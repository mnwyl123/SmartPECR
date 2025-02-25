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
				  <label class="layui-form-label">待删除业务标识码</label>
				  <div class="layui-input-inline">
					<input type="text" name="delRecCode1" id="delRecCode1" autocomplete="off" class="layui-input"/>								
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
				<div class="layui-inline">
				  <label class="layui-form-label">身份标识码</label>
				  <div class="layui-input-inline">
					<input type="text" id="idNum1" name="idNum1" autocomplete="off" class="layui-input"/>							  								
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
<div class="layui-row layui-col-space15" style="display:none;margin:30px auto;" id="dialog">
    <div class="layui-col-md12">
		<div class="layui-form-item"  id="baseAddBtn">
		 <form class="layui-form" lay-filter="exampleForm" id="exampleForm">
		 <div class="layui-form-item layui-layer-padding">
		 	  <div class="layui-input-inline" style="width: 100%;" id="errorMessage">
					<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:87%;height:110px;overflow-y:scroll;overflow-x:scroll;margin-left: 35px;" rows="4" readonly="readonly"></textarea>
			   </div>
               <input name ="pk" id="pk" type="hidden"/>
	               <div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px">
					  <label class="layui-form-label" style="float:none;text-align: left;">
					  	信息记录类型:
					  </label>
					 <div class="layui-input-inline" style="width: 100%;">
			           <select lay-filter="infRecType" lay-search=""  id="infRecType" lay-verify="required">
					            <option value=""></option>
						</select>
				     </div>
				   </div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="entName">
						<label class="layui-form-label" style="float:none;text-align: left;" >
							企业名称:
						</label>
						<div class="layui-input-inline" style="width: 100%;" >
							<input type="text" placeholder="" class="layui-input" id="name" lay-verify="" maxlength="30">
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="entIdType">
						<label class="layui-form-label" style="float:none;text-align: left;">
							企业标识类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="idType" name="idType" lay-verify="">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs3"  style="margin-top: 30px;margin-left: 35px" id="entIdNum">
						<label class="layui-form-label" style="float:none;text-align: left;">
							企业标识号码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="idNum" lay-verify="" maxlength="20">
						</div>
					</div>
					<div class="layui-inline layui-col-xs3"  style="margin-top: 30px;margin-left: 35px" id="perInfSurcCode">
						<label class="layui-form-label" style="float:none;text-align: left;">
							信息来源编码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="infSurcCode" lay-verify=""  maxlength="20">
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perDelStartDate">
					  <label class="layui-form-label" style="float:none;text-align: left;">
					  	待删除起始日:
					  </label>
					  <div class="layui-input-inline" style="width: 100%;">
						<input type="text" name="delStartDate" id="delStartDate"  placeholder="yyyy-MM-dd"  class="layui-input datefield" >
					  </div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perDelEndDate">
					  <label class="layui-form-label" style="float:none;text-align: left;">
					   	待删除结束日:
					  </label>
					  <div class="layui-input-inline" style="width: 100%;">
						<input type="text" name="delEndDate" id="delEndDate"  placeholder="yyyy-MM-dd"  class="layui-input datefield" >
					  </div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perDelRecCode">
						  <label class="layui-form-label" style="float:none;text-align: left;">
						 	 待删除业务码:
						  </label>
						  <div class="layui-input-inline" style="width: 100%;">
							<input type="text"id="delRecCode" class="layui-input">
						  </div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perdelSgmtCode">
					  <label class="layui-form-label" style="float:none;text-align: left;">
					   	待删除段标:
					   </label>
					  <div class="layui-input-inline" style="width: 100%;">
						<select  id="delSgmtCode" name="delSgmtCode">
                               <option value="">请选择</option>
						</select>
					  </div>
					</div> 
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perSheetYear">
						<label class="layui-form-label" style="float:none;text-align: left;">
							报表年份:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="sheetYear">
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perSheetType">
						<label class="layui-form-label" style="float:none;text-align: left;">
							报表类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="sheetType">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px"id="perSheetTypeDivide">
						<label class="layui-form-label" style="float:none;text-align: left;">
							报表类型细分:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="sheetTypeDivide">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px">
						<label class="layui-form-label" style="float:none;text-align: left;">
							信息报告日期:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input datefield" id="rptDate" lay-verify="required" >
						</div>
					</div>
			</div>
			<div class="layui-form-item" style="margin-top: 40px">
				<div class="layui-input-block" style="margin-left: 0px;text-align: center;">
				    <button type="submit"  class="layui-btn" id="close" lay-filter="close">取消</button>
					<button type="submit" class="layui-btn" lay-submit id="exampleSubmit" lay-filter="exampleSubmit">确定</button>
				</div>
			</div>
		</form>	
	</div>
</div>
</div>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
		<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
		<button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="submitBtn" id="submitBtn" >强制提交 <i class="layui-icon layui-icon-ok"></i></button>
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
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>

<script src="static/js/pecr/ent/entDelAccountData.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
