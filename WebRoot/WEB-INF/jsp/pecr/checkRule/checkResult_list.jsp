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
			<form class="layui-form" action="" id="queryPanel">
				<div class="layui-form-item" style="margin:1px">
					<div class="layui-inline">
						<label class="layui-form-label" style='padding:15px 5px 5px 5px; text-align:right; font:normal bold 12px Microsoft Yahei;'>校验任务名称:</label>
						<div class="layui-input-inline" style='padding:10px 5px 5px 5px;'>
							<input type="text" name="CHECK_TASK_NAME" id="CHECK_TASK_NAME" placeholder="请输入校验任务名称" 
								   autocomplete="off" class="layui-input"/>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label" style='padding:15px 5px 5px 5px; text-align:right; font:normal bold 12px Microsoft Yahei;'>校验结果:</label>
						  <div class="layui-input-inline" style='padding:10px 5px;'>
							<select lay-search="" id="EXECUTE_RESULT" name="EXECUTE_RESULT">
							  <option value="">请选择</option>										 
							</select>
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
			</form>
			<table class="layui-hide" id="checkResult" lay-data="{id: 'checkResult'}" lay-filter="checkResultRow"></table>
		</div>
	</div>	
</div>

<!-- 新增或修改界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="addOrModify_win">
	<div style="text-align:center">
	<form class="layui-form" lay-filter="checkRuleForm" id="checkRuleForm">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">规则编码</label>
				<div class="layui-input-inline">
				  <input type="text" name="ERRNO" lay-verify="required " autocomplete="off" placeholder="请输入规则编码" 
						 class="layui-input" id="ruleIdInput"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">业务类型</label>
				<div class="layui-input-inline">
					<select name="BUSINESSTYPE" lay-verify="required" lay-search="">
					  <option value="">直接选择或搜索选择</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">校验表名</label>
				<div class="layui-input-inline">
					<input type="text" name="CHECKTANLENAME" autocomplete="off" placeholder="请输入表名" class="layui-input" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">校验字段</label>
				<div class="layui-input-inline">
					<input type="text" name="CHECKCOLNAME" autocomplete="off" placeholder="请输入字段" class="layui-input" />
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">校验表中文名</label>
				<div class="layui-input-inline">
					<input type="text" name="CHTABLENAME" autocomplete="off" placeholder="请输入表中文名" class="layui-input" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">校验对应字段</label>
				<div class="layui-input-inline">
					<input type="text" name="INTERNALKEY" autocomplete="off" placeholder="请输入校验对应字段名" class="layui-input" />
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">校验方式</label>
				<div class="layui-input-inline">
					<select name="VALIDTYPE">
						<option value="">请选择校验方式</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">是否启用</label>
				<div class="layui-input-inline">
					<select name="ISINUSE">
						<option value="">请选择</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">校验方法</label>
			<div class="layui-input-block">
				<textarea name="VALIDEXPRESSION" placeholder="请输入内容" class="layui-textarea" style="width:90%"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">规则描述</label>
			<div class="layui-input-block">
				<textarea name="ERRDESCRIBE" placeholder="请输入描述信息" class="layui-textarea" style="width:90%"></textarea>
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
	<div class="layui-btn-container">
		<button type="button" class="layui-btn layui-btn-xs" lay-event="removeHist">移入历史
			<i class="layui-icon layui-icon-addition"></i>
		</button>
	</div>
</script>

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barOper">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情</a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">修改</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="del">删除</a>
</script>

<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
	//初始化下拉字典
	initDict('exeResult', staticDict.isUse);
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
			elem: '#checkResult',          //表格所固定的div
			toolbar: '#toolbarTal',     //表格顶部工具栏
			url:'checkResult/resultDataList.do', //url
			cellMinWidth: 80,
			cols: [[ 
				{type:'numbers'},	//列每行序号
				{type:'checkbox'}, //列复选框
				{field: 'CHECK_TASK_NAME', title: '校验任务名称', align:'center', sort: true},
				{field: 'BELONG_SUBJECT', width:100, title: '所属主题', align:'center',templet:function(d){return renderColumnDict(d, 'belong_subject', staticDict.checkRuleType)}},
				{field: 'EXECUTE_RESULT', width:100, title: '执行结果', align:'center'},
				{field: 'START_TIME', title: '开始时间', align:'center'},
				{field: 'SPEND_TIME', width:80, title: '耗时', align:'center'},
				{field: 'RESULT_STATISTIC', title: '执行结果统计', align:'center'}
				/*
				{fixed: 'right', title:'操作', toolbar: '#barOper', align:'center', width:200} //行上的工具栏
				*/
			]],
			even: true,  //行斑马线
			page: true, //是否分页
			limit: 10, //初始每页显示条数
			height: $(document).height() - $('#checkResult').offset().top - $('#queryPanel').height() - 30,
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
			table.reload('checkResult', {
				method : 'post',
				where  :{
					'CHECK_TASK_NAME':$('#CHECK_TASK_NAME').val(),
					'EXECUTE_RESULT' :$('#EXECUTE_RESULT').val()
					}
				}
			); 
		});

		table.on('toolbar(checkResultRow)', function(obj){
			if(obj.event === 'removeHist'){
				//获得表格CheckBox已经选中的行的信息
				var checkStatus = table.checkStatus('checkResult'),
				//返回行的value
				data = checkStatus.data;
				if(data.length==0){
					layer.msg("请选择需要移入历史的数据行");
					return ;
				}
				var str = "";
				for(var i = 0; i < data.length; i++){
					str += checkStatus.data[i].ERRNO + ",";
				}
				str = str.substr(0, str.length - 1);
				layer.confirm('确定将选中的数据移入历史吗？', {icon: 3, title: '提示信息'}, function (index){
					$.ajax({
						type : "POST",  //请求方式
						url : "checkResult/deleteALL.do", //请求地址
						data : {str:str},           //数据，json字符串
						success : function(result) { //请求成功
							layer.msg('删除成功', {time:3000});
							table.reload('checkResult', {
								 where:{ERRNO:$('#ERRNO').val()}
							});
						},
						error : function(e){ //请求失败，包含具体的错误信息
							layer.alert('删除出错,错误信息如下:<br>' + e.responseText);
						}
					});
					layer.close(index);
				});
			}
		});
  
		table.on('tool(checkResultRow)', function(obj){
			var readForm = layui.$('[lay-filter="checkRuleForm"]')
			var data = obj.data;
			if(obj.event === 'del'){
				layer.confirm('确定要删除该条数据吗？', function(index){
					$.ajax({
						type : "POST",  //请求方式
						url : "checkResult/deleteALL.do", //请求地址
						data : {str : data.ERRNO}, //数据，json字符串
						success : function(result) { //请求成功
							layer.msg('删除成功', {time:3000});
							table.reload('checkResult', {
								 where:{ERRNO:$('#ERRNO').val()}
							});
							layer.close(popIndex);
						},
						error : function(e){ //请求失败，包含具体的错误信息
							layer.alert('删除出错,错误信息如下:<br>' + e.responseText);
						}
					});
					layer.close(index);
				});
			} else if (obj.event === 'edit'){
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
				url  : "checkResult/addOrUpdate.do?addOrUpdate=" + addOrUpdate,
				data : data.field,   //数据，json字符串
				success : function(result) {
					if(result.success == true){
						layer.msg('操作成功', {time:3000});
						table.reload('checkResult', {
							where:{
								'ERRNO':$('#ERRNO').val()
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
		
		//规则-业务类型 
		form.val('checkRuleForm', {
			BUSINESSTYPE : "${BUSINESSTYPE}",
			VALIDTYPE : '${VALIDTYPE}', 
			ISINUSE : '${ISINUSE}', 
		});
		
		form.render('select');
	});
</script>
</body>
</html>
