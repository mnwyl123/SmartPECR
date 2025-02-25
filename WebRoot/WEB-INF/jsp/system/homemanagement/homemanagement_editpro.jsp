<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<!-- 图标 -->
	<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12" >
					<div class="float-r margin-5"> 
						<div class="btn-group">
						<a class="btn btn-hanzi btn-orange"  onclick="window.location.href=document.referrer ;">返&nbsp;&nbsp;&nbsp;回</a> 
						</div>
					</div>
					<form action="homemanagement/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MODULE_ID" id="MODULE_ID" value="${pd.MODULE_ID}"/>
						<div id="zhongxin" class="paddingt-5">
						<table id="table_report" class="table table-striped bgreen1 margin-5" ><!-- table-bordered table-hover -->
							<tr>
								<td class="width35 align-right paddingt-13" >模块名称:</td>
								<td class="width-40" ><input type="text" name="MODULE_NAME" id="MODULE_NAME" value="${pd.MODULE_NAME}" maxlength="255" placeholder="这里输入名称" title="名称" class="width-75" disabled/></td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->
<!-- 
<c:if test="${msg == 'edit' }"> -->
	<div id="zhongxin1">
		<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/moduleapp/list.do?MODULE_ID=${pd.MODULE_ID}" style="margin:0 auto;width:100%;height:420px;;"></iframe>
	</div>
<!-- </c:if>  -->



	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());

		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>