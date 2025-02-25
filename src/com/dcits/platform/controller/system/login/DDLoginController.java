package com.dcits.platform.controller.system.login;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.service.system.DDLogin.DDLoginManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PasswordEncoder;

@Controller
public class DDLoginController extends BaseController{

	@Resource(name="userService")
	private UserManager userService;
	
	@Resource(name="ddLoginService")
	private DDLoginManager ddLoginService;
	
	@Resource(name="operationService")
	private OperationManager operationService;
	
	@Resource(name="menuService")
	private MenuManager menuService;
	
	@Resource(name="orgService")
	private OrgManager orgService;
	
	@Resource(name="pwdRuleConfigService")
	private pwdRuleConfigManager pwdRuleConfigService;
	
	PasswordEncoder passwordEncoder = new PasswordEncoder();
	
	@RequestMapping(value="/DDlogin_test")
	public ModelAndView test(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/index/DDLogin");
		return mv;
	}
	
	
	@RequestMapping(value="/DDlogin_toLogin")
	public ModelAndView toDDLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//获取令牌
		String tokenNo = pd.getString("tokenNo");
		//用户编号
		String staff = pd.getString("staff");
//		String host="127.0.0.1";//建立socket通信的主机地址
//		int port = 5555;//建立socket通信的端口号
//		String host="10.37.65.64";//建立socket通信的主机地址
//		int port = 39007;//建立socket通信的端口号
		Socket socket = null;
		OutputStream outputStream = null;
		InputStream inputStream = null;
		try {
			String host = BaseController.getPropertiesValue("HOST");
			int port = Integer.parseInt(BaseController.getPropertiesValue("PORT"));
			socket = new Socket(host,port);
			outputStream = socket.getOutputStream();//创建输出流将xml文件的格式发送到Esb
			StringBuffer message =new StringBuffer("");//创建message用于发送token验证信息
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String date = sdf.format(new Date());
			String yyyyMMdd = date.substring(0, 8);
			String HHmmss = date.substring(8,14);
			String UUID = this.get32UUID();
			String random = UUID.substring(1, 24);
			String SYS_HEAD ="\r\n<SYS_HEAD>\r\n<SvcCd>60012000001</SvcCd>\r\n" + 
					"        <SvcScnCd>02</SvcScnCd>\r\n" + 
					"        <SvcVer>V001</SvcVer>\r\n" + 
					"        <CnsmrCd>400800</CnsmrCd>\r\n" + 
					"        <CnsmrSeqNo>"+yyyyMMdd+random+"</CnsmrSeqNo>\r\n" + 
					"        <CnsmrTranDt>"+yyyyMMdd+"</CnsmrTranDt>\r\n" + 
					"        <CnsmrTranTm>"+HHmmss+"</CnsmrTranTm>\r\n" + 
					"        <TmnlCd>FTZ"+HHmmss+"</TmnlCd>\r\n" + 
					"        <ChnlTp>A</ChnlTp>\r\n" + 
					"        <OrigCnsmrCd>4008</OrigCnsmrCd>\r\n" + 
					"        <OrigCnsmrSeqNo>4008"+date+random+"</OrigCnsmrSeqNo>\r\n" + 
					"        <OrigCnsmrTranDt>"+yyyyMMdd+"</OrigCnsmrTranDt>\r\n" + 
					"        <OrigCnsmrTranTm>"+HHmmss+"</OrigCnsmrTranTm>\r\n" + 
					"        <MacNd></MacNd>\r\n" + 
					"        <MacVal></MacVal></SYS_HEAD>";
	            		
	        String APP_HEAD="\r\n<APP_HEAD>\r\n<ReSndFlg>N</ReSndFlg>\r\n" + 
	            				"        <LglCd>001</LglCd>\r\n" + 
	            				"        <ClrgDt>"+yyyyMMdd+"</ClrgDt>\r\n" + 
	            				"        <TlrNo></TlrNo>\r\n" + 
	            				"        <BrchCd>043400</BrchCd>\r\n" + 
	            				"        <TlrPswd></TlrPswd>\r\n" + 
	            				"        <TlrLvl></TlrLvl>\r\n" + 
	            				"        <TlrTp></TlrTp>\r\n" + 
	            				"        <ChkTlrFlg></ChkTlrFlg>\r\n" + 
	            				"        <array>\r\n" + 
	            				"            <EntrTlrArr>\r\n" + 
	            				"                <EntrTlrNo></EntrTlrNo>\r\n" + 
	            				"                <EntrBrchCd></EntrBrchCd>\r\n" + 
	            				"                <EntrTlrLvl></EntrTlrLvl>\r\n" + 
	            				"                <EntrTlrTp></EntrTlrTp>\r\n" + 
	            				"            </EntrTlrArr>\r\n" + 
	            				"        </array>\r\n" + 
	            				"        <AuthFlg></AuthFlg>\r\n" + 
	            				"        <array>\r\n" + 
	            				"            <AuthTlrArr>\r\n" + 
	            				"                <AuthTlrNo></AuthTlrNo>\r\n" + 
	            				"                <AuthBrchCd></AuthBrchCd>\r\n" + 
	            				"                <AuthTlrPswd></AuthTlrPswd>\r\n" + 
	            				"                <AuthTlrLvl></AuthTlrLvl>\r\n" + 
	            				"                <AuthTlrTp></AuthTlrTp>\r\n" + 
	            				"            </AuthTlrArr>\r\n" + 
	            				"        </array>\r\n</APP_HEAD>";
	            		
	        String BODY="\r\n<BODY>\r\n" + 
	        		"        <UsrCd>"+staff+"</UsrCd>\r\n" + 
	        		"        <Token>"+tokenNo+"</Token>\r\n" + 
	        		"        <PrphrlSysCd>"+4008+"</PrphrlSysCd>\r\n" + 
	        		"</BODY>";   		
	        message.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>" + 
	        		"<service>");
	        message.append(SYS_HEAD+APP_HEAD+BODY);
	        message.append("\r\n</service>");
	        //报文头拼接，报文内容长度8位，不够补零。
	        String msgLength =String.valueOf(message.toString().getBytes().length);
			while (msgLength.length() <8 ) {
				msgLength = "0" + msgLength;
			}
			String msg=message.toString();
			msg=msgLength+msg;
			logBefore(logger, "发送报文"+msg);
			socket.getOutputStream().write(msg.getBytes("UTF-8"));//往esb写报文
		    socket.shutdownOutput();//写报文结束
		    //接收esb的报文
		    inputStream = socket.getInputStream();
			byte[] head = new byte[8];// 文长度标识，固定8个字节报
			inputStream.read(head);
			byte [] msgContent = null;
			int dataLen = Integer.parseInt(new String(head,"UTF-8"));
				if (dataLen > 0) {
					msgContent = new byte[dataLen];
					int len=inputStream.read(msgContent);
					while(len<dataLen){
						msgContent[len] = (byte) inputStream.read();
						len++;
					}
				}
				
			System.out.println(new String(msgContent,"UTF-8"));
			logBefore(logger, "接受报文"+new String(msgContent,"UTF-8"));
			Document document = DocumentHelper.parseText(new String(msgContent,"UTF-8"));
			JSONObject json = xmlDocToJSON(document);
			String body = json.getString("BODY");
			//获取esb报文中body数据
			//所有key值：TknVerfFlg,PrphrlSysCd,UsrCd,UsrNm,UsrSex,IdentTp,IdentNo,MblNo,CtcAdr,UsrSrc,BlngBrchNo,BsnPcsBrchNo,SignInMd,UsrSt,UsrLvl,RlInfoArr,RlCd,RlInfoArr
			Map<String,Object> maps = JSON.parseObject(body);
			String RlInfoArr = json.getJSONObject("BODY").getJSONArray("RlInfoArr").toJSONString();
			List<Object> lists =  JSON.parseArray(RlInfoArr);
			maps.put("RlInfoArr", lists);
			pd.put("maps", maps);
			//获取IP和mac
			HttpServletRequest request = this.getRequest();
			String ip = "";
			if (request.getHeader("x-forwarded-for") == null) {  
				ip = request.getRemoteAddr();  
		    }else{
		    	ip = request.getHeader("x-forwarded-for");  
		    }
			pd.put("IP", ip);
			pd.put("MAC", operationService.getMac());
			PageData result = ddLoginService.DDloginUserDeal(pd);
			
			mv.addObject("result", result);
			mv.addObject("pd", pd);
			mv.setViewName("system/index/DDLogin");
			
		}catch(Exception e) {
			throw e;
		}finally {
			if(inputStream!=null){
				inputStream.close();
			}
			if(outputStream!=null){
				outputStream.close();
			}
			if(socket!=null){
				socket.close();
			}
			socket.close();
		}
		return mv;
	}
	
	public static JSONObject xmlDocToJSON(Document document){
//		File file = new File("C:\\Users\\ZHANGHUIAF\\Desktop\\response.xml");
//		SAXReader reader = new SAXReader();
//		Document document = null;
//		try {
//			document = reader.read(file);
//		} catch (DocumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		JSONObject json = new JSONObject();
		Element root = document.getRootElement();
		Element sys = root.element("SYS_HEAD");
		JSONObject SYS_HEAD = new JSONObject();
		List<Element> sysLists = sys.elements();
		for(Element el:sysLists){
			if("array".equals(el.getName())){
				JSONArray rets = new JSONArray();
				List<Element> retLists = el.element("Ret").elements();
				for(Element retList:retLists){
					JSONObject ret = new JSONObject();
					ret.put(retList.getName(), retList.getText());
					rets.add(ret);
				}
				SYS_HEAD.put("Ret", rets);
			}else{
				SYS_HEAD.put(el.getName(), el.getText());
			}
			
		}
		Element app = root.element("APP_HEAD");
		JSONObject APP_HEAD = new JSONObject();
		List<Element> appLists = app.elements();
		for(Element el:appLists){
			if("array".equals(el.getName())){
				JSONArray tlrArrs = new JSONArray();
				List<Element> eles = el.elements();
				for(Element ele:eles){
					if("EntrTlrArr".equals(ele.getName())){
						List<Element> entrTlrArrs = ele.elements();
						for(Element entrTlrArr:entrTlrArrs){
							JSONObject entrTlrArrData = new JSONObject();
							entrTlrArrData.put(entrTlrArr.getName(), entrTlrArr.getText());
							tlrArrs.add(entrTlrArrData);
						}
						APP_HEAD.put("EntrTlrArr", tlrArrs);
					}
					if("AuthTlrArr".equals(ele.getName())){
						List<Element> authTlrArrs = ele.elements();
						for(Element authTlrArr:authTlrArrs){
							JSONObject authTlrArrData = new JSONObject();
							authTlrArrData.put(authTlrArr.getName(), authTlrArr.getText());
							tlrArrs.add(authTlrArrData);
						}
						APP_HEAD.put("AuthTlrArr", tlrArrs);
					}
				}
				
			}else{
				APP_HEAD.put(el.getName(), el.getText());
			}
		}
		
		Element body = root.element("BODY");
		JSONObject BODY = new JSONObject();
		List<Element> bodyLists = body.elements();
		for(Element el:bodyLists){
			if("array".equals(el.getName())){
				JSONArray rlcds = new JSONArray();
				List<Element> rlDatas = el.elements();
				for(Element rlData:rlDatas){
					JSONObject rlcd = new JSONObject();
					List<Element> rlLists = rlData.elements();
					for(Element rl:rlLists){
						rlcd.put(rl.getName(), rl.getText());
					}
					rlcds.add(rlcd);
				}
				BODY.put("RlInfoArr", rlcds);
			}else{
				BODY.put(el.getName(), el.getText());
			}
		}
		json.put("SYS_HEAD", SYS_HEAD);
		json.put("APP_HEAD", APP_HEAD);
		json.put("BODY", BODY);
		return json;
	}
	
	
}
