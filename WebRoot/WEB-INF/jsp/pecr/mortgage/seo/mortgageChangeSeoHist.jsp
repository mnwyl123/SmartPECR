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
<div class="layui-col-md12" style="display:none;margin:30px auto;text-align: center" id="dialog">
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
			<div class="layui-form-item" style="margin-top:40px;">
				<div class="layui-input-block" style="margin-left: 0px;">
					<button type="submit" class="layui-btn" lay-submit id="exampleSubmit"lay-filter="exampleSubmit">确定</button>
				</div>
			</div>
		</div>
	</form>	
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
</div>
    <!--<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="getCheckLength">提交 <i class="layui-icon layui-icon-ok"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius" lay-event="isAll">驳回 <i class="layui-icon layui-icon-return"></i></button>-->
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
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
   	var dataObj = window.parent.$("body").data("dataObj");
	//展示已知数据
	  table.render({
	    elem: '#tableDemo' //表格所固定的div
		,toolbar: '#toolbarDemo'  //表格顶部工具栏
		,url:'moChangeSeo/dataHistList.do?OD_BNES_CODE='+ dataObj.OD_BNES_CODE + "&NW_BNES_CODE=" + dataObj.NW_BNES_CODE //url
	    ,cols: [[ 
	      {type:'numbers'}	//列每行序号
	      ,{type:'checkbox'} //列复选框
			,{align : "center",hide: true, field:"efwMocId",title:"主键"}
			,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType', staticDict.motgaInfrectype)}}
			,{align : "center",field: 'odBnesCode', title: '原业务标识码'}
			,{align : "center",field: 'nwBnesCode', title: '新业务标识码'}
			,{align : "center",field: 'businessStates', title: '数据状态',templet: function(d){return renderColumnDict(d, 'businessStates', staticDict.businessStates)}}
			,{align : "center",field: 'lastUpdateTime', title: '变更日期(报告)'}
		  ,{fixed: 'right',align:'center', title:'操作', toolbar: '#barDemo', width:250} //行上的工具栏
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
  
  //日期输入框  按css将所有的date组件渲染
  $(".datefield").each(function(){
	  laydate.render({
	    elem: this,
	    trigger:'click'
	  });
  });
  
  laydate.render({
      elem: '#month'
      ,type: 'month'
      ,theme: '#588fd0'
      ,format: 'yyyy-MM'
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
  form.on('submit(close)', function(data){
	  layer.close(popIndex);
	  tableReload(); 
	  });
  
  form.on('submit(exampleSubmit)', function(data){
		var para = {};
		 para.infRecType= $("#infRecType").val();
		 para.efwMocId= $("#efwMocId").val();
		 para.lastUpdateTime = $("#lastUpdateTime").val();
		 para.odBnesCode = $("#odBnesCode").val();
		 para.nwBnesCode = $("#nwBnesCode").val();
	     $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : "moChange/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
	       //数据，json字符串
	       data : para,
	       //请求成功
	       success : function(result) {
	    	   if(result.success == true){
	     	   	  layer.msg('操作成功', {time:3000});
	     	   	  verify.dataValidation('dialog','MOC_ID_CAGS_INF',$("#efwMocId").val(),'form',true,false,true); //数据校验
	     	      layer.close(popIndex);
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
  
  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
	  form.val('exampleForm', {'efwMocId':'','lastUpdateTime':'', 'odBnesCode':'', 'nwBnesCode':''});
    var data = obj.data;
    var businessStates = data.businessStates;
    var flag1 = data.flag;
    if(obj.event === 'more'){
    	addOrUpdate = "detail";
    	popIndex = layer.open({
			type :'1',
			title :'详情',
			content :$('#dialog'),
			area: ['40%', '50%%']			
		});
    	$("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
		/* $("#lastUpdateTime").prop("disabled",true);
		$("#odBnesCode").prop("disabled",true);
		$("#nwBnesCode").prop("disabled",true);
		$("#infRecType").prop("disabled",true); */
    	//将该行数据在form中回显
    	form.val('exampleForm', data);
    }
    else if(obj.event === 'edit'){
    	if(flag1 === 'new'&& (businessStates == '20' || businessStates == '11' || businessStates == '10' || businessStates == '40' || businessStates == '80' || businessStates == '110')){
	  	    	addOrUpdate = "update";
	   	     	popIndex = layer.open({
	   	 			type :'1',
	   	 			title :'信息补录',
	   	 			content :$('#dialog'),
	   	 			area: ['40%', '50%%']			
	   	 		});
	   	     	$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
 				/* $("#lastUpdateTime").prop("disabled",false);
				$("#odBnesCode").prop("disabled",false);
				$("#nwBnesCode").prop("disabled",false);
 				$("#infRecType").prop("disabled",false); */
	   	     	//将该行数据在form中回显
	   	     	form.val('exampleForm', data);
          }else{
          	  layer.confirm('该数据信息不支持发起补录!', {anim: 6});
          }
    }else if(obj.event === 'back'){
    	if(flag1 === 'new'&& businessStates == '50'){
    		layer.confirm('是否确认回退报文(该数据所在报文的全部数据状态为审核成功)？', function(index){
	  	   	     $.ajax({
	  	   	       //请求方式
	  	   	       type : "POST",
	  	   	       //请求地址
	  	   	       url : "moChangeSeo/backdate.do",
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
  });
  });
});

</script>
</body>
</html>
