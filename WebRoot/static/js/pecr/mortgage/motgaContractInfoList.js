initDict('certType', staticDict.certType);
initDict('businessStates', staticDict.businessStates);
initDict('infoIdType', staticDict.infoIdType);

var addOrUpdate;
/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laytpl','laypage'], function(){
    var element = layui.element //获取element模块
    form = layui.form, //获取form模块
    layer = layui.layer, //获取layer模块
    laydate = layui.laydate, //获取laydate模块
    table = layui.table, //获取table模块
	laypage = layui.laypage,
    laytpl = layui.laytpl;
    require(['static/js/pecr/module/base'],function(base){
    	/**
    	* 查询所属机构
    	*/
    	var queryOrg = function () {
    		var para = [{orgCode:'10001'},{orgCode:'10002'}];
    		$.ajax({
    			url:'dataDictCode/selectOrgList.do', 
    			data:JSON.stringify(para),
    			contentType : "application/json;charsetset=UTF-8",
    			type:'post',  
    			cache:false,  
    			dataType:'json',  
    			success:function(data){ 
    				if (data.result.length){
    					base.renderTpl({
    						tplId : "orgTpl",
    						  arr : {"list" : data.result},
    						containerId : "orgCode"
    					});
    					form.render('select');
    				}
    			 },  	     
    		});
    	};
    	
    	/**
    	 * 查询数据状态
    	 */
    	var queryOrg = function () {
    		var para = [{systemStateType : 'DATA_STATUS'}];
    		$.ajax({
    			url:'dataDictCode/getSystemStateList.do',
    			data:JSON.stringify(para),
    			contentType : "application/json;charsetset=UTF-8",
    			type:'post',  
    			cache:false,  
    			dataType:'json',  
    			success:function(data){ 
    				if (data.result.length){
    					base.renderTpl({
    						tplId : "businessStatesTpl",
    						  arr : {"list" : data.result},
    						containerId : "businessStates"
    					});
    					form.render('select');
    				}
    			 },  	     
    		});
    	};
    	
    	/**
    	 * 初始化常量枚举值
    	 */
    	var initEnumerationValue = function () {
    		var array = ['CERT_TYPE','DATA_STATUS_BLXS'];
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
    				for(var i=0; i<data.result.length; i++){
    					if (data.result[i].CERT_TYPE){
    						base.renderTpl({
    							tplId : "enumerationValueTpl",
    							arr : {"list" : data.result[i].CERT_TYPE},
    							containerId : "infoIdType"
    						});
    					} else if (data.result[i].DATA_STATUS_BLXS){
    						base.renderTpl({
    							tplId : "enumerationValueTpl",
    							arr : {"list" : data.result[i].DATA_STATUS},
    							containerId : "businessStates"
    						});
    					} 
    				}
    				form.render('select');
    			}	     
    		});
    	};
    	 //初始化常量枚举值
        //initEnumerationValue();
    	/**
    	 * 监听身份类别切换
    	 */
    	form.on('select(infoIdType)', function(data){
    		$.ajax({
    			url:'dataDictCode/selectCodeListByUperId.do', 
    			data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
    			type:'post',  
    			cache:false,  
    			dataType:'json',  
    			success:function(data){
    				if (data.result.length){
    					base.renderTpl({
    						tplId : "enumerationValueTpl",
    						arr : {"list" : data.result},
    						containerId : "certType"
    					});
    				}
    				form.render('select');
    			}
    		});
    	});
    	  
    })
	
	/**
	 * element组件渲染
	 * form组件渲染
	 */
	element.init();//每个页面都有
	form.render();//每个页面都有
    	
	//初始化列表
	table.render({
		elem: '#motgaTab', //表格所固定的div
		toolbar: '#toolbarHead',  //表格顶部工具栏
		url:'motgaInfo/motgaContractInfoList.do',
    	cols: [[
			{type:'numbers'},	//列每行序号
			{type:'checkbox'},  //列复选框
			{field: 'efaMotgaCltalCtrctBsId', title: '主键', hide: true},
			{field: 'mngmtOrgCode', align:'center', title: '所属机构'},
			{field: 'name', align:'center', title: '债务人名称'},
            {field: 'infoIdType', align:'center', title: '债务人身份类别', templet:function(d){return renderColumnDict(d,'infoIdType',staticDict.infoIdType)}},
			{field: 'certType', align:'center', title: '债务人身份标识类型', templet:function(d){return renderColumnDictComsharHodIdType(d,'certType',staticDict.idType,staticDict.entCertMainType,'infoIdType')}},
			{field: 'certNum', align:'center', title: '债务人身份标识号码'},
			{field: 'businessStates', align:'center', title: '数据状态',templet:function(d){return renderColumnDict(d,'businessStates',staticDict.businessStates)}},
			{field: 'rptDate', align:'center', title: '信息报告日期'},
			{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
		]],
		even: true,  //行斑马线
		page: true, //是否分页
		limit: 10, //初始每页显示条数
		height: $(document).height() - $('#motgaTab').offset().top - $('#queryPanel').height() - 25,
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
		table.reload('motgaTab', {
			method : 'post',
			where: {
					//orgCode  : $('#orgCode').val(), 
				 infoIdType  : $('#infoIdType').val(),
				       name  : $('#name').val(),
				   certType  : $('#certType').val(),
				    certNum  : $('#certNum').val(),
			 businessStates  : $('#businessStates').val(),
			        rptDate  : $('#rptDate').val()
				}
		}); 
		return false;
	});
	
	
	/**
	 * 点击新增按钮
	 */
	table.on('toolbar(motgaTab)', function(obj){
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
				content: 'motgaInfo/motgaContractInfoEdit.do?addOrUpdate=' + addOrUpdate
            });
		}else if(obj.event === 'submitBtn') {
			//获取选中的行信息
			 var checkStatus = table.checkStatus('motgaTab');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var infRecType ="510";
			 var rptDate = $('#rptDate').val();
			 if(data.length==0 && rptDate.length==0){
				layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期");
				return ;
			}
		 	var str = "";
			for(var i = 0; i < data.length; i++){
				str+=checkStatus.data[i].efaMotgaCltalCtrctBsId+","
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
						table.reload('motgaTab', {
							method : 'post',
							where: {
								 infoIdType  : $('#infoIdType').val(),
								       name  : $('#name').val(),
								   certType  : $('#certType').val(),
								    certNum  : $('#certNum').val(),
							 businessStates  : $('#businessStates').val(),
							        rptDate  : $('#rptDate').val()
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
	table.on('tool(motgaTab)', function(obj){
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
				content: 'motgaInfo/motgaContractInfoEdit.do?addOrUpdate=' + addOrUpdate
				         + '&efaMotgaCltalCtrctBsId=' + data.efaMotgaCltalCtrctBsId,
				end: function(){
					table.reload('motgaTab', {
						method : 'post',
						where: {
								//orgCode  : $('#orgCode').val(), 
							 infoIdType  : $('#infoIdType').val(),
								   name  : $('#name').val(),
							   certType  : $('#certType').val(),
								certNum  : $('#certNum').val(),
						 businessStates  : $('#businessStates').val(),
								rptDate  : $('#rptDate').val()
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
				content: 'motgaInfo/motgaContractInfoEdit.do?addOrUpdate=' + addOrUpdate
				         + '&efaMotgaCltalCtrctBsId=' + data.efaMotgaCltalCtrctBsId,
				end: function(){
					table.reload('motgaTab', {
						method : 'post',
						where: {
								//orgCode  : $('#orgCode').val(), 
							 infoIdType  : $('#infoIdType').val(),
								   name  : $('#name').val(),
							   certType  : $('#certType').val(),
								certNum  : $('#certNum').val(),
						 businessStates  : $('#businessStates').val(),
								rptDate  : $('#rptDate').val()
							}
					});
				}
			});
		}else if (layEvent === 'deleteInfo'){
			layer.confirm('确认要删除该条信息？', function(index){
				$.ajax({
					type : "POST",
					url : "motgaInfo/delMotgaContractInfo.do",
					data : data,
					success : function(result) {
						layer.msg('删除成功', {time:3000});
						table.reload('motgaTab', {
							method : 'post',
							where: {
									//orgCode  : $('#orgCode').val(), 
								 infoIdType  : $('#infoIdType').val(),
									   name  : $('#name').val(),
								   certType  : $('#certType').val(),
									certNum  : $('#certNum').val(),
							 businessStates  : $('#businessStates').val(),
									rptDate  : $('#rptDate').val()
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
