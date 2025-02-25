var addOrUpdate;
/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laytpl'], function(){
    var element = layui.element, //获取element模块
    form = layui.form, //获取form模块
    layer = layui.layer, //获取layer模块
    laydate = layui.laydate, //获取laydate模块
    table = layui.table //获取table模块
    laytpl = layui.laytpl;
    require(['static/js/pecr/module/base'],function(base){
		/**
	     * 初始化常量枚举值
	     */
	    var initEnumerationValue = function () {
			var array = ['ENT_GUAR_ACCT_TYPE','DATA_STATUS_BLXS'];
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
						if (data.result[i].ENT_GUAR_ACCT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_ACCT_TYPE},
								containerId : "acctType"
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
//	                d1.resolve("渲染完成");
				}	     
		    });
	    };
	    //初始化常量枚举值
	    initEnumerationValue();
		 });
	/**
	 * element组件渲染
	 * form组件渲染
	 */
	element.init();//每个页面都有
	form.render();//每个页面都有
    	
	//初始化列表
	table.render({
		elem: '#enSecAcctInfTab', //表格所固定的div
		toolbar: '#toolbarHead',  //表格顶部工具栏
		url:'enSecAcctInf/enSecAcctInfList.do',
    	cols: [[
			{type:'numbers'},	//列每行序号
			{type:'checkbox'},  //列复选框
			{field: 'eeaGuarAcctBsSgmtId', title: '主键', hide: true},
			{field: 'mngmtOrgCode', align:'center', title: '所属机构', hide: true},
			{field: 'name', align:'center', title: '姓名'},
            {field: 'idType', align:'center', title: '身份标识类型',templet: function(d){return renderColumnDict(d,'idType',enterDict.entCertMainType)}},
			{field: 'idNum', align:'center', title: '身份标识号码'},
			{field: 'acctType', align:'center', title: '账户类型', templet: function(d){return renderColumnDict(d,'acctType',enterDict.entGuarAcctType)}},
			{field: 'acctCode', align:'center', title: '账户标识码'},
			{field: 'businessStates', align:'center', title: '数据状态',templet: function(d){return renderColumnDict(d, 'businessStates', enterDict.dataStatusBlxs)}},
			{field: 'rptDate', align:'center', title: '信息报告日期'},
			{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
		]],
		even: true,  //行斑马线
		page: true, //是否分页
		limit: 10, //初始每页显示条数
		height: $(document).height() - $('#enSecAcctInfTab').offset().top - $('#queryPanel').height() - 25,
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
		table.reload('enSecAcctInfTab', {
			method : 'post',
			where: {
				rptDate   :   $('#rptDate').val(), 
				acctType      :   $('#acctType').val(), 
				acctCode      :   $('#acctCode').val(), 
				businessStates:$('#businessStates').val()
				}
		}); 
		return false;
	});
	
	
	/**
	 * 点击新增按钮
	 */
	table.on('toolbar(enSecAcctInfTab)', function(obj){
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
				content: 'enSecAcctInf/enSecAcctInfEdit.do?addOrUpdate=' + addOrUpdate
            });
		}else if(obj.event === 'submitBtn'){
			 //获取选中的行信息
			 var checkStatus = table.checkStatus('enSecAcctInfTab');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var infRecType ="440";
			 var rptDate = $('#rptDate').val();
			 if(data.length==0 && rptDate.length==0){
					layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期");
					return ;
				}
			 	var str = "";
				for(var i = 0; i < data.length; i++){
					str+=checkStatus.data[i].eeaGuarAcctBsSgmtId+","
				}
				str = str.substr(0, str.length - 1);
				layer.confirm('确定要强制提交选中的数据吗？', {icon: 3, title: '提示信息'}, function (index){
					$.ajax({
						type : "GET",  //请求方式
						url : "changeDataState/changeDataStateByConditon.do?infRecType="+infRecType+"&rptDate="+rptDate+"&type="+'submit', //请求地址
						data : {str:str},           //数据，json字符串
						success : function(result) { //请求成功
							if(result.success){
								layer.msg('强制提交成功', {time:3000});
							}else{
								layer.msg('强制提交失败', {time:3000});
							}
							table.reload('enSecAcctInfTab', {
								where:{
									orgCode   :   $('#orgCode').val(), 
									name      :   $('#name').val(), 
									acctType  :   $('#acctType').val(),
									businessStates:$('#businessStates').val()
									}
							});
						},
						error : function(e){ //请求失败，包含具体的错误信息
							layer.alert('强制提交出错,错误信息如下:<br>' + e.responseText);
						}
					});
				});
		}
	});
	
	 /**
	 * 工具栏操作
	 */
	table.on('tool(enSecAcctInfTab)', function(obj){
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
				content: 'enSecAcctInf/enSecAcctInfEdit.do?addOrUpdate=' + addOrUpdate
				         + '&eeaGuarAcctBsSgmtId=' + data.eeaGuarAcctBsSgmtId,
				end: function(){
					table.reload('enSecAcctInfTab', {
						method : 'post',
						where: {
							rptDate   :   $('#rptDate').val(), 
							acctType      :   $('#acctType').val(), 
							acctCode      :   $('#acctCode').val(), 
							businessStates:$('#businessStates').val()
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
				content: 'enSecAcctInf/enSecAcctInfEdit.do?addOrUpdate=' + addOrUpdate
				         + '&eeaGuarAcctBsSgmtId=' + data.eeaGuarAcctBsSgmtId,
				end: function(){
					table.reload('enSecAcctInfTab', {
						method : 'post',
						where: {
							rptDate   :   $('#rptDate').val(), 
							acctType      :   $('#acctType').val(), 
							acctCode      :   $('#acctCode').val(), 
							businessStates:$('#businessStates').val()
							}
					});
				}
			});
		}else if (layEvent === 'deleteInfo'){
			layer.confirm('确认要删除该条信息？', function(index){
				$.ajax({
					type : "POST",
					url : "enSecAcctInf/delEnSecAcctInf.do",
					data : data,
					success : function(result) {
						layer.msg('删除成功', {time:3000});
						table.reload('enSecAcctInfTab', {
							method : 'post',
							where: {
								rptDate   :   $('#rptDate').val(), 
								acctType      :   $('#acctType').val(), 
								acctCode      :   $('#acctCode').val(), 
								businessStates:$('#businessStates').val()
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
