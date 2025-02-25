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
<link rel="stylesheet" href="css/pecr/personProtocolInfo/personProtocolInfoEdit.css" media="all">
</head>
<style type="text/css">
	.layui-form-label{
	float: left;
	display: block;
	padding: 5px 10px 8px 15px;
	width: 300px;
	font-weight: 500;
	line-height: 15px;
	text-align: end;
	font-size: 13px;
	font-family: Microsoft Yahei;
	}
</style>
<body style="background-color: #FFFFFF;">  
<input type="hidden" id="cashFlowsBsSgmt" value='${cashFlowsBsSgmt}'>
<input type="hidden" id="cashFlows2002Sgmt" value='${cashFlows2002Sgmt}'>
<input type="hidden" id="cashFlows2007Sgmt" value='${cashFlows2007Sgmt}'>
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
											<option value="630" selected>企业现金流量表信息记录</option>
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
										<select id="entCertType" name='entCertType' lay-verify="required">
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
										<input type="text" placeholder="" class="layui-input" id="sheetYear" lay-verify="required">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报表类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="sheetType" name='sheetType' lay-verify="required">
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
										<select id="sheetTypeDivide" name='sheetTypeDivide' lay-verify="required">
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
										<input type="text" placeholder="" class="layui-input datefield" id="auditTime" lay-verify="required">
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
										<select id="rptDateCode" name='rptDateCode' lay-verify="required">
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
										<input type="text" placeholder="" class="layui-input datefield" id="rptDate" lay-verify="required">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
				<!-- 2002版现金流量表段 start-->
				<div class="layui-colla-item" id="oldBox">
					<form class="layui-form" id="02sheet">
						<input type="button" id="basicAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" id="basicSaveBtn" lay-filter="basicSaveBtn" lay-submit style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="basicDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn" ></input>
						<h3 class="layui-colla-title">2002版现金流量表段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	经营活动现金流入小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashInflowsFromOperat_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	经营活动现金流出小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashOutflowsFromOpera_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	经营活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromOperating_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	投资活动现金流入小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashInflowsFromInvest_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	投资活动现金流出小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashOutflowsFromInves_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	投资活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromInvesting_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	筹资活动现金流入小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashInflowsFromFinanc_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            <b style="color: #f00;">*</b>
			                            	筹资活动现金流出小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashOutflowsFromFinan_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            <b style="color: #f00;">*</b>
			                            	筹集活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromFinancing_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            <b style="color: #f00;">*</b>
			                            	现金及现金等价物净增加额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netIncreaseinCashAndCashE_old" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	销售商品和提供劳务收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromSalesOfGo_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收到的税费返还:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="taxRefunds_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 收到的其他与经营活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherCashReceivedRelatingT_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	购买商品、接受劳务支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaidForGoodsAndServic_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付给职工以及为职工支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaidToAndOnBehalfOf_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付的各项税费:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="paymentsOfAllTypesOfTaxes_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付的其他与经营活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherCashPaymentsFromOpera_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收回投资所收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromReturnOfI_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	取得投资收益所收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromOnvestments_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	处置固定资产无形资产和其他长期资产所收回的现金净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashReceivedFromDisposa_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收到的其他与投资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedRelatingToOthe_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	购建固定资产无形资产和其他长期资产所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaidToAcquireFixedAss_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	投资所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsForInvestments_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付的其他与投资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsRelatedToOthT_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	吸收投资所收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromInvestors_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 借款所收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashFromBorrowings_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收到的其他与筹资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherCashReceivedRelatingC_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	偿还债务所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashRepaymentsForDebts_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	分配股利、利润或偿付利息所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsForDistribution_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付的其他与筹资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsRelatedToOthC_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	汇率变动对现金的影响:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="effectOfExchangRateChanges_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	净利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netProfit_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 计提的资产减值准备:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="provisionForAssets_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	固定资产拆旧:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="depreciationOfFixedAssets_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	无形资产摊销:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="amortisationOfIntangibleAss_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	长期待摊费用摊销:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="longTermDeferredExpensesAm_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	待摊费用减少:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="decreaseOfDefferedExpenses_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	预提费用增加:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="additionOfAccuedExpense_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	处置固定资产无形资产和其他长期资产的损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossesOnDisposalOfFixedAs_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	固定资产报废损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossesOnScrappingOfFixedA_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	财务费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="financeExpense_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	投资损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossesArsingFromInvestment_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	递延税款贷项:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="deferredTaxCredit_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	存货的减少:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="decreaseInInventories_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	经营性应收项目的减少:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="decreaseinOperatingReceivabl_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	经营性应付项目的增加:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="increaseinOperatingReceivabl_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            (净利润调节为经营活动现金流量科目下)其他:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="others_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	经营活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromOperating2_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	债务转为资本:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="debtsTransferToCapital_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	一年内到期的可转换公司债券:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="oneYearDueConvertibleBonds_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	融资租入固定资产:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="financingRentToTheFixedAs_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            (不涉及现金收支的投资和筹资活动科目下)其他:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonCashOthers_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金的期末余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashAtTheEndOfPeriod_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金的期初余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashAtTheBeginningOfTheP_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金等价物的期末余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashEquivalentsAtTheEndOf_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 现金等价物的期初余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashRquivalentsAtTheBeginn_old" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金及现金等价物净增加额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netIncreaseInCashAndCash_old" lay-verify="assetsValue">
									</div>
								</div>	
							</div>
						</div>
					</form>
				</div>
				<!-- 2002版现金流量表段 end-->
			
				<!-- 2007版现金流量表段 start-->
				<div class="layui-colla-item" id="newBox">
					<form class="layui-form" id="07sheet">
						<input type="button" id="insuranceAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="insuranceSaveBtn" id="insuranceSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="insuranceDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">2007版现金流量表段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	经营活动现金流入小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashInflowsFromOperat_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                           	 经营活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromOperating_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                           	 投资活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromInvesting_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	筹集活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromFinancing_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                            	现金及现金等价物净增加额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netincreaseinCashAndCashEq_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
			                           	 期末现金及现金等价物余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="theFinalCashAndCashEquiva_new" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	销售商品和提供劳务收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromSalesOfGo_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收到的税费返还:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="taxRefunds_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收到其他与经营活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherCashReceivedRelatingJ_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	购买商品、接受劳务支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaidForGoodsAndServic_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付给职工以及为职工支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaidToAndOnBehaLfOf_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 支付的各项税费:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="paymentsOfAllTypesOfTaxes_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付其他与经营活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherCashPaymentsFromOpera_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	经营活动现金流出小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashOutflowsFromOpera_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收回投资所收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromReturnOfI_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	取得投资收益所收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromOnvestments_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	处置固定资产无形资产和其他长期资产所收回的现金净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashReceivedFromDisposa_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	处置子公司及其他营业单位收到的现金净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashInflowsOfDisposalO_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收到其他与投资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedRelatingToOthe_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	投资活动现金流入小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashInflowsFromInvest_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 购建固定资产无形资产和其他长期资产所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaidToAcquireFixedAss_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	投资所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsForInvestments_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	取得子公司及其他营业单位支付的现金净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashOutflowsOfProcureme_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付其他与投资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsRelatedToOthT_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 投资活动现金流出小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="subTotalOfCashOutflows_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	吸收投资收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashReceivedFromInvestors_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	取得借款收到的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashFromBorrowings_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	收到其他与筹资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherCashReceivedRelatingC_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	筹资活动现金流入小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashInflowsFromFinanc_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	偿还债务所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashRepaymentsForDebts_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	分配股利、利润或偿付利息所支付的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsForDistribution_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	支付其他与筹资活动有关的现金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashPaymentsRelatedToOthC_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	筹资活动现金流出小计:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="totalCashOutflowsFromFinan_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 汇率变动对现金及现金等价物的影响:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="effectOfExchangRateChanges_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	期初现金及现金等价物余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="initialCashAndCashEquivale_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	净利润:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netProfit_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	资产减值准备:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="provisionForAssetImpairment_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 固定资产折旧、油气资产折耗、生产性生物资产折旧:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="depreciationOfFixedAssets_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	无形资产摊销:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="amortisationOfIntangibleAss_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	长期待摊费用摊销:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="amortisationOfLongTermDeff_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	待摊费用减少:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="decreaseOfDefferedExpenses_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	预提费用增加:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="additionOfAccuedExpense_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	处置固定资产无形资产和其他长期资产的损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossesOnDisposalOfFixedAs_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	固定资产报废损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossesOnScrappingOfFixedA_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	公允价值变动损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="profitOrLossFromChangesIn_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	财务费用:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="financeExpense_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	投资损失:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="lossesArsingFromInvestment_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	递延所得税资产减少:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="deferredIncomeTaxAssets_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	递延所得税负债增加:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="deferredIncomeTaxLiabilitie_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 存货的减少:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="decreaseinInventories_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 经营性应收项目的减少:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="decreaseinOperatingReceivabl_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 经营性应付项目的增加:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="increaseInOperatingReceivab_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            (净利润调节为经营活动现金流量科目下)其他:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="others_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	经营活动产生的现金流量净额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netCashFlowsFromOperating2_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	债务转为资本:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="debtsTransferToCapital_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	一年内到期的可转换公司债券:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="oneYearDueConvertibleBonds_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	融资租入固定资产:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="financingRentToTheFixedAs_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            (不涉及现金收支的投资和筹资活动科目下)其他:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonCashOthers_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金的期末余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashAtTheEndOfPeriod_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金的期初余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashAtTheBeginningOfTheP_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金等价物的期末余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashEquivalentsAtTheEndOf_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                           	 现金等价物的期初余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cashEquivalentsAtTheBeginn_new" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3.5" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
			                            	现金及现金等价物净增加额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="netincreaseinCashAndCashE2_new" lay-verify="assetsValue">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 2007版现金流量表段 end-->
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

<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="plugins/layui/lay/modules/laytpl.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/js/pecr/ent/CashFlows/cashFlowsEdit.js" charset="utf-8"></script>

<!--表格列上的工具栏--> 
<script type="text/html" id="dataTableToolBarTpl">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
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
