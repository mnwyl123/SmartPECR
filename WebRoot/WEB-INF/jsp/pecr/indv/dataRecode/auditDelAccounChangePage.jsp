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
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="delAccountMsg">
    <div style="text-align:center">
	<form class="layui-form" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;" id="baseAddBtn">
         <input name ="pk" id="pk" type="hidden"/>
         <div class="layui-inline">
           		<label class="layui-form-label">信息记录类型:</label>
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
<!-- 		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block">
				<button type="submit"class="layui-btn" lay-submit lay-filter="close" id="close">关闭</button>
				<button type="submit" class="layui-btn" lay-submit lay-filter="exampleSubmit"  id="exampleSubmit">保存</button>
			</div>
		</div> -->
		</div>
	</form>	
</div>
</div>
<!-- 审核界面 -->
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
<script src="static/js/pecr/require.js" charset="utf-8"></script>

<script type="text/javascript">
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage','laytpl'], function(){
	var element = layui.element
	form = layui.form,
	table = layui.table,
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate,
	laytpl = layui.laytpl;
	require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
    	element.init();//每个页面都有
		form.render();//每个页面都有
		
		  //日期输入框  按css将所有的date组件渲染
		  $(".datefield").each(function(){
			  laydate.render({
			    elem: this,
			    trigger:'click'
			  });
		  }); 
		  var initEnumerationValue = function () {
				var array = ['INDV_INFRECTYPE_DEL','DATA_STATUS_ZHCX','ID_TYPE'];
				var selectData = [];
				for(var i=0; i<array.length; i++ ){
					var node = {};
					node.systemCodeType = array[i];
					selectData.push(node);
				}
				$.ajax({  
				    url:'dataDictCode/selectCodeTypeList.do', 
					data:{DATA_IDS : JSON.stringify(selectData)},  
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data){
						for(var i=0;i<data.result.length;i++){
							if (data.result[i].INDV_INFRECTYPE_DEL){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].INDV_INFRECTYPE_DEL},
									containerId : "acctType"
								});
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].INDV_INFRECTYPE_DEL},
									containerId : "infRecType1"
								});
								continue;
							}else if (data.result[i].DATA_STATUS_ZHCX){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].DATA_STATUS_ZHCX},
									containerId : "businessStates"
								});
								continue;
							}else if (data.result[i].ID_TYPE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ID_TYPE},
									containerId : "idType"
								});
								continue;
							}
						}
		                form.render('select');
		               // d1.resolve("渲染完成");
					}	     
			    });
		    };
		    //初始化常量枚举值
		    initEnumerationValue();
			  //日期输入框  按css将所有的date组件渲染
			  $(".datefield").each(function(){
				  laydate.render({
				    elem: this,
				    trigger:'click'
				  });
			  }); 
			 var initPopindex = function(type){
				 if(type==='114' || type==='134'){
					   $('#perdelStartDate').hide();
					   $('#perdelEndDate').hide();
					   $("#perdelSgmtCode").hide();
					   $("#perdelRecCode").hide();
					   $('#perName').show();
					   $('#perIdType').show();
					   $('#perIdNum').show();
					   $('#perInfSurcCode').show();
				   }
				 //整笔删除
				 if(type==='214' || type==='224' || type==='234') {
					 $('#perName').hide();
					 $('#perIdType').hide();
					 $('#perIdNum').hide();
					 $('#perInfSurcCode').hide();
					   $('#perdelStartDate').hide();
					   $('#perdelEndDate').hide();
					   $("#perdelSgmtCode").hide();
					   $("#perdelRecCode").show();
				   }
				 //按段删除
				 if(type==='213' || type==='223' || type==='233'){
					 $('#perName').hide();
					 $('#perIdType').hide();
					 $('#perIdNum').hide();
					 $('#perInfSurcCode').hide();
					   $('#perdelStartDate').show();
					   $('#perdelEndDate').show();
					   $("#perdelSgmtCode").show();
					   $("#perdelRecCode").show();
				   }
			 } ;
		
			 table.render({
					elem: '#tableDemo' //表格所固定的div
					,toolbar: '#toolbarHead'  //表格顶部工具栏
					,url:'auditing/dataDelAccounChangePage.do' //url
					,cols: [[ 
					{type:'numbers'}	//列每行序号
					,{type:'checkbox'} //列复选框   
					//,{align : "center",hide: true, field:"pk",title:"主键"},
					,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType',staticDict.INFOTYPE)}}
					,{align : "center",field: 'name', title: '姓名'}
					//,{align : "center",field: 'idType', title: '证件类型',templet: function(d){return renderColumnDict(d, 'idType',staticDict.idType)}}
					,{align : "center",field: 'idNum', title: '证件号码'}
					,{align : "center",field: 'infSurcCode', title: '信息来源编码'}
					,{align : "center",field: 'delRecCode', title: '待删除业务标识码'}
					,{align : "center",field: 'delSgmtCode', title: '待删除段标'}
					,{align : "center",fixed: 'right', title:'操作', toolbar: '#opraBarRow'} //行上的工具栏
					]]
					,even: true  //行斑马线
					,page: true //是否分页
					,limit: 10 //初始每页显示条数
					,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
					,limits: [10,20,30],
					//回调函数
					done: function (res, curr, count) {
					  $('th').css({'background-color':'#0997F7',
									 'color':'#FFFFFF',
									 'font-family':'Microsoft Yahei',
									 'font-weight':'500',   //设置字体是否加粗
									 'font-size':'13px'});
					  
					}
				});
				//检索
				$("#queryBtn").on('click', function(){
					table.reload('tableDemo', {
						method : 'post',
						where: {
							acctType      :   $('#acctType').val(), 
							acctCode      :   $('#acctCode').val(), 
							businessStates:   $('#businessStates').val()
							}
					}); 
					return false;
				});
			
				
				table.on('tool(tableDemo)', function(obj){
					var data = obj.data;
					if(obj.event === 'more'){
						layer.open({
								title: '详情',
								type: '1',
								content :$('#delAccountMsg'),
								area: ['40%', '65%']
							});
						/* $(".layui-input").prop("disabled",true);
						$("select").prop("disabled",true); */
						$("#infRecType1").val(data.infRecType);
						$("#name").val(data.name);
						$("#idType").val(data.idType);
						$("#idNum").val(data.idNum);
						$("#rptDate").val(data.rptDate);
						$("#infSurcCode").val(data.infSurcCode);
						if(data.infRecType ==='213' || data.infRecType ==='223' || data.infRecType ==='233'){
							$.ajax({
								url:'dataDictCode/selectCodeListByUperId.do', 
								data:{uperId:$("#infRecType1").find("option[value='"+data.infRecType+"']").data("id")},
								type:'post',  
								cache:false,  
								dataType:'json',  
								success:function(data1){
									base.renderTpl({
										tplId : "enumerationValueTpl",
										arr : {"list" : data1.result},
										containerId : "delSgmtCode"
									});
									$("#delSgmtCode").val(data.delSgmtCode);	
									form.render('select');
								}
							});
						}
						$("#delRecCode").val(data.delRecCode);
						initPopindex(data.infRecType);
						form.val('exampleForm', data);
						form.render('select');
					}
				});
				
				table.on('toolbar(tableDemo)', function (obj) {
					switch (obj.event) {
						case 'auditingBtn':
							 //查询框先选择信息记录类型
							 var infrectype = $('#acctType').val();
							 if(infrectype === null || infrectype === ""){
								 layer.msg("请先选择需要审核的信息记录类型");
								 return ;
							 }
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
								 strIds+=checkStatus.data[i].pk+",";
							 }
							 strIds = strIds.substr(0, strIds.length - 1);
							 //判断后台对应的表和主键
							 var tableName = "";
							 var tablePk = "";
							 if(infrectype === '213'){
								tableName = "I_IN_ACCT_DEL";
								tablePk = "PBY_IN_ACCT_DEL_ID";
							}else if(infrectype === '134'){
								tableName = "I_IN_ID_EFCT_INF_DLT"
								tablePk = "PAZ_IN_ID_EFCT_INF_DLT_ID";
							}else if(infrectype === '233'){
								tableName = "I_IN_SEC_ACCT_DEL";
								tablePk = "PDY_IN_SEC_ACCT_DEL_ID";
							}else if(infrectype === '114'){
								tableName = "I_IN_BS_INF_DLT";
								tablePk = "PAY_IN_BS_INF_DLT_ID";
							}else if(infrectype === '223'){
								tableName = "I_IN_CTRCT_DEL";
								tablePk = "PCY_IN_CTRCT_DEL_ID";
							}else if(infrectype === '234'){
								tableName = "I_IN_SEC_ACCT_ENT_DEL";
								tablePk = "PDZ_IN_SEC_ACCT_ENT_DEL_ID";
							}else if(infrectype === '214'){
								tableName = "I_IN_ACCT_ENT_DEL";
								tablePk = "PBZ_IN_ACCT_ENT_DEL_ID";
							}else{//授信
								tableName = "I_IN_CTRCT_ENT_DEL";
								tablePk = "PCZ_IN_CTRCT_ENT_DEL_ID";
							}
							 
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
										data     : {state:'30',strIds:strIds,auditOpinion:auditOpinion,tableName: tableName ,tablePk: tablePk},
										type     : 'post',  
										cache    : false,  
										dataType : 'json',  
										success:function(result){ 
											table.reload('tableDemo', {
												method : 'post',
												where:{
													acctType      :   $('#acctType').val(), 
													acctCode      :   $('#acctCode').val(), 
													businessStates:   $('#businessStates').val()
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
											table.reload('tableDemo', {
												method : 'post',
												where:{
													acctType      :   $('#acctType').val(), 
													acctCode      :   $('#acctCode').val(), 
													businessStates:   $('#businessStates').val()
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
