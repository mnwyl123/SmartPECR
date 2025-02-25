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
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item">
			<div class="layui-inline">
			  <label class="layui-form-label">借款人姓名</label>
			  <div class="layui-input-inline">
				<input type="text" name="name" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">借款人证件类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" readonly name="idType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">借款人证件号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="idNum" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">账户类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="acctType"  name="acctType"lay-filter="acctType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">账户标识码</label>
			  <div class="layui-input-inline">
				<input type="text" name="acctCode1" id="acctCode1" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">事件类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="opetnType"  name="opetnType" lay-filter="acctType">
				  	<option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">发生月份</label>
			  <div class="layui-input-inline">
				<input type="text" name="month" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">生效标志</label>
			   <div class="layui-input-inline">
				<select  lay-search="" id="flag"  name="flag" lay-filter="acctType">
			     	<option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">信息报告日期</label>
			  <div class="layui-input-inline">
				<input type="text" name="rptDate" id="rptDate" disabled="true"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield">
			  </div>
			</div>
		</div>
<!-- 		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit lay-filter="exampleSubmit">确定</button>
			</div>
		</div> -->
	</form>	
</div>
<div class="layui-col-md12" style="display:none;margin:30px auto;text-align: center" id="edit">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="hidden" name="pbkInSpcEvtDscInfId" autocomplete="off" class="layui-input" id="pbkInSpcEvtDscInfId"/>
			 </div>
			<div class="layui-inline">
			  <label class="layui-form-label">借款人姓名</label>
			  <div class="layui-input-inline">
				<input type="text" name="name" id="name" autocomplete="off" class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">借款人证件类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="idType"  name="idType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">借款人证件号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="idNum" id="idNum" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">账户类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="acctType1"  name="acctType1"lay-filter="acctType1">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">账户标识码</label>
			  <div class="layui-input-inline">
				<input type="text" name="acctCode" id="acctCode"  autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">事件类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="opetnType"  name="opetnType" lay-filter="acctType">
				  	<option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">发生月份</label>
			  <div class="layui-input-inline">
				<input type="text" name="month" id="month" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">生效标志</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="flag"  name="flag" lay-filter="acctType">
			     	<option value="">请选择</option>										 
				 </select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">信息报告日期</label>
			  <div class="layui-input-inline">
				<input type="text" name="rptDate" id="rptDate" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield">
			  </div>
			</div>
		</div>
		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block" style="margin-left: 0px;">
				<button type="submit"  class="layui-btn" lay-submit lay-filter="close">取消</button>
				<button type="submit"  class="layui-btn" lay-submit id= "save"lay-filter="save">保存</button>
				<button type="submit"  class="layui-btn" lay-submit id= "update" lay-filter="update">确认修改</button>
			</div>
		</div>
	</form>	
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

//初始化性别下拉字典
initDict('idType', staticDict.idType);
initDict('acctType', staticDict.acctType);
initDict('flag', staticDict.perLoanChanEffectiveSign);
initDict('opetnType', staticDict.perLoanChanEventType);

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
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage','laytpl'], function()
{
	var element = layui.element
	form = layui.form,
	table = layui.table
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate
	laytpl = layui.laytpl;
	require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
	/**
     * 初始化常量枚举值
     */
    var initEnumerationValue = function () {
		var array = ['PER_LOAN_ACCT_TYPE','DATA_STATUS_BLXS'];
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
					if (data.result[i].PER_LOAN_ACCT_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].PER_LOAN_ACCT_TYPE},
							containerId : "acctType1"
						});
						continue;
					}else if (data.result[i].DATA_STATUS_BLXS){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].DATA_STATUS_BLXS},
							containerId : "businessStates"
						});
						continue;
					}
				}
                form.render('select');
//                d1.resolve("渲染完成");
			}	     
	    });
    };
    //初始化常量枚举值
    initEnumerationValue();
	 
 // form.render('select');
   var dataObj = window.parent.$("body").data("dataObj");
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'inSpcEvtDscInfSeo/dataHistList.do?ACCT_TYPE='+ dataObj.ACCT_TYPE + "&ACCT_CODE=" + dataObj.ACCT_CODE //url
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框
      ,{field: 'pbkInSpcEvtDscInfId', hide: true,title: '主键', sort: true}
      ,{field: 'acctType', align:'center', title: '账户类型', templet:function(d){return renderColumnDict(d,'acctType',staticDict.acctType)}}
      ,{field: 'acctCode', align:'center', title: '账户标识码'} //列上要显示字典描述，renderColumnDict中第2个参数为当前列的field值，第3个参数为具体哪个字典变量
      ,{field: 'opetnType', align:'center', title: '事件类型', templet:function(d){return renderColumnDict(d,'opetnType',staticDict.perLoanChanEventType)}}
      ,{field: 'rptDate', align:'center', title: '信息报告日期'}
      ,{align : "center",field: 'businessStates', title: '数据状态', templet:function(d){return renderColumnDict(d,'businessStates',staticDict.businessStates)}}
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
  form.on('submit(save)', function(data){
	  addOrUpdate = "save";
	  $("#save").show();
  	  $("#update").hide();
	  if(data.field.acctType ===""){
		  layer.msg('账户类型不能为空');
			return false;
		}
	  if(data.field.acctCode===""){
		  layer.msg('账户标识码不能为空');
			return false;
		}
	  if($("#opetnType").val()===""){
		  layer.msg('事件类型不能为空');
			return false;
		}
	  if($("#month").val()===""){
		  layer.msg('发生月份不能为空');
			return false;
		}
	  if($("#flag").val()===""){
		  layer.msg('生效标志不能为空');
			return false;
		}
	  if($("#rptDate").val()===""){
		  layer.msg('信息报告日期不能为空');
			return false;
		}
	  if($("#name").val()===""){
		  layer.msg('姓名不能为空');
			return false;
		}
	  if($("#idType").val()===""){
		  layer.msg('证件类型不能为空');
			return false;
		}
	  if($("#idNum").val()===""){
		  layer.msg('证件号码不能为空');
			return false;
		}
	  if($("#idNum").val()!=""&&($("#idNum").val()=="0"||$("#idType").val()=="10")){
			var CREDENTIALS_NUM=$("#idNum").val();
		  	if(IDCard1('','',CREDENTIALS_NUM)){
		  		layer.msg('身份证号码格式错误！');
				return false;
		  	}
		}
	     $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : "inSpcEvtDscInf/updatedate.do?addOrUpdate="+addOrUpdate,
	       //数据，json字符串
	       data : data.field,
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
	   return false;//防止页面跳转
	  });
  form.on('submit(update)', function(data){
	  addOrUpdate = "update";
	     $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : "inSpcEvtDscInf/updatedate.do?addOrUpdate="+addOrUpdate,
	       //数据，json字符串
	       data : data.field,
	       //请求成功
	       success : function(result) {
	    	   if(result.success == true){
	     	   	  layer.msg('操作成功', {time:3000});
	     	   	  verify.dataValidation('save','I_IN_SPC_EVT_DSC_INF',$("#pbkInSpcEvtDscInfId").val(),'form',true,false,true); //数据校验
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
	   return false;//防止页面跳转
	  });
  
//新增按钮点击事件
	$('#addBtn').on('click', function(){
		 addOrUpdate = "add";
		  $("#save").show();
	  	  $("#update").hide();
	  	 form.val('exampleForm', {'pbkInSpcEvtDscInfId':'','name':'', 'idType':'', 'idNum':'', 'acctType':'', 'acctCode1':'', 'opetnType':'', 
				'month':'', 'flag':'', 'rptDate':''});
		 popIndex = layer.open({
			type :'1',
			title :'新增用户',
			content :$('#edit'),
			area: ['40%', '90%']			
		});
		form.render('select');
	});
  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
	  form.val('exampleForm', {'pbkInSpcEvtDscInfId':'','name':'', 'idType':'', 'idNum':'', 'acctType':'', 'acctCode1':'', 'opetnType':'', 
			'month':'', 'flag':'', 'rptDate':''});
    var data = obj.data;
    var businessStates = data.businessStates;
    var flag1 = data.flag1;
    if(obj.event === 'more'){
    	addOrUpdate = "update";
    	popIndex = layer.open({
			type :'1',
			title :'详情',
			content :$('#dialog'),
			area: ['40%', '80%']			
		});
    	//将该行数据在form中回显
    	form.val('exampleForm', data);
      	$("#acctType1").val(data.acctType);
    	$("#acctCode1").val(data.acctCode);
    	form.render('select');
    	$("#userid_input").attr('readonly', true);
    	$("#userid_input").addClass('readonly-backgroud');
    }
    else if(obj.event === 'edit'){
    	if(flag1 === 'new' && (businessStates == '20' || businessStates == '11' || businessStates == '10' || businessStates == '40' || businessStates == '80' || businessStates == '110')){
       	    addOrUpdate = "update";
   	     	$("#update").show();
   	     	$("#save").hide();
   	     	popIndex = layer.open({
   	 			type :'1',
   	 			title :'信息补录',
   	 			content :$('#edit'),
   	 			area: ['40%', '90%']			
   	 		});
   	     	//将该行数据在form中回显
   	     	form.val('exampleForm', data);
   	        $("#acctType1").val(data.acctType);
     	    $("#acctCode1").val(data.acctCode);
     	    form.render('select');
          }else{
          	  layer.confirm('该数据信息不支持发起补录!', {anim: 6});
          }
    }else if(obj.event === 'back'){
    	if(flag1 === 'new' && businessStates == '50'){
    		layer.confirm('是否确认回退报文(该数据所在报文的全部数据状态为审核成功)？', function(index){
	  	   	     $.ajax({
	  	   	       //请求方式
	  	   	       type : "POST",
	  	   	       //请求地址
	  	   	       url : "inSpcEvtDscInfSeo/backdate.do?addOrUpdate="+addOrUpdate,
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
