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
<link rel="stylesheet" href="css/pecr/enterpriseLoanInfo/enterpriseLoanInfoEditC1.css" media="all">
</head>
<body style="background-color: #FFFFFF;">
<div class="wrap">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-collapse">
			    <div class="layui-colla-item" id="feedBackErrorDiv">
				    <form class="layui-form">
					<h3 class="layui-colla-title">反馈错误信息展示</h3>	
					<div class="layui-colla-content layui-show">
					  <div class="layui-form-item layui-layer-padding">
						<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:99%;height:110px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"></textarea>
					  </div>
					</div>
					</form>
				</div>
				<!-- 基础段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="baseAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" id="baseSaveBtn" lay-filter="baseSaveBtn" lay-submit style="display: none;"
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
								<option value="412" selected>企业借贷账户按段更正请求记录</option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							账户类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="acctType" lay-verify="required" disabled>
								<option value="C1" selected>催收账户</option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
										账户标识码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="acctCode" lay-verify="required" maxlength="60" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										借款人名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="name" lay-verify="required" maxlength="80" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										借款人身份标识类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="idType" lay-verify="required" disabled="disabled">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										借款人身份标识号码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="idNum" lay-verify="required" maxlength="40" readonly>
									</div>
								</div>
						 		<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										所属机构:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="orgCode" name="orgCode" lay-verify="" disabled="disabled">
											<option value=""></option>
										</select>
									</div>
								</div>  
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										业务管理机构代码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="mngmtOrgCode" lay-verify="required|orgCodeLength" readonly> 
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										是否特殊数据标识:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="isFilter" lay-verify="required" disabled="disabled">
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
										<input type="text" placeholder="" class="layui-input datefield" id="rptDate" 
										       lay-verify="required" disabled="disabled">
									</div>
								</div>
								 <div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
                        <label class="layui-form-label" style="float:none;text-align: left;">
                            <b style="color: #f00;">*</b>
                  					          待更正段段标:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select lay-filter="mdfcSgmtCode" id="mdfcSgmtCode" lay-verify="required" disabled="disabled">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
				<!-- 基本信息段 start-->
				<div class="layui-colla-item" id="dcAcctBsInfSgmtDiv" data-value="C" style="display: none;">
					<form class="layui-form">
						<input type="button" id="basicAddBtn" style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" id="basicSaveBtn" lay-filter="basicSaveBtn" lay-submit style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn"  value="保存当前段"></input>
						<input type="button" id="basicDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">基本信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							借贷业务大类:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select lay-filter="busiLines" id="busiLines" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							借贷业务种类细分:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="busiDtlLines" lay-verify="required">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							开户日期:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="openDate" lay-verify="required" >
									</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							币种:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="cy" lay-verify="required" lay-search="">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							借款金额:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="loanAmt" lay-verify="required|regCapValue">
						</div>
					</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基本信息段 end-->
				
				<!-- 相关还款责任人段 start-->
				<div class="layui-colla-item" data-value="D" style="display: none;">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="responsibleAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">相关还款责任人段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="responsibleDataTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="responsibleDataTable"></table>
					</div>
				</div>
				<!-- 相关还款责任人段 end-->
				
				<!-- 还款表现信息段 start-->
				<div class="layui-colla-item" data-value="H" style="display: none;">
					<form class="layui-form">
						<input type="button" id="behaviorAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" id="behaviorSaveBtn" lay-filter="behaviorSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="behaviorDelBtn" style="display:none;margin-right:110px;" value="删除"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">还款表现信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										账户状态:
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
										余额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="acctBal" lay-verify="required|regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										余额变化日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="balChgDate" lay-verify="required" >
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										五级分类:
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
										五级分类认定日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="fiveCateAdjDate" lay-verify="required" >
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										最近一次实际还款日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="latRpyDate" lay-verify="required" >
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										最近一次实际还款金额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="latRpyAmt" lay-verify="required|regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										最近一次实际归还本金:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="latRpyPrincAmt" lay-verify="required|regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										还款形式:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="rpmtType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										账户关闭日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="closeDate" >
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 还款表现信息段 end-->
				
				<!-- 特殊交易说明段 start-->
				<div class="layui-colla-item" data-value="I" style="display: none;">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="businessAddBtn" value="新增"></input>
					<h3 class="layui-colla-title">特殊交易说明段</h3>
					<div class="layui-colla-content">
						<!--
						<table class="layui-hide" id="idSgmtTable4" lay-filter="idSgmtTable4"></table>
						-->
						<table id="businessDataTable" class="layui-hide" style="margin-top: 10px;clear: both;" 
						       lay-filter="businessDataTable"></table>
					</div>
				</div>
				<!-- 特殊交易说明段 end-->
				
				<!-- 初始债权说明段 start-->
				<div class="layui-colla-item" data-value="G" style="display: none;">
					<form class="layui-form">
						<input type="button" id="claimAddBtn" style="display:none;" value="新增"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<input type="button" id="claimSaveBtn" lay-filter="claimSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="claimDelBtn" style="display:none;margin-right:110px;" value="删除"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">初始债权说明段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										初始债权人名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="initCredName" lay-verify="required" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										初始债权人机构代码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="initCedOrgCode" lay-verify="cedOrgCodeLength">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										原债务种类:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="origDbtCate" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										债权转移时的还款状态:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="initRpySts" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 初始债权说明段 end-->
			</div>
		</div>
	</div>
	
	<!--<div class="layui-form-item layui-col-xs12" style="width: 80%;margin: 30px 0 20px;text-align: center;">
		<div class="layui-inline layui-col-xs12">
			<div class="layui-input-inline" style="width: 100%;">
				<button class="layui-btn layui-btn-xs layui-btn-custom-blue" id="delAllModelBtn" style="display: none;">
					删除，C1-催收账户
				</button>
				<button class="layui-btn layui-btn-xs layui-btn-custom-blue" id="pushAllModelBtn" style="display: none;">
					提交，C1-催收账户
				</button>
				<button class="layui-btn layui-btn-xs layui-btn-custom-blue" id="approvalAllBtn" style="display: none;">
					审批，C1-催收账户
				</button>
				<button class="layui-btn layui-btn-xs layui-btn-custom-blue" id="overruleAllBtn" style="display: none;">
					驳回，C1-催收账户
				</button>
				<button class="layui-btn layui-btn-xs layui-btn-custom-blue" id="entireDelAllModelBtn" style="display: none;">
					生成整笔删除报文
				</button>
				<button class="layui-btn layui-btn-xs layui-btn-custom-blue" id="idChangeAllModelBtn" style="display: none;">
					标识变更
				</button>
			</div>
		</div>
	</div>-->
	<div class="layui-form-item layui-col-xs12" style="width: 80%;margin: 30px 0 20px;text-align: center;">
        <div class="layui-inline layui-col-xs12">
            <div class="layui-input-inline" style="width: 100%;">
                <button class="layui-btn layui-btn-primary" id="cancelAllModelBtn">关闭</button>
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
					<select lay-filter="arlpIdType" id="arlpIdType" name='arlpIdType' lay-verify="required">
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
		<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
			<div class="layui-inline">
				<div class="layui-input-inline" style="width:100%;  text-align:center;">
					<button class="layui-btn layui-btn-primary" id="cancelResponsibleModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveResponsibleModelBtn" id="saveResponsibleModelBtn">保存</button>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- 特殊交易说明段 -->
<div id="businessEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					交易类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="chanTranType" name='chanTranType' lay-search="" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					交易日期:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input datefield" id="tranDate" name='tranDate' lay-verify="required" >
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					交易金额:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="tranAmt" name='tranAmt' lay-verify="required|regCapValue">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					到期日期变更月数:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="dueTranMon" name='dueTranMon' lay-verify="required|threeValue">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					交易明细信息:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="detInfo" name='detInfo' maxlength="200">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-row layui-col-space20" style="margin:10px;">
			<div class="layui-inline layui-col-xs12">
				<div class="layui-input-inline" style="width: 100%; text-align: center;">
					<button class="layui-btn layui-btn-primary" id="cancelBusinessModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveBusinessModelBtn" id="saveBusinessModelBtn">保存</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/ent/entLoanChangeEditC1.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
