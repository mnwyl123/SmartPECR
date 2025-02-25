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
<style type="text/css">
	.layui-form-label{
		overflow: hidden; 
		text-overflow: ellipsis;
		white-space: nowrap;
	}
</style>
</head>
<body style="background-color: #FFFFFF;">  
<input type="hidden" id="acctBsSgmt" value='${acctBsSgmt}'>
<input type="hidden" id="acctInfSgmt" value='${acctInfSgmt}'>
<div class="wrap">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">				
			<div class="layui-collapse" >
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
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息记录类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="infRecType" lay-verify="required" disabled>
											<option value="650" selected>事业单位收入支出表信息记录</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										企业名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="entName" lay-verify="required" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
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
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										企业身份标识号码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="entCertNum" lay-verify="required" maxlength="40">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报表年份:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="sheetYear" lay-verify="required" >
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
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
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
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
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										审计事务所名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="auditFirmName" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										审计人员名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="auditorName" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										审计时间:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="auditTime" >
									</div>
								</div>
								<!-- <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										所属机构:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="orgCode" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div> -->
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										客户资料维护机构代码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="cimoc" lay-verify="required|orgCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
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
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
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
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息报告日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="rptDate" lay-verify="required" >
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
				<!-- 基本信息段 start-->
				<div class="layui-colla-item" id="dcAcctBsInfSgmtDiv">
					<form class="layui-form" id="incomeex">
						<input type="button" id="basicAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" id="basicSaveBtn" lay-filter="basicSaveBtn" lay-submit style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="basicDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn" ></input>
						<h3 class="layui-colla-title">事业单位收入支出表段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										本期财政补助结转结余:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="currentFinancialSubsidyCarr" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										本期事业结转结余:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="currentUndertakingsCarriedO" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										本期经营结余:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="currentOperatingBalance" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										弥补以前年度亏损后的经营结余:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="operatingBalanceMadeUpFor" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										本年非财政补助结转结余:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonFinancialSubsidyCarried" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										本年非财政补助结余:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonFinancialAidBalanceThis" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										转入事业基金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="publicFundTurnedInto" lay-verify="required|assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										财政补助收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="financialSubsidyRevenue" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										事业支出(财政补助支出):
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="undertakingsExpenditureFinan" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										事业类收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="undertakingsClassRevenue" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										事业收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="undertakingsRevenue" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										上级补助收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="superiorSubsidyRevenue" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										附属单位上缴收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="revenueTurnedOverBySubsidi" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherRevenue" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										(其他收入科目下)捐赠收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="donationIncome" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										事业类支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="undertakingsClassExpenditure" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										事业支出(非财政补助支出):
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="undertakingsExpenditureNonF" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										上缴上级支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="paymentToTheHigherAuthorit" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										对附属单位补助支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="grantToTheAuxiliaryOrganiz" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										其他支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="otherExpenditure" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										经营收入:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="operatingRevenue" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										经营支出:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="operatingExpenditure" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										非财政补助结转:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="nonFinancialAidCarriedOver" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										应缴企业所得税:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="enterpriseincomeTaxPayable" lay-verify="assetsValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										提取专用基金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="specialFundsToExtract" lay-verify="assetsValue">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基本信息段 end-->
							
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
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="plugins/layui/lay/modules/laytpl.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/js/pecr/ent/seo/entIncomeAndExpenseStatemeBEdit.js" charset="utf-8"></script>

<!--表格列上的工具栏--> 
<script type="text/html" id="dataTableToolBarTpl">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
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
</body>
</html>
