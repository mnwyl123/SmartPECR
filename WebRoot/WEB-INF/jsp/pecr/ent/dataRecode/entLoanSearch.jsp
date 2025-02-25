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
	                <label class="layui-form-label">账户标识码</label>
	                <div class="layui-input-inline">
						<input type="text" name="acctCode" id="acctCode" autocomplete="off" class="layui-input" style="width: 188px;"/>
	                </div>
	            </div>
	            <div class="layui-inline">
	                <label class="layui-form-label">待更正段段标:</label>
	                <div class="layui-input-inline">
	                   <select lay-filter="mdfcSgmtCode" id="mdfcSgmtCode" lay-verify="required">
	                        <option value=""></option>
	                    </select>
	                </div>
	            </div>
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	 <table class="layui-hide" id="entLoanAcctTab" lay-filter="entLoanAcctTab"></table>
</div> 

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
	<a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="checked">选中</a>
</script>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">

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
	var form = layui.form,
	element = layui.element,
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
			var array = ['ENT_LOAN_INF_REC_TYPE'];
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
						if (data.result[i].ENT_LOAN_INF_REC_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_INF_REC_TYPE},
								containerId : "mdfcSgmtCode"
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

		//展示已知数据
		table.render({
			elem: '#entLoanAcctTab', //表格所固定的div
			//toolbar: '#toolbarHead',  //表格顶部工具栏
			url:'entUpDaccountData/getHistEntAcctLists.do',
			where:{mdfcSgmtCode : $("#mdfcSgmtCode").val()},
	    	cols: [[
				{type:'numbers'},	//列每行序号
				{type:'checkbox'},  //列复选框
				{field: 'EDA_ACCT_BS_SGMT_ID ', title: '主键', hide: true},
				{field: 'INF_REC_TYPE', align:'center', title: '信息记录类型',templet:function(d){return renderColumnDict(d,'INF_REC_TYPE',enterDict.infRecType)}},
				{field: 'ACCT_TYPE', align:'center', title: '账户类型',templet:function(d){return renderColumnDict(d,'ACCT_TYPE',enterDict.enLoanAcctType)}},
				{field: 'RPT_DATE', align:'center', title: '信息报告日期'},
				{field: 'NAME', align:'center', title: '企业名称'},
				{field: 'ID_NUM', align:'center', title: '企业身份标识号码'},
				{field: 'LAST_UPDATE_TIME', align:'center', title: '最后一次修改日期'},
				{align : "center",field: 'BUSINESS_STATES', title: '状态',templet: function(d){return renderColumnDict(d, 'BUSINESS_STATES',enterDict.dataStatusBlxs)}},
				{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
			]],
			even: true,  //行斑马线
			page: true, //是否分页
			limit: 10, //初始每页显示条数
			height: $(document).height() - $('#entLoanAcctTab').offset().top - $('#queryPanel').height() - 25,
			limits: [10, 20, 50],
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
			type: 'month',
			format:'yyyy-MM',
			trigger:'click'
		  });
		});
	  
		//查询按钮点击事件
		$("#queryBtn").on('click', function(){
			var mdfcSgmtCode = $("#mdfcSgmtCode").val();
			var acctCode = $("#acctCode").val();
			if(mdfcSgmtCode == ""){
				layer.alert("请选择更正段段标！");
				return false;
			}
			if(acctCode == ""){
				layer.alert("请输入待更正的账户标识码！");
				return false;
			}
			table.reload('entLoanAcctTab', {
				method : 'post',
				where: {
						acctCode : $("#acctCode").val(),
						mdfcSgmtCode : $("#mdfcSgmtCode").val(),
					}
			}); 
			return false;
		});
		
	  
		//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
		table.on('tool(entLoanAcctTab)', function(obj){
			var data = obj.data;
			var layEvent = obj.event;
			if (layEvent === 'checked'){
				$("body").data("dataObj",data);
				$.ajax({
					type : "POST",
					url : 'entUpDaccountData/selectEntLoanChangeEdit.do',
					data : {id:data.EDA_ACCT_BS_SGMT_ID,mdfcSgmtCode:data.MDFC_SGMT_CODE},
					success : function(result) {
						if(result.code == 0){
							layer.msg('插入成功', {time:3000});
						}
						var index = parent.layer.getFrameIndex(window.name);//先得到当前iframe层的索引
						parent.layer.close(index); //再执行关闭
					},
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('插入出错,错误信息如下:<br>'+e.responseText);
					}
				});
	        }
		});
	});
});



</script>
</body>
</html>
