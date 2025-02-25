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
<div class="wrap">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">				
			<div class="layui-collapse" >
			    <div class="layui-colla-item" id="feedBackErrorDiv">
				<form class="layui-form">
					<h3 class="layui-colla-title">反馈错误信息展示</h3>	
					<div class="layui-colla-content">
					  <div class="layui-form-item layui-layer-padding">
						<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:99%;height:110px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"></textarea>
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
						<h3 class="layui-colla-title">企业资产负债表整笔删除请求记录</h3>	
						<div class="layui-colla-content layui-show">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息记录类型
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="infRecType" name='infRecType' lay-verify="required" disabled>
											<option value="614" selected>企业资产负债表整笔删除请求记录</option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										企业名称
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="entName" name='entName'
										       lay-verify="required" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										企业身份标识类型
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
										企业身份标识号码
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="entCertNum" name='entCertNum'
										       lay-verify="required" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报表年份
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="sheetYear" name='sheetYear'
										       lay-verify="required" maxlength="80">
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										报表类型
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
										报表类型细分
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="sheetTypeDivide" name='sheetTypeDivide' lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
							<!-- 	<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										所属机构
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="orgCode" name='orgCode' lay-verify="required">
											<option value="1">1</option>
										</select>
									</div>
								</div> -->
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
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
<script src="plugins/layui/lay/modules/laytpl.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="static/js/pecr/ent/balanceSheetDlt/balanceSheetDltEdit.js" charset="utf-8"></script>

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
