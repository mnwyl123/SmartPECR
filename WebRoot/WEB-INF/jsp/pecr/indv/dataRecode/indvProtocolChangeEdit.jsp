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
<link rel="stylesheet" href="css/pecr/personLoanInfo/personLoanInfoEditD1.css" media="all">
</head>
<body style="background-color: #FFFFFF;"> 
<input type="hidden" id="CtrctBsSgmt" value='${CtrctBsSgmt}'>
<input type="hidden" id="CreditLimSgmt" value='${CreditLimSgmt}'>
<input type="hidden" id="addOrUpdate" value='${pd.addOrUpdate}'>
<div class="wrap">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-collapse">
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
				<div class="layui-colla-item" id="dcAcctBsSgmtDiv">
					<form class="layui-form" lay-filter="dcAcctBsSgmtForm">
						<input type="button" id="baseAddBtn" lay-filter="baseAddBtn" style="display: none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" id="baseSaveBtn" lay-filter="baseSaveBtn" lay-submit style="display: none;"
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>
						<input type="button" id="baseDelBtn" lay-filter="baseDelBtn" value="删除" 
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
								<option value="222" selected>个人授信协议按段更正请求记录</option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							待更正业务标识码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="contractCode" lay-verify="required" maxlength="60" readonly>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							受信人姓名:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="name" lay-verify="required" maxlength="30" readonly>
						</div>
					</div>
					<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							受信人证件类型:
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
							受信人证件号码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="idNum" lay-verify="required" maxlength="20" readonly>
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
							待更正段段标:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select lay-filter="mdfcSgmtCode" id="mdfcSgmtCode" lay-verify="required" disabled="disabled">
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
							<select id="orgCode" name="orgCode" lay-verify="" disabled="disabled">
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
							<input type="text" placeholder="" class="layui-input datefield" id="rptDate" lay-verify="required" disabled="disabled" >
						</div>
					</div>
								
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
				<!-- 共同受信人信息段 start-->
			<div class="demo" data-value="C" style="display: none;">
				<div class="layui-colla-item" data-value="C" style="display: none;">
					<input type="button" class="layui-btn layui-btn-xs pane-title-btn" id="commonAddBtn" 
						   value="新增"></input>
					<h3 class="layui-colla-title">共同受信人信息段</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="commonDataTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="commonDataTable"></table>
					</div>
				</div>
			</div>
				
				<!-- 共同受信人信息段 end-->
				
				<!-- 额度信息段 start-->
				<div class="layui-colla-item" data-value="D" style="display: none;">
					<form class="layui-form">
						<input type="button" id="amountAddBtn" lay-filter="amountAddBtn" style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn" value="新增"></input>
						<input type="button" id="amountSaveBtn" lay-filter="amountSaveBtn" lay-submit style="display:none;"
							   class="layui-btn layui-btn-xs pane-title-btn"  value="保存当前段"></input>
						<input type="button" id="amountDelBtn" lay-filter="amountDelBtn" value="删除" 
							   class="layui-btn layui-btn-xs pane-title-btn" style="display:none;margin-right:110px;"></input>
						<h3 class="layui-colla-title">额度信息段</h3>
						<div class="layui-colla-content layui-show">
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
				
				<!-- 共同受信人信息段 start-->
				<div  id="commonEditModel" style="display: none;">
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
				<!-- 共同受信人信息段 end-->
			<div class="layui-form-item layui-col-xs12" style="width: 80%;margin: 30px 0 20px;text-align: center;">
				<div class="layui-inline layui-col-xs12">
				<div class="layui-input-inline" style="width: 100%;">
				<button class="layui-btn layui-btn-primary" id="cancelAllModelBtn">关闭</button>
			</div>
		</div>
	</div>

			</div>
		</div>
	</div>

</div>

<!--表格列上的工具栏--> 
<script type="text/html" id="dataTableToolBarTpl">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script type="text/html" id="dataTableToolBarTplDetail">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
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

<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/js/pecr/indv/indvProtocolChangeEdit.js" charset="utf-8"></script>
</body>
</html>
