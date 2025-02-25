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
<html><!--个人基本信息记录  -->
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
<!-- 一些额外的css -->
<link rel="stylesheet" href="plugins/layui/css/admin.css" media="all">
<!-- 客户化后的css，调整了字体和宽度等 -->
<link rel="stylesheet" href="plugins/layui/css/layui.custom.css" media="all">
<link rel="stylesheet" href="css/pecr/personProtocolInfo/personProtocolInfoEdit.css" media="all">
</head>
<body style="background-color: #FFFFFF;">  
<input type="hidden" id="basBsSgmt" value='${basBsSgmt}'>
<input type="hidden" id="basFcsInfoSgmt" value='${basFcsInfoSgmt}'>
<input type="hidden" id="basSpsInfoSgmt" value='${basSpsInfoSgmt}'>
<input type="hidden" id="basEduInfoSgmt" value='${basEduInfoSgmt}'>
<input type="hidden" id="basOctpnInfoSgmt" value='${basOctpnInfoSgmt}'>
<input type="hidden" id="basRedncInfoSgmt" value='${basRedncInfoSgmt}'>
<input type="hidden" id="basMlgInfoSgmt" value='${basMlgInfoSgmt}'>
<input type="hidden" id="basIncInfSgmt" value='${basIncInfSgmt}'>
<input type="hidden" id="addOrUpdate" value='${pd.addOrUpdate}'>
<div class="wrap">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">				
			<div class="layui-collapse" >
				<div class="layui-colla-item" id="feedBackErrorDiv">
				<form class="layui-form">
					<h3 class="layui-colla-title">反馈错误信息展示</h3>	
					<div class="layui-colla-content <c:if test="${not empty feedBackErrorSgmt}">layui-show</c:if>">
					  <div class="layui-form-item layui-layer-padding">
						<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:99%;height:110px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"><c:if test="${not empty feedBackErrorSgmt}"><c:forEach items="${feedBackErrorSgmt}" var="var" varStatus="vs">${vs.index+1 }：${var.errorMsg }</c:forEach></c:if></textarea>
					  </div>
					</div>
					</form>
				</div>
				<!-- 基础段 start-->
				<div class="layui-colla-item" id="CtrctBsSgmtDiv">
					<form class="layui-form">
						<input type="button" id="baseAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="baseSaveBtn" id="baseSaveBtn" lay-submit style="display: none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="baseDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>	   
						<h3 class="layui-colla-title">基础段</h3>	
						<div class="layui-colla-content layui-show">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息记录类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="infRecType" name="infRecType" lay-verify="required" disabled>
											<option value="110" selected>个人基本信息记录</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										姓名:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="name" lay-verify="required" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										证件类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="idType" name="idType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										证件号码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="idNum" lay-verify="required" maxlength="20">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息来源编码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="infSurcCode" lay-verify="required|noChinese" maxlength="20">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报告时点说明代码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="rptDateCode" name="rptDateCode" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
							 	<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										所属机构:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="orgCode" name="orgCode" lay-filter= "orgCode" lay-verify="required" lay-search="">
											<option value="">请选择</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										客户资料类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="customerType" name="customerType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										客户资料维护机构代码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cimoc" name="cimoc" lay-verify="required|orgCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										是否特殊数据标识:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="isFilter" lay-verify="required">
											<option value=""></option>
											<option value="Y">是</option>
											<option value="N" selected>否</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息报告日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="rptDate" lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
				<!-- 其他标识段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="responsibleAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">其他标识段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="responsibleDataTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="responsibleDataTable"></table>
					</div>
				</div>
				<!-- 其他标识段 end-->
				
				
				<!-- 基本信息段 start-->
				<div class="layui-colla-item" id="dcAcctBsInfSgmtDiv">
					<form class="layui-form">
						<input type="button" id="basicAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" id="basicSaveBtn" lay-filter="basicSaveBtn" lay-submit style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="basicDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn" ></input>
						<h3 class="layui-colla-title">基本概况段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										性别:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="sex" name="sex" lay-verify="required">
											<option value="">请选择</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										出生日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="dob" >
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										国籍:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select lay-filter="nation" id="nation"  lay-search="" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										户籍所在地行政区划:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="hhDist" lay-search="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										户籍地址:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="houseAdd" maxlength="100">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										手机号码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cellPhone" lay-verify="validPhoneNum">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										电子邮箱:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="email" maxlength="60">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息更新日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="fcsInfoUpDate" lay-verify="required" readonly>
									</div>
								</div>	
							</div>
						</div>
					</form>
				</div>
				<!-- 基本信息段 end-->
				
						
							
				<!-- 教育信息段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="insuranceAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="insuranceSaveBtn" id="insuranceSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="insuranceDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">教育信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										学历:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="eduLevel" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										学位:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="acaDegree" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息更新日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="eduInfoUpDate" lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 教育信息段 end-->
				
				<!-- 职业信息段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="jobAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="jobSaveBtn" id="jobSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="jobDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">职业信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										就业状况:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="empStatus" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单位名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cpnName" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单位性质:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="cpnType">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单位所属行业:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="industry">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单位详细地址:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cpnAddr" maxlength="100">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单位所在地邮编:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cpnPc" lay-verify="zipCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单位所在地行政区划:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="cpnDist" lay-search="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单位电话:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cpnTEL" maxlength="25">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										职业:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="occupation">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										职务:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="title">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										职称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="techTitle">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										本单位工作起始年份:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="workStartDate">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息更新日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="octpnInfoUpDate" lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 职业信息段 end-->
				
				<!-- 居住地址段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="liveAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="liveSaveBtn" id="liveSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="liveDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">居住地址段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										居住状况:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="resiStatus" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										居住地详细地址:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="resiAddr" maxlength="100">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										居住地邮编:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="resiPc" lay-verify="zipCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										居住地行政区划:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="resiDist" lay-search="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										住宅电话:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="homeTel" maxlength="25">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息更新日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="resiInfoUpDate" lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 居住地址段 end-->
				
				<!-- 通讯地址信息段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="communicationAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="communicationSaveBtn" id="communicationSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="communicationDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">通讯地址信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										通讯地址:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="mailAddr" lay-verify="required" maxlength="100">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										通讯地邮编:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="mailPc" lay-verify="required|zipCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										通讯地行政区划:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="mailDist" lay-search="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息更新日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="mlgInfoUpDate" lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 通讯地址信息段 end-->
				
				<!-- 婚姻信息段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="marriageAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="marriageSaveBtn" id="marriageSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="marriageDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">婚姻信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										婚姻状况:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="mariStatus" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										配偶姓名:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="spoName" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										配偶证件类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="spoIdType" >
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										配偶证件号码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="spoIdNum" maxlength="20">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										配偶联系电话:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="spoTel" maxlength="25">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										配偶工作单位:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="spsCmpyNm" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息更新日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="spsInfoUpDate" lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 婚姻信息段 end-->
				
				<!-- 收入信息段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="incomeAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="incomeSaveBtn" id="incomeSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="incomeDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">收入信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										自报年收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="annlInc" lay-verify="required|regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										纳税年收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="taxIncome" lay-verify="required|regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息更新日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="incInfoUpDate" lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 收入信息段 end-->
			</div>
		</div>
	</div>
	
	<div class="layui-form-item layui-col-xs12" style="width: 80%;margin: 30px 0 20px;text-align: center;">
        <div class="layui-inline layui-col-xs12">
            <div class="layui-input-inline" style="width: 100%;">
                <button class="layui-btn layui-btn-primary" id="cancelAllModelBtn">关闭</button>
                <button class="layui-btn layui-btn-custom-blue" id="delAllModelBtn" style="display: none;">删除</button>
                <button class="layui-btn layui-btn-custom-blue" id="pushAllModelBtn" style="display: none;">提交</button>
                <button class="layui-btn layui-btn-custom-blue" id="approvalAllBtn" style="display: none;">审批</button>
                <button class="layui-btn layui-btn-custom-blue" id="overruleAllBtn" style="display: none;">驳回</button>
                <button class="layui-btn layui-btn-custom-blue" id="entireDelAllModelBtn" style="display: none;">生成整笔删除报文</button>
                <button class="layui-btn layui-btn-custom-blue" id="idChangeAllModelBtn" style="display: none;">标识变更</button>
            </div>
        </div>
    </div>
</div>

<div id="responsibleEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					姓名:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" name="alias" id="alias" lay-verify="required" maxlength="30">
				</div>
			</div>
            <div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					证件类型:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select id="othIdType" name="othIdType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					证件号码:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" name="othIdNum" id="othIdNum" lay-verify="required" maxlength="20">
                </div>
            </div>
            <div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					信息更新日期:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input datefield" name="idInfoUpDate" id="idInfoUpDate" lay-verify="required" readonly>
                </div>
            </div>
		</div>
		<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px; text-align: center;">
			<div class="layui-inline">
				<div class="layui-input-inline" style="width: 100%;text-align: right;">
					<button class="layui-btn layui-btn-primary" id="cancelResponsibleModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveResponsibleModelAddBtn" id="saveResponsibleModelAddBtn">保存</button>
				</div>
			</div>
		</div>
		<input type="button" id="saveResponsibleAddBtn" style="display: none;" class="layui-btn layui-btn-xs pane-title-btn" value=""></input>
	</form>
</div>


<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="plugins/layui/lay/modules/laytpl.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<script src="static/js/pecr/indv/IndvBasicsInfo/indvBasicsInfoEdit.js" charset="utf-8"></script>
<!--表格列上的工具栏--> 
<script type="text/html" id="dataTableToolBarTpl">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script type="text/html" id="dataTableToolBarTplDetail">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
</script>
<!-- 所属机构模板 -->
<script type="text/html" id="orgTpl">
	 <option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.orgCode}}" data-id="{{item.orgFourteenCode}}">{{item.orgCode}}-{{item.orgName}}</option>
	{{#  }); }}
</script>

<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
</body>
</html>
