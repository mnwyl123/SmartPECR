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
					  <label class="layui-form-label">客户标识码</label>
					  <div class="layui-input-inline">
						<input type="text" name="customer_id_num" id="customer_id_num" autocomplete="off"  class="layui-input"/>
					  </div>
					</div>
					
				</div>
			  </div>						  
			</div>	
		</div>	
		<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
	  </div>

<!-- 新增修改 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="examplelog">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;">
			
			<div class="layui-inline">
		
			  <div class="layui-input-inline">
				<input type="text" style="display:none" name="uuid" id="uuid1" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">客户类型</label>
			  <div class="layui-input-inline">
				<select lay-filter="customer_type1" lay-search="" readonly name="customer_type"id="customer_type1">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">客户证件类型</label>
			  <div class="layui-input-inline">
				<select lay-filter="customer_id_type1"  lay-search="" readonly name="customer_id_type" id="customer_id_type1">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">客户证件号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="customer_id_num" id="customer_id_num1" autocomplete="off" class="layui-input" maxlength="40">
			  </div>
			</div>
				
		</div>
		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block">
				<button type="submit"  class="layui-btn" lay-submit lay-filter="close">取消</button>
				<button type="submit"  class="layui-btn" lay-submit id= "add" lay-filter="add">新增</button>
				<button type="submit"  class="layui-btn" lay-submit id= "save" lay-filter="save">提交</button>
			</div>
		</div>
	</form>	
</div>

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">

  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="update">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="delete">删除 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>

</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>

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
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage','laytpl'], function(){
	var element = layui.element
	form = layui.form,
	
	table = layui.table,
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate
	laytpl = layui.laytpl;
	
	
	
	require(['static/js/pecr/module/base'],function(base){
		/**
	     * 初始化常量枚举值
	     */
	    var initEnumerationValue = function () {
			var array = ['CUSTOMER_TYPE'];
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
						if (data.result[i].CUSTOMER_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CUSTOMER_TYPE},
								containerId : "customer_type1"
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
	    
	    
	    /**
		 * 监听身份类别切换
		 */
		form.on('select(customer_type1)', function(data){
			//console.log(data.value+','+data.value);
			$.ajax({
				url:'dataDictCode/selectCodeListByUperId.do', 
				data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data){
					if (data.result.length){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result},
							containerId : "customer_id_type1"
						});
					}
					form.render('select');
				}
			});
		});
	    

  

  
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'whiteMsgMaintenance/product_list.do?type=customer' //url
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框
      ,{field: 'uuid', hide: true,title: '主键UUID', sort: true}
      ,{align : "center",field: 'customer_type', title: '客户类型', templet:function(d){return renderColDict(d,'CUSTOMER_TYPE','customer_type')}}
      ,{align : "center",field: 'customer_id_type', title: '客户证件类型'}
      ,{align : "center",field: 'customer_id_num', title: '客户证件号码'}
      ,{align : "center",field: 'last_update_time', title: '最终修改时间'}
	  ,{align : "center",fixed: 'right', title:'操作', toolbar: '#barDemo', width:200} //行上的工具栏
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

  
  //查询按钮点击事件
  $("#queryBtn").on('click', function(){
	  table.reload('tableDemo', {'where':{
		  'customer_id_num':$('#customer_id_num').val()
		  
		  }}); 
	  return false;
  });
  
  

	//新增按钮点击事件
	$('#addBtn').on('click', function(){
		  
		 form.render('select');
		 form.val('exampleForm', {'uuid':'','customer_type':'','customer_id_type':'','customer_id_num':''});
		 $("#add").show();
	  	  $("#save").hide();
		 popIndex = layer.open({
			type :'1',
			title :'新增',
			content :$('#examplelog'),
			area: ['40%', '60%']			
		});
		form.render('select');
	});
  
  
  
  form.on('submit(add)', function(data){
	  var addOrSave = "add";
	  if(data.field.customer_type == null || data.field.customer_type == ""||
			  data.field.customer_id_type == null || data.field.customer_id_type == ""||
			  data.field.customer_id_num == null || data.field.customer_id_num == ""){
		  
		  layer.alert('客户相关所有信息必填!');
		  return false;
	  }else{
		  $("#add").show();
	  	  $("#save").hide();
  	  
	     $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : "whiteMsgMaintenance/customer_save.do?addOrSave="+addOrSave,
	       //数据，json字符串
	       data : data.field,
	       //请求成功
	       success : function(result) {
	    	   if(result.success == true){
	     	   	  layer.msg('操作成功', {time:3000});
	     	   		table.reload('tableDemo', {'where':{
	     			  'customer_id_num':$('#customer_id_num').val()
	     			  
	     			  }});
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
	   return false;//防止页面跳转
		  
	  }
	
	  });

  
  	form.on('submit(save)', function(data){
	  var addOrSave = "save";
	  if(data.field.customer_type == null || data.field.customer_type == ""||
			  data.field.customer_id_type == null || data.field.customer_id_type == ""||
			  data.field.customer_id_num == null || data.field.customer_id_num == ""){
		  
		  layer.alert('客户类型,证件类型,证件号码信息必填!');
		  return false;
	  }
	   	  
	     $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : "whiteMsgMaintenance/customer_save.do?addOrSave="+addOrSave,
	       //数据，json字符串
	       data : data.field,
	       //请求成功
	       success : function(result) {
	    	   if(result.success == true){
	     	   	  layer.msg('操作成功', {time:3000});
	     	   		table.reload('tableDemo', {'where':{
	     			  'customer_id_num':$('#customer_id_num').val()
	     			  
	     			  }});
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
	   return false;//防止页面跳转
	  });
  


  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
	  form.val('exampleForm', {'uuid':'','customer_type':'','customer_id_type':'','customer_id_num':''});
    	var data = obj.data;
    	var delOrUpdate="";
	
    	
   
    if(obj.event === 'update'){
    	//$("#customer_type1").val("");
    	delOrUpdate="update";
    	 $.ajax({
  	       //请求方式
  	       type : "POST",
  	       //请求地址
  	       url : "whiteMsgMaintenance/customer_editdel.do?delOrUpdate="+delOrUpdate,
  	       //数据，json字符串
  	       data : data,
  	       //请求成功
  	       success : function(result) {
  	    	   if(result.success == true){
  	    		  var result_data = result.data;
	  	    		$("#add").hide();
	  	      		$("#save").show();
	  	      	
	  	      		$("#uuid1").val(result_data.uuid);
	  	      		$("#customer_type1").val(result_data.customer_type);
	  	    		//$("#customer_id_num1").val(result_data.customer_id_num);
	  	    		
		  	      $.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId: $('#customer_type1').find("option[value='" + $('#customer_type1').val() + "']").data("id")},
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data){
						if (data.result.length){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result},
								containerId : "customer_id_type1"
							});
						}
						$("#customer_id_type1").val(result_data.customer_id_type);
						form.render('select');
					}
				 });
	  	  
	  	    		form.val('exampleForm', result_data);	
	  	      	
	  	      		
			    	popIndex = layer.open({
						type :'1',
						title :'编辑',
						content :$('#examplelog'),
						area: ['40%', '60%']			
					});
  	     	   }else{
  	     		
  	     		   layer.alert(result.msg);
  	     	   }
  	       },
  	       //请求失败，包含具体的错误信息
  	       error : function(e){
  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
  	       }
  	   });
    	
    }else if(obj.event === 'delete'){
    	delOrUpdate="delete";
    	layer.confirm('确定删除该客户 ?', function(index){
		     $.ajax({
		       //请求方式
		       type : "POST",
		       //请求地址
		       url : "whiteMsgMaintenance/customer_editdel.do?delOrUpdate="+delOrUpdate,
		       //数据，json字符串
		       data : data,
		       //请求成功
		       success : function(result) {
		    	   if(result.success == true){
		     	   	  layer.msg('删除成功', {time:3000});
		     	   		table.reload('tableDemo', {'where':{
		     			  'customer_id_num':$('#customer_id_num').val()
		     			  
		     			  }});
		     	   }else{
		     		   layer.alert(result.msg);
		     	   }
		       },
		       //请求失败，包含具体的错误信息
		       error : function(e){
		    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
		       }
		   });	
    	});
	   return false;//防止页面跳转
    }
  });
});
});

</script>
</body>
</html>
