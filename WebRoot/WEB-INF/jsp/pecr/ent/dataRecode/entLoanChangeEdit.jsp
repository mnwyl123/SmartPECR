<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
<link rel="stylesheet" href="plugins/layui/css/admin.css" media="all">
<!-- 客户化后的css，调整了字体和宽度等 -->
<link rel="stylesheet" href="plugins/layui/css/layui.custom.css" media="all">
<style>
	.layui-tab {
		text-align: left !important;
		margin: 0px;
	}
</style>
</head>
<body style="background-color: #FFFFFF;">  
<input type="hidden" id="acctBsSgmt" value='${acctBsSgmt}'>
<input type="hidden" id="acctBsInfSgmt" value='${acctBsInfSgmt}'>
<input type="hidden" id="acctCredSgmt" value='${acctCredSgmt}'>
<input type="hidden" id="creditorInfSgmt" value='${creditorInfSgmt}'>
<input type="hidden" id="lbltyInfSgmt" value='${lbltyInfSgmt}'>
<input type="hidden" id="addOrUpdate" value='${pd.addOrUpdate}'>
<input type="hidden" id="feedBackError" value="<c:if test="${not empty feedBackErrorSgmt}"><c:forEach items="${feedBackErrorSgmt}" var="var" varStatus="vs">${vs.index+1 }：${var.errorMsg }</c:forEach></c:if>">
<div class="wrap">
	<div class="layui-tab layui-tab-brief" lay-filter="loanAcctInfotab" style="height: 100%;">
		<ul class="layui-tab-title">
			<li data-type="D1" class="layui-this">D1-非循环贷账户</li>
			<li data-type="D2">D2-贴现账户</li>
			<li data-type="R1">R1-循环贷账户</li>
			<li data-type="R4">R4-循环额度下分账户</li>
			<li data-type="C1">C1-催收账户</li>
		</ul>
		<div class="layui-tab-content" style="position: absolute;left: 0;right: 0;top: 35px;bottom: 0;">
			<div data-type="D1" class="layui-tab-item layui-show" style="width: 100%;height: 100%;">
				<iframe src="" data-src="entUpDaccountData/entLoanChangeEditD1.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="D2" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="entUpDaccountData/entLoanChangeEditD2.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="R1" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="entUpDaccountData/entLoanChangeEditR1.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="R4" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="entUpDaccountData/entLoanChangeEditR4.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="C1" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="entUpDaccountData/entLoanChangeEditC1.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
		</div>
	</div>
</div>
<!-- 表格列上的工具栏 -->
<script type="text/html" id="tableColBar">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/ent/entLoanChangeEdit.js" charset="utf-8"></script>
</body>
</html>
