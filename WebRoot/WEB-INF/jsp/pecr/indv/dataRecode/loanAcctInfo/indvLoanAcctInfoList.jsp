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
		  <div class="layui-colla-content layui-show" >
			<div class="layui-form-item" style="margin:1px 1px 0px 0px">
				<div class="layui-inline">
		                <label class="layui-form-label">信息报告日期:</label>
		                <div class="layui-input-inline">
		                    <input type="text" placeholder="" class="layui-input datefield" id="rptDate">
		                </div>
		        </div>
		        
		        <div class="layui-inline">
	                <label class="layui-form-label">身份标识号码</label>
	                <div class="layui-input-inline">
	                    <input type="text" placeholder="" class="layui-input" id="id_num" name="id_num">
	                </div>
          	 	</div>
          	 	
				<div class="layui-inline">
				  <label class="layui-form-label">账户类型</label>
				  <div class="layui-input-inline">
					<select  lay-search="" id="acctType" name="acctType">
					  <option value="">请选择</option>										 
					</select>								
				  </div>
				</div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">账户标识码</label>
				  <div class="layui-input-inline">
					<input type="text" name="acctCode" id="acctCode" autocomplete="off" class="layui-input"/>								
				  </div>
				</div>
				
			  <div class="layui-inline">
				<div class="layui-inline">
				  <label class="layui-form-label">数据状态</label>
				  <div class="layui-input-inline">
					<select lay-search="" id="businessStates" name="businessStates">
						<option value="">请选择</option>
					</select>							  								
				  </div>
				</div>	
			  </div>
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="indvLoanAcctTab" lay-filter="indvLoanAcctTab"></table>
</div> 

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="detailsInfo">详情</a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="editInfo">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="deleteInfo">删除</a>
</script>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
	
	<button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="submitBtn">强制提交 <i class="layui-icon layui-icon-ok"></i></button>
	
</script>
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/pecr/indv/LoanAcctInfo/personLoanAcctInfo.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
