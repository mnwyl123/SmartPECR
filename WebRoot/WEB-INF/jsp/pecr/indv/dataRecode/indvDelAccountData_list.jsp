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
			<div class="layui-form-item">
				<div class="layui-inline">
				  <label class="layui-form-label">信息记录类型</label>
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
	                <label class="layui-form-label" >信息报告日期</label>
	                <div class="layui-input-inline">
	                    <input type="text" placeholder="" class="layui-input datefield" id="rptDate1" name="rptDate1">
	                </div>
	            </div>
				
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
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div> 


	<!-- 新增或修改界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="dialog">
    <div style="text-align:center">
	<form class="layui-form" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;" id="baseAddBtn">
			<div class="layui-inline" id ="errorMessage">
				<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:365px;height:110px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"></textarea>
			 </div>
           <input name ="pk" id="pk" type="hidden"/>
         <div class="layui-inline">
           		<label class="layui-form-label">类型:</label>
           		<div class="layui-input-inline">
		           <select  lay-filter="infRecType1" lay-search="" id="infRecType1" name="infRecType1" lay-verify="">
	                    <option value=""></option>
					</select>
                </div>
		 </div>
		<div class="layui-inline" id="perName">
			<label class="layui-form-label" >
				姓名:
			</label>
			<div class="layui-input-inline" >
				<input type="text" placeholder="" class="layui-input" id="name" name="name" lay-verify="" maxlength="30">
			</div>
		</div>
		<div class="layui-inline" id="perIdType">
			<label class="layui-form-label">
				证件类型:
			</label>
			<div class="layui-input-inline">
				<select id="idType" name="idType" lay-verify="">
					<option value=""></option>
				</select>
			</div>
		</div>
		<div class="layui-inline" id="perIdNum">
			<label class="layui-form-label" >
				证件号码:
			</label>
			<div class="layui-input-inline">
				<input type="text" placeholder="" class="layui-input" id="idNum" name="idNum" lay-verify="" maxlength="20">
			</div>
		</div>
		<div class="layui-inline" id="perInfSurcCode">
			<label class="layui-form-label">
				信息来源编码:
			</label>
			<div class="layui-input-inline" >
				<input type="text" placeholder="" class="layui-input" id="infSurcCode" name="infSurcCode" lay-verify=""  maxlength="20">
			</div>
		</div>
		<div class="layui-inline" id="perdelStartDate">
		  <label class="layui-form-label">待删除起始日:</label>
		  <div class="layui-input-inline">
			<input type="text" name="delStartDate" id="delStartDate"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
		  </div>
		</div>
		<div class="layui-inline" id="perdelEndDate">
		  <label class="layui-form-label">待删除结束日:</label>
		  <div class="layui-input-inline">
			<input type="text" name="delEndDate" id="delEndDate"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
		  </div>
		</div>
		<div class="layui-inline" id ="perdelRecCode">
		  <label class="layui-form-label">待删除业务码:</label>
		  <div class="layui-input-inline">
			<input type="text" id="delRecCode" name="delRecCode" class="layui-input">
		  </div>
		</div>
		<div class="layui-inline" id="perdelSgmtCode">
		  <label class="layui-form-label">待删除段标:</label>
		  <div class="layui-input-inline">
			<select  id="delSgmtCode" name="delSgmtCode">
                <option value="">请选择</option>
			</select>
		  </div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">
				信息报告日期:
			</label>
			<div class="layui-input-inline">
				<input type="text" placeholder="" class="layui-input datefield" id="rptDate" name="rptDate" lay-verify="" readonly>
	   		</div>
    	</div>  
		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block">
				<button type="submit"class="layui-btn" lay-submit lay-filter="close" id="close">关闭</button>
				<button type="submit" class="layui-btn" lay-submit lay-filter="exampleSubmit"  id="exampleSubmit">保存</button>
			</div>
		</div>
		</div>
	</form>	
</div>
</div>

<!--excel模板导入页面  -->
<div class="layui-col-md12" style="display:none;margin:30px auto;text-align: center" id="uploadPage">
	<form class="layui-form layui-form-pane" lay-filter="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">	
		<div class="layui-form-item" id="saveAddBtn">
			<div class="layui-inline">
				  <label class="layui-form-label">信息记录类型</label>
				  <div class="layui-input-inline">
					<select  lay-search="" id="infRecType" name="infRecType" lay-verify="required">
					  <option value="">请选择</option>										 
					</select>								
				  </div>
			</div>
			<div class="layui-inline">
			  <div class="layui-upload">
				<input type="file" id="excel" name="excel" class="layui-input" lay-verify="required" style="cursor: pointer;"/>
			  </div>
			</div>
		</div>
		<div class="layui-form-item" style="margin-top:60px;">
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile114" >基本信息整笔删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile134" >证件有效期整笔删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile213" >借贷账户按段删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile214" >借贷账户整笔删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile223" >授信协议按段删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile224" >授信协议整笔删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile233" >担保账户按段删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
			<div class="layui-inline">
			  <div class="layui-upload">
				<button class="layui-btn layui-btn-xs" id="downloadTemplateFile234" >担保账户整笔删除模板<i class="layui-icon layui-icon-download-circle"></i></button>
			  </div>
			</div>
		</div>
		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block" style="margin-right: 110px">
				<button type="submit"  class="layui-btn" id="close" lay-filter="close">取消</button>
				<button type="submit"  class="layui-btn" lay-submit id= "save" lay-filter="save">确定</button>
			</div>
		</div>
	</form>	
</div>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
		<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
		<button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="submitBtn"id="submitBtn" >强制提交 <i class="layui-icon layui-icon-ok"></i></button>
	    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="uploadFile" id="uploadFile" >Excel导入 <i class="layui-icon layui-icon-upload-drag"></i></button>
</script>

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情</a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="del">删除</a>
</script>
<!-- 枚举值模板模板  加载select选择框 数据字典 -->
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
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/indv/indvDelAccountData.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
