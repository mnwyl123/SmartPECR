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
<input type="hidden" id="motgaCltalBsSgmt" value='${motgaCltalBsSgmt}'>
<input type="hidden" id="motgaCltalInfSgmt" value='${motgaCltalInfSgmt}'>
<input type="hidden" id="addOrUpdate" value='${pd.addOrUpdate}'>
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
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息记录类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="infRecType" lay-verify="required" disabled>
											<option value="510" selected>抵(质)押合同信息记录</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										抵(质)押合同标识码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="ccCode" lay-verify="required" maxlength="60">
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
										债务人身份类别:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select lay-filter="infoIdType_base" id="infoIdType_base" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										债务人名称:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="name" lay-verify="required" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										债务人身份标识类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="certType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										债务人身份标识号码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="certNum" lay-verify="required" maxlength="40">
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
										业务管理机构代码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="mngmtOrgCode" lay-verify="required|orgCodeLength">
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
										合同类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select lay-filter="guarType" id="guarType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										担保金额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="ccAmt" lay-verify="required|regCapValue">
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
										抵（质）押合同生效日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="ccValDate" lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										抵（质）押合同到期日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="ccExpDate" lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										最高额担保标志:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="maxGuar" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										抵（质）押合同状态:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="ccStatus" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 基本信息段 end-->
				
				<!-- 其他债务人信息段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="debtorAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">其他债务人信息段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="debtorDataTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="debtorDataTable"></table>
					</div>
				</div>
				<!-- 其他债务人信息段 end-->
				
				<!-- 抵押物信息段 start-->
				<div class="layui-colla-item" id="guarTypePawnContact" style="display: none;">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="pawnAddBtn" value="新增"></input>
					<h3 class="layui-colla-title">抵押物信息段</h3>
					<div class="layui-colla-content">
						<table id="pawnDataTable" class="layui-hide" style="margin-top: 10px;clear: both;" 
						       lay-filter="pawnDataTable"></table>
					</div>
				</div>
				<!-- 抵押物信息段 end-->
							
				<!-- 质物信息段 start-->
				<div class="layui-colla-item" id="guarTypeQualityContact" style="display: none;">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="qualityAddBtn" value="新增"></input>
					<h3 class="layui-colla-title">质物信息段</h3>
					<div class="layui-colla-content">
						<table id="qualityDataTable" class="layui-hide" style="margin-top: 10px;clear: both;" 
						       lay-filter="qualityDataTable"></table>
					</div>
				</div>
				<!-- 质物信息段 end-->
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

<!-- 其他债务人信息段 -->
<div id="debtorEditModel" style="display: none;">
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
					其他债务人名称:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="guarName" name='guarName' lay-verify="required" maxlength="80">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					其他债务人身份标识类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="guarCertType" name='guarCertType' lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					其他债务人身份标识号码:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="guarCertNum" name='guarCertNum' lay-verify="required" maxlength="40">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px; text-align: center;">
			<div class="layui-inline">
				<div class="layui-input-inline" style="width: 100%;text-align: right;">
					<button class="layui-btn layui-btn-primary" id="cancelDebtorModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveDebtorModelBtn" id="saveDebtorModelBtn">保存</button>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- 抵押物信息段 -->
<div id="pawnEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					抵押物种类:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select lay-search="" id="pleType" name="pleType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					抵押物识别号类型:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select lay-search="" id="motgaProptIdType" name="motgaProptIdType">
                        <option value=""></option>
                    </select>
                </div>
            </div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					抵押物唯一识别号:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="pleCertId" name="pleCertId" maxlength="40">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					抵押物位置所在地行政区划:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="pleDistr" name="pleDistr" lay-search="">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					抵押物评估价值:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="pleValue" name="pleValue" lay-verify="regCapValue">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					币种:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="pleCy" name="pleCy" lay-search="">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					评估机构类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="valOrgType" name="valOrgType">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					抵押物评估日期:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input datefield" id="valDate" name="valDate" readonly>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					抵押人身份类别:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select lay-filter="pledgorType" id="pledgorType" name="pledgorType" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					抵押人名称:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="pledgorName" name="pledgorName"
					       lay-verify="required" maxlength="80">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					抵押人身份标识类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="pleorCertType" name="pleorCertType" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					抵押人身份标识号码:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="pleorCertNum" name="pleorCertNum" lay-verify="required" maxlength="40">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px; margin-left:20px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					抵押物说明:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="pleDesc" name="pleDesc" maxlength="200">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
			<div class="layui-inline layui-col-xs12">
				<div class="layui-input-inline" style="width: 100%;text-align: center;">
					<button class="layui-btn layui-btn-primary" id="cancelPawnModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="savePawnModelBtn" id="savePawnModelBtn">保存</button>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- 质物信息段 -->
<div id="qualityEditModel" style="display: none;">
	<form class="layui-form">
		<div class="layui-form-item layui-col-space20" style="margin: 0;">
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					质物种类:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="impType" name="impType" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					质物价值:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="impVal" name="impVal" lay-verify="required|regCapValue">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					币种:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="impCy" name="impCy" lay-verify="required" lay-search="">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出质人身份类别:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select lay-filter="ippc" id="ippc" name="ippc" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出质人名称:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="pawnName" name="pawnName" lay-verify="required" maxlength="80">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出质人身份标识类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="pawnCertType" name="pawnCertType" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					出质人身份标识号码:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="pawnCertNum" name="pawnCertNum" lay-verify="required" maxlength="40">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
			<div class="layui-inline layui-col-xs12">
				<div class="layui-input-inline" style="width: 100%;text-align: center;">
					<button class="layui-btn layui-btn-primary" id="cancelQualityModelBtn" type="button">取消</button>
					<button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveQualityModelBtn" id="saveQualityModelBtn">保存</button>
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
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/js/pecr/ent/seo/motgaContractInfoEdit.js" charset="utf-8"></script>

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
