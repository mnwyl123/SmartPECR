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
		  <div class="layui-colla-content layui-show">
			<div class="layui-form-item">
				<div class="layui-inline">
				  <label class="layui-form-label">信息报告日期</label>
				  <div class="layui-input-inline">
					<input type="text" name="RPT_DATE" id="RPT_DATE"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield">
				  </div>
				</div>
			</div>
		  </div>						  
		</div>	
	</div>	
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
			           <select lay-filter="infRecType" lay-search=""  id="infRecType" name="infRecType" lay-verify="required">
					            <option value=""></option>
						</select>
				     </div>
				   </div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="entName">
						<label class="layui-form-label" style="float:none;text-align: left;" >
							企业名称:
						</label>
						<div class="layui-input-inline" style="width: 100%;" >
							<input type="text" placeholder="" class="layui-input" id="name" name="name" lay-verify="" maxlength="30">
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
							<input type="text" placeholder="" class="layui-input" id="idNum" name="idNum" lay-verify="" maxlength="20">
						</div>
					</div>
					<div class="layui-inline layui-col-xs3"  style="margin-top: 30px;margin-left: 35px" id="perInfSurcCode">
						<label class="layui-form-label" style="float:none;text-align: left;">
							信息来源编码:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input" id="infSurcCode" name="infSurcCode" lay-verify=""  maxlength="20">
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perDelStartDate">
					  <label class="layui-form-label" style="float:none;text-align: left;">
					  	待删除起始日:
					  </label>
					  <div class="layui-input-inline" style="width: 100%;">
						<input type="text" name="delStartDate" id="delStartDate" placeholder="yyyy-MM-dd"  class="layui-input datefield" >
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
							<input type="text" id="delRecCode" name="delRecCode" class="layui-input">
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
							<input type="text" placeholder="" class="layui-input" id="sheetYear" name="sheetYear">
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px" id="perSheetType">
						<label class="layui-form-label" style="float:none;text-align: left;">
							报表类型:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="sheetType" name="sheetType">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px"id="perSheetTypeDivide">
						<label class="layui-form-label" style="float:none;text-align: left;">
							报表类型细分:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select id="sheetTypeDivide" name="sheetTypeDivide">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="layui-inline layui-col-xs3" style="margin-top: 30px;margin-left: 35px">
						<label class="layui-form-label" style="float:none;text-align: left;">
							信息报告日期:
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<input type="text" placeholder="" class="layui-input datefield" id="rptDate" name="rptDate" lay-verify="required" >
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
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情 </a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">发起补录</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="back">报文回退 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
<div class="layui-input-inline">
</div>    <!--<button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="getCheckLength">提交 <i class="layui-icon layui-icon-ok"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius" lay-event="isAll">驳回 <i class="layui-icon layui-icon-return"></i></button>-->
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
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript">

//弹出层id
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;
/**
 * 和表单、日期控件、数据表格等相关操作均在下面方法中编写 
 * 公共的方法或变量可以提到下面方法以外定义
 *
 * 界面要用layui的form，则要进入form
 * 要用日期控件，要引入laydate
 * 要用折叠面板，要引入element
 * 要用数据表格，要引入table
 */
 layui.use(['form', 'laydate','layer', 'element', 'table','laypage','laytpl'], function()
		 {
		   var element = layui.element
		   form = layui.form,
		   table = layui.table,
		   layer = layui.layer, //获取layer模块
		   laypage = layui.laypage, //获取laypage模块
		   laytpl = layui.laytpl, //获取laytpl模块  模板引擎
		   laydate = layui.laydate;
		   require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){

		 	//日期输入框  按css将所有的date组件渲染
		 		$(".datefield").each(function(){
		 			laydate.render({
		 				elem: this,
		 				trigger:'click',
		 				theme: '#588fd0',
		 				format: 'yyyy-MM-dd'
		 			});
		 		});
		 		laydate.render({
		           elem: '#sheetYear'
		           ,type: 'year'
		           ,theme: '#588fd0'
		           ,format: 'yyyy'
		       });
		   /*laydate.render({
		 	    elem: '#date'
		 	  });*/
		 		element.init();//每个页面都有
		 		form.render();//每个页面都有
		 		 var selectAdd = function(data,selectId){
		 			 var getTpl = document.getElementById("enumerationValueTpl").innerHTML;
		 			 var  containerId = document.getElementById(selectId);
		 			laytpl(getTpl).render({list:data}, function(html){
		 				containerId.innerHTML = html;
		 			});
		 		 }
		      
		 		  var initEnumerationValue = function () {
		 				var array = ['ENT_INFRECTYPE_DEL','ENT_CERT_TYPE','SHEET_TYPE','ENT_BALANCE_SHEET_TYPE_DIVIDE'];
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
		 							if (data.result[i].ENT_INFRECTYPE_DEL){
		 								base.renderTpl({
		 									tplId : "enumerationValueTpl",
		 									arr : {"list" : data.result[i].ENT_INFRECTYPE_DEL},
		 									containerId : "infRecType"
		 								});
		 								continue;
		 							}else if (data.result[i].ENT_CERT_TYPE){
		 								base.renderTpl({
		 									tplId : "enumerationValueTpl",
		 									arr : {"list" : data.result[i].ENT_CERT_TYPE},
		 									containerId : "idType"
		 								});
		 								continue;
		 							}else if (data.result[i].SHEET_TYPE){
		 								base.renderTpl({
		 									tplId : "enumerationValueTpl",
		 									arr : {"list" : data.result[i].SHEET_TYPE},
		 									containerId : "sheetType"
		 								});
		 								continue;
		 							} else if(data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE){
		 								base.renderTpl({
		 									tplId : "enumerationValueTpl",
		 									arr : {"list" : data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE},
		 									containerId : "sheetTypeDivide"
		 								});
		 								continue;
		 							} 
		 						}
		 						form.render('select');
		 						}
		 				    });
		 		        };
		 		       var initPopindex = function(type){
							 if(type==='314'){
								   $('#perDelStartDate').hide();
								   $('#perDelEndDate').hide();
								   $("#perdelSgmtCode").hide();
								   $("#perDelRecCode").hide();
								   $("#perSheetYear").hide();
								   $("#perSheetType").hide();
								   $('#perInfSurcCode').show()
								   $("#perSheetTypeDivide").hide();
								   $("#entName").show();
								   $("#entIdType").show();
								   $("#entIdNum").show();
							   }
							 if(type==='414' || type==='424' || type==='444') {
								   $('#perDelStartDate').hide();
								   $('#perDelEndDate').hide();
								   $("#perdelSgmtCode").hide();
								   $('#perInfSurcCode').hide();
								   $("#perSheetYear").hide();
								   $("#perSheetType").hide();
								   $("#perSheetTypeDivide").hide();
								   $("#perDelRecCode").show();
								   $("#entName").hide();
								   $("#entIdType").hide();
								   $("#entIdNum").hide();
							   }
							 if(type==='614' || type==='624' || type==='634'|| type==='544'|| type==='654'){
								   $('#perDelStartDate').hide();
								   $('#perDelEndDate').hide();
								   $("#perdelSgmtCode").hide();
								   $("#perDelRecCode").hide();
								   $('#perInfSurcCode').hide();
								   $("#perSheetYear").show();
								   $("#perSheetType").show();
								   $("#perSheetTypeDivide").show();
								   $("#entName").show();
								   $("#entIdType").show();
								   $("#entIdNum").show();
							 }
							 if(type==='413' || type==='423' || type==='443'){
								   $('#perInfSurcCode').hide();
								   $('#perDelStartDate').show();
								   $('#perDelEndDate').show();
								   $("#perdelSgmtCode").show();
								   $("#perDelRecCode").show();
								   $("#perSheetYear").hide();
								   $("#perSheetType").hide();
								   $("#perSheetTypeDivide").hide();
								   $("#entName").hide();
								   $("#entIdType").hide();
								   $("#entIdNum").hide();
							   }
							
						 } ;
		 		        //初始化常量枚举值
		 		        initEnumerationValue();
		 		        /**
		 		    	 * 监听变更类型切换
		 		    	 */
		 		    	form.on('select(infRecType)', function(data){
		 		    		$.ajax({
		 		    			url:'dataDictCode/selectCodeListByUperId.do', 
		 		    			data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
		 		    			type:'post',  
		 		    			cache:false,  
		 		    			dataType:'json',  
		 		    			success:function(data){
		 		    				selectAdd(data.result,'delSgmtCode');
		 		    				base.renderTpl({
		 								tplId : "enumerationValueTpl",
		 								arr : {"list" : data.result},
		 								containerId : "delSgmtCode"
		 							});
		 		    				form.render('select');
		 		    				initPopindex($("#infRecType").val());
		 		    			}
		 		    		});
		 		    		
		 		    	});
 // form.render('select');
  var dataObj = window.parent.$("body").data("dataObj");
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'entDelAccountSeo/dataHistList.do?ID_TYPE='+ ((typeof(dataObj.ID_TYPE) == "undefined") ? "" : dataObj.ID_TYPE) + '&ID_NUM=' + ((typeof(dataObj.ID_NUM) == "undefined") ? "" : dataObj.ID_NUM) + '&DEL_REC_CODE=' + ((typeof(dataObj.DEL_REC_CODE) == "undefined") ? "" : dataObj.DEL_REC_CODE) //url
    ,cols: [[ 
    	{type:'checkbox'},  //列复选框
		{field: 'pk', title: '主键', hide: true},
		{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType',enterDict.entDelMesPage)}},
		{field: 'name', align:'center', title: '企业名称'},
        {field: 'idType', align:'center', title: '企业身份标识类型', templet:function(d){return renderColumnDict(d,'idType',enterDict.arlpCertType)}},
		{field: 'idNum', align:'center', title: '企业身份标识号码'},
		{field: 'delRecCode', align:'center', title: '待删除业务标识码'},
		{field: 'sheetYear', align:'center', title: '报表年份'},
		{field: 'sheetType', align:'center', title: '报表类型', templet:function(d){return renderColumnDict(d,'sheetType',enterDict.sheetType)}},
		{field: 'sheetTypeDivide', align:'center', title: '报表类型细分', templet:function(d){return renderColumnDict(d,'sheetTypeDivide',enterDict.entBalanceSheetTypeDivide)}},
		{field: 'businessStates', align:'center', title: '数据状态', templet:function(d){return renderColumnDict(d,'businessStates',enterDict.dataStatusBlxs)}},
		{field: 'rptDate', align:'center', title: '信息报告日期'},
		{fixed: 'right',align:'center',  title:'操作', toolbar: '#barDemo', width:250} //行上的工具栏
    ]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 10 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [10, 20, 50],
	done: function (res, curr, count) {
		$('th').css({'background-color':'#0997F7',
			 'color':'#FFFFFF',
			 'font-family':'Microsoft Yahei',
			 'font-weight':'500',   //设置字体是否加粗
			 'font-size':'13px'});
	}
  });
  
  function tableReload(){
	  table.reload('tableDemo',{
		  method : 'post',
			where: { 
				RPT_DATE    :   $('#RPT_DATE').val()
				}
	  }); 
  }
  
  //查询按钮点击事件
  $("#queryBtn").on('click', function(){
	  tableReload(); 
	  return false;
  });

  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
	$("#exampleForm")[0].reset();
    var data = obj.data;
    var businessStates = data.businessStates;
    var flag = data.flag;
    if(obj.event === 'more'){
    	addOrUpdate = "update";
    	popIndex = layer.open({
			type :'1',
			title :'详情',
			content :$('#dialog'),
			area: ['70%', '70%']			
		});
    	//将该行数据在form中回显
    	$("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
		$(".layui-input").prop("disabled",true);
		$("select").prop("disabled",true);
		/* $("#infRecType").val(data.infRecType);	
		$("#name").val(data.name);	
		$("#idType").val(data.idType);
		$("#idNum").val(data.idNum);	
		$("#delEndDate").val(data.delEndDate);
		$("#delStartDate").val(data.delStartDate);
		$("#infSurcCode").val(data.infSurcCode);	
		$("#sheetYear").val(data.sheetYear);
		$("#sheetType").val(data.sheetType);	
		$("#sheetTypeDivide").val(data.sheetTypeDivide);
		$("#rptDate").val(data.rptDate); */
		initPopindex(data.infRecType);
		$.ajax({
			url:'dataDictCode/selectCodeListByUperId.do', 
			data:{uperId:$("#infRecType").find("option[value='"+data.infRecType+"']").data("id")},
			type:'post',  
			cache:false,  
			dataType:'json',  
			success:function(data1){
				selectAdd(data1.result,'delSgmtCode');
				$("#delSgmtCode").val(data.delSgmtCode);	
				form.render('select');
			}
		});
		$("#delRecCode").val(data.delRecCode);
		form.val('exampleForm', data);
		form.render('select');
    }else if(obj.event === 'edit'){
    	if(flag === 'new' && (businessStates == '20' || businessStates == '11' || businessStates == '10' || businessStates == '40' || businessStates == '80' || businessStates == '110')){
    		$("body").data("dataObj",data);
			addOrUpdate = 'edit';
   	    	popIndex = layer.open({
   				type :'1',
   				title :'信息补录',
   				content :$('#dialog'),
   				area: ['70%', '70%']			
   			});
   	    	//将该行数据在form中回显
   	    	form.val('exampleForm', data);
   	    	$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
	 	 	$(".layui-input").prop("disabled",false);
	 	 	$("select").prop("disabled",false);
	  	   	/* $("#infRecType").val(data.infRecType);	
	  	 	$("#name").val(data.name);	
	  	 	$("#idType").val(data.idType);
	  	 	$("#idNum").val(data.idNum);	
	  	 	$("#delEndDate").val(data.delEndDate);
	  	 	$("#delStartDate").val(data.delStartDate);
	  	 	$("#infSurcCode").val(data.infSurcCode);	
	  	 	$("#sheetYear").val(data.sheetYear);
	  	 	$("#sheetType").val(data.sheetType);	
	  	 	$("#sheetTypeDivide").val(data.sheetTypeDivide);
	  	 	$("#rptDate").val(data.rptDate); */
	  	 	initPopindex(data.infRecType);
	  	 	$("#pk").val(data.pk);
	  		 $("#exampleSubmit").data("id",data.pk);
	  	 	form.render('select');
			initPopindex(data.infRecType);
			$.ajax({
				url:'dataDictCode/selectCodeListByUperId.do', 
				data:{uperId:$("#infRecType").find("option[value='"+data.infRecType+"']").data("id")},
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data1){
					selectAdd(data1.result,'delSgmtCode');
					$("#delSgmtCode").val(data.delSgmtCode);	
					form.render('select');
				}
			});
			$("#delRecCode").val(data.delRecCode);
        }else{
      	  layer.confirm('该数据信息不支持发起补录!', {anim: 6});
        }
      }else if(obj.event === 'back'){
      	if(flag === 'new'&& businessStates == '50'){
      		layer.confirm('是否确认回退报文(该数据所在报文的全部数据状态为审核成功)？', function(index){
		   	    $.ajax({
		   	       //请求方式
		   	       type : "POST",
		   	       //请求地址
		   	       url : "entDelAccountSeo/backdate.do?addOrUpdate="+addOrUpdate,
		   	       //数据，json字符串
		   	       data : data,
		   	       //请求成功
		   	       success : function(result) {
		   	    	   if(result.success == true){
		   	     	   	  layer.msg('操作成功', {time:3000});
		   	     	  	  tableReload(); 
		   	     	      layer.close(popIndex);
		   	     	   }else{
		   	     		   layer.alert(result.msg);
		   	     	   }
		   	       },
		   	       //请求失败，包含具体的错误信息
		   	       error : function(e){
		   	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
		   	       }
		   	    });
		   		layer.close(index);
			});
	   	   return false;//防止页面跳转
          }else{
        	  layer.confirm('该数据信息不支持报文回退!', {anim: 6});
          }
	}
  //新增或更新的实际数据库操作  
    form.on('submit(exampleSubmit)', function(data){
    	var para = {};
		 para.pk=$("#exampleSubmit").data("id");
		 para.infRecType  = $("#infRecType").val();
		 para.delStartDate = $("#delStartDate").val();
		 para.delEndDate = $("#delEndDate").val();
		 para.delRecCode = $("#delRecCode").val();
		 para.name = $("#name").val();
		 para.idType = $("#idType").val();
		 para.idNum = $("#idNum").val();
		 para.delSgmtCode = $("#delSgmtCode").val();
		 para.infSurcCode = $("#infSurcCode").val();	
		 para.sheetYear = $("#sheetYear").val();
		 para.sheetType = $("#sheetType").val();	
		 para.sheetTypeDivide =	$("#sheetTypeDivide").val();
		 para.rptDate = $("#rptDate").val();
       $.ajax({
         //请求方式
         type : "POST",
         //请求地址
         url : "entDelAccount/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
         //数据，json字符串
         data : para,
         //请求成功
         success : function(result) {
      	   if(result.success == true){
      		 dataObj = para;
      	   	  layer.msg('操作成功', {time:3000});
       	      layer.close(popIndex);
		   	   if(dataObj.infRecType === '413'){
		           verify.dataValidation('base','E_ACCT_INF_DEL',dataObj.pk,'form',true,false,true); //数据校验
			    }else if(dataObj.infRecType === '443'){
		            verify.dataValidation('base','E_SEC_ACCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		
				}else if(dataObj.infRecType === '423'){
		            verify.dataValidation('base','E_CTRCT_INF_DEL',dataObj.pk,'form',true,false,true); //数据校验
		
				}else if(dataObj.infRecType === '444'){
		            verify.dataValidation('base','E_SEC_ACCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		
				}else if(dataObj.infRecType === '414'){
		            verify.dataValidation('base','E_ACCT_INF_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		
				}else if(dataObj.infRecType === '424'){
		            verify.dataValidation('base','E_CTRCT_INF_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		            
				}else if(dataObj.infRecType === '314'){
		            verify.dataValidation('base','E_BS_INF_DLT',dataObj.pk,'form',true,false,true); //数据校验
		            
				}else if(dataObj.infRecType === '614'){
		            verify.dataValidation('base','E_BALANCE_SHEET_DLT',dataObj.pk,'form',true,false,true); //数据校验
		            
				}else if(dataObj.infRecType === '624'){
		            verify.dataValidation('base','E_IN_COME_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		            
				}else if(dataObj.infRecType === '634'){
		            verify.dataValidation('base','E_CASH_FLOW_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		            
				}else if(dataObj.infRecType === '644'){
		            verify.dataValidation('base','E_ASSETS_DEBT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		            
				}else if(dataObj.infRecType === '654'){
		            verify.dataValidation('base','E_IN_OUT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
		            
				}
		   		tableReload(); 
       	   }else{
       		   layer.alert(result.msg);
       	   }
         },
         //请求失败，包含具体的错误信息
         error : function(e){
      	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
         }
     });
     return false;//防止页面跳转
    });
  });
});
});

</script>
</body>
</html>
