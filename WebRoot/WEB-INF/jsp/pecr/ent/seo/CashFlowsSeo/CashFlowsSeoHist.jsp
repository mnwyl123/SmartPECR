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
<!-- 字典都写在js中 -->
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
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
layui.use(['form', 'laydate', 'element', 'table'], function()
{
  var form = layui.form,
  element = layui.element,
  table = layui.table,
  laydate = layui.laydate;
  
 // form.render('select');
  var dataObj = window.parent.$("body").data("dataObj");
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'cashFlowsSeo/dataHistList.do?ENT_CERT_TYPE=' + dataObj.ENT_CERT_TYPE+'&ENT_CERT_NUM='+dataObj.ENT_CERT_NUM //url
    ,cols: [[ 
    	{type:'checkbox'},  //列复选框
		{field: 'ejaCashFlowsBsSgmtId', title: '主键', hide: true},
		{field: 'entName', align:'center', title: '企业名称'},
        {field: 'entCertType', align:'center', title: '企业身份标识类型',templet: function(d){return renderColumnDict(d, 'entCertType', enterDict.arlpCertType)}},
		{field: 'entCertNum', align:'center', title: '企业身份标识号码'},
		{field: 'businessStates', align:'center', title: '数据状态',templet: function(d){return renderColumnDict(d, 'businessStates', enterDict.dataStatusBlxs)}},
		{field: 'rptDate', align:'center', title: '信息报告日期'},
		{field: 'sheetYear', align:'center', title: '报表年份'},
		{field: 'sheetType', align:'center', title: '报表类型',templet: function(d){return renderColumnDict(d, 'sheetType', enterDict.sheetType)}},
		{field: 'sheetTypeDivide', align:'center', title: '报表类型细分',templet: function(d){return renderColumnDict(d, 'sheetTypeDivide', enterDict.entBalanceSheetTypeDivide)}},
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

  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
    var data = obj.data;
    var businessStates = data.businessStates;
    var flag = data.flag;
    if(obj.event === 'more'){
    	if(flag === 'new'){
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
				content: 'cashFlows/enSecAcctInfEdit.do?addOrUpdate=' + addOrUpdate
				         + '&ejaCashFlowsBsSgmtId=' + data.ejaCashFlowsBsSgmtId,
				end: function(){
					tableReload();
				}
			});
          }else{
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
  				content: 'cashFlowsSeo/indvBasicsInfoDetail.do?addOrUpdate=' + addOrUpdate
  				         + '&ejaCashFlowsBsSgmtId=' + data.ejaCashFlowsBsSgmtId,
  				end: function(){
  					tableReload();
  				}
  			});
          }
    }
    else if(obj.event === 'edit'){
    	if(flag === 'new' && (businessStates == '20' || businessStates == '11' || businessStates == '10' || businessStates == '40' || businessStates == '80' || businessStates == '110')){
    		$("body").data("dataObj",data);
			addOrUpdate = 'edit';
			layer.open({
				type: 2,
				title: '编辑',
				shadeClose: false,
				shade: [0.3, '#000'],
				area: ['100%', '100%'],
				anim: 2,
				resize: false,
				content: 'cashFlows/enSecAcctInfEdit.do?addOrUpdate=' + addOrUpdate
				         + '&ejaCashFlowsBsSgmtId=' + data.ejaCashFlowsBsSgmtId,
				end: function(){
					tableReload();
				}
			});
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
		   	       url : "cashFlowsSeo/backdate.do?addOrUpdate="+addOrUpdate,
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

</script>
</body>
</html>
