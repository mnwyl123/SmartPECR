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
<!-- 一些额外的css -->
<link rel="stylesheet" href="plugins/layui/css/admin.css" media="all">
<!-- 客户化后的css，调整了字体和宽度等 -->
<link rel="stylesheet" href="plugins/layui/css/layui.custom.css" media="all">
<link rel="stylesheet" href="css/pecr/enterpriseIncomeInfo/enterpriseIncomeInfoEdit.css" media="all">
<style type="text/css">
	.layui-form-label{
		overflow: hidden; 
		text-overflow: ellipsis;
		white-space: nowrap;
	}
</style>
</head>
<body style="background-color: #FFFFFF;">  
<input type="hidden" id="incomeStatement" value='${incomeStatement}'>
<input type="hidden" id="incomeStatement02" value='${incomeStatement02}'>
<input type="hidden" id="incomeStatement07" value='${incomeStatement07}'>
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
										<select id="infRecType" lay-verify="required" disabled>
											<option value="620" selected>企业利润及利润分配表信息记录</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										企业名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="entName" lay-verify="required" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										企业身份标识类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="entCertType" lay-verify="required">
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
										<input type="text" placeholder="" class="layui-input" id="entCertNum" lay-verify="required" maxlength="40">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报表年份:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="sheetYear" lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报表类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="sheetType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报表类型细分:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="sheetTypeDivide" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										审计事务所名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="auditFirmName" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										审计人员名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="auditorName" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										审计时间:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="auditTime" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										所属机构:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="orgCode" name="orgCode" lay-verify="required" lay-filter= "orgCode">
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
										<input type="text" placeholder="" class="layui-input" id="cimoc" lay-verify="required|orgCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报告时点说明代码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="rptDateCode" lay-verify="required">
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
				
				<!-- 2002版利润及利润分配表段 start-->
				<div class="layui-colla-item" id="oldBox">
					<form class="layui-form" id="02sheet">
						<input type="button" id="oldAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" id="oldSaveBtn" lay-filter="oldSaveBtn" lay-submit style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="oldDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn" ></input>
						<h3 class="layui-colla-title">2002版利润及利润分配表段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										主营业务收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="mainRevenuefRevenue_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										主营业务利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="principleBusinessProfit_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										营业利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="operatingProfits_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										利润总额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalProfit_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										净利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netProfit_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(主营业务收入科目下)出口产品销售收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="salesIncomeOfExportGoodsP_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(主营业务收入科目下)进口产品销售收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="salesIncomeOfImportGoodsP_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										销售折扣与折让:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="discountAndAllowance_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										主营业务收入净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netAmountOfIncomeFromMain_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										主营业务成本:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="mainOperatingCost_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(主营业务成本科目下)出口产品销售成本:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="salesIncomeOfExportProduct_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										主营业务税金及附加:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="principleBusinessTaxAndExt_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										经营费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="operationExpense_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他(业务成本):
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="othersOperatingCost_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										递延收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="deferredIncome_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										代购代销收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="incomeFromSalesAgency_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他(收入):
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherOperatingIncome_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他业务利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherBusinessProfit_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										营业费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="sellingExpenses_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										管理费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="generalAndAdministrativeExp_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										财务费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="financialExpenses_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他(费用):
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="othersExpenses_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										投资收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="investmentIncome_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										期货收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="futuresIncome_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										补贴收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="allowanceIncome_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(补贴收入科目下)补贴前亏损的企业补贴收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="allowanceIncomeBeforeAllowa_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										营业外收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonOperatingIncome_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外收入科目下)处置固定资产净收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netGainOnDisposalOfFixed_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外收入科目下)非货币性交易收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="incomeFromNonCurrencyTrade_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外收入科目下)出售无形资产收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="incomeFromSalesOfIntangibl_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外收入科目下)罚款净收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="incomeFromPenalty_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他(利润):
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="othersIncome_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(其他科目下)用以前年度含量工资节余弥补利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="calculatingFromTheContentS_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										营业外支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonOperatingExpenses_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外支出科目下)处置固定资产净损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossFromDisposalOfFixedAs_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外支出科目下)债务重组损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="exchangeOfNonMonetaryAsset_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外支出科目下)罚款支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossOfLawsuits_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(营业外支出科目下)捐赠支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="paymentForDonation_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherPayments_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(其他支出)结转的含量工资包干节余:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="balanceOfContentSalary_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										所得税:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="incometax_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										少数股东损益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="imparimentLoss_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										未确认的投资损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="unrealizedinvestmentLosses_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										年初未分配利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitDistributionAtBeginni_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										盈余公积补亏:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="compensationOfSurplusReserv_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他调整因素:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherAdjustmentFactors_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										可供分配的利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitAvailableForDistribut_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										单项留用的利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitReservedForASingleit_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										补充流动资本:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="supplementaryCurrentCapital_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										提取法定盈余公积:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="appropriationOfStatutorySur_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										提取法定公益金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="appropriationOfStatutoryWel_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										提取职工奖励及福利基金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="appropriationOfStaffincentiv_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										提取储备基金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="appropriationOfReserveFund_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										提取企业发展基金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="appropriationOfEnterpriseEx_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										利润归还投资:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitsCapitalizadOnReturn_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(可供分配的利润科目下)其他:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="others_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										可供投资者分配的利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitAvailableForOwnersDi_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										应付优先股股利:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="preferredStockDividendsPaya_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										提取任意盈余公积:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="withdrawalOtherCommonAccumu_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										应付普通股股利:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="payableDividendsOfCommonSt_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										转作资本的普通股股利:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="transferFromOrdinaryShares_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(可供投资者分配的利润科目下)其他:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="othersForOwners_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										未分配利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="unappropriatedProfit_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(未分配利润科目下)应由以后年度税前利润弥补的亏损:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossCompensatedBeforeTheTa_old" lay-verify="assetsValue">
									</div>
								</div>	
							</div>
						</div>
					</form>
				</div>
				<!-- 2002版利润及利润分配表段 end-->
							
				<!-- 2007版利润及利润分配表段 start-->
				<div class="layui-colla-item" id="newBox">
					<form class="layui-form" id="07sheet">
						<input type="button" id="newAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="newSaveBtn" id="newSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="newDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">2007版利润及利润分配表段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										营业收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="revenueOfSales_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										营业利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="operatingProfits_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										利润总额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitBeforeTax_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										净利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netProfit_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										营业成本:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="costOfSales_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										营业税金及附加:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="businessAndOtherTaxes_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										销售费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="sellingExpenses_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										管理费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="generalAndAdministrativeExp_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										财务费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="financialExpense_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										资产减值损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="impairmentLossOfAssets_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										公允价值变动净收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitOrLossArisingFromCh_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										投资净收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="investmentIncome_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										对联营企业和合营企业的投资收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="investmentIncomeFromAffilia_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										营业外收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonOperatingIncome_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										营业外支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonOperatingExpenses_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="width:200px;float:none;text-align: left;">
										非流动资产损失(其中：非流动资产处置损失):
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonCurrentassets_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										所得税费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="incomeTaxExpense_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										基本每股收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="basicearningsPerShare_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										稀释每股收益:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="dilutedEarningsPerShare_new" lay-verify="assetsValue">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 2007版资产负债表段 end-->
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
			</div>
		</div>
	</div>
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
<script src="static/js/pecr/ent/financial/entIncomeInfoEdit.js" charset="utf-8"></script>

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
