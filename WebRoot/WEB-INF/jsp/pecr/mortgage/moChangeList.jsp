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
</head>
<body>  
<div class="wrap">
	<div class="layui-form layui-form-pane" id="queryPanel">
		<div class="layui-colla-item">
		  <h3 class="layui-colla-title">数据检索
			<button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius pane-title-btn" id="queryBtn">
				查询  <i class="layui-icon layui-icon-search"></i>  
			</button>
		  </h3>	
		  <div class="layui-colla-content layui-show" style="margin:1px 1px 0px 0px">
			<div class="layui-inline">
			  <label class="layui-form-label">数据状态</label>
			  <div class="layui-input-inline">
				<select lay-search="" id="businessStates" name="businessStates">
					<option value="">请选择</option>
				</select>							  								
			  </div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label" >信息报告日期</label>
				<div class="layui-input-inline">
					<input type="text" placeholder="" class="layui-input datefield" id="rptDate" name='rptDate'>
				</div>
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="acc" lay-filter="acc"></table>
</div> 
	<!-- 新增或修改界面 -->
<div class="layui-col-md12" style="display:none;margin:30px auto;" id="dialog">
    <div style="text-align:center">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" >
		         <input name="efwMocId" id="efwMocId" type="hidden"/>
	                <div class="layui-inline">
					  <label class="layui-form-label">类型:</label>
						 <div class="layui-input-inline">
		                    <select id="infRecType" lay-verify="required">
								<option value="511">511-抵（质）押合同标识变更请求记录</option>
					        </select>
		                 </div>
					</div>
					<div class="layui-inline">
					  <label class="layui-form-label">变更日期:</label>
					  <div class="layui-input-inline">
						<input type="text" name="lastUpdateTime" id="lastUpdateTime"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
					  </div>
					</div>
				<div class="layui-inline">
					  <label class="layui-form-label">原业务标识码:</label>
					  <div class="layui-input-inline">
						<input type="text" name="odBnesCode" id="odBnesCode" class="layui-input">
					  </div>
					</div>
					
					<div class="layui-inline">
					  <label class="layui-form-label">新业务标识码:</label>
					  <div class="layui-input-inline">
						<input type="text" name="nwBnesCode" id="nwBnesCode"class="layui-input">
					  </div>
					</div>
				<div class="layui-form-item" style="margin-top:40px;">
					<div class="layui-input-block" style="margin-right: 110px">
						<button type="submit" class="layui-btn" lay-submit id="close" lay-filter="close">取消</button>
						<button type="submit" class="layui-btn" lay-submit id="exampleSubmit" lay-filter="exampleSubmit">保存</button>
					</div>
				</div>
		</div>
	</form>	
</div>
</div>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
		<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
		<button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="submitBtn"id="submitBtn" >强制提交 <i class="layui-icon layui-icon-ok"></i></button>
</script>
<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情</a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="del">删除</a>
</script>

<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/mortgage/moChangeList.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
