package com.dcits.supervise.pecr.indv.threadExcute;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dcits.supervise.pecr.indv.entity.SendInform;
import com.dcits.supervise.pecr.indv.entity.SendMsgInformConfig;
import com.dcits.supervise.pecr.indv.service.packet.IndvTextMsgInformManager;

import net.sf.json.JSONObject;

public class SendInformThread implements Runnable {

	private SendMsgInformConfig sendConfig;
	private List<String> failList;
	private boolean[] isEnd;
	private int arrayIndex;
	private IndvTextMsgInformManager textMsgInform;
	// 判断调用哪个方法
	private int runFlag;
	// 直接发送短信和重复发送短信时使用
	private int startCount;
	private int endCount;
	// 对特定状态数据发送短信时使用
	private String globalStrs;
	private Map<String, Object> map;
	private Map<String, Object> map1;
	private Map<String, Object> map2;
	private Map<String, Object> map3;
	private Map<String, Object> map4;
	private String[] strH;
	private String[] strB;
	private SimpleDateFormat simpleDateFormat1;
	private SimpleDateFormat simpleDateFormat2;
	private Logger logger = LoggerFactory.getLogger(SendInformThread.class);

	public SendInformThread(SendMsgInformConfig sendConfig,
			List<String> failList, boolean[] isEnd, int arrayIndex,
			IndvTextMsgInformManager textMsgInform, int startCount, int endCount) {
		this.sendConfig = sendConfig;
		this.failList = failList;
		this.isEnd = isEnd;
		this.textMsgInform = textMsgInform;
		this.arrayIndex = arrayIndex;
		this.startCount = startCount;
		this.endCount = endCount;
		this.map = new LinkedHashMap<String, Object>();
		this.map1 = new LinkedHashMap<String, Object>();
		this.map2 = new LinkedHashMap<String, Object>();
		this.map3 = new LinkedHashMap<String, Object>();
		this.map4 = new LinkedHashMap<String, Object>();
		this.strH = new String[1];
		this.simpleDateFormat1 = new SimpleDateFormat("yyyyMMddkkmmssSSS");
		this.simpleDateFormat2 = new SimpleDateFormat("yyyyMMdd");
		runFlag = 1;
	}

	public SendInformThread(SendMsgInformConfig sendConfig2,
			List<String> failList2, boolean[] isEnd2, int arrayIndex2,
			IndvTextMsgInformManager textMsgInform, String globalStrs) {
		this.sendConfig = sendConfig2;
		this.failList = failList2;
		this.isEnd = isEnd2;
		this.textMsgInform = textMsgInform;
		this.arrayIndex = arrayIndex2;
		this.globalStrs = globalStrs;
		this.map = new LinkedHashMap<String, Object>();
		this.map1 = new LinkedHashMap<String, Object>();
		this.map2 = new LinkedHashMap<String, Object>();
		this.map3 = new LinkedHashMap<String, Object>();
		this.map4 = new LinkedHashMap<String, Object>();
		this.strH = new String[1];
		this.simpleDateFormat1 = new SimpleDateFormat("yyyyMMddkkmmssSSS");
		this.simpleDateFormat2 = new SimpleDateFormat("yyyyMMdd");
		runFlag = 2;
	}

	public void run() {
		if (runFlag == 1) {
			sendRun();
		} else if (runFlag == 2) {
			sendRunGivenStatus();
		}
	}

	private void sendRunGivenStatus() {
		try {
			Map<String, Object> selectMap = new HashMap<String, Object>();
			selectMap.put("REPORT_MESSAGE_NAME",
					sendConfig.getREPORT_MESSAGE_NAME());
			selectMap.put("ORG_CODE", sendConfig.getBranchId());
			selectMap.put("GLOBAL_SERIAL_NO_STRS", globalStrs);
			// 每次查出2000条数据合集
			List<SendInform> sendListCon = textMsgInform
					.selectsendListGivenStatus(selectMap);
			listToJsonMap(sendListCon);
			isEnd[arrayIndex] = true;
		} catch (Exception e) {
			isEnd[arrayIndex] = true;
			e.printStackTrace();
		}
	}

	private void sendRun() {
		try {
			int selectCount = (endCount - startCount) / 1000
					+ ((endCount - startCount) % 1000 == 0 ? 0 : 1);
			Map<String, Object> selectMap = new HashMap<String, Object>();
			selectMap.put("REPORT_MESSAGE_NAME",
					sendConfig.getREPORT_MESSAGE_NAME());
			selectMap.put("ORG_CODE", sendConfig.getBranchId());
			for (int i = 0; i < selectCount; i++) {
				selectMap.put("limitNum", "" + (startCount + 1000 * i));
				selectMap.put("limitCount", "" + 1000);
				// if (i == selectCount - 1) {
				// int limitCount = startCount + 1000 * i;
				// int limit = 1000;
				// selectMap.put("startCount", "" + (startCount + 1000 * i));
				// selectMap.put("endCount", "" + endCount);
				// } else {
				// int limitCount = startCount + 1000 * i;
				// int limit = 1000;
				// selectMap.put("startCount", "" + (startCount + 1000 * i));
				// selectMap.put("endCount", ""
				// + (startCount + 1000 * (i + 1)));
				// }

				// 每次查出1000条数据合集
				List<SendInform> sendListCon = textMsgInform
						.selectsendListCon(selectMap);
				listToJsonMap(sendListCon);
			}
			isEnd[arrayIndex] = true;
		} catch (Exception e) {
			isEnd[arrayIndex] = true;
			e.printStackTrace();
		}
	}

	private void listToJsonMap(List<SendInform> sendListCon) {
		// Map<String,String> mapText=new HashMap<String,String>();
		Map<String, List<SendInform>> mapList = new HashMap<String, List<SendInform>>();
		String global = null;
		// 遍历1000或2000个对象,对象按照global进行分组组装
		for (SendInform send : sendListCon) {
			global = send.getGlobalSerialNo();

			if (mapList.containsKey(global)) {
				mapList.get(global).add(send);
			} else {
				mapList.put(global, new ArrayList<SendInform>());
				mapList.get(global).add(send);
			}
		}

		Set<String> set = mapList.keySet();
		// 循环进行短信报文的发送
		for (String globalStr : set) {
			List<SendInform> list = mapList.get(globalStr);
			String json = sendListText(globalStr, list);
			String status = httpRequestJson(globalStr, json);
			failList.add(status + globalStr);
		}
	}

	private String httpRequestJson(String globalStr, String json) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		logger.info("请求时间---" + sdf.format(new Date()) + "---请求报文---" + json);
		System.out.println("请求时间---" + sdf.format(new Date()) + "---请求报文---"
				+ json);

		String returnStr = "N";
		String content = null;
		URL urls = null;
		HttpURLConnection httpURLConnection = null;
		try {
			urls = new URL(sendConfig.getSEND_MSG_HEAD());
			httpURLConnection = (HttpURLConnection) urls.openConnection();
			// 设置连接时间
			httpURLConnection.setConnectTimeout(10000);
			// 打开输入流，以便从服务器获取数据
			httpURLConnection.setDoInput(true);
			// 打开输出流，以便向服务器提交数据
			httpURLConnection.setDoOutput(true);
			// 设置以POST方式提交数据
			httpURLConnection.setRequestMethod("POST");
			// 使用POST不能使用缓存
			httpURLConnection.setUseCaches(false);
			// 设置请求的类型是文本类型
			httpURLConnection.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			// 设置请求体的长度
			httpURLConnection.setRequestProperty("Content-Length",
					"" + (json.getBytes("utf-8").length));
			// 获得输出流，向指定的Url写入数据
			OutputStream outputStream = httpURLConnection.getOutputStream();
			outputStream.write(json.getBytes("utf-8"));
			int response = httpURLConnection.getResponseCode();
			// 获得服务器响应码
			if (response == HttpURLConnection.HTTP_OK) {
				InputStream inputStream = httpURLConnection.getInputStream();
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(inputStream, "utf-8"));
				StringBuilder builder = new StringBuilder();
				String line = null;
				while ((line = reader.readLine()) != null) {
					builder.append(line).append("\n");
				}
				content = builder.toString();
			}

			logger.info("响应时间---" + sdf.format(new Date()) + "---响应报文---"
					+ content);
			System.out.println("响应时间---" + sdf.format(new Date())
					+ "---响应报文---" + content);

			returnStr = "X";
			returnStr = feedbackSendMsg(globalStr, content);
		} catch (Exception e) {
			e.printStackTrace();
			return returnStr;
		} finally {
			if (httpURLConnection != null) {
				httpURLConnection.disconnect();
			}
		}
		return returnStr;
	}

	// 解析短信反馈报文
	private String feedbackSendMsg(String global, String content) {
		if (content != null && !content.equals("")) {
			String retStatus = content.substring(
					content.indexOf("retStatus") - 1,
					content.indexOf("retStatus") + 14);
			retStatus = retStatus.replaceAll("\"", "");
			String status = retStatus.substring(retStatus.indexOf(":") + 1,
					retStatus.indexOf(":") + 2);
			return status;
		} else {
			return "X";
		}
	}

	// 将100条数据拼装成http传输的json
	private String sendListText(String globalStr, List<SendInform> list) {
		strB = new String[list.size()];
		map.clear();
		map1.clear();
		map2.clear();
		map3.clear();
		map4.clear();

		map.put("routeKey", sendConfig.getRouteKey());
		map.put("routeKeyType", sendConfig.getRouteKeyType());
		strH[0] = JSONObject.fromObject(map).toString();

		map1.put("sourSystemId", sendConfig.getSourSystemId());
		map1.put("branchId", sendConfig.getBranchId());
		map1.put("subSerialNo", sendConfig.getSubSerialNo());
		map1.put("destServiceCode", sendConfig.getDestServiceCode());
		map1.put("sourSPN", sendConfig.getSourSPN());
		map1.put("globalSerialNo", globalStr);
		map1.put("tranTimestamp", simpleDateFormat1.format(new Date()));
		map1.put("destSystemId", sendConfig.getDestSystemId());
		map1.put("routeInfo", strH);
		map1.put("tellerId", sendConfig.getTellerId());
		map1.put("destServiceVer", sendConfig.getDestServiceVer());
		map1.put("sourServerId", sendConfig.getSourServerId());
		map1.put("company", sendConfig.getCompany());
		map1.put("sourServiceVer", sendConfig.getSourServiceVer());
		map1.put("tranDate", simpleDateFormat2.format(new Date()));
		map1.put("isPlayback", sendConfig.getIsPlayback());
		map1.put("destSPN", sendConfig.getDestSPN());

		for (int i = 0; i < list.size(); i++) {
			map2.put(
					"content",
					sendConfig.getContent()
							.replace("[ACCT_CODE]", list.get(i).getLoanKey())
							.replace("[SETT_DATE]", list.get(i).getDueDate()));
			map2.put("mobile", list.get(i).getMobileTel());
			strB[i] = JSONObject.fromObject(map2).toString();
		}

		map3.put("Msg", strB);
		map3.put("Password", sendConfig.getPassword());
		map3.put("UserId", sendConfig.getUserId());

		map4.put("reqHead", map1);
		map4.put("BODY", map3);

		return JSONObject.fromObject(map4).toString();

	}

}
