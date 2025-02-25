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
		var array = ['DATA_STATUS_BLXS','PER_LOAN_ACCT_TYPE'];
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
					if (data.result[i].DATA_STATUS_BLXS){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].DATA_STATUS_BLXS},
							containerId : "businessStates"
						});
						continue;
					}else if (data.result[i].PER_LOAN_ACCT_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].PER_LOAN_ACCT_TYPE},
							containerId : "acctType"
						});
						continue;
					}
				}
                form.render('select');
  //              d1.resolve("渲染完成");
			}	     
	    });
    };
    //初始化常量枚举值
    initEnumerationValue();
	 });
  
	//展示已知数据
	table.render({
		elem: '#indvLoanAcctTab', //表格所固定的div
		toolbar: '#toolbarHead',  //表格顶部工具栏
		url:'indvLoanAcctInfo/acctInfoList.do',
    	cols: [[
			{type:'numbers'},	//列每行序号
			{type:'checkbox'},  //列复选框
			{field: 'pbaAcctBsSgmtId', title: '主键', hide: true},
//			{field: 'mngmtOrgCode', align:'center', title: '所属机构'},
			{field: 'name', align:'center', title: '姓名'},
            {field: 'idType', align:'center', title: '身份标识类别', templet:function(d){return renderColumnDict(d,'idType',staticDict.idType)}},
			{field: 'idNum', align:'center', title: '身份标识号码'},
			{field: 'acctType', align:'center', title: '账户类型', templet:function(d){return renderColumnDict(d,'acctType',staticDict.acctType)}},
			{field: 'acctCode', align:'center', title: '账户标识码'},
			{field: 'businessStates', align:'center', title: '数据状态', templet:function(d){return renderColumnDict(d,'businessStates',staticDict.businessStates)}},
			{field: 'rptDate', align:'center', title: '信息报告日期'},
			{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
		]],
		even: true,  //行斑马线
		page: true, //是否分页
		limit: 10, //初始每页显示条数
		height: $(document).height() - $('#indvLoanAcctTab').offset().top - $('#queryPanel').height() - 25,
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
  
	//日期 或者按单个日期组件渲染
	/*laydate.render({
	elem: '#date'
	});*/
  
	//查询按钮点击事件
	$("#queryBtn").on('click', function(){
		table.reload('indvLoanAcctTab', {
			method : 'post',
			where: {
				rptDate  : $('#rptDate').val(), 
				acctType : $('#acctType').val(), 
				acctCode : $('#acctCode').val(),
				businessStates:$('#businessStates').val(),
				id_num      :   $('#id_num').val(), 
				}
		}); 
		return false;
	});
  
	table.on('toolbar(indvLoanAcctTab)', function(obj){
		if(obj.event === 'addBtn') {
			$("body").data("dataObj",null);//绑定数据，透传到子页面进行判断，新增或者修改
			addOrUpdate = 'add';
            layer.open({
                type: 2,
                title: '新增个人借贷账户信息',
                shadeClose: false,
                shade: [0.3, '#000'],
                area: ['100%', '100%'],
                anim: 2,
                resize: false,
				content: 'indvLoanAcctInfo/loanAcctInfoEdit.do?addOrUpdate=' + addOrUpdate
            });
		}else if(obj.event === 'submitBtn') {
			//获取选中的行信息
			 var checkStatus = table.checkStatus('indvLoanAcctTab');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var infRecType ="210";
			 var rptDate = $('#rptDate').val();
			 if(data.length==0 && rptDate.length==0){
				layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期");
				return ;
			}
		 	var str = "";
			for(var i = 0; i < data.length; i++){
				str+=checkStatus.data[i].pbaAcctBsSgmtId+","
			}
			str = str.substr(0, str.length - 1);
			layer.confirm('确定要强制提交选中的数据吗？', {icon: 3, title: '提示信息'}, function (index){
				$.ajax({
					type : "GET",  //请求方式
					url : 'changeDataState/changeDataStateByConditon.do?infRecType='+infRecType+'&rptDate='+rptDate+'&type=submit', //请求地址
					data : {str:str},           //数据，json字符串
					success : function(result) { //请求成功
						if(result.success){
							layer.msg('强制提交成功', {time:3000});
						}else{
							layer.msg('强制提交失败', {time:3000});
						}
						table.reload('indvLoanAcctTab', {
							where:{
								rptDate  : $('#rptDate').val(), 
								acctType : $('#acctType').val(), 
								acctCode : $('#acctCode').val(),
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
  
	//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
	table.on('tool(indvLoanAcctTab)', function(obj){
		var data = obj.data;
		var layEvent = obj.event;
		if(layEvent === 'deleteInfo'){
			layer.confirm('确认要删除该条信息？', function(index){
				$.ajax({
					type : "POST",
					url : "indvLoanAcctInfo/delLoanAcctInfo.do",
					data : data,
					success : function(result) {
						layer.msg('删除成功', {time:3000});
						table.reload('indvLoanAcctTab', {
								where:{
									rptDate  : $('#rptDate').val(), 
									acctType : $('#acctType').val(), 
									acctCode : $('#acctCode').val(),
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
		} else if (layEvent === 'editInfo'){
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
				content: 'indvLoanAcctInfo/loanAcctInfoEdit.do?addOrUpdate=' + addOrUpdate 
				         + "&pbaAcctBsSgmtId=" + data.pbaAcctBsSgmtId,
				end: function(){
					table.reload('indvLoanAcctTab', {
						method : 'post',
						where: {
							rptDate  : $('#rptDate').val(), 
							acctType : $('#acctType').val(), 
							acctCode : $('#acctCode').val(),
							businessStates:$('#businessStates').val()
							}
					}); 
					
				}
			});
        }else if (layEvent === 'detailsInfo'){
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
				content: 'indvLoanAcctInfo/loanAcctInfoEdit.do?addOrUpdate=' + addOrUpdate+ "&pbaAcctBsSgmtId=" + data.pbaAcctBsSgmtId,
				end: function(){
					table.reload('indvLoanAcctTab', {
						method : 'post',
						where: {
							rptDate  : $('#rptDate').val(), 
							acctType : $('#acctType').val(), 
							acctCode : $('#acctCode').val(),
							businessStates:$('#businessStates').val()
							}
					}); 
				}
			});
		}
	
	});
});
