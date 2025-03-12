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
				  <label class="layui-form-label">提取日期</label>
				  <div class="layui-input-inline">
     						 <input type="text" class="layui-input" id="rptDate" name="rptDate" placeholder=" - ">
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">信息记录类型</label>
				  <div class="layui-input-inline">
				  	<select  lay-search="" id="infRecType" name="infRecType">
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

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
 
</script>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="generateMessage" id="generateMessage">生成报文 <i class="layui-icon layui-icon-file-b"></i></button>
</script>
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
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript">

//初始化性别下拉字典
initDict('idType', enterDict.idType);
//弹出层id
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;
//获取checkbox选中的数据
var date;
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
	var form = layui.form,
	element = layui.element,
	table = layui.table,
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate
	laytpl = layui.laytpl;

require(['static/js/pecr/module/base'],function(base){
	var initEnumerationValue = function(){
		var array = ['ENT_INFRECTYPE'];
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
					if (data.result[i].ENT_INFRECTYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].ENT_INFRECTYPE},
							containerId : "infRecType"
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
});
laydate.render({
	  elem: '#rptDate'
	  ,range: true
});
//展示已知数据  
table.render({
  elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'entNormalMessage/dataList.do' //url
  ,cols: [[
    {type:'numbers', fixed: 'left', width:50}	//列每行序号
    ,{type:'checkbox', width:50} //列复选框
    ,{field: 'rptDate', align:'center', title: '报送日期'}
    ,{field: 'infRecType', align:'center' , title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType', enterDict.infRecType)}}
    ,{field: 'recodeNum', align:'center', title: '记录数'}
    ,{field: 'rightRecodeNum', align:'center', title: '审核通过记录数'}
    ,{field: 'wrongRecodeNum', align:'center', title: '审核驳回记录数'}
    ,{field: 'COMPANY', align:'center', title: '法人',hide:true}
  ]]
  ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 15 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [15, 30, 50]
	,done: function (res, curr, count) {
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

//日期 或者按单个日期组件渲染
/*laydate.render({
  elem: '#date'
});*/

//查询按钮点击事件
$("#queryBtn").on('click', function(){
	  table.reload('tableDemo', {
		  method : 'post',
		  where: {'rptDate':$('#rptDate').val(), 'infRecType':$('#infRecType').val()}});
	  return false;
});
table.on('toolbar(tableDemo)', function(obj){
	if(obj.event === 'generateMessage') {
		 //获取选中的行信息
		 var checkStatus = table.checkStatus('tableDemo');
		 //获取选中行的数据
		 data=checkStatus.data;
		 var normalOrAbnormal ="entnormal";
		 if(data.length==0){
				layer.msg("请选择需要生成报文的行");
				return ;
			}
		 	var str = "";
			for(var i = 0; i < data.length; i++){
				str+=checkStatus.data[i].infRecType+","+checkStatus.data[i].rptDate+","+checkStatus.data[i].COMPANY+";"
				
			}
			str = str.substr(0, str.length - 1);
			layer.confirm('确定要生成选中的数据的报文吗？', {icon: 3, title: '提示信息'}, function (index){
				$.ajax({
					type : "POST",  //请求方式
					url : "generateMessageCt/generateMessage.do?normalOrAbnormal="+normalOrAbnormal, //请求地址
					data : {str:str},           //数据，json字符串
					success : function(result) { //请求成功
						if(result.success){
							layer.msg(result.msg, {
								icon:1,
								time:2000
								},function(){
									table.reload('tableDemo', {
										  method : 'post',
										  where: {'rptDate':$('#rptDate').val(), 'infRecType':$('#infRecType').val()}
									});  
								}
							);
						}else{
							layer.alert(result.msg);
						}
					},
					error : function(e){ //请求失败，包含具体的错误信息
						layer.alert('生成出错,错误信息如下:<br>' + e.responseText);
					}
				});
			});
	}
});

/*表格顶部的工具栏按钮也可以采用下面方式
table.on('toolbar(tableDemo)', function(obj){
	 if(obj.event === 'getCheckLength') {
		 var data = table.checkStatus('tableDemo');
		 alert(JSON.stringify(data));
	 }
});*/
});
</script>
</body>
</html>
