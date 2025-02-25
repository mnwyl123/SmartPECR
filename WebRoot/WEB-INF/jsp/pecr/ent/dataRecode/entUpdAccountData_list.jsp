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
	<div class="layui-tab layui-tab-brief" lay-filter="loanAcctInfotab" style="height: 100%;">
		<ul class="layui-tab-title">
			<li data-type="212" class="layui-this">企业借贷协议按段更正请求记录</li>
			<li data-type="222">企业授信协议按段更正请求记录</li>
			<li data-type="232">企业担保账户按段更正请求记录</li>
		</ul>
			<div class="layui-tab-content" style="position: absolute;left: 0;right: 0;top: 35px;bottom: 0;">
			<div data-type="D1" class="layui-tab-item layui-show" style="width: 100%;height: 100%;">
				<iframe src="" data-src="indvLoanAcctInfo/indvLoanAcctInfoEditD1.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="R1" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="indvLoanAcctInfo/indvLoanAcctInfoEditR1.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="R2" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="indvLoanAcctInfo/indvLoanAcctInfoEditR2.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="R3" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="indvLoanAcctInfo/indvLoanAcctInfoEditR3.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="R4" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="indvLoanAcctInfo/indvLoanAcctInfoEditR4.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
			<div data-type="C1" class="layui-tab-item" style="width: 100%;height: 100%;">
				<iframe src="" data-src="indvLoanAcctInfo/indvLoanAcctInfoEditC1.do" frameborder='0' width='100%' height='100%'></iframe>
			</div>
		</div>
		</div>
<!-- 
<div class="layui-row layui-col-space15" style="margin:2px;">
	<div class="layui-col-md12">
		<div class="layui-card">
			<div class="layui-card-body">	
				<div class="layui-collapse" >
				<form class="layui-form" action="" id="queryPanel">
					  <div class="layui-colla-content layui-show">				
						<div class="layui-form-item">						
					<div class="layui-inline">
							  <label class="layui-form-label">类型:</label>
							 <div class="layui-input-inline">
				                   <select lay-filter="infRecType" lay-search="" lay-verify="required" id="infRecType">
				                    <option value=""></option>
								</select>
			                </div>
							</div>
						  
							<div class="layui-inline">
							  <label class="layui-form-label">更正起始日期:</label>
							  <div class="layui-input-inline">
								<input type="text" id="updateStartDate"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
							  </div>
							</div>
							
							<div class="layui-inline">
							  <label class="layui-form-label">更正结束日期:</label>
							  <div class="layui-input-inline">
								<input type="text" id="updateEndDate"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
							  </div>
							</div>
							<div class="layui-inline">
							  <label class="layui-form-label">待更正标识码:</label>
							  <div class="layui-input-inline">
								<input type="text" id="updateRecCode" class="layui-input">
							  </div>
							</div>
							<div class="layui-inline">
							  <label class="layui-form-label">账户类型:</label>
							  <div class="layui-input-inline">
                                 <select lay-filter="acctType" lay-search="" lay-verify="required" id="acctType">
                                 <option value=""></option>
												</select>
							  </div>
							</div>
							<div class="layui-inline">
							  <label class="layui-form-label">待更正段标:</label>
							  <div class="layui-input-inline">
                                 <select lay-filter="updateSgmtCode" lay-search="" lay-verify="required" id="updateSgmtCode">
                                 <option value=""></option>
												</select>
							  </div>
							</div>
								
								 <div class="layui-inline">
							  <label class="layui-form-label">状态:</label>
							  <div class="layui-input-inline">
								<select  lay-verify="required" id="businessStates">
								 		<option value="">请选择</option>
													<option value="0">新增</option>
													<option value="1">已报</option>			 
								</select>
							  </div>	
							</div>
						<div class="layui-inline">	 
						 <div class="layui-input-inline" style='padding:0px 50px;'>
						<button class="layui-btn layui-btn-xs layui-btn-radius" type='button' id="queryBtn" >
							 <i class="layui-icon layui-icon-search"></i> 查询  
						</button>
						</div>
						</div>
					  </div>						  
					</div>
					</form>
						<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
				</div>
			</div>
		</div>
	</div>
	</div>-->
	<!-- 新增或修改界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="dialog">
    <div style="text-align:center">
	<form class="layui-form" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;">
		         <input id="pbyInMdfcId" type="hidden"/>
			              	<div class="layui-inline">
							  <label class="layui-form-label">类型:</label>
							 <div class="layui-input-inline">
				                   <select lay-filter="infRecType1" lay-search="" lay-verify="required" id="infRecType1">
				                    <option value=""></option>
								</select>
			                </div>
							</div>
							
							<div class="layui-inline">
							  <label class="layui-form-label">更正起始日期:</label>
							  <div class="layui-input-inline">
								<input type="text" id="updateStartDate"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
							  </div>
							</div>
							
							<div class="layui-inline">
							  <label class="layui-form-label">更正结束日期:</label>
							  <div class="layui-input-inline">
								<input type="text" id="updateEndDate"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
							  </div>
							</div>
							<div class="layui-inline">
							  <label class="layui-form-label">待更正标识码:</label>
							  <div class="layui-input-inline">
								<input type="text" id="updateRecCode" class="layui-input">
							  </div>
							</div>
							<div class="layui-inline">
							  <label class="layui-form-label">账户类型:</label>
							  <div class="layui-input-inline">
                                 <select lay-filter="acctType" lay-search="" lay-verify="required" id="acctType">
                                 <option value=""></option>
												</select>
							  </div>
							</div>
							<div class="layui-inline">
							  <label class="layui-form-label">待更正段标:</label>
							  <div class="layui-input-inline">
                                 <select lay-filter="updateSgmtCode" lay-search="" lay-verify="required" id="updateSgmtCode">
                                 <option value=""></option>
												</select>
							  </div>
							</div>
		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit lay-filter="exampleSubmit">确定</button>
			</div>
		</div>
		</div>
	</form>	
</div>
</div>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
		<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
		<button type="button" class="layui-btn layui-btn-xs layui-btn-radius" id="delSelectAll">批量删除 
			<i class="layui-icon layui-icon-delete"></i>
		</button>
</script>

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情</a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="del">删除</a>
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<script src="static/js/pecr/ent/entUpdAccount.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
</body>
</html>
