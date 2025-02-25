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
						<label class="layui-form-label" style="width: 110px;">企业名称:</label>
						<div class="layui-input-inline">
							<input type="text" placeholder="" class="layui-input" id="entName">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 110px;">企业身份标识类型:</label>
						<div class="layui-input-inline">
							<select id="entCertType"  name="entCertType">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 110px;">企业身份标识号码:</label>
						<div class="layui-input-inline">
							<input type="text" placeholder="" class="layui-input" id="entCertNum">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div>
<!-- 新增或修改界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="dialog">
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
<script type="text/html" id="toolbarHead">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="auditingBtn" id="auditingBtn">审核 <i class="layui-icon layui-icon-addition"></i></button>
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">

//初始化性别下拉字典
initDict('entCertType', enterDict.entCertMainType);
layui.use(['form', 'laydate', 'element', 'table'], function()
{
  var form = layui.form,
  element = layui.element,
  table = layui.table,
  laydate = layui.laydate;
  
 // form.render('select');
  
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarHead'  //表格顶部工具栏
	,url:'auditing/dataEnIcdnRltpList.do' //url
    ,cols: [[
         	{type:'numbers'},	//列每行序号
    		{type:'checkbox'},  //列复选框
    		{field: 'ecaEnIcdnRltpInfId', title: '主键', hide: true},
    		{field: 'entName', align:'center', title: 'A企业名称'},
    		{field: 'entCertType', align:'center', title: 'A企业身份标识类型',templet: function(d){return renderColumnDict(d, 'entCertType', enterDict.entCertMainType)}},
            {field: 'assoType', align:'center', title: '关联关系类型',templet: function(d){return renderColumnDict(d, 'assoType', enterDict.entAssoType)}},
    		{field: 'assoSign', align:'center', title: '关联标志',templet: function(d){return renderColumnDict(d, 'assoSign', enterDict.entAssoSign)}},
    		//{field: 'orgName', align:'center', title: '数据来源机构名称'},
    /* 		{field: 'businessStates', align:'center', title: '数据状态',templet: function(d){return renderColDict(d, 'DATA_STATUS_BLXS', 'businessStates')}},
     */		{field: 'rptDate', align:'center', title: '信息报告日期'},
    		{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
        ]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 5 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [10, 20, 50]
	,done: function (res, curr, count) {
		$('th').css({'background-color':'#0997F7',
			 'color':'#FFFFFF',
			 'font-family':'Microsoft Yahei',
			 'font-weight':'500',   //设置字体是否加粗
			 'font-size':'13px'});
	}
  }); 
  table.on('tool(tableDemo)', function(obj){
		var data = obj.data;
		$("body").data("dataObj",data);
		addOrUpdate = 'detail';
		layer.open({
			type: 2,
			title: '详情',
			shadeClose: false,
			shade: [0.3, '#000'],
			area: ['100%', '100%'],
			anim: 2,
			resize: false,
			content: 'enIcdnRltpInf/enIcdnRltpInfEdit.do?addOrUpdate=' + addOrUpdate
	                 + '&ecaEnIcdnRltpInfId=' + data.ecaEnIcdnRltpInfId,
			end: function(){
				table.reload('enIcdnRltpInfTab', {
					method : 'post',
					where: {
						entName      :   $('#entName').val(), 
						entCertType      :   $('#entCertType').val(), 
						entCertNum      :   $('#entCertNum').val() 
						}
				});
			}
		});
		 });
//查询按钮点击事件
	$("#queryBtn").on('click', function(){
		table.reload('tableDemo', {
			method : 'post',
			where: {
				entName      :   $('#entName').val(), 
				entCertType      :   $('#entCertType').val(), 
				entCertNum      :   $('#entCertNum').val() 
				}
		}); 
		return false;
	});
  //日期输入框  按css将所有的date组件渲染
  $(".datefield").each(function(){
	  laydate.render({
	    elem: this,
	    trigger:'click'
	  });
  });
  
  table.on('toolbar(tableDemo)', function (obj) {
		switch (obj.event) {
			case 'auditingBtn':
				 //获取选中的行信息
				 var checkStatus = table.checkStatus('tableDemo');
				 //获取选中行的数据
				 data=checkStatus.data;
				 if(data.length==0){
						layer.msg("请选择需要审核的数据");
						return ;
				  }
				 var strIds = "";
				 for(var i = 0; i < data.length; i++){
					 strIds+=checkStatus.data[i].ecaEnIcdnRltpInfId+",";
				}
				 strIds = strIds.substr(0, strIds.length - 1);
				  	layer.open({
						type :'1',
						title :'审核',
						content :$('#dialog'),
						btn:['审核通过','审核驳回'],
						area: ['40%', '50%'],
						yes: function (index,layero){
							var auditOpinion = $("#auditOpinion").val();
							$.ajax({ 
								url      : 'auditing/isAuditing.do', 
								data     : {state:'30',strIds:strIds,auditOpinion:auditOpinion,tableName:'E_ICDN_RLTP_INF',tablePk:'ECA_EN_ICDN_RLTP_INF_ID'},
								type     : 'post',  
								cache    : false,  
								dataType : 'json',  
								success:function(result){ 
									table.reload('tableDemo', {
										method : 'post',
										where:{
											entName      :   $('#entName').val(), 
											entCertType      :   $('#entCertType').val(), 
											entCertNum      :   $('#entCertNum').val() 
											},
										done: function (res, curr, count) {
											layer.close(index);
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
								data     : {state:'40',strIds:strIds,auditOpinion:auditOpinion,tableName:'E_ICDN_RLTP_INF',tablePk:'ECA_EN_ICDN_RLTP_INF_ID'},
								type     : 'post',  
								cache    : false,  
								dataType : 'json',  
								success:function(result){ 
									table.reload('tableDemo', {
										method : 'post',
										where:{
											entName      :   $('#entName').val(), 
											entCertType      :   $('#entCertType').val(), 
											entCertNum      :   $('#entCertNum').val() 
											},
										done: function (res, curr, count) {
											layer.close(index);
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
</script>
</body>
</html>
