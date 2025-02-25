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
					
					<form action="sysApp/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SYS_IND1" id="SYS_IND1" value="${pd.SYS_IND}"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped" >
							<tr>
								<td class="align-right paddingt-13 width-30">系统编码:<span class="red ">*</span></td>
								<td class="paddingt-13"><input type="text" name="SYS_IND" id="SYS_IND" value="${pd.SYS_IND}" maxlength="100" placeholder="这里输入系统编码" title="系统编码" class="width-75" onblur="hasD();" <c:if test="${null != pd.SYS_IND}">readonly="readonly" disabled</c:if>/></td>
							</tr>
							<tr>
								<td class="align-right">系统名称:<span class="red ">*</span></td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="1000" placeholder="这里输入系统名称" title="系统名称" class="width-75"/></td>
							</tr>    
							<tr>
								<td class="align-right">状态:<span class="red ">*</span></td>
								<td>
									<select name="STATUS" id="STATUS"  class="width-75">
										<option value="">选择状态</option>
										<option value="1" <c:if test="${pd.STATUS == '1'}">selected</c:if>>1：有效</option>
										<option value="0" <c:if test="${pd.STATUS == '0'}">selected</c:if>>0：无效</option>
									</select>
								</td>
							</tr> 
							<tr>
								<td class="align-right">入口地址:<span class="red ">*</span></td>
								<td><input type="text" name="URL" id="URL" value="${pd.URL}" maxlength="1000" placeholder="这里输入入口地址" title="入口地址" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right">图片地址:<span class="red ">*</span></td>
								<td><input type="text" name="PICTURE_PATH" id="PICTURE_PATH" value="${pd.PICTURE_PATH}" maxlength="255" placeholder="这里输入图片地址" title="图片地址" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right">系统描述:<span class="red ">*</span></td>
								<td><input type="text" name="S_DESC" id="S_DESC" value="${pd.S_DESC}" maxlength="1000" placeholder="这里输入系统描述" title="系统描述" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right">系统分类:<span class="red ">*</span></td>
								<td><input type="text" name="S_CLASSES" id="S_CLASSES" value="${pd.S_CLASSES}" maxlength="20" placeholder="这里输入系统分类" title="系统分类" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right">模拟登陆地址:<span class="red ">*</span></td>
								<td><input type="text" name="IMITATE_URL" id="IMITATE_URL" value="${pd.IMITATE_URL}" maxlength="100" placeholder="这里输入模拟登陆地址" title="模拟登陆地址" class="width-75"/></td>
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
			 
			if($("#SYS_IND").val()==""){
				$("#SYS_IND").tips({
					side:3,
		            msg:'请输入系统编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SYS_IND").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入系统名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请选择状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#URL").val()==""){
				$("#URL").tips({
					side:3,
		            msg:'请输入入口地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#URL").focus();
			return false;
			}
			if($("#PICTURE_PATH").val()==""){
				$("#PICTURE_PATH").tips({
					side:3,
		            msg:'请输入图片地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PICTURE_PATH").focus();
			return false;
			}
			if($("#S_DESC").val()==""){
				$("#S_DESC").tips({
					side:3,
		            msg:'请输入系统描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#S_DESC").focus();
			return false;
			}
			if($("#S_CLASSES").val()==""){
				$("#S_CLASSES").tips({
					side:3,
		            msg:'请输入系统分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#S_CLASSES").focus();
			return false;
			}
			if($("#IMITATE_URL").val()==""){
				$("#IMITATE_URL").tips({
					side:3,
		            msg:'请输入模拟登陆地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IMITATE_URL").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show(); 
		}
		//判断编号是否存在
		function hasD(SYS_IND){
		var SYS_IND = $.trim($("#SYS_IND").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>sysApp/hasD.do',
	    	data: {SYS_IND:SYS_IND,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#SYS_IND").tips({
							side:3,
				            msg:'系统编码 '+SYS_IND+' 已存在',
				            bg:'#AE81FF',
				            time:2
				        });
					 $("#SYS_IND").val('');
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