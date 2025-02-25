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
<div class="layui-row layui-col-space15" style="display:none;margin:30px auto;" id="moreDialog">
    <div class="layui-col-md12">
		<div class="layui-form-item"  id="baseAddBtn">
		 <form class="layui-form" lay-filter="exampleForm" id="exampleForm">
		 <div class="layui-form-item layui-layer-padding">
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
			<!-- <div class="layui-form-item" style="margin-top: 40px">
				<div class="layui-input-block" style="margin-left: 0px;text-align: center;">
				    <button type="submit"  class="layui-btn" id="close" lay-filter="close">取消</button>
					<button type="submit" class="layui-btn" lay-submit id="exampleSubmit" lay-filter="exampleSubmit">确定</button>
				</div>
			</div> -->
		</form>	
	</div>
</div>
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
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript">

layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage', 'laytpl'], function () {
    var
        element = layui.element
        form = layui.form,
        table = layui.table,
        layer = layui.layer,
        laypage = layui.laypage,
        laydate = layui.laydate
        laytpl = layui.laytpl;
  require(['static/js/pecr/module/base'], function (base) {
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
	        ,trigger:'click'
	    });
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
				var array = ['ENT_INFRECTYPE_DEL','DATA_STATUS_ZHCX','ENT_CERT_MAIN_TYPE','PER_GUAR_DEL_INF_REC_TYPE','SHEET_TYPE','ENT_BALANCE_SHEET_TYPE_DIVIDE'];
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
									containerId : "acctType"
								});
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ENT_INFRECTYPE_DEL},
									containerId : "infRecType"
								});
								continue;
							}else if (data.result[i].DATA_STATUS_ZHCX){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].DATA_STATUS_ZHCX},
									containerId : "businessStates"
								});
								continue;
							}else if (data.result[i].ENT_CERT_MAIN_TYPE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
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
  
  
  
//展示已知数据
    table.render({
    elem: '#tableDemo' //表格所固定的div
    ,toolbar: '#toolbarHead'  //表格顶部工具栏
	,url:'auditing/dataEntDelAccounChangePage.do' //url
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框   
      ,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType',enterDict.entDelMesPage)}}
      ,{align : "center",field: 'name', title: '企业名称'}
      //,{align : "center",field: 'idType', title: '企业身份标识类型',templet: function(d){return renderColumnDict(d, 'idType',enterDict.entCertMainType)}}
      ,{align : "center",field: 'idNum', title: '企业身份标识号码'}
      ,{align : "center",field: 'delRecCode', title: '待删除业务标识码'}
	  ,{align : "center",field: 'operatorUser', title: '操作员'}
	  ,{align : "center",field: 'businessStates', title: '状态',templet: function(d){return renderColumnDict(d, 'businessStates',enterDict.dataStatusBlxs)}}
	  ,{align : "center",fixed: 'right', title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
    ]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 10 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [10, 15, 20],
	//回调函数
	done: function (res, curr, count) {
        $('th').css({'background-color':'#0997F7',
					 'color':'#FFFFFF',
					 'font-family':'Microsoft Yahei',
					 'font-weight':'500',   //设置字体是否加粗
					 'font-size':'13px'});
    }
  });
  
  table.on('tool(tableDemo)', function(obj){
	  var data = obj.data;
	  popIndex = layer.open({
			title: '详情',
			type: '1',
			content :$('#moreDialog'),
			area: ['70%', '70%']
		});
	  	$("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
	  	$("#close").hide();
	  	$("#errorMessage").show();
		$("#infRecType").val(data.infRecType);
		$("#name").val(data.name);	
		$("#idType").val(data.idType);
		$("#idNum").val(data.idNum);
		$("#delEndDate").val(data.delEndDate);
		$("#delStartDate").val(data.delStartDate);
		$("#infSurcCode").val(data.infSurcCode);	
		$("#sheetYear").val(data.sheetYear);
		$("#sheetType").val(data.sheetType);	
		$("#sheetTypeDivide").val(data.sheetTypeDivide);
		$("#rptDate").val(data.rptDate);
		form.render('select');
		initPopindex(data.infRecType);
		if(data.infRecType ==='413' || data.infRecType ==='423' || data.infRecType ==='443'){
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
		}
		$("#delRecCode").val(data.delRecCode);
		form.val('exampleForm', data);
		form.render('select');
	});
  //查询事件
  function tableReload(){
  	  table.reload('tableDemo',{
		  method : 'post',
		  where: {
			 'infRecType'      :   $('#acctType').val(), 
			 'delRecCode'      :   $('#delRecCode1').val(), 
			 'businessStates':$('#businessStates').val(),
			 'idNum' : $('#idNum1').val()
		  }
	  });
    }
  
  //查询
  $("#queryBtn").on('click',function(){
	  tableReload();
	  return false;
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
				  if(infrectype =='314'){
					  tableName = "E_BS_INF_DLT";
					  tablePk = "EAZ_EN_BS_INF_DLT_ID";
				  }else if(infrectype =='413'){
					  tableName = "E_ACCT_INF_DEL";
					  tablePk = "EDY_EN_ACCT_INF_DEL_ID";
				  }else if(infrectype == '414'){
					  tableName = "E_ACCT_INF_ENT_DEL";
					  tablePk = "EDZ_EN_ACCT_INF_ENT_DEL_ID";
				  }else if(infrectype =='423'){
					  tableName = "E_CTRCT_INF_DEL";
					  tablePk = "EGY_EN_CTRCT_INF_DEL_ID";
				  }else if(infrectype == '424'){
					  tableName = "E_CTRCT_INF_ENT_DEL";
					  tablePk = "EGZ_EN_CTRCT_INF_ENT_DEL_ID";
				  }else if(infrectype =='443'){
					  tableName = "E_SEC_ACCT_DEL";
					  tablePk = "EEY_EN_SEC_ACCT_DEL_ID";
				  }else if(infrectype == '444'){
					  tableName = "E_SEC_ACCT_ENT_DEL";
					  tablePk = "EEZ_EN_SEC_ACCT_ENT_DEL_SG_ID";
				  }else if(infrectype == '614'){
					  tableName = "E_BALANCE_SHEET_DLT";
					  tablePk = "EMZ_BALANCE_SHEET_DLT_ID";
				  }else if(infrectype == '624'){
					  tableName = "E_IN_COME_ENT_DEL";
					  tablePk = "E_IN_COME_ENT_DEL_ID";
				  }else if(infrectype =='634'){
					  tableName = "E_CASH_FLOW_ENT_DEL";
					  tablePk = "E_CASH_FLOW_ENT_DEL_ID";
				  }else if(infrectype =='644'){
					  tableName = "E_ASSETS_DEBT_ENT_DEL";
					  tablePk = "E_ASSETS_DEBT_ENT_DEL_ID";
				  }else{
					  tableName = "E_IN_OUT_ENT_DEL";
					  tablePk = "E_IN_OUT_ENT_DEL_ID";
				  }
				 
				var popIndex  = layer.open({
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
									tableReload();
									layer.msg(result.msg, {time:1000});
								 },
								//请求失败，包含具体的错误信息
								error : function(e){
									layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
								}					 
							});
							 layer.close(popIndex); 
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
									tableReload();
									layer.msg(result.msg, {time:1000});
								 },
								//请求失败，包含具体的错误信息
								error : function(e){
									layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
								}					 
							});
							 layer.close(popIndex); 
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
