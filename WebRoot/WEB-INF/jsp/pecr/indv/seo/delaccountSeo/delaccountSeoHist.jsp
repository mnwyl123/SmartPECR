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
				  <label class="layui-form-label">报送日期</label>
				  <div class="layui-input-inline">
					<input type="text" name="RPT_DATE" id="RPT_DATE"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield">
				  </div>
				</div>
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div> 

<div class="layui-col-md10" style="display:none;margin:30px auto;" id="dialog">
    <div style="text-align:center">
	<form class="layui-form" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;" id="baseAddBtn">
			<div class="layui-inline" id ="errorMessage">
				<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:365px;height:110px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"></textarea>
			 </div>
           <input name ="pk" id="pk" type="hidden"/>
         <div class="layui-inline">
           		<label class="layui-form-label">类型:</label>
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
		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block">
				<button type="submit"class="layui-btn" lay-submit lay-filter="close" id="close">关闭</button>
				<button type="submit" class="layui-btn" lay-submit lay-filter="exampleSubmit"  id="exampleSubmit">保存</button>
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
   <!-- 
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="getCheckLength">提交 <i class="layui-icon layui-icon-ok"></i></button>
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
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript">

//初始化性别下拉字典
initDict('idType', staticDict.idType);
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
	laydate = layui.laydate,
	laytpl = layui.laytpl;
    
	require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
	    element.init();//每个页面都有
		form.render();//每个页面都有
		
	    var dataObj = window.parent.$("body").data("dataObj");
    	/**
         * 初始化常量枚举值
         */
        var initEnumerationValue = function () {
    		var array = ['INDV_INFRECTYPE_DEL','ID_TYPE'];
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
    							containerId : "infRecType1"
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
                    //d1.resolve("渲染完成");
    			}	     
    	    });
        };
        //初始化常量枚举值
        initEnumerationValue();
        
        form.on('select(infRecType1)', function(data){
    		$.ajax({
    			url:'dataDictCode/selectCodeListByUperId.do', 
    			data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
    			type:'post',  
    			cache:false,  
    			dataType:'json',  
    			success:function(data){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result},
								containerId : "delSgmtCode"
							});
					form.render('select');
					console.log($("#infRecType1").val());
    			}
    		});
    		
    	});
        
      //展示已知数据
        table.render({
          elem: '#tableDemo' //表格所固定的div
      	,toolbar: '#toolbarDemo'  //表格顶部工具栏
      	,url:'delaccountSeo/dataHistList.do?ID_TYPE='+ ((typeof(dataObj.ID_TYPE) == "undefined") ? "" : dataObj.ID_TYPE) + '&ID_NUM=' + ((typeof(dataObj.ID_NUM) == "undefined") ? "" : dataObj.ID_NUM) + '&DEL_REC_CODE=' + ((typeof(dataObj.DEL_REC_CODE) == "undefined") ? "" : dataObj.DEL_REC_CODE)//url
          ,cols: [[ 
          	{type:'numbers'}	//列每行序号
              ,{type:'checkbox'} //列复选框   
              ,{align : "center",hide: true, field:"pk",title:"主键"}
              ,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType',staticDict.INFOTYPE)}}
              ,{align : "center",field: 'name', title: '姓名'}
              //,{align : "center",field: 'idType', title: '证件类型',templet: function(d){return renderColumnDict(d, 'idType',staticDict.idType)}}
              ,{align : "center",field: 'idNum', title: '证件号码'}
      		,{align : "center",field: 'infSurcCode', title: '信息来源编码'}
    		,{align : "center",field: 'delRecCode', title: '待删除业务标识码'}
    		,{align : "center",field: 'delSgmtCode', title: '待删除段标'}
    		,{align : "center",field: 'rptDate', title: '信用报告日期'}
      		,{align : "center",field: 'businessStates', title: '状态', templet:function(d){return renderColumnDict(d,'businessStates',staticDict.businessStates)}}
      	  ,{align : "center",fixed: 'right', title:'操作', toolbar: '#barDemo', width:250} //行上的工具栏
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
		 
        //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
        table.on('tool(tableDemo)', function(obj){
          form.val('exampleForm', {'infRecType1':'', 'delStartDate':'', 'delEndDate':'', 'delRecCode':'','delSgmtCode':'', 'name':'', 'idType':'', 'idNum':''});
          var data = obj.data;
          var businessStates = data.businessStates;
          var flag = data.flag;
			var PK = data.pk;
			var tableName = "";
			if(data.infRecType === '213'){
				tableName = "I_IN_ACCT_DEL";
			}else if(data.infRecType === '134'){
				tableName = "I_IN_ID_EFCT_INF_DLT"
			}else if(data.infRecType === '233'){
				tableName = "I_IN_SEC_ACCT_DEL";
			}else if(data.infRecType === '114'){
				tableName = "I_IN_BS_INF_DLT";
			}else if(data.infRecType === '223'){
				tableName = "I_IN_CTRCT_DEL";
			}else if(data.infRecType === '234'){
				tableName = "I_IN_SEC_ACCT_ENT_DEL";
			}else if(data.infRecType === '214'){
				tableName = "I_IN_ACCT_ENT_DEL";
			}else{//授信
				tableName = "I_IN_CTRCT_ENT_DEL";
			}
          if(obj.event === 'more'){
        	  $.ajax({
		  	       //请求方式
		  	       type : "POST",
		  	       //请求地址
		  	       url : "validate/getErrorMessage.do",
		  	       //数据，json字符串
		  	       data :{pk:PK,tableName:tableName}, 
		  	       //请求成功
		  	       success : function(result) {
		  	    	   if(result.success == true){
		  	    		 var errorMessage="";
		  	    		 var data = result.result;
		  	    		 for(var i=0;i<data.length;i++){
		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
		  	    		 }
		  	    		$("#feedBackError").val(errorMessage);
		  	     	   }else{
		  	     		   layer.alert(result.msg);
		  	     	   }
		  	       },
		  	       //请求失败，包含具体的错误信息
		  	       error : function(e){
		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
		  	       }
		  	   });
        	   popIndex = layer.open({
	      			title: '详情',
	      			type: '1',
	      			content :$('#dialog'),
	      			area: ['40%', '65%']
	      		});
	          	form.val('exampleForm', data);
	      	    $("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
	      		//$(".layui-input").prop("disabled",true);
	      		//$("select").prop("disabled",true);
	      		$("#infRecType1").val(data.infRecType);
	      		$("#name").val(data.name);
	      		$("#idType").val(data.idType);
	      		$("#idNum").val(data.idNum);
	      		$("infRecType1").val(data.infRecType);
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
          } else if(obj.event === 'edit'){
              if(flag === 'new' && (businessStates == '20' || businessStates == '11' || businessStates == '10' || businessStates == '40' || businessStates == '80' || businessStates == '110')){
            	addOrUpdate = "update";
      			$.ajax({
      		  	       //请求方式
      		  	       type : "POST",
      		  	       //请求地址
      		  	       url : "validate/getErrorMessage.do",
      		  	       //数据，json字符串
      		  	       data :{pk:PK,tableName:tableName}, 
      		  	       //请求成功
      		  	       success : function(result) {
      		  	    	   if(result.success == true){
      		  	    		 var errorMessage="";
      		  	    		 var data = result.result;
      		  	    		 for(var i=0;i<data.length;i++){
      		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
      		  	    		 }
      		  	    		$("#feedBackError").val(errorMessage);
      		  	     	   }else{
      		  	     		   layer.alert(result.msg);
      		  	     	   }
      		  	       },
      		  	       //请求失败，包含具体的错误信息
      		  	       error : function(e){
      		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
      		  	       }
      		  	   });
       	   	     	popIndex = layer.open({
       	   	   			type :'1',
       	   	   			title :'修改信息',
       	   	   			content :$('#dialog'),
       	   	   			area: ['40%', '65%']			
       	   	   		});
       	   	     	//将该行数据在form中回显
       	   	     	form.val('exampleForm', data);
       	   	     	$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
       	   	   		//$(".layui-input").prop("disabled",false);
       	   	   		//$("select").prop("disabled",false);
       	   	   		$("#infRecType1").val(data.infRecType);
       	   	   		$("#name").val(data.name);
       	   	   		$("#idType").val(data.idType);
       	   	   		$("#idNum").val(data.idNum);
       	   	   		$("infRecType1").val(data.infRecType);
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
       	   	   		$("#pk").val(data.pk);
       	   	  		initPopindex(data.infRecType);
       	   	   		$("#exampleSubmit").data("id",data.pk);
       	   	   		form.render('select');
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
	         	   	       url : "delaccountSeo/backdate.do?addOrUpdate="+addOrUpdate,
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
        
        
        //新增或更新的实际数据库操作  
        form.on('submit(exampleSubmit)', function(data){
        	 var para = {};
        	 para.pk=$("#exampleSubmit").data("id");
        	 para.infRecType  = $("#infRecType1").val();
        	 para.delStartDate = $("#delStartDate").val();
        	 para.delEndDate = $("#delEndDate").val();
        	 para.delRecCode = $("#delRecCode").val();
        	 para.delSgmtCode = $("#delSgmtCode").val();
        	 para.name = $("#name").val();
        	 para.idNum = $("#idNum").val();
        	 para.idType = $("#idType").val();
        	 para.rptDate =$("#rptDate").val();
 			 para.infSurcCode = $("#infSurcCode").val();
           $.ajax({
             //请求方式
             type : "POST",
             //请求地址
             url : "delaccount/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
             //数据，json字符串
             data : para,
             //请求成功
             success : function(result) {
          	   if(result.success == true){
 			   	  dataObj = para;
			   	  layer.msg('操作成功', {time:3000});
			      layer.close(popIndex);
			      if(dataObj.infRecType === '213'){
					   verify.dataValidation('base','I_IN_ACCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '134'){
						verify.dataValidation('base','I_IN_ID_EFCT_INF_DLT',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '233'){
						verify.dataValidation('base','I_IN_SEC_ACCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '114'){
						verify.dataValidation('base','I_IN_BS_INF_DLT',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '223'){
						verify.dataValidation('base','I_IN_CTRCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '234'){
						verify.dataValidation('base','I_IN_SEC_ACCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '214'){
						verify.dataValidation('base','I_IN_ACCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else{//授信
						verify.dataValidation('base','I_IN_CTRCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
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
      
		//点击关闭按钮
		form.on('submit(close)', function(data){
			  layer.close(popIndex);
			  tableReload();
			  return false; 
		});
        
    });

  
});

</script>
</body>
</html>
