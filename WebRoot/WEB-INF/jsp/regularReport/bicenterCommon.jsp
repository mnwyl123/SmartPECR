<%@ page import="java.util.*" %>
<%@ page session="false"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
      + request.getServerName() + ":" + request.getServerPort()
      + path + "/bicenter/";
  if (null != request.getAttribute("fromProxy")
      && (Boolean) request.getAttribute("fromProxy")) {
    basePath = "";
  }
%>