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
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12 no-padding">
					
					<form action="homemanagement/${msg }.do" name="Form" id="Form" method="post"> 
						<input type="hidden" name="MODULE_ID1" id="MODULE_ID1" value="${pd.MODULE_ID}"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped" >
							<tr>
								<td class="align-right paddingt-13 width-30">编码:<span class="red ">*</span></td>
								<td class="paddingt-13"><input type="text" name="MODULE_ID" id="MODULE_ID" value="${pd.MODULE_ID}" maxlength="100" placeholder="这里输入模块ID" title="模块ID" class="width-75" onblur="hasD();" <c:if test="${null != pd.MODULE_ID}">readonly="readonly" disabled</c:if>/></td>
							</tr>
							<tr>
								<td class="align-right">模块名称:<span class="red ">*</span></td>
								<td><input type="text" name="MODULE_NAME" id="MODULE_NAME" value="${pd.MODULE_NAME}" maxlength="1000" placeholder="这里输入模块名称" title="模块名称" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right">图标:<span class="red ">*</span></td>
								<td><input type="text" name="MODULE_PICTURE" id="MODULE_PICTURE" value="${pd.MODULE_PICTURE}" maxlength="1000" placeholder="这里输入图标" title="图标" class="width-75"/></td>
							</tr> 
							
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
					<div class="footfix">
							<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
						</div>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" class="width50" /><br/><h4 class="lighter block green"></h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			 
			if($("#MODULE_ID").val()==""){
				$("#MODULE_ID").tips({
					side:3,
		            msg:'请输入模块ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODULE_ID").focus();
			return false;
			}
			if($("#MODULE_NAME").val()==""){
				$("#MODULE_NAME").tips({
					side:3,
		            msg:'请输入模块名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODULE_NAME").focus();
			return false;
			}
			if($("#MODULE_PICTURE").val()==""){
				$("#MODULE_PICTURE").tips({
					side:3,
		            msg:'请输入链接地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODULE_PICTURE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show(); 
		}
		//判断编号是否存在
		function hasD(MODULE_ID){
		var MODULE_ID = $.trim($("#MODULE_ID").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>homemanagement/hasD.do',
	    	data: {MODULE_ID:MODULE_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#MODULE_ID").tips({
							side:3,
				            msg:'模块ID :'+MODULE_ID+' 已存在',
				            bg:'#AE81FF',
				            time:2
				        });
					 $("#MODULE_ID").val('');
				 }
			}
		});
	}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>
					
			