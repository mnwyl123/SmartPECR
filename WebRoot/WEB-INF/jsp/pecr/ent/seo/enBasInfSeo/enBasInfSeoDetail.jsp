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
<link rel="stylesheet" href="css/pecr/personLoanInfo/personLoanInfoEditC1.css" media="all">
</head>
<body style="background-color: #FFFFFF;">
<input type="hidden" id="entBsSgmt" value='${entBsSgmt}'>
<input type="hidden" id="entFcsInfSgmt" value='${entFcsInfSgmt}'>
<input type="hidden" id="entSpvsgAthrtyInfSgmt" value='${entSpvsgAthrtyInfSgmt}'>
<input type="hidden" id="entCotaInfSgmt" value='${entCotaInfSgmt}'>
<input type="hidden" id="addOrUpdate" value='${pd.addOrUpdate}'>
<div class="wrap">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-collapse">
				<!-- 基础段 start-->
				<div class="layui-colla-item" id="dcentBsSgmtDiv">
					<form class="layui-form" lay-filter="dcentBsSgmtForm">
						<input type="button" id="baseAddBtn" lay-filter="baseAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" id="dcentBsSgmtSub" lay-filter="dcentBsSgmtSub" lay-submit style="display: none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="dcentBsSgmtDel" lay-filter="dcentBsSgmtDel" value="删除" 
							 class="layui-btn layui-btn-xs pane-title-btn" style="display:none;margin-right:110px;"></input>
						<h3 class="layui-colla-title">基础段</h3>
						<div class="layui-colla-content layui-show">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							信息记录类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="infRecType" lay-verify="required" disabled>
								<option value="310" selected>企业基本信息记录</option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							企业名称:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" name="entName"  id="entName" lay-verify="required" maxlength="80">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							企业身份标识类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="entCertType_" >
							<select id="entCertType"  name="entCertType" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							企业身份标识号码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" name="entCertNum"  id="entCertNum" lay-verify="required" maxlength="80">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							信息来源编码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" name="infSurcCode" id="infSurcCode" lay-verify="required" maxlength="20">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							报告时点说明代码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="rptDateCode_" >
							<select id="rptDateCode" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
				<!-- 	<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							所属机构:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="orgCode" lay-verify="required">
								<option value="1">1</option>
							</select>
						</div>
					</div> -->
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							客户资料类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="customerType_" >
							<select id="customerType" lay-verify="required">
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
							<input type="text" placeholder="" name="cimoc" class="layui-input" id="cimoc" lay-verify="required|orgCodeLength">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							存续状态:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="etpSts_" >
							<select id="etpSts" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							组织机构类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="orgType_" >
							<select lay-filter="orgType" id="orgType" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							是否特殊数据标识:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="isFilter"  lay-verify="required">
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
							<input type="text" placeholder="" class="layui-input datefield" name="rptDate"  id="rptDate" lay-verify="required" maxlength="80">
						</div>
					</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
				<!-- 其他标识段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="dcentIdSgmtAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">其他标识段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="entIdSgmtTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="entIdSgmtTable"></table>
					</div>
				</div>
				<!-- 其他标识段 end-->
				
				<!-- 基本概况段 start-->
				<div class="layui-colla-item" id="dcentFcsInfSgmtDiv">
					<form class="layui-form">
						<input type="button" id="dcentFcsInfSgmtAdd" lay-filter="dcentFcsInfSgmtAdd" style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" id="dcentFcsInfSgmtSub" lay-filter="dcentFcsInfSgmtSub" lay-submit style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn"  value="保存当前段"></input>
						<input type="button" id="dcentFcsInfSgmtDel" lay-filter="dcentFcsInfSgmtDel" value="删除" 
							   class="layui-btn layui-btn-xs pane-title-btn" style="display:none;margin-right:110px;"></input>
						<h3 class="layui-colla-title">基本概况段</h3>
						<input type="hidden" id="eacFcsInfSgmtId">
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							国别代码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="nationality_" >
							<select lay-filter="nationality"  id="nationality" lay-search="" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							登记地址:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="regAdd" maxlength="100">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							登记地行政区划代码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="admDivOfReg_" >
							<select id="admDivOfReg" lay-search="">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							成立日期:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder=""  class="layui-input datefield" class="layui-input" id="establishDate" >
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							营业许可证到期日:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder=""class="layui-input datefield" id="bizEndDate" lay-verify="required" >
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							行业分类代码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="ecoIndusCate_" >
							<select id="ecoIndusCate" lay-search="" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							经济类型代码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="ecoType_" >
							<select id="ecoType" lay-search="" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							企业规模:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="entScale_" >
							<select id="entScale" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							业务范围:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder=""  class="layui-input" id="bizRange" maxlength="400">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							信息更新日期:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder=""  class="layui-input datefield" id="fcsInfoUpDate" lay-verify="required" >
						</div>
					</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基本概况段 end-->
				
				<!-- 联系方式段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="deentCotaInfSgmtAddBtn" style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" id="deentCotaInfSgmtSaveBtn" lay-filter="deentCotaInfSgmtSaveBtn" lay-submit style="display: none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="deentCotaInfSgmtDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">联系方式段</h3>
						<input type="hidden" id="eahCotaInfSgmtId" >
				<div class="layui-colla-content">
					<div class="layui-form-item layui-layer-padding">
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							联系地址行政区划代码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="conAddDistrictCcode_">
							<select id="conAddDistrictCcode"  lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							联系地址:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder=""  class="layui-input" id="conAdd" maxlength="100">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							联系电话:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="conPhone" maxlength="25">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							财务部门联系电话:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder=""  class="layui-input" id="finConPhone" maxlength="25">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							信息更新日期:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder=""  class="layui-input datefield"  id="cotaInfoUpDate" lay-verify="required" >
						</div>
					</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 联系方式段 end-->
				
				<!-- 主要组成人员段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="EntMnMmbInfSgmtAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">主要组成人员段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="EntMnMmbInfSgmtTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="EntMnMmbInfSgmtTable"></table>
					</div>
				</div>
				<!-- 主要组成人员段 end-->
				
				<!-- 注册资本及主要出资人段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="entMnShaHodInfSgmtAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">注册资本及主要出资人段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="entMnShaHodInfSgmtTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="entMnShaHodInfSgmtTable"></table>
					</div>
				</div>
				<!-- 注册资本及主要出资人段 end-->
				
				<!-- 实际控制人段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="entActuCotrlInfSgmtAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">实际控制人段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="entActuCotrlInfSgmtTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="entActuCotrlInfSgmtTable"></table>
					</div>
				</div>
				<!-- 实际控制人段 end-->
				
				<!-- 上级机构段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="dcentSpvsgAthrtyInfSgmtAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" lay-filter="dcentSpvsgAthrtyInfSgmtSaveBtn" lay-submit id="dcentSpvsgAthrtyInfSgmtSaveBtn" style="display: none;"
						        class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="dcentSpvsgAthrtyInfSgmtDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn" ></input>
						<h3 class="layui-colla-title">上级机构段</h3>
						<input type="hidden" id="eagSpvsgAthrtyInfSgmtId" >
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							上级机构类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="supOrgType_" >
							<select id="supOrgType" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							上级机构名称:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input"  id="supOrgName" lay-verify="required" maxlength="80">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							上级机构身份标识类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="hidden" id="supOrgCertType_" >
							<select id="supOrgCertType" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							上级机构身份标识号码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="supOrgCertNum" lay-verify="required" maxlength="40">
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							信息更新日期:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input datefield" id="supOrgInfoUpDate" lay-verify="required" >
						</div>
					</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 上级机构段 end-->
				
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

<!--表格列上的工具栏--> 
<script type="text/html" id="dataTabToolBarTpl">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script type="text/html" id="dataTabToolBarTplDetail">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
</script>

<!-- 所属机构模板 -->
<script type="text/html" id="orgTpl">
	 <option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.orgCode}}">{{item.orgCode}}-{{item.orgName}}</option>
	{{#  }); }}
</script>

<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<!-- 实际控制人段 -->
<div id="entActuCotrlInfSgmtEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<input type="hidden" id="eafActuCotrlInfSgmtId">
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					实际控制人身份类别:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select lay-filter="actuCotrlCertType" id="actuCotrlCertType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					实际控制人名称:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="actuCotrlName" lay-verify="required" maxlength="80">
                </div>
            </div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					实际控制人身份标识类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="actuCotrlIdType" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					实际控制人身份标识号码:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="actuCotrlIdNum" lay-verify="required" maxlength="40">
				</div>
			</div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
       				信息更新日期:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input datefield" id="actuCotrlInfoUpdate" lay-verify="required" >
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
            <div class="layui-inline layui-col-xs12">
                <div class="layui-input-inline" style="width: 100%;text-align: center;">
                    <button class="layui-btn layui-btn-primary" id="cancelentActuCotrlInfSgmtModelBtn">取消</button>
                    <button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveentActuCotrlInfSgmtModelBtn" id="saveentActuCotrlInfSgmtModelBtn">保存</button>
                </div>
            </div>
        </div>
	</form>
</div>
<!-- 其他标识段 -->
<div id="entIdSgmtEditModel" style="display: none;">
	<form class="layui-form">
        <div class="layui-form-item layui-col-space20" style="margin: 0;">
        	<input type="hidden" id="eabIdSgmtId">
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					企业身份标识类型:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select id="othEntCertType"name="othEntCertType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					企业身份标识号码:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="othEntCertNum" name="othEntCertNum" lay-verify="required" maxlength="40">
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					信息更新日期:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input datefield" id="idInfoUpDate" name="idInfoUpDate"lay-verify="required" >
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
            <div class="layui-inline layui-col-xs12">
                <div class="layui-input-inline" style="width: 100%;text-align: center;">
                    <button class="layui-btn layui-btn-primary" id="cancelentIdSgmtModelBtn">取消</button>
                    <button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveentIdSgmtModelBtn" id="saveentIdSgmtModelBtn">保存</button>
                </div>
            </div>
        </div>
   </form>
</div>
<!-- 注册资本及主要出资人段 -->
<div id="entMnShaHodInfSgmtEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<input type="hidden" id="eaeMnShaHodInfSgmtId">
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					注册资本币种:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select id="regCapCurrency" lay-search="" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
           </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					注册资本:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="regCap" lay-verify="required|regCapValue">
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出资人类型:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select id="sharHodType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
       				出资人身份类别:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select lay-filter="sharHodCertType" id="sharHodCertType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出资人名称:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="sharHodName" lay-verify="required" maxlength="80">
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出资人身份标识类型:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
					<select id="sharHodIdType" lay-verify="required">
						<option value="1">1</option>
					</select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出资人身份标识号码:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="sharHodIdNum" lay-verify="required" maxlength="40">
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出资比例（%）:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="invRatio" lay-verify="required|invRatioValue">
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
       				信息更新日期:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input datefield" id="mnShaHodInfoUpDate" lay-verify="required" >
                </div>
            </div>
            </div>
            <div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
	            <div class="layui-inline layui-col-xs12">
	                <div class="layui-input-inline" style="width: 100%;text-align: center;">
	                    <button class="layui-btn layui-btn-primary" id="cancelentMnShaHodInfSgmtModelBtn">取消</button>
	                    <button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveentMnShaHodInfSgmtModelBtn" id="saveentMnShaHodInfSgmtModelBtn">保存</button>
	                </div>
	            </div>
	        </div>
	</form>
</div>
<!-- 主要组成人员段 -->
<div id="entMnMmbInfSgmtEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<input type="hidden" id="eadMnMmbInfSgmtId">
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					主要组成人员姓名:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="mmbAlias" lay-verify="required" maxlength="30">
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					主要组成人员证件类型:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select id="mmbIdType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					主要成员证件号码:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input" id="mmbIdNum" lay-verify="required" maxlength="20">
                </div>
            </div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					主要组成人员职位:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="mmbPstn" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					信息更新日期:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <input type="text" placeholder="" class="layui-input datefield" id="mnMmbInfoUpdate" lay-verify="required" >
                </div>
            </div>
            </div>
			<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
	            <div class="layui-inline layui-col-xs12">
	                <div class="layui-input-inline" style="width: 100%;text-align: center;">
	                    <button class="layui-btn layui-btn-primary" id="cancelentMnMmbInfSgmtModelBtn">取消</button>
	                    <button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveentMnMmbInfSgmtModelBtn" id="saveentMnMmbInfSgmtModelBtn">保存</button>
	                </div>
	            </div>
	        </div>
   </form>
</div>



<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="plugins/layui/lay/modules/laytpl.js" charset="utf-8"></script>
<script src="static/js/pecr/ent/seo/enBasInfSeoEdit.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
</body>
</html>
