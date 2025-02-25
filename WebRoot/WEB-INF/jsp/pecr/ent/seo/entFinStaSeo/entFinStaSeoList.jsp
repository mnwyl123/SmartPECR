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
				  <label class="layui-form-label">企业身份标识类型</label>
				  <div class="layui-input-inline">
	                    <select id="ENT_CERT_TYPE"  name="ENT_CERT_TYPE">
	                        <option value=""></option>
	                    </select>
	                </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">企业身份标识号码</label>
				  <div class="layui-input-inline">
					<input type="text" name="ENT_CERT_NUM" id="ENT_CERT_NUM" autocomplete="off"  class="layui-input"/>
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
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript">

//初始化性别下拉字典
initDict('idType', enterDict.idType);
initDict('famMemCertType', enterDict.idType);
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
  var form = layui.form,
  element = layui.element,
  table = layui.table,
  laydate = layui.laydate
  laytpl = layui.laytpl;
 // form.render('select');
    require(['static/js/pecr/module/base'],function(base){
	/**
     * 初始化常量枚举值
     */
    var initEnumerationValue = function () {
		var array = ['ENT_CERT_MAIN_TYPE','DATA_STATUS_BLXS'];
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
					if (data.result[i].ENT_CERT_MAIN_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
							containerId : "ENT_CERT_TYPE"
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
	 });
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'entFinStaSeo/dataList.do' //url
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框
      ,{align : "center",field: 'ENT_CERT_TYPE', title: '企业身份标识类型', templet: function(d){return renderColumnDict(d,'ENT_CERT_TYPE',enterDict.entCertMainType)}}
      ,{align : "center",field: 'ENT_CERT_NUM', title: '企业身份标识号码'}
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
				ENT_CERT_TYPE     :   $('#ENT_CERT_TYPE').val(), 
				ENT_CERT_NUM      :   $('#ENT_CERT_NUM').val()
				}
	  }); 
	  return false;
  });

  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
    var data = obj.data;
    $("body").data("dataObj",data);
    console.log(data);
    layer.open({
		type: 2,
		title: '历史记录',
		shadeClose: false,
		shade: [0.3, '#000'],
		area: ['100%', '100%'],
		anim: 2,
		resize: false,
		content: 'entFinStaSeo/listHistPage.do?ent_cert_type=' + data.ent_cert_type+'&ent_cert_num='+data.ent_cert_num,
		end: function(){
			table.reload('enBasInfTab', {
				method : 'post',
				where: {
						orgCode   :   $('#orgCode').val(), 
						name      :   $('#name').val(), 
						acctType    :   $('#acctType').val(),
						businessStates:$('#businessStates').val()
					}
			}); 
		}
	});
  });
  
});

</script>
</body>
</html>
