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
	<!--数据维护-->
<div class="wrap">
	<div class="layui-form layui-form-pane" id="queryPanel">
		<div class="layui-colla-item">
		  <h3 class="layui-colla-title">数据检索
			<button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius pane-title-btn" id="queryBtn">
				查询  <i class="layui-icon layui-icon-search"></i>  
			</button>
		  </h3>	
		  <div class="layui-colla-content layui-show" style="margin:1px 1px 0px 0px">
			<div class="layui-form-item">
				<div class="layui-inline">
	                <label class="layui-form-label" >异议事项号</label>
	                <div class="layui-input-inline">
	                    <input type="text" placeholder="" class="layui-input" id="OBJCHECKID">
	                </div>
	            </div>
	            
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="objectHandingTable" lay-filter="objectHandingTable"></table>
	
					<!-- 异议处理基础信息 start-->
				<div class="layui-colla-item" id="objectionDiv" style="display:none;margin:30px auto;">
					<form class="layui-form">
						<input type="button" lay-filter="baseSaveBtn" id="baseSaveBtn" lay-submit
						       class="layui-btn layui-btn-xs pane-title-btn" value="保存当前段"></input>	   
						<h3 class="layui-colla-title">异议处理基础信息</h3>	
						<div class="layui-colla-content layui-show">
							<div class="layui-form-item layui-layer-padding">
								<div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										发起用户代码：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="userCode" name='userCode'
										       lay-verify="required" maxlength="64">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										用户姓名：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="name" name='name'
										       lay-verify="required" maxlength="30">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										个人证件类型:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										       <select id="idType" name='idType' lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										个人证件号:
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="idNum" name='idNum'
										       lay-verify="required" maxlength="18">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										业务标识号：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="acctNum" name='acctNum'
										       lay-verify="required" maxlength="20">
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										定位信息类别：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="infoType" name='infoType' lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label>
										<b style="color: #f00;">*</b>
										异议说明：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="explain" name='explain'
										       lay-verify="required" maxlength="1000">
									</div>
								</div>
								
							   <div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										所属机构：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="orgCode" name='orgCode' lay-verify="required">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label >
										<b style="color: #f00;">*</b>
										录入日期：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input datefield" id="rptDate" name='rptDate'
										       lay-verify="required" readonly>
									</div>
								</div>
								<div class="layui-inline layui-col-xs3" >
									<label>
									附件信息：
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<button class="layui-btn layui-btn-xs layui-btn-radius" id="generateUploadView">回执上传 <i class="layui-icon layui-icon-upload-circle"></i></button>
									</div>
								</div>
							</div>
						</div>
					</form>
			
				<!-- 异议处理基础信息 end-->
				
				<!-- 附件段 
				<div class="layui-colla-item" id="dcAcctBsInfSgmtDiv">
					<form class="layui-form">
						<h3 class="layui-colla-title">附件信息</h3>
						
					</form>
				</div>
				-->
				
				<!-- 处理历史段 start-->
				<div class="layui-colla-item">
					<h3 class="layui-colla-title">异议处理历史</h3>
					<div class="layui-colla-content">
						<table class="layui-hide" id="historyTable" style="margin-top: 10px;clear: both;" 
							   lay-filter="historyTable"></table>
					</div>
				</div>
					</div>
				<!-- 处理历史段 end-->
</div> 

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="detail">详情</a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="editInfo">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="deleteInfo">删除</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="addMarkReport">添加标注报文</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="enclosureReport">附件查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="checkReport">核查报文</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="updateReport">更正报文</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="resultReport">结果接受情况报文</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="deleteMarkReport">删除标注报文</a>

</script>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 异议处理<i class="layui-icon layui-icon-addition"></i></button>

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
<script src="static/js/pecr/objectHanding/objectHanding.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
