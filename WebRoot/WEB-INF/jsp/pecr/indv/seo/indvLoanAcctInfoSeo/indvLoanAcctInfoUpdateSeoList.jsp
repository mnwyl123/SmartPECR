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
				  <label class="layui-form-label">账户类型</label>
				  <div class="layui-input-inline">
					<input type="text" name="ACCT_TYPE" id="ACCT_TYPE" autocomplete="off"  class="layui-input"/>
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">账户标识码</label>
				  <div class="layui-input-inline">
					<input type="text" name="ACCT_CODE" id="ACCT_CODE" autocomplete="off"  class="layui-input"/>
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">证件号码</label>
				  <div class="layui-input-inline">
					<input type="text" name="ID_NUM" id="ID_NUM" autocomplete="off"  class="layui-input"/>
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">客户号</label>
				  <div class="layui-input-inline">
					<input type="text" name="CUSTOMERID" id="CUSTOMERID" autocomplete="off"  class="layui-input"/>
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
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">查看历史 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
<div class="layui-input-inline">
</div>
    <!--<button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" lay-event="getCheckLength">提交 <i class="layui-icon layui-icon-ok"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius" lay-event="isAll">驳回 <i class="layui-icon layui-icon-return"></i></button>-->
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
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
  
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'indvLoanAcctInfoSeo/dataListForUpdate.do' //url
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框
      ,{align : "center",field: 'ACCT_TYPE', title: '账户类型', templet:function(d){return renderColumnDict(d,'ACCT_TYPE',staticDict.acctType)}}
      ,{align : "center",field: 'ACCT_CODE', title: '账户标识码'}
      ,{align : "center",field: 'NAME', title: '客户姓名'}
      ,{align : "center",field: 'ID_NUM', title: '证件号码'}
      ,{align : "center",field: 'CUSTOMERID', title: '客户号'}
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
  
  //日期输入框  按css将所有的date组件渲染
  $(".datefield").each(function(){
	  laydate.render({
	    elem: this,
	    trigger:'click'
	  });
  });
  
  //查询按钮点击事件
  $("#queryBtn").on('click', function(){
	  table.reload('tableDemo',{
		  method : 'post',
			where: {
				ACCT_TYPE   :   $('#ACCT_TYPE').val(), 
				ACCT_CODE      :   $('#ACCT_CODE').val(),
				ID_NUM   :   $('#ID_NUM').val(), 
				CUSTOMERID   :   $('#CUSTOMERID').val()
				}
	  }); 
	  return false;
  });

  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
    var data = obj.data;
    $("body").data("dataObj",data);
    layer.open({
		type: 2,
		title: '历史记录',
		shadeClose: false,
		shade: [0.3, '#000'],
		area: ['100%', '100%'],
		anim: 2,
		resize: false,
		content: 'indvLoanAcctInfoSeo/listHistPageForUpdate.do?ACCT_TYPE=' + data.ACCT_TYPE+'&ACCT_CODE='+data.ACCT_CODE,
		end: function(){
			table.reload('tableDemo', {
				method : 'post',
				where: {
					ACCT_TYPE   :   $('#ACCT_TYPE').val(), 
					ACCT_CODE      :   $('#ACCT_CODE').val(),
					ID_NUM   :   $('#ID_NUM').val(), 
					CUSTOMERID   :   $('#CUSTOMERID').val()
					}
			}); 
		}
	});
  });
  
});

</script>
</body>
</html>
