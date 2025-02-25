var addOrUpdate;
/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table'], function(){
    var element = layui.element, //获取element模块
    form = layui.form, //获取form模块
    layer = layui.layer, //获取layer模块
    laydate = layui.laydate, //获取laydate模块
    table = layui.table; //获取table模块
	
	/**
	 * element组件渲染
	 * form组件渲染
	 */
	element.init();//每个页面都有
	form.render();//每个页面都有
    	
	//初始化列表
	table.render({
		elem: '#indvGuarAcctTab', //表格所固定的div
		toolbar: '#toolbarHead',  //表格顶部工具栏
		url:'institutionBalanceSheetDlt/List.do',
    	cols: [[
			{type:'numbers'},	//列每行序号
			{type:'checkbox'},  //列复选框
			{field: 'elaIncomeAndExpenseStatId', title: '主键', hide: true},
			{field: 'orgCode', align:'center', title: '所属机构'},
			{field: 'entName', align:'center', title: '企业名称'},
            {field: 'entCertType', align:'center', title: '企业身份标识类型', templet:function(d){return renderColDict(d,'ID_TYPE','idType')}},
			{field: 'entCertNum', align:'center', title: '企业身份标识号码'},
			{field: 'sheetYear', align:'center', title: '报表年份'},
			{field: 'businessStates', align:'center', title: '数据状态'},
			{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
		]],
		even: true,  //行斑马线
		page: true, //是否分页
		limit: 10, //初始每页显示条数
		height: $(document).height() - $('#indvGuarAcctTab').offset().top - $('#queryPanel').height() - 25,
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
		trigger:'click'
	  });
	});
	
	  
	//查询按钮点击事件
	$("#queryBtn").on('click', function(){
		table.reload('indvGuarAcctTab', {
			method : 'post',
			where: {
					orgCode  : $('#orgCode').val(), 
					name     : $('#name').val(), 
					acctType : $('#acctType').val(),
			  businessStates : $('#businessStates').val(),
			        isFilter : $('#isFilter').val()
				}
		}); 
		return false;
	});
	
	
	/**
	 * 点击新增按钮
	 */
	table.on('toolbar(indvGuarAcctTab)', function(obj){
		if(obj.event === 'addBtn') {
			$("body").data("dataObj",null);//绑定数据，透传到子页面进行判断，新增或者修改
			addOrUpdate = 'add';
            layer.open({
                type: 2,
                title: '新增',
                shadeClose: false,
                shade: [0.3, '#000'],
                area: ['100%', '100%'],
                anim: 2,
                resize: false,
				content: 'institutionBalanceSheetDlt/guarAcctInfoEdit.do?addOrUpdate=' + addOrUpdate
            });
		}
	});
	
	 /**
	 * 工具栏操作
	 */
	table.on('tool(indvGuarAcctTab)', function(obj){
		var data = obj.data;
		var layEvent = obj.event;
		if (layEvent === 'editInfo'){
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
				content: 'institutionBalanceSheetDlt/guarAcctInfoEdit.do?addOrUpdate=' + addOrUpdate
				         + '&ekaInstitutionBalanceShtId=' + data.ekaInstitutionBalanceShtId,
				end: function(){
					table.reload('indvGuarAcctTab', {
						method : 'post',
						where: {
								orgCode  : $('#orgCode').val(), 
								name     : $('#name').val(), 
								acctType : $('#acctType').val(),
						  businessStates : $('#businessStates').val(),
								isFilter : $('#isFilter').val()
							}
					});
				}
			});
		}else if (layEvent === 'detail'){
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
				content: 'institutionBalanceSheetDlt/guarAcctInfoEdit.do?addOrUpdate=' + addOrUpdate
				         + '&ekaInstitutionBalanceShtId=' + data.ekaInstitutionBalanceShtId,
				end: function(){
					table.reload('indvGuarAcctTab', {
						method : 'post',
						where: {
								orgCode  : $('#orgCode').val(), 
								name     : $('#name').val(), 
								acctType : $('#acctType').val(),
						  businessStates : $('#businessStates').val(),
								isFilter : $('#isFilter').val()
							}
					});
				}
			});
		}else if (layEvent === 'deleteInfo'){
			layer.confirm('确认要删除该条信息？', function(index){
				$.ajax({
					type : "POST",
					url : "institutionBalanceSheetDlt/deleteOneRecord.do",
					data : data,
					success : function(result) {
						layer.msg('删除成功', {time:3000});
						table.reload('indvGuarAcctTab', {
							method : 'post',
							where: {
									orgCode  : $('#orgCode').val(), 
									name     : $('#name').val(), 
									acctType : $('#acctType').val(),
							  businessStates : $('#businessStates').val(),
									isFilter : $('#isFilter').val()
								}
						});
						layer.close(index);
					},
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('删除出错,错误信息如下:<br>'+e.responseText);
					}
				});
				layer.close(index);
			});
		}
	});
});