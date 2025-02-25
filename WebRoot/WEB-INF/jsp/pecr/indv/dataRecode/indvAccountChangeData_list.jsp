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
	                <label class="layui-form-label" >变更日期</label>
	                <div class="layui-input-inline">
	                    <input type="text" placeholder="" class="layui-input datefield" id="rptDate" name="rptDate">
	                </div>
	            </div>
				
				
				<div class="layui-inline">
				  <label class="layui-form-label">变更类型</label>
				  <div class="layui-input-inline">
					<select lay-search="" id="infrectype" name="infrectype">
						<option value="">请选择</option>
					</select>							  								
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
	<table class="layui-hide" id="acc" lay-filter="acc"></table>
</div> 
	<!-- 新增或修改界面 -->
	<div class="layui-row layui-col-space15" style="display:none;margin:30px auto;" id="dialog">
		<div class="layui-col-md12">				
			<div class="layui-collapse" >
			    <div class="layui-colla-item" id="feedBackErrorDiv">
				<form class="layui-form">
					<h3 class="layui-colla-title">反馈错误信息展示</h3>	
					<div class="layui-colla-content layui-show">
					  <div class="layui-form-item layui-layer-padding">
						<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:99%;height:70px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"></textarea>
					  </div>
					</div>
					</form>
				</div>
				<!-- 基础段 start-->
				<div class="layui-colla-item" id="CtrctBsSgmtDiv">
					<form class="layui-form" lay-filter="exampleForm" id="exampleForm">   
						<h3 class="layui-colla-title">个人标识变更管理</h3>	
						<div class="layui-colla-content layui-show" id="baseAddBtn">
							<div class="layui-form-item layui-layer-padding">
							<input name ="pk" id="pk" type="hidden"/>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息记录类型
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select lay-search="" id="infrectype1" name="infrectype1" lay-verify="required">
												<option value="">请选择</option>
										</select>	
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										姓名
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="name" name="name" maxlength="30" />
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										证件类型
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select id="idType" name="idType" >
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
									<label class="layui-form-label" style="float:none;text-align: left;">
										证件号码
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<input type="text" placeholder="" class="layui-input" id="idNum" name="idNum" maxlength="30" />
									</div>
								</div>
								<div class="layui-inline layui-col-xs2" style="margin-bottom: -10px;">
							  <label class="layui-form-label" style="float:none;text-align: left;">
							 		<b style="color: #f00;">*</b> 
									  变更日期:</label>
							  <div class="layui-input-inline">
								<input type="text" name="lastUpdateTime" id="lastUpdateTime"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" lay-verify="required">
							  </div>
							</div>
							
						<div class="layui-inline layui-col-xs2" style="margin-top: 30px;">
							  <label class="layui-form-label" style="float:none;text-align: left;">
								 <b style="color: #f00;">*</b> 
								  原业务标识码:</label>
							  <div class="layui-input-inline" style="width: 100%;">
								<input type="text" name="odBnesCode" id="odBnesCode" class="layui-input" lay-verify="required">
							  </div>
						</div>
							
							<div class="layui-inline layui-col-xs2" style="margin-top: 30px;">
							  <label class="layui-form-label" style="float:none;text-align: left;">
								 <b style="color: #f00;">*</b> 
								  新业务标识码:</label>
							  <div class="layui-input-inline" style="width: 100%;">
								<input type="text" name="nwBnesCode" id="nwBnesCode"class="layui-input" lay-verify="required">
							  </div>
							</div>
							</div>
						</div>
						<div class="layui-form-item" style="margin-top:40px;margin-left:290px">
							<div class="layui-input-block">
								<button type="submit"  class="layui-btn"  lay-filter="close">取消</button>
								<button type="submit"  class="layui-btn" lay-submit lay-filter="exampleSubmit" id="exampleSubmit">保存</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
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
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/js/jquery.cookie.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<script src="static/js/pecr/indv/indvAccountChange.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
