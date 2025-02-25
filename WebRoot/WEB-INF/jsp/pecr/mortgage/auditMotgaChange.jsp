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
				<!-- <div class="layui-form-item" style="margin-top:40px;">
					<div class="layui-input-block" style="margin-right: 110px">
						<button type="submit" class="layui-btn" lay-submit id="close" lay-filter="close">取消</button>
						<button type="submit" class="layui-btn" lay-submit id="exampleSubmit" lay-filter="exampleSubmit">保存</button>
					</div>
				</div> -->
		</div>
	</form>	
</div>
</div>
<!-- 审核界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="dialogCheck">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;">
			<div class="layui-inline">
			  <label>审核意见:</label>
			  <div class="layui-input-block">
				<textarea  placeholder="请填写您的审核意见" style="margin: 0px; width: 352px; height: 146px;" id="auditOpinion">同意</textarea>
			  </div>
			</div>
		</div>
	</form>	
</div>
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="auditingBtn" id="auditingBtn">审核 <i class="layui-icon layui-icon-addition"></i></button>
</script>
<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>

<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/js/easy.ajax.js" charset="utf-8"></script>
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>

<script type="text/javascript">
initDict('businessStates', staticDict.businessStates);
//弹出层id
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;

layui.use(['element', 'form','layer','laydate','table','laytpl'], function(){
  var element = layui.element
  	form = layui.form
  	layer = layui.layer
  	laydate = layui.laydate
  	table = layui.table
  	laytpl = layui.laytpl;  

  require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
		/**
		 * element组件渲染
		 * form组件渲染
		 */
		element.init();//每个页面都有
		form.render();//每个页面都有
		
      table.render({
      	elem: '#acc' //表格所固定的div
      			,toolbar: '#toolbarDemo'  //表格顶部工具栏
      				,url:'auditing/dataMotgaChange.do' //url
      					,cols: [[ 
      						{type:'numbers'}	//列每行序号
      						,{type:'checkbox'} //列复选框
      						,{align : "center",hide: true, field:"efwMocId",title:"主键"}
      						,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType', staticDict.motgaInfrectype)}}
      						,{align : "center",field: 'lastUpdateTime', title: '变更日期'}
      						,{align : "center",field: 'odBnesCode', title: '原业务标识码'}
      						,{align : "center",field: 'nwBnesCode', title: '新业务标识码'}
      						,{align : "center",field: 'operatorUser', title: '操作员'}
      						,{align : "center",field: 'businessStates', title: '数据状态',templet: function(d){return renderColumnDict(d, 'businessStates', staticDict.businessStates)}}
      						,{align : "center",fixed: 'right', title:'操作',toolbar: '#opraBarRow'} //行上的工具栏
      						]],
      						even: true,  //行斑马线
      						page: true, //是否分页
      						limit: 5, //初始每页显示条数
      						height: $(document).height() - $('#acc').offset().top - $('#queryPanel').height() - 25,
      						limits: [5,10, 15],
      						//回调函数
      						done: function (res, curr,count) {
      							$('th').css({'background-color':'#0997F7',
      								'color':'#FFFFFF',
      								'font-family':'Microsoft Yahei',
      								'font-weight':'500',   //设置字体是否加粗
      								'font-size':'13px'});
      								}
      							});

      //日期输入框  按css将所有的date组件渲染
      	$(".datefield").each(function(){
      		laydate.render({
      			elem: this,
      			trigger:'click'
      		});
      	}); 

      	//检索
      	$("#queryBtn").on('click', function(){
      		table.reload('acc', {
      			method : 'post',
      			where: {
      				businessStates  : $('#businessStates').val(),
  			        rptDate  : $('#rptDate').val()
      				}
      		}); 
      		return false;
      	});
      	//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
      	table.on('tool(acc)', function(obj){
      		var data = obj.data;
      		if(obj.event === 'more'){
      			popIndex = layer.open({
      				title: '详情',
      				type: '1',
      				content :$('#dialog'),
      				area: ['40%', '50%']
      			});
      			$("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
      			$("#lastUpdateTime").prop("disabled",true);
  				$("#odBnesCode").prop("disabled",true);
  				$("#nwBnesCode").prop("disabled",true);
      			$("#infRecType").prop("disabled",true);
      			form.val('exampleForm', data);
      			$(".errorFormBox").html("");
      			form.render('select');
      		}
      	});
      	
      	
      	table.on('toolbar(acc)', function (obj) {
			switch (obj.event) {
				case 'auditingBtn':
					 //获取选中的行信息
					 var checkStatus = table.checkStatus('acc');
					 //获取选中行的数据
					 data=checkStatus.data;
					 if(data.length==0){
						layer.msg("请选择需要审核的数据");
						return ;
					  }
					 var strIds = "";
					 for(var i = 0; i < data.length; i++){
						 strIds+=checkStatus.data[i].efwMocId+",";
					 }
					 strIds = strIds.substr(0, strIds.length - 1);
					 //判断后台对应的表和主键
					 var tableName = "MOC_ID_CAGS_INF";
					 var tablePk = "EFW_MOC_ID_CAGS_INF_ID";
				  	layer.open({
						type :'1',
						title :'审核',
						content :$('#dialogCheck'),
						btn:['审核通过','审核驳回'],
						area: ['40%', '50%'],
						yes: function (index,layero){
							var auditOpinion = $("#auditOpinion").val();
							$.ajax({ 
								url      : 'auditing/isAuditing.do', 
								data     : {state:'30',strIds:strIds,auditOpinion:auditOpinion,tableName: tableName ,tablePk: tablePk},
								type     : 'post',  
								cache    : false,  
								dataType : 'json',  
								success:function(result){ 
									table.reload('acc', {
										method : 'post',
										where:{
											businessStates  : $('#businessStates').val(),
						  			        rptDate  : $('#rptDate').val()
											}
									});
									layer.msg(result.msg, {time:1000});
								 },
								//请求失败，包含具体的错误信息
								error : function(e){
									layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
								}					 
							});
							 layer.close(index); 
							 return ;
					  	},
					  	btn2: function (index,layero){
							var auditOpinion = $("#auditOpinion").val();
							$.ajax({ 
								url      : 'auditing/isAuditing.do', 
								data     : {state:'40',strIds:strIds,auditOpinion:auditOpinion,tableName: tableName,tablePk: tablePk},
								type     : 'post',  
								cache    : false,  
								dataType : 'json',  
								success:function(result){ 
									table.reload('acc', {
										method : 'post',
										where:{
											businessStates  : $('#businessStates').val(),
						  			        rptDate  : $('#rptDate').val()
											}
									});
									 
									layer.msg(result.msg, {time:1000});
								 },
								//请求失败，包含具体的错误信息
								error : function(e){
									layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
								}					 
							});
							 layer.close(index); 
					  	}
					});
			  	form.render('select');
				break;
					  	
			};
	  });      	
});
});

</script>
</body>
</html>
