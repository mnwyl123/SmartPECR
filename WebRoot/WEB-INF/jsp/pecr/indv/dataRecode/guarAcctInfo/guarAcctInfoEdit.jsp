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
<body style="background-color: #FFFFFF;">  
<input type="hidden" id="acctBsSgmt" value='${acctBsSgmt}'>
<input type="hidden" id="acctInfSgmt" value='${acctInfSgmt}'>
<input type="hidden" id="repymtInfSgmt" value='${repymtInfSgmt}'>
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
										信息记录类型
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="infRecType" name='infRecType' lay-verify="required" disabled>
											<option value="230" selected>个人担保账户信息记录</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										账户类型
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="acctType" name='acctType' lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										账户标识码
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="acctCode" name='acctCode'
										       lay-verify="required" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报告时点说明代码
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
										债务人姓名
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="name" name='name'
										       lay-verify="required" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										债务人证件类型
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="idType" name='idType' lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										债务人证件号码
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="idNum" name='idNum'
										       lay-verify="required" maxlength="20">
									</div>
								</div>
							<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										所属机构
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
										业务管理机构代码
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="mngmtOrgCode" name='mngmtOrgCode'
										       lay-verify="required|orgCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										是否特殊数据标识
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="isFilter" name='isFilter' lay-verify="required">
											<option value=""></option>
											<option value="Y">是</option>
											<option value="N" selected>否</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息报告日期
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="rptDate" name='rptDate'
										       lay-verify="required" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
				<!-- 基本信息段 start-->
				<div class="layui-colla-item" id="dcAcctBsInfSgmtDiv">
					<form class="layui-form">
						<input type="button" id="basicAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" id="basicSaveBtn" lay-filter="basicSaveBtn" lay-submit style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="basicDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn" ></input>
						<h3 class="layui-colla-title">基本信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										担保业务大类
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select lay-filter="busiLines" id="busiLines" name="busiLines" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										担保业务种类细分
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="busiDtilLines" name="busiDtilLines" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										开户日期
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="openDate" name="openDate"
										       lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										币种
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="cy" name="cy" lay-verify="required" lay-search="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										担保金额
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="acctCredLine" name="acctCredLine"
										       lay-verify="required|regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										到期日期
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="dueDate" name="dueDate"
										       lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										反担保方式
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="guarMode" name="guarMode" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										其他还款保证方式
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="othRepyGuarWay" name="othRepyGuarWay" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										保证金百分比 (%)
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="secDep" name="secDep"
										       lay-verify="required|threeValue|secDepValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										担保合同文本编号
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="ctrctTxtCd" 
										       name="ctrctTxtCd" maxlength="60">
									</div>
								</div>	
							</div>
						</div>
					</form>
				</div>
				<!-- 基本信息段 end-->
				
				<!-- 相关还款责任人段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="responsibleAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">相关还款责任人段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="responsibleDataTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="responsibleDataTable"></table>
					</div>
				</div>
				<!-- 相关还款责任人段 end-->
				
				<!-- 抵质押物信息段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="mortgageAddBtn" value="新增"></input>
					<h3 class="layui-colla-title">抵质押物信息段</h3>
					<div class="layui-colla-content">
						<table id="mortgageDataTable" class="layui-hide" style="margin-top: 10px;clear: both;" 
						       lay-filter="mortgageDataTable"></table>
					</div>
				</div>
				<!-- 抵质押物信息段 end-->
							
				<!-- 在保责任信息段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="insuranceAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="insuranceSaveBtn" id="insuranceSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="insuranceDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">在保责任信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										账户状态
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="acctStatus" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										在保余额
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="loanAmt" lay-verify="required|regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										余额变化日期
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="repayPrd" lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										五级分类
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="fiveCate" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										五级分类认定日期
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="fiveCateAdjDate" lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										风险敞口
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="riEx" lay-verify="regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										代偿（垫款）标志
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="compAdvFlag" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										账户关闭日期
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="closeDate" readonly>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 在保责任信息段 end-->
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

<!-- 相关还款责任人段 -->
<div id="responsibleEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					身份类别:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select lay-filter="infoIdType" id="infoIdType" name='infoIdType' lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					责任人名称:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="arlpName" name='arlpName' lay-verify="required" maxlength="80">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					责任人身份标识类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="arlpCertType" name='arlpCertType' lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					责任人身份标识号码:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="arlpCertNum" name='arlpCertNum' lay-verify="required" maxlength="40">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					还款责任人类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select lay-filter="arlpType" id="arlpType" name='arlpType' lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					还款责任金额:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="arlpAmt" name='arlpAmt' lay-verify="regCapValue">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					联保标志:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="wartySign" name='wartySign'>
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					保证合同编号:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="maxGuarMcc" name='maxGuarMcc' maxlength="60">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px; text-align: center;">
			<div class="layui-inline">
				<div class="layui-input-inline" style="width: 100%;text-align: right;">
					<button class="layui-btn layui-btn-primary" id="cancelResponsibleModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveResponsibleModelBtn" id="saveResponsibleModelBtn">保存</button>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- 抵质押物信息段 -->
<div id="mortgageEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<div class="layui-inline layui-col-xs6" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					抵(质)押合同标识码:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="ccc" name="ccc" lay-verify="required" maxlength="60">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
			<div class="layui-inline layui-col-xs12">
				<div class="layui-input-inline" style="width: 100%;text-align: center;">
					<button class="layui-btn layui-btn-primary" id="cancelMortgageModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveMortgageModelBtn" id="saveMortgageModelBtn">保存</button>
				</div>
			</div>
		</div>
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
<script src="static/js/pecr/indv/GuarAcctInfo/personGuarAcctInfoEdit.js" charset="utf-8"></script>

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
