<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="layui-row layui-col-space15" style="margin:1px;">
	<div class="layui-col-md12">
		<div class="layui-card">
		<div class="layui-collapse">
			<form class="layui-form" action="" id="queryPanel">
				<!--<div class="layui-colla-content layui-show">-->
					<div class="layui-form-item" style="margin:1px">
						<div class="layui-inline">
							<label class="layui-form-label" style='padding:15px 5px 5px 5px; text-align:right; font:normal bold 12px Microsoft Yahei;'>规则编码</label>
							<div class="layui-input-inline" style='padding:10px 5px 5px 5px;'>
								<input type="text" name="FB_CODE" id="FB_CODE" placeholder="请输入反馈代码" 
									   autocomplete="off" class="layui-input"/>
							</div>
						</div>
						<div class="layui-inline">
							<div class="layui-input-inline">
								<button type='button' class="layui-btn layui-btn-sm" id="queryBtn"
										data-type="reload" style="margin-left: 15px">
									<i class="layui-icon layui-icon-search"></i>查询
								</button>
							</div>
						</div>
					</div>
				<!--</div>-->
			</form>
			<table class="layui-hide" id="checkRule" lay-data="{id: 'checkRule'}" lay-filter="checkRuleRow"></table>
		</div>
		</div>
	</div>	
</div> 

<!-- 新增或修改界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="addOrModify_win">
	<div style="text-align:center">
	<form class="layui-form" lay-filter="checkRuleForm" id="checkRuleForm">
	       <input name="FEED_BACK_REPORT_CODE_ID" id="FEED_BACK_REPORT_CODE_ID" type="hidden"/>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">反馈代码：</label>
				<div class="layui-input-inline">
					<input type="text" name="FB_CODE" autocomplete="off" placeholder="请输入反馈代码" class="layui-input" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">反馈标签：</label>
				<div class="layui-input-inline">
					<input type="text" name="FB_TAG" autocomplete="off" placeholder="请输入反馈标签" class="layui-input" />
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">规则描述</label>
			<div class="layui-input-block">
				<textarea name="MESSAGE" placeholder="请输入描述信息" class="layui-textarea" style="width:90%"></textarea>
			</div>
		</div>
		<div class="layui-form-item" style="margin-top:20px;" id="confirmButton">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit lay-filter="exampleSubmit">确定</button>
			</div>
		</div>
	</form>
	</div>
</div>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarTal">
	
		<button type="button" class="layui-btn layui-btn-xs" lay-event="addBtn">新增 
			<i class="layui-icon layui-icon-addition"></i>
		</button>
		
	
</script>

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barOper">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情</a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">修改</a>
</script>

<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">

	//弹出层id
	var popIndex;
	//新增还是更新，由于调用后台同一个方法，使用该参数判断
	var addOrUpdate;
	
	layui.use(['form', 'laydate', 'element', 'table'], function(){
		var form = layui.form,
		    element = layui.element,
		    table = layui.table,
		    laydate = layui.laydate;
  
		// form.render('select');
  
		//展示已知数据
		table.render({
			elem: '#checkRule',          //表格所固定的div
			toolbar: '#toolbarTal',     //表格顶部工具栏
			url:'Rule/dataList.do', //url
			cols: [[ 
				{type:'numbers'},	//列每行序号
				{type:'checkbox'}, //列复选框
				{field: 'FEED_BACK_REPORT_CODE_ID',hide: true, title: '规则编码', align:'center', sort: true},
				{field: 'FB_CODE', title: '反馈代码', align:'center'},
				{field: 'FB_TAG', title: '反馈标签', align:'center'},
				{field: 'MESSAGE', title: '描述信息', align:'center'},
				{fixed: 'right', title:'操作', toolbar: '#barOper', align:'center', width:200} //行上的工具栏
			]],
			even: true,  //行斑马线
			page: true, //是否分页
			limit: 10, //初始每页显示条数
			height: $(document).height() - $('#checkRule').offset().top - $('#queryPanel').height() - 25,
			limits: [10, 20, 50],
			//回调函数
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
  
		//日期 或者按单个日期组件渲染
		/*laydate.render({
		elem: '#date'
		});*/
  
		//查询按钮点击事件
		$("#queryBtn").on('click', function(){
			table.reload('checkRule', {
				method : 'post',
				where  :{
					'FB_CODE':$('#FB_CODE').val()
					}
				}
			); 
		});
		
		//表格顶部的工具栏按钮也可以采用下面方式  官方推荐 checkRuleToolBar为table中lay-filter设定的值
		table.on('toolbar(checkRuleRow)', function(obj){
			if(obj.event === 'addBtn') {
				addOrUpdate = "add";
				//移除主键只读和置灰
				$("#ruleIdInput").removeAttr('readonly');
				$("#ruleIdInput").removeClass('readonly-backgroud');
				//新增时对弹出框中的form数据清空
				form.val('checkRuleForm', {FEED_BACK_REPORT_CODE_ID        : '', 
											FB_CODE : '', 
											FB_TAG : '', 
											MESSAGE : ''}
						);
				popIndex = layer.open({
					type  : 1,
					title : '新增规则信息',
					content :$('#addOrModify_win'),
					area: ['70%', '90%']			
				});
				document.getElementById("confirmButton").style.display = "block";
			}
		});
  
		/*表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，
		而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
		*/
		table.on('tool(checkRuleRow)', function(obj){
			var readForm = layui.$('[lay-filter="checkRuleForm"]')
			var data = obj.data;
			 if (obj.event === 'edit'){
				addOrUpdate = "update";
				popIndex = layer.open({
					type : 1,
					title :'修改规则信息',
					content : $('#addOrModify_win'),
					area: ['70%', '90%']			
				});
				readForm.find('input,textarea,select').prop('disabled',false);
				//将该行数据在form中回显
				form.val('checkRuleForm', data);
				$("#ruleIdInput").attr('readonly', true);
				$("#ruleIdInput").addClass('readonly-backgroud');
				document.getElementById("confirmButton").style.display = "block";
				//下面批量设置只读的操作可以在数据详情界面补录和查看时批量增加或删除readOnly属性，而不用在每个input组件上单个判断
				//$("input").attr('readonly', true);
				//$("textarea").attr('readonly', true);
			} else if(obj.event === 'more'){
				layer.open({
					type: 1,
					title: '校验规则详情',
					area: ['70%', '90%'],
					content: $('#addOrModify_win')
				});
				readForm.find('input,textarea,select').prop('disabled',true);
				form.val('checkRuleForm', data);
				document.getElementById("confirmButton").style.display = "none";
			}
		});
  
		//新增或更新的实际数据库操作
		form.on('submit(exampleSubmit)', function(data){
			$.ajax({
				type : "POST",  //请求方式
				url  : "Rule/addOrUpdate.do?addOrUpdate=" + addOrUpdate,
				data : data.field,   //数据，json字符串
				success : function(result) {
					if(result.success == true){
						layer.msg('操作成功', {time:3000});
						table.reload('checkRule', {
							where:{
								'FEED_BACK_REPORT_CODE_ID':$('#FEED_BACK_REPORT_CODE_ID').val()
							}
						});
						layer.close(popIndex);
					}else{
						layer.alert(result.msg);
					}
				},
				//请求失败，包含具体的错误信息
				error : function(e){
					layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
				}
			});
			return false;//防止页面跳转
		});
	
		
	});
</script>
</body>
</html>
