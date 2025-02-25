<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	Object userName = session.getAttribute("USER_NAME");
	String errorCode = session.getAttribute("ERROR_CODE").toString();
	String errorMsg = session.getAttribute("ERROR_MSG").toString();
	
	String contextPath = request.getContextPath();	
	//准备显示信息
	String info = errorMsg + "，请与系统管理员联系。";
%>
<html>
<head>
<title>ModelB@nk统一认证中心</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.bj {
	background-image: url(static/sso/images/bg_top.png);
	background-repeat: no-repeat;
	background-position: center top;
}
.lable {
	font-family: "宋体";
	font-size: 14px;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
}
.next {
	font-family: "宋体";
	font-size: 13px;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
}
.titlelable {
	font-family: "宋体";
	font-size: 15px;
	font-style: normal;
	font-weight: bold;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body onkeydown="doKeyDown()">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th height="100%" align="left" valign="top" bgcolor="#FFFFFF" class="bj" scope="col"> <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <th height="271" align="left" valign="top" scope="col"><table width="63%" height="191"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <th height="17" scope="col"><img src="static/sso/images/UniformAuth.png" width="359" height="131"></th>
            </tr>
            <tr>
              <td align="left" valign="top"><table width="100%"  border="0" cellspacing="5" cellpadding="0">
                  <tr>
                    <th height="104" scope="col">&nbsp;</th>
                  </tr>
              </table></td>
            </tr>
          </table></th>
        </tr>
        <tr>
          <td align="left" valign="top"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr align="left" valign="top">
                <th width="35%" height="407" align="right" scope="col">&nbsp;</th>
                <th width="31%" align="center" valign="top" scope="col"><table width="100%"  border="0" cellspacing="0" cellpadding="5">
                  <tr>
                    <th width="26%" align="right" valign="top" scope="col"><img src="static/sso/images/warn.png" width="54" height="43"> </th>
                    <th width="74%" align="left"  class="titlelable" scope="col"><%= info%>                      <DIV id=content class=fl-screenNavigator-scroll-container>
                        <DIV id=msg class=success>                        </DIV>
                      </DIV></th>
                  </tr>
                  <tr>
                    <th width="26%" align="center" valign="top" scope="col">&nbsp;</th>
                    <td align="left" nowrap class="lable"><DIV id=content class=fl-screenNavigator-scroll-container>
                      <DIV id=msg class=success>
                        <P class="lable"><img src="static/sso/images/line.png" width="218" height="17"></P>
                        </DIV>
                    </DIV></td>
                  </tr>
                  <tr>
                    <th align="center" valign="top" scope="col">&nbsp;</th>
                    <td align="left" nowrap class="next">你还可以进行下一步的操作：</td>
                  </tr>
                  <tr>
                    <th align="center" valign="top" scope="col">&nbsp;</th>
                    <td align="left" nowrap class="next"><a href="<%= contextPath %>">重新登录</a></td>
                  </tr>
                  <tr>
                    <th align="center" valign="top" scope="col">&nbsp;</th>
                    <td align="left" nowrap class="next"><a href="<%=System.getProperty("cas.server.logout.url")%>">注销</a></td>
                  </tr>
                  <tr>
                    <th align="center" valign="top" scope="col">&nbsp;</th>
                    <td align="left" nowrap class="next"><a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a></td>
                  </tr>
                </table></th>
                <th width="34%" scope="col">&nbsp;</th>
              </tr>
            </table></td>
        </tr>
      </table></th>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" background="static/sso/images/bg_bottom.png" class="next">Copyright@2007-2012 神州数码融信软件有限公司</td>
  </tr>
</table>
</body>
</html>
