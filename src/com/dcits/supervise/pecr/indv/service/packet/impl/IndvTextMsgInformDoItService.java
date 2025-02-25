package com.dcits.supervise.pecr.indv.service.packet.impl;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.indv.entity.SendMsgInformConfig;
import com.dcits.supervise.pecr.indv.service.packet.IndvTextMsgInformManager;
import com.dcits.supervise.pecr.indv.threadExcute.SendInformThread;

@Service
public class IndvTextMsgInformDoItService {
	public synchronized Map<String, Object> textMsgInformProcess(
			IndvTextMsgInformManager textMsgInform,
			List<Map<String, Object>> sendMsgPmtList,
			Map<String, Object> msgData) {
		Map<String, Object> endMap = new HashMap<String, Object>();
		// 接收出现失败的短信回执,在线程执行结束后按照其中的全局编号进行状态更新
		List<String> failList = Collections
				.synchronizedList(new ArrayList<String>());
		try {
			int sendCount = textMsgInform.selectSendCount(msgData);
			if (sendCount == 0) {
				endMap.put("success", false);
				endMap.put("message", "该条报文中没有需要进行短信通知的逾期客户!");
				return endMap;
			} else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddkkmmss");
				String INFORM_TIME = sdf.format(new Date());
				msgData.put("INFORM_TIME", INFORM_TIME);

				String sourServerId = getHostIp();
				msgData.put("sourServerId", sourServerId);

				SendMsgInformConfig sendConfig = new SendMsgInformConfig();
				sendConfig.valueToElement(sendMsgPmtList, msgData);

				msgData.put("INFORM_TIME", INFORM_TIME);
				msgData.put("sourSystemId", sendConfig.getSourSystemId());
				msgData.put("sourSPN", sendConfig.getSourSPN());
				msgData.put("SEND_TEXT", sendConfig.getContent());
				// msgData.put("SEND_TEXT_D", sendConfig.getContentD());

				// insertSendMsgInformInfoLimit(textMsgInform,msgData);
				textMsgInform.insertSendMsgInformInfo(msgData);

				int threadCount = sendCount / 3000
						+ (sendCount % 3000 == 0 ? 0 : 1);
				boolean[] isEnd = new boolean[threadCount];
				boolean end = true;
				int startCount = 0;
				int endCount = 0;

				for (int i = 0; i < isEnd.length; i++) {
					if (i != 0 && i % 5 == 0) {
						while (true) {
							this.wait(5000);
							boolean b = true & isEnd[i - 5] & isEnd[i - 4]
									& isEnd[i - 3] & isEnd[i - 2]
									& isEnd[i - 1];
							if (b) {
								break;
							}
						}
					}

					isEnd[i] = false;
					if (i == isEnd.length - 1) {
						startCount = i * 3000;
						endCount = sendCount;
					} else {
						startCount = i * 3000;
						endCount = (i + 1) * 3000;
					}
					SendInformThread sendThread = new SendInformThread(
							sendConfig, failList, isEnd, i, textMsgInform,
							startCount, endCount);
					Thread bath1 = new Thread(sendThread);
					bath1.start();
				}

				while (true) {
					this.wait(5000);
					end = true;
					for (int i = 0; i < isEnd.length; i++) {
						end = end & isEnd[i];
					}
					if (end) {
						updateFeedbackState(textMsgInform, msgData, failList);

						// 查询该条报文发送的所有短信情况并写入前台提示中
						String jspMessage = createSendMessage(textMsgInform,
								msgData);

						endMap.put("success", true);
						endMap.put("message", "短信通知完成!" + jspMessage);
						return endMap;
					}
				}
			}
		} catch (Exception e) {
			updateFeedbackState(textMsgInform, msgData, failList);
			String jspMessage = createSendMessage(textMsgInform, msgData);
			endMap.put("success", false);
			endMap.put("message", "短信通知异常!" + jspMessage);
			e.printStackTrace();
			return endMap;
		}
	}

	private String getHostIp() throws SocketException {
		String ip = null;
		Enumeration<NetworkInterface> nis;
		nis = NetworkInterface.getNetworkInterfaces();
		NetworkInterface ni = nis.nextElement();
		Enumeration<InetAddress> ias = ni.getInetAddresses();
		for (; ias.hasMoreElements();) {
			InetAddress ia = ias.nextElement();
			if (ia instanceof Inet4Address
					&& !ia.getHostAddress().equals("127.0.0.1")) {
				ip = ia.getHostAddress();
			}

		}
		return ip == null ? "" : ip;
	}

	private void updateFeedbackState(IndvTextMsgInformManager textMsgInform,
			Map<String, Object> msgData, List<String> failList) {
		Map<String, LinkedList<String>> statusMap = new HashMap<String, LinkedList<String>>();
		for (String globalStr : failList) {
			String feedbackStatus = globalStr.substring(0, 1);
			String globalSerialNo = globalStr.substring(1, globalStr.length());
			if (statusMap.containsKey(feedbackStatus)) {
				statusMap.get(feedbackStatus).add(globalSerialNo);
			} else {
				LinkedList<String> globalNoList = new LinkedList<String>();
				globalNoList.add(globalSerialNo);
				statusMap.put(feedbackStatus, globalNoList);
			}
		}
		Set<String> statusSet = statusMap.keySet();
		StringBuffer globalBuf = new StringBuffer();
		// 循环修改响应状态,每50个唯一流水号修改一次状态
		for (String status : statusSet) {
			LinkedList<String> Glist = statusMap.get(status);
			globalBuf.append("(");
			for (int i = 0; i < Glist.size(); i++) {
				if (i == Glist.size() - 1) {
					globalBuf.append("'" + Glist.get(i) + "')");
					msgData.put("SEND_FEEDBACK_STATE", status);
					msgData.put("GLOBAL_SERIAL_NO", globalBuf.toString());
					textMsgInform.updateGlobalNo(msgData);
					globalBuf.delete(0, globalBuf.length());

				} else if (i % 50 == 49) {
					globalBuf.append("'" + Glist.get(i) + "')");
					msgData.put("SEND_FEEDBACK_STATE", status);
					msgData.put("GLOBAL_SERIAL_NO", globalBuf.toString());
					textMsgInform.updateGlobalNo(msgData);
					globalBuf.delete(0, globalBuf.length());
					globalBuf.append("(");
				} else {
					globalBuf.append("'" + Glist.get(i) + "',");
				}
			}
		}
	}

	private String createSendMessage(IndvTextMsgInformManager textMsgInform,
			Map<String, Object> msgData) {
		String jspMessage = "";
		int selectInformCount = 0;
		List<Map<String, Object>> msgList = null;
		try {
			selectInformCount = textMsgInform.selectInformCount(msgData);
			msgList = textMsgInform.getMessageCountList(msgData);
		} catch (Exception e) {
			e.printStackTrace();
		}

		jspMessage = jspMessage + "本次通知短信共" + selectInformCount + "条";
		if (msgList != null) {
			for (Map<String, Object> map : msgList) {
				if ("N".equals(map.get("STATUS"))) {
					jspMessage = jspMessage + ",请求失败:"
							+ (long) map.get("COUNT") + "条";
				} else if ("S".equals(map.get("STATUS"))) {
					jspMessage = jspMessage + ",反馈成功:"
							+ (long) map.get("COUNT") + "条";
				} else if ("F".equals(map.get("STATUS"))) {
					jspMessage = jspMessage + ",反馈失败:"
							+ (long) map.get("COUNT") + "条";
				} else if ("U".equals(map.get("STATUS"))) {
					jspMessage = jspMessage + ",反馈未知:"
							+ (long) map.get("COUNT") + "条";
				} else if ("P".equals(map.get("STATUS"))) {
					jspMessage = jspMessage + ",反馈处理中:"
							+ (long) map.get("COUNT") + "条";
				} else if ("X".equals(map.get("STATUS"))) {
					jspMessage = jspMessage + ",解析响应失败:"
							+ (long) map.get("COUNT") + "条";
				}
			}

		} else {
			jspMessage = jspMessage + ",统计结果方法错误,请联系开发人员!";
		}
		return jspMessage;
	}

	public synchronized Map<String, Object> sendInformGivenStatusProcess(
			IndvTextMsgInformManager textMsgInform,
			List<Map<String, Object>> sendMsgPmtList,
			Map<String, Object> msgData) {
		Map<String, Object> endMap = new HashMap<String, Object>();
		// 接收出现失败的短信回执,在线程执行结束后按照其中的全局编号进行状态更新
		List<String> failList = Collections
				.synchronizedList(new ArrayList<String>());
		try {
			String sourServerId = getHostIp();
			msgData.put("sourServerId", sourServerId);

			SendMsgInformConfig sendConfig = new SendMsgInformConfig();
			sendConfig.valueToElement(sendMsgPmtList, msgData);

			String feedbackStateList = (String) msgData
					.get("SEND_FEEDBACK_STATE");
			String[] feedbackStateArray = feedbackStateList.split(",");
			String stateValue = "(";
			for (int i = 0; i < feedbackStateArray.length; i++) {
				if (i != feedbackStateArray.length - 1) {
					stateValue = stateValue + "'" + feedbackStateArray[i]
							+ "',";
				} else {
					stateValue = stateValue + "'" + feedbackStateArray[i]
							+ "')";
				}
			}
			System.out.println("----------------所选重发状态-----------------"
					+ stateValue + "-------------------------------------");
			msgData.put("SEND_FEEDBACK_STATE", stateValue);

			// 查找需要发送状态的Global_No列表
			List<Map<String, Object>> globalMapList = textMsgInform
					.getGivenStatusGlobal(msgData);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddkkmmss");
			String INFORM_TIME = sdf.format(new Date());
			msgData.put("INFORM_TIME", INFORM_TIME);

			List<String> globalList = new LinkedList<String>();
			for (Map<String, Object> map : globalMapList) {
				String globalStr = (String) map.get("GLOBAL_SERIAL_NO");
				// System.out.println();
				// System.out.println("---" + globalStr + "---");
				// System.out.println();
				globalStr = globalStr.substring(0, 5) + INFORM_TIME
						+ globalStr.substring(19, globalStr.length());
				globalList.add(globalStr);
			}

			System.out.println();
			System.out.println("global_no查出合集打印");
			System.out.println(Arrays.toString(globalList.toArray()));
			System.out.println();

			// 将要重复发送状态的数据的global_id换成新的时间,并将数据状态替换为请求失败状态
			textMsgInform.updateGlobalStatusFalse(msgData);

			int threadCount = globalList.size() / 20
					+ (globalList.size() % 20 == 0 ? 0 : 1);
			String[] globalStrsArray = new String[threadCount];

			for (int i = 0; i < globalStrsArray.length; i++) {
				String globalStrs = "(";
				if (i == globalStrsArray.length - 1) {
					for (int j = i * 20; j < globalList.size(); j++) {
						if (j == globalList.size() - 1) {
							globalStrs = globalStrs + "'" + globalList.get(j)
									+ "')";
						} else {
							globalStrs = globalStrs + "'" + globalList.get(j)
									+ "',";
						}
					}
				} else {
					for (int j = i * 20; j < (i + 1) * 20; j++) {
						if (j == (i + 1) * 20 - 1) {
							globalStrs = globalStrs + "'" + globalList.get(j)
									+ "')";
						} else {
							globalStrs = globalStrs + "'" + globalList.get(j)
									+ "',";
						}
					}
				}
				globalStrsArray[i] = new String(globalStrs);
			}

			System.out.println();
			System.out.println("global_no修改后合集打印" + "---"
					+ globalStrsArray.length);
			System.out.println(Arrays.toString(globalStrsArray));
			System.out.println();

			boolean[] isEnd = new boolean[threadCount];
			for (int i = 0; i < isEnd.length; i++) {
				if (i != 0 && i % 5 == 0) {

					while (true) {
						this.wait(5000);
						boolean b = true & isEnd[i - 5] & isEnd[i - 4]
								& isEnd[i - 3] & isEnd[i - 2] & isEnd[i - 1];
						if (b) {
							break;
						}
					}
				}

				isEnd[i] = false;
				SendInformThread sendThread = new SendInformThread(sendConfig,
						failList, isEnd, i, textMsgInform, globalStrsArray[i]);
				Thread bath1 = new Thread(sendThread);
				bath1.start();
			}

			while (true) {
				this.wait(5000);
				boolean end = true;
				for (int i = 0; i < isEnd.length; i++) {
					end = end & isEnd[i];
				}
				if (end) {
					// 所有线程运行结束,开始修改数据的响应状态
					updateFeedbackState(textMsgInform, msgData, failList);

					// 查询该条报文发送的所有短信情况并写入前台提示中
					String jspMessage = createSendMessage(textMsgInform,
							msgData, globalStrsArray);

					endMap.put("success", true);
					endMap.put("message", "短信通知完成!" + jspMessage);
				}
				return endMap;
			}
		} catch (Exception e) {
			e.printStackTrace();
			updateFeedbackState(textMsgInform, msgData, failList);
			endMap.put("success", false);
			endMap.put("message", "短信特定状态通知方法错误!");
			return endMap;
		}
	}

	/*
	 * 特定状态发送短信时使用此方法
	 */
	private String createSendMessage(IndvTextMsgInformManager textMsgInform,
			Map<String, Object> msgData, String[] globalStrsArray) {
		try {
			String jspMessage = "";
			int selectInformCount = 0;
			Map<String, Integer> selectInformCountState = new HashMap<String, Integer>();
			for (int i = 0; i < globalStrsArray.length; i++) {
				msgData.remove("GLOBAL_SERIAL_NO_STRS");
				msgData.put("GLOBAL_SERIAL_NO_STRS", globalStrsArray[i]);
				List<Map<String, Object>> givenCountList = textMsgInform
						.selectInformCountGivenStatus(msgData);
				for (Map<String, Object> map : givenCountList) {
					String feedbackState = (String) map.get("STATUS");
					int feedbackStateCount = (int) map.get("COUNT");

					selectInformCount = selectInformCount + feedbackStateCount;
					if (selectInformCountState.containsKey(feedbackState)) {
						selectInformCountState.put(feedbackState,
								selectInformCountState.get(feedbackState)
										+ feedbackStateCount);
					} else {
						selectInformCountState.put(feedbackState,
								feedbackStateCount);
					}
				}
			}
			jspMessage = jspMessage + "本次通知短信共" + selectInformCount + "条";

			Set<String> setState = selectInformCountState.keySet();
			for (String state : setState) {
				if ("N".equals(state)) {
					jspMessage = jspMessage + ",请求失败:"
							+ selectInformCountState.get(state) + "条";
				} else if ("S".equals(state)) {
					jspMessage = jspMessage + ",反馈成功:"
							+ selectInformCountState.get(state) + "条";
				} else if ("F".equals(state)) {
					jspMessage = jspMessage + ",反馈失败:"
							+ selectInformCountState.get(state) + "条";
				} else if ("U".equals(state)) {
					jspMessage = jspMessage + ",反馈未知:"
							+ selectInformCountState.get(state) + "条";
				} else if ("P".equals(state)) {
					jspMessage = jspMessage + ",反馈处理中:"
							+ selectInformCountState.get(state) + "条";
				} else if ("X".equals(state)) {
					jspMessage = jspMessage + ",解析响应失败:"
							+ selectInformCountState.get(state) + "条";
				}
			}
			return jspMessage;
		} catch (Exception e) {
			e.printStackTrace();
			return "特定状态短信通知统计结果数量方法异常,请联系开发人员排查!";
		}

	}

}
