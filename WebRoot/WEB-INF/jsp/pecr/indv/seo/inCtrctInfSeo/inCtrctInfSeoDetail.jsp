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
<input type="hidden" id="CtrctBsSgmt" value='${CtrctBsSgmt}'>
<input type="hidden" id="CreditLimSgmt" value='${CreditLimSgmt}'>
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
											<option value="220" selected>个人授信协议信息记录</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										授信协议标识码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="contractCode" lay-verify="required" maxlength="60">
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
										授信人姓名:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="name" lay-verify="required" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										授信人证件类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="idType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										授信人证件号码:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="idNum" lay-verify="required" maxlength="20">
									</div>
								</div>
						<!-- 		<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
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
			
				<!-- 共同授信人信息段 start-->
				<div class="layui-colla-item">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="commonAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">共同授信人信息段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="commonDataTable" style="margin-top: 10px;clear: both;" 
						       lay-filter="commonDataTable"></table>
					</div>
				</div>
				<!-- 共同授信人信息段 end-->
				
				<!-- 额度信息段 start-->
				<div class="layui-colla-item">
					<form class="layui-form">
						<input type="button" id="amountAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" lay-filter="amountSaveBtn" id="amountSaveBtn" lay-submit style="display:none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="amountDelBtn" value="删除" style="display:none;margin-right:110px;"
							   class="layui-btn layui-btn-xs pane-title-btn"></input>
						<h3 class="layui-colla-title">额度信息段</h3>
						<div class="layui-colla-content">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										授信额度类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="creditLimType" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										额度循环标志:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="limLoopFlg" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										授信额度:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="creditLim" lay-verify="required|regCapValue">
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
										额度生效日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="conEffDate" lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										额度到期日期:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="conExpDate" lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										额度状态:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="conStatus" lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										授信限额:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="creditRest" lay-verify="regCapValue">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										授信限额编号:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="creditRestCode" maxlength="60">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 额度信息段 end-->
			</div>
		</div>
	</div>
	
	<div class="layui-form-item layui-col-xs12" style="width: 80%;margin: 30px 0 20px;text-align: center;">
		<div class="layui-inline layui-col-xs12">
			<div class="layui-input-inline" style="width: 100%;">
				<button class="layui-btn layui-btn-custom-blue" id="delAllModelBtn" style="display: none;">删除，个人授信信息</button>
				<button class="layui-btn layui-btn-custom-blue" id="pushAllModelBtn" style="display: none;">提交，个人授信信息</button>
				<button class="layui-btn layui-btn-custom-blue" id="approvalAllBtn" style="display: none;">审批，个人授信信息</button>
				<button class="layui-btn layui-btn-custom-blue" id="overruleAllBtn" style="display: none;">驳回，个人授信信息</button>
				<button class="layui-btn layui-btn-custom-blue" id="entireDelAllModelBtn" style="display: none;">生成整笔删除报文</button>
				<button class="layui-btn layui-btn-custom-blue" id="idChangeAllModelBtn" style="display: none;">标识变更</button>
			</div>
		</div>
	</div>
</div>

<!-- 共同受信人信息段 -->
<div id="commonEditModel" style="display: none;">
    <form class="layui-form">
        <div class="layui-form-item layui-col-space20" style="margin: 0;">
            <div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
                <label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					共同授信人身份类别:
                </label>
                <div class="layui-input-inline" style="width: 100%;">
                    <select lay-filter="brerType" id="brerType" name="brerType" lay-verify="required">
                        <option value=""></option>
                    </select>
                </div>
            </div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					共同授信人名称:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="certRelName"  name="certRelName"lay-verify="required" maxlength="80">
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					共同授信人身份标识类型:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<select id="certRelIdType" name="certRelIdType" lay-verify="required">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-inline layui-col-xs3" style="margin-bottom: -10px;">
				<label class="layui-form-label" style="float:none;text-align: left;">
					<b style="color: #f00;">*</b>
					共同授信人身份标识号码:
				</label>
				<div class="layui-input-inline" style="width: 100%;">
					<input type="text" placeholder="" class="layui-input" id="certRelIdNum" name="certRelIdNum" lay-verify="required" maxlength="40">
				</div>
			</div>
        </div>
        <div class="layui-form-item layui-row layui-col-space20" style="margin: 10px;">
            <div class="layui-inline layui-col-xs12">
                <div class="layui-input-inline" style="width: 100%;text-align: center;">
                    <button class="layui-btn layui-btn-primary" id="cancelCommonModelBtn" type="button">取消</button>
                    <button class="layui-btn layui-btn-custom-blue" lay-submit lay-filter="saveCommonModelBtn" 
					        id="saveCommonModelBtn">保存</button>
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
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/js/pecr/indv/seo/InCtrctInfdataEdit.js" charset="utf-8"></script>

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
