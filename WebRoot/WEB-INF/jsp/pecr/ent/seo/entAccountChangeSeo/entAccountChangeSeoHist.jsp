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
				<!-- <div class="layui-inline">
				  <label class="layui-form-label">企业名称</label>
				  <div class="layui-input-inline">
					<input type="text" name="NAME" id="NAME" autocomplete="off"  class="layui-input"/>
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">企业身份标识号码</label>
				  <div class="layui-input-inline">
					<input type="text" name="ID_NUM" id="ID_NUM" autocomplete="off"  class="layui-input"/>
				  </div>
				</div> -->
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
			<div class="layui-collapse" >
			    <div class="layui-colla-item" id="feedBackErrorDiv">
				<form class="layui-form">
					<h3 class="layui-colla-title">反馈错误信息展示</h3>	
					<div class="layui-colla-content">
					  <div class="layui-form-item layui-layer-padding">
						<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:99%;height:110px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"></textarea>
					  </div>
					</div>
					</form>
				</div>
				<!-- 基础段 start-->
				<div class="layui-colla-item" id="CtrctBsSgmtDiv">
					<form class="layui-form" lay-filter="exampleForm" id="exampleForm">   
						<h3 class="layui-colla-title">企业标识变更管理</h3>	
						<div class="layui-colla-content layui-show">
							<div class="layui-form-item layui-layer-padding">
							<input name ="pk" id="pk" type="hidden"/>
								<div class="layui-inline layui-col-xs3" >
									<label class="layui-form-label" style="float:none;text-align: left;">
										<b style="color: #f00;">*</b>
										信息记录类型
									</label>
									<div class="layui-input-inline" style="width: 100%;">
										<select lay-search="" id="infrectype1" name="infrectype1">
												<option value="">请选择</option>
								</select>	
									</div>
								</div>
							<div class="layui-inline layui-col-xs3" >
							  <label class="layui-form-label" style="float:none;text-align: left;">
							 <b style="color: #f00;">*</b> 
									  变更日期:</label>
							  <div class="layui-input-inline">
								<input type="text" name="lastUpdateTime" id="lastUpdateTime"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
							  </div>
							</div>
							
						<div class="layui-inline layui-col-xs3" >
							  <label class="layui-form-label" style="float:none;text-align: left;">
							 <b style="color: #f00;">*</b> 
							  原业务标识码:</label>
							  <div class="layui-input-inline" style="width: 100%;">
								<input type="text" name="odBnesCode" id="odBnesCode" class="layui-input" lay-verify="required" maxlength="60">
							  </div>
							</div>
							
							<div class="layui-inline layui-col-xs3" >
							  <label class="layui-form-label" style="float:none;text-align: left;">
							 <b style="color: #f00;">*</b> 
							  新业务标识码:</label>
							  <div class="layui-input-inline" style="width: 100%;">
								<input type="text" name="nwBnesCode" id="nwBnesCode"class="layui-input"  lay-verify="required" maxlength="60">
							  </div>
							</div>
							</div>
						</div>
						<div class="layui-form-item" style="margin-top:40px;text-align:center;">
							<div class="layui-input-block" style="margin-left:0px;">
								<button type="submit"  class="layui-btn" lay-filter="close">取消</button>
								<button type="submit"  class="layui-btn" lay-submit lay-filter="exampleSubmit" id="exampleSubmit">保存</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 基础段 end-->
				
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
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/js/jquery.cookie.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>

<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>

<script type="text/javascript">

initDict('infRecType1', enterDict.infRecTypeM);
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
layui.use(['form', 'laydate', 'element', 'table','laytpl'], function()
{
  var element = layui.element
  form = layui.form,
  laytpl = layui.laytpl,
  table = layui.table,
  laydate = layui.laydate;
  
 // form.render('select');
 require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
	 
		/**
		 * element组件渲染
		 * form组件渲染
		 */
		element.init();//每个页面都有
		form.render();//每个页面都有
	/**
	* 初始化常量枚举值
	*/
		
	var initEnumerationValue = function () {
		var array = ['ENT_INFRECTYPE_ACCOUNT'];
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
						if (data.result[i].ENT_INFRECTYPE_ACCOUNT){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_INFRECTYPE_ACCOUNT},
								containerId : "infrectype1"
							});
							continue;
					}
				}
					form.render('select');
				}
		    });
     };
     //初始化常量枚举值
     initEnumerationValue();
	 
	 
	 var dataObj = window.parent.$("body").data("dataObj");
	//展示已知数据
	  table.render({
	    elem: '#tableDemo' //表格所固定的div
		,toolbar: '#toolbarDemo'  //表格顶部工具栏
		,url:'entAccountChangeSeo/dataHistList.do?OD_BNES_CODE=' + dataObj.OD_BNES_CODE+'&NW_BNES_CODE='+dataObj.NW_BNES_CODE //url
	    ,cols: [[ 
	    	{type:'checkbox'},  //列复选框
			{field: 'pk', title: '主键', hide: true},
//			{field: 'orgCode', align:'center', title: '所属机构'},
//			{field: 'name', align:'center', title: '企业名称'},
//	        {field: 'idType', align:'center', title: '企业身份标识类型', templet: function(d){return renderColumnDict(d,'idType',enterDict.entCertMainType)}},
	        {align : "center",field: 'infRecType', title: '信息记录类型', templet: function(d){return renderColumnDict(d,'infRecType',enterDict.entInfrectypeAccount)}},
	        {align : "center",field: 'rptDate', title: '报告日期'},
	  		{align : "center",field: 'odBnesCode', title: '原业务标识码'},
	  		{align : "center",field: 'nwBnesCode', title: '新业务标识码'},
			{field: 'businessStates', align:'center', title: '数据状态',templet: function(d){return renderColumnDict(d, 'businessStates', enterDict.dataStatusBlxs)}},
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

	//新增或更新的实际数据库操作
		form.on('submit(exampleSubmit)', function(data){
			var para = {};
			 para.pk= $("#exampleSubmit").data("id");
			 para.infRecType  = $("#infrectype1").val();
			 para.lastUpdateTime = $("#lastUpdateTime").val();
			 para.odBnesCode = $("#odBnesCode").val();
			 para.nwBnesCode = $("#nwBnesCode").val();
			$.ajax({
				//请求方式
				type : "POST",
				//请求地址
				url : "entAccountChange/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
				//数据，json字符串
				data : para,
				//请求成功
				success : function(result) {
					if(result.success == true){
						dataObj = para;
						layer.msg('操作成功');
						tableReload(); 
						layer.close(popIndex);
						if(dataObj.infRecType === '441'){//担保
			                verify.dataValidation('base','E_SEC_ACCT_ID_CAGS_INF',dataObj.pk,'form',true,false); //数据校验
			                								
						}else if(dataObj.infRecType === '421'){//授信
			                verify.dataValidation('base','E_CR_ACCT_ID_CAGS_INF',dataObj.pk,'form',true,false); //数据校验
			                								
						}else if(dataObj.infRecType === '411'){//借贷
			                verify.dataValidation('base','E_ACCT_INF_ID_CAGS_INF',dataObj.pk,'form',true,false); //数据校验
			                								
						}
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
		form.val('exampleForm', {'infrectype1':'','nwBnesCode':'', 'odBnesCode':'','lastUpdateTime':''});
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
			$("#infrectype1").val(data.infRecType);
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
  	   	    	$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
       			$(".layui-input").prop("disabled",false);
   				$("select").prop("disabled",false);
       			$("#infrectype1").val(data.infRecType);
       			$("#exampleSubmit").data("id",data.pk);
       			form.val('exampleForm', data);
	  	   	    $("#infrectype1").attr("disabled",false);
				$("#lastUpdateTime").attr("disabled",false);
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
			   	       url : "entAccountChangeSeo/backdate.do?addOrUpdate="+addOrUpdate,
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
