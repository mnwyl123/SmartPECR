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

					<form action="moduleapp/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MODULE_ID1" id="MODULE_ID1" value="${pd.MODULE_ID}"/>
						<input type="hidden" name="SYS_INDD" id="SYS_INDD" value="${pd.SYS_IND}"/>
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">模块ID:<span class="red ">*</span></td>
								<td><input type="text" name="MODULE_ID" id="MODULE_ID" value="${pd.MODULE_ID}" maxlength="32" placeholder="这里输入模块ID" title="模块ID" class="width-75"  <c:if test="${null != pd.MODULE_ID}"> readonly="readonly" disabled</c:if> style="width:75%;"/></td>
							</tr>
							
							<!--
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系统（产品）id:<span class="red ">*</span></td>
								<td><input type="text" name="SYS_IND" id="SYS_IND" value="${pd.SYS_IND}" maxlength="50" placeholder="这里输入系统（产品）id" title="系统（产品）id" style="width:75%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系统（产品）名称:<span class="red ">*</span></td>
								<td><input type="text" name="PRO_NAME" id="PRO_NAME" value="${pd.PRO_NAME}" maxlength="50" placeholder="这里输入系统（产品）名称" title="系统（产品）名称" style="width:75%;"/></td>
							</tr>
							-->
							<tr>							
								<td style="width:75px;text-align: right;padding-top: 13px;">请选择系统应用:<span class="red ">*</span></td>
								<td>
									<!--fieldset -->
									<div class="row style_m"> 
										<div class="col-xs-3">
											
											<select dict-name="sysApps" name="SYS_IND" id="SYS_IND"  default-value="${pd.SYS_IND }" onblur="hasD();" <c:if test="${null != pd.SYS_IND}"> readonly = "readonly" disabled </c:if>>
												<option value="">请选择系统应用</option>
												<c:forEach items="${appList}" var="app">
													<option value="${app.SYS_IND }" <c:if test="${app.SYS_IND==pd.SYS_IND}"> selected </c:if>> ${app.SYS_IND}--${app.NAME}  </option>
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序:<span class="red ">*</span></td>
								<td><input type="text" name="ORDER_BY" id="ORDER_BY" value="${pd.ORDER_BY}" maxlength="50" placeholder="这里输入排序" title="排序" style="width:75%;" /></td>
							</tr>
							<!--<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>-->
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
					<div style="padding-top: 13px;" class="modal-footer center">
							<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
						</div>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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
			if($("#SYS_IND").val()==""){
				$("#SYS_IND").tips({
					side:3,
		            msg:'请选择系统（产品）',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SYS_IND").focus();
			return false;
			}
			if($("#ORDER_BY").val()==""){
				$("#ORDER_BY").tips({
					side:3,
		            msg:'请输入排序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEQ").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		//判断编号是否存在
		function hasD(){
			var SYS_IND = $.trim($("#SYS_IND").val());
			var MODULE_ID = $.trim($("#MODULE_ID").val());
			$.ajax({
				type: "POST",
				url: '<%=basePath%>moduleapp/hasD.do',
				//data: {SYS_IND:SYS_IND,tm:new Date().getTime()}, 
				data: {SYS_IND:SYS_IND,MODULE_ID:MODULE_ID,tm:new Date().getTime()}, 
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" != data.result){
						 $("#SYS_IND").tips({
								side:3,
								msg:'编号 :'+SYS_IND+' 已存在',
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