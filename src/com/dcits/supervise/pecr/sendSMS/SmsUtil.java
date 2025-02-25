package com.dcits.supervise.pecr.sendSMS;

import java.io.BufferedInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.lang3.StringUtils;

public class SmsUtil {
	/**
	 * 短信测试
	 */
	public static void main(String[] args) {
		//sendMsg("18792658103", "短信代码测试", true);
	}

	private static final Logger logger = Logger.getLogger(SmsUtil.class.getName());
	/** 短信平台Socket地址 */
	private static String IP ;//= "36.33.227.146";
	/** 短信平台端口 */
	private static  int PORT ;//= 6811;
	/** 短信平台Socket超时时间 */
	private static  int TIMEOUT ;// = 60000;
	/** 参数分隔符: 参数1;参数2... */
	private static final String PARAM_SEPERATOR = ";";
	/** 参数值分隔符: 参数名,长度,默认值 */
	private static final String VALUE_SEPERATOR = ",";
	/** 请求参数配置 */
	private static final Map<String, String[]> REQUEST_MAP = getRequestConfigMap();
	/** 响应参数配置 */
	private static final Map<String, String[]> RESPONSE_MAP = getResponseConfigMap();
	/** 消息编码 */
	private static final String MSG_ENCODE = "GBK";
	
	
	public SmsUtil(String ip,int port,int timeout) {
		this.IP = ip;
		this.PORT = port;
		this.TIMEOUT = timeout;	
	}

	/**
	 * 发送单条短信
	 * @param phoneNumber 发送电话号码
	 * @param msgContent 发送短信内容
	 * @param realTime 实时发送标志：true表示实时发送，false表示只在工作时间段发送-早9到晚9点
	 * @return 发送成功返回true，否则返回false
	 */
	public static boolean sendMsg(String phoneNumber, String msgContent, boolean realTime,Map<String,Object> param) {

		if(StringUtils.isEmpty(phoneNumber) || StringUtils.isEmpty(msgContent)) {
			logger.log(Level.SEVERE, "发送短信的电话号码和短信内容不能为空！");
			return false;
		}
		
		Socket socket = new Socket();
		DataOutputStream dos = null;
		BufferedInputStream dis = null;
		try {
			socket.connect(new InetSocketAddress(IP, PORT), TIMEOUT);

			logger.info("发送报文...");
			String requestString = getRequestString(phoneNumber, msgContent, realTime);
			param.put("REQUEST_STR", requestString);
			dos = new DataOutputStream(socket.getOutputStream());
			dos.write(requestString.getBytes(MSG_ENCODE));
			dos.flush();

			logger.info("接收报文...");
			dis = new BufferedInputStream(socket.getInputStream());
			byte[] buffer = new byte[3000];
			dis.read(buffer);
			String response = new String(buffer, MSG_ENCODE).trim();
			param.put("RESPONSE_STR", response);
			return handleResponse(response);
		} catch (Exception e) {
			logger.log(Level.SEVERE, "发送单条短信异常", e);
		} finally {
			try {
				if(dis != null) dis.close();
				if(dos != null) dos.close();
				if(socket != null) socket.close();
			} catch (IOException e) {
				logger.log(Level.SEVERE, "发送单条短信异常", e);
			}
		}
		return false;
	}

	/**
	 * 组装短信平台Socket请求报文
	 * @param phoneNumber 发送电话号码
	 * @param msgContent 发送短信内容
	 * @param realTime 实时发送标志：true表示实时发送，false表示只在工作时间段发送-早9到晚9点
	 * @throws UnsupportedEncodingException 
	 */
	private static String getRequestString(String phoneNumber, String msgContent, boolean realTime) throws UnsupportedEncodingException {
		//获取配置文件中的请求报文的字段长度和默认值
		//报文长度位数=4位
		int packLenLen = Integer.parseInt(REQUEST_MAP.get("packLen")[1]);
		//报文长度=287
		String packLen = REQUEST_MAP.get("packLen")[2];
		//交易码长度=6位
		int tradeCodeLen = Integer.parseInt(REQUEST_MAP.get("tradeCode")[1]);
		//交易码=333333
		String tradeCode = REQUEST_MAP.get("tradeCode")[2];
		//服务代码长度=4位
		int srvIdLen = Integer.parseInt(REQUEST_MAP.get("srvId")[1]);
		//服务代码=9111
		String srvId = REQUEST_MAP.get("srvId")[2];
		//机构号长度=6位
		int branchNoLen = Integer.parseInt(REQUEST_MAP.get("branchNo")[1]);
		//机构号=100006
		String branchNo = REQUEST_MAP.get("branchNo")[2];
		//实时标志长度=1位
		int immedFlagLen = Integer.parseInt(REQUEST_MAP.get("immedFlag")[1]);
		//实时标志=实时发送填写1(24小时), 非实时发送填写0(只在工作时间段发送-早9到晚9点)
		String immedFlag = realTime ? "1" : "0";
		//手机号长度=30位
		int objAddrLen = Integer.parseInt(REQUEST_MAP.get("objAddr")[1]);
		//手机号=调用方传入
		String objAddr = phoneNumber;
		//短信内容长度=240位
		int msgContLen = Integer.parseInt(REQUEST_MAP.get("msgCont")[1]);
		//短信内容=调用方传入
		String msgCont = msgContent;

		logger.info("短信平台请求数据：packLen=" + packLen
				+ ",tradeCode=" + tradeCode
				+ ",srvId=" + srvId
				+ ",branchNo=" + branchNo
				+ ",immedFlag=" + immedFlag
				+ ",objAddr=" + objAddr
				+ ",msgCont=" + msgCont);

		StringBuffer sb = new StringBuffer();
		sb.append(StringUtils.leftPad(packLen, packLenLen, "0"));
		sb.append(StringUtils.rightPad(tradeCode, tradeCodeLen, " "));
		sb.append(StringUtils.rightPad(srvId, srvIdLen, " "));
		sb.append(StringUtils.rightPad(branchNo, branchNoLen, " "));
		sb.append(StringUtils.rightPad(immedFlag, immedFlagLen, " "));
		sb.append(StringUtils.leftPad(objAddr, objAddrLen, " "));
		sb.append(StringUtils.rightPad(msgCont, msgContLen, " "));

		logger.info("短信平台请求报文：" + sb.toString());

		return sb.toString();
	}

	/**
	 * 解析响应报文
	 * @param response 响应字符串
	 * @return 成功返回true，否则返回false
	 */
	private static boolean handleResponse(String response) {
		//获取配置文件中的返回报文的字段长度
		//报文长度位数=4位
		int packLenLen = Integer.parseInt(RESPONSE_MAP.get("packLen")[1]);
		//返回码长度=7位
		int resCodeLen = Integer.parseInt(RESPONSE_MAP.get("resCode")[1]);
		//返回码=ISS0000(表示成功)
		String resCodeSuccess = RESPONSE_MAP.get("resCode")[2];
		//返回信息长度=50位
		//int resMsgLen = Integer.parseInt(RESPONSE_MAP.get("resMsg")[1]);

		//解析响应报文的内容
		String packLen = response.substring(0, packLenLen);
		String resCode = response.substring(packLenLen, packLenLen + resCodeLen);
		String resMsg = response.substring(packLenLen + resCodeLen);
		logger.info("短信平台响应报文：" + response);
		logger.info("短信平台响应数据：packLen=" + packLen + ",resCode=" + resCode + ",resMsg=" + resMsg);

		//返回调用结果
		return resCodeSuccess.equals(resCode);
	}

	/**
	 * 短信平台Socket请求参数
	 */
	private static Map<String, String[]> getRequestConfigMap() {
		//建议添加到配置文件里
		//参数名,长度,默认值: 报文长度4位=287;交易码6位=333333;服务代码4位=9111;机构号6位=800004;实时标志1位=1(实时发送);手机号30位=空;短信内容240位=空
		String request = "packLen,4,287;tradeCode,6,333333;srvId,4,9111;branchNo,6,800004;immedFlag,1,1;objAddr,30,;msgCont,240,";
		Map<String, String[]> requestMap = new HashMap<String, String[]>();
		String[] params = request.split(PARAM_SEPERATOR);
		for(String param : params) {
			String[] value = param.split(VALUE_SEPERATOR);
			requestMap.put(value[0], value);
		}
		return requestMap;
	}

	/**
	 * 短信平台Socket响应参数
	 */
	private static Map<String, String[]> getResponseConfigMap() {
		//建议添加到配置文件里
		//参数名,长度,默认值: 报文长度4位;返回码7位=ISS0000(表示成功);返回信息50位
		String response = "packLen,4;resCode,7,ISS0000;resMsg,50";
		Map<String, String[]> responseMap = new HashMap<String, String[]>();
		String[] params = response.split(PARAM_SEPERATOR);
		for(String param : params) {
			String[] value = param.split(VALUE_SEPERATOR);
			responseMap.put(value[0], value);
		}
		return responseMap;
	}
}
