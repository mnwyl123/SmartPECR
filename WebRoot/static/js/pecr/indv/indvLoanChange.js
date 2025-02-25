var locals = (window.location.href+'').split('/');
var basePath = locals[0]+'//'+locals[2]+'/'+locals[3]+'/';

/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage','laytpl','upload'], function(){
	var form = layui.form,
	element = layui.element,
	table = layui.table,
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate
	laytpl = layui.laytpl
	upload = layui.upload;
	require(['static/js/pecr/module/base'],function(base){
	/**
     * 初始化常量枚举值
     */
    var initEnumerationValue = function () {
		var array = ['DATA_STATUS_ZHCX','ID_TYPE','PER_LOAN_ACCT_TYPE','PER_LOAN_UPD_INF_REC_TYPE'];
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
					if (data.result[i].ID_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].ID_TYPE},
							containerId : "idType"
						});
						continue;
					}else if (data.result[i].DATA_STATUS_ZHCX){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].DATA_STATUS_ZHCX},
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
					}else if (data.result[i].PER_LOAN_UPD_INF_REC_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].PER_LOAN_UPD_INF_REC_TYPE},
							containerId : "mdfcSgmtCode"
						});
						continue;
					}
				}
                form.render('select');
                //d1.resolve("渲染完成");
			}	     
	    });
    };
    //初始化常量枚举值
    initEnumerationValue();
	 });
 /**
  * 表格全局默认参数设置
  */
	require(['static/js/pecr/module/base'],function (base){
        /**
         * element组件渲染
         * form组件渲染
         */
        element.init();//每个页面都有
        form.render();//每个页面都有

    	//日期输入框  按css将所有的date组件渲染
    	$(".datefield").each(function(){
    	  laydate.render({
    		elem: this,
    		trigger:'click'
    	  });
    	});
        
      //初始化列表
    	table.render({
    		elem: '#dataTable', //表格所固定的div
    		toolbar: '#toolbarHead',  //表格顶部工具栏
    		url:'indvProtocol/loanList.do',
        	cols: [[
    			{type:'numbers'},	//列每行序号
    			{type:'checkbox'},  //列复选框
    			{field: 'pbaAcctBsSgmtId', title: '主键', hide: true},
 //   			 {align : "center",field : "orgName",title : "所属机构"},
                 {align : "center",field : "name",title : "姓名"},
                 {align : "center",field : "idType",title : "身份标识类型", templet:function(d){return renderColumnDict(d,'idType',staticDict.idType)}},
                 {align : "center",field : "idNum",title : "身份标识号码"},
                 {field: 'acctType', align:'center', title: '账户类型', templet:function(d){return renderColumnDict(d,'acctType',staticDict.acctType)}},
     			 {field: 'acctCode', align:'center', title: '账户标识码'},
                 {align : "center",field : "businessStates",title : "数据状态", templet:function(d){return renderColumnDict(d,'businessStates',staticDict.businessStates)}},
                 {align : "center",field : "rptDate",title : "信息报告日期"},
                 {align : "center",field : "mdfcSgmtCode",title : "待更正段段标", templet:function(d){return renderColumnDict(d,'mdfcSgmtCode',staticDict.perLoanUpdInfRecType)}},
    			{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
    		]],
    		even: true,  //行斑马线
    		page: true, //是否分页
    		limit: 10, //初始每页显示条数
    		height: $(document).height() - $('#dataTable').offset().top - $('#queryPanel').height() - 25,
    		limits: [10, 20, 50],
    		done: function (res, curr, count) {
    			$('th').css({'background-color':'#0997F7',
    				 'color':'#FFFFFF',
    				 'font-family':'Microsoft Yahei',
    				 'font-weight':'500',   //设置字体是否加粗
    				 'font-size':'13px'});
    		}
    	});
    	
    	  function tableReload(){
    		  table.reload('dataTable', {
      			method : 'post',
      			where: {
      					idType   :   $('#idType').val(), 
      					idCode      :   $('#idCode').val(), 
      				    rptDate  :  $('#rptDate').val(),
      					businessStates:$('#businessStates').val(),
      					acctType : $('#acctType').val(), 
      					acctCode : $('#acctCode').val()
      				}
      		}); 
    	  }

    	//查询按钮点击事件
    	$("#queryBtn").on('click', function(){
    		tableReload(); 
    		return false;
    	});
        
    	var popIndex;
    	table.on('toolbar(dataTable)', function(obj){
    		if(obj.event === 'addBtn') {
    			 popIndex = layer.open({
    				type: 2,
    				title: '获取个人借贷交易上报历史数据列表',
    				shadeClose: false,
    				shade: [0.3, '#000'],
    				area: ['80%', '70%'],
    				anim: 2,
    				resize: false,
    				content: 'indvProtocol/goIndvLoanSearch.do',
    				end: function(){
    					tableReload(); 
    				}
    			});
    		}else if(obj.event === 'submitBtn') {
    			//获取选中的行信息
   			 var checkStatus = table.checkStatus('dataTable');
   			 //获取选中行的数据
   			 data=checkStatus.data;
   			 var infRecType ="212";
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
   						tableReload(); 
   					},
   					error : function(e){ //请求失败，包含具体的错误信息
   						layer.alert('强制提交出错,错误信息如下:<br>' + e.responseText);
   					}
   				});
   			});
   		}else if(obj.event === 'uploadFile'){
   			popIndex = layer.open({
					type :'1',
					title :'Excel模板导入',
					content :$('#uploadPage'),
					area: ['40%', '30%'],
					success:function(layero,index){
						//导入方法
						importExcel();
					}
				});
   		}
    	});
      
    	//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
    	table.on('tool(dataTable)', function(obj){
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
    						tableReload(); 
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
    				content: 'indvProtocol/indvLoanChangeEdit.do?addOrUpdate=' + addOrUpdate 
    				         + "&pbaAcctBsSgmtId=" + data.pbaAcctBsSgmtId,
    				end: function(){
    					tableReload(); 
    					
    				}
    			});
            }else if (layEvent === 'detail'){
    			$("body").data("dataObj",data);
    			addOrUpdate = 'detail';
    			$("body").data("type",addOrUpdate);
    			layer.open({
    				type: 2,
    				title: '详情',
    				shadeClose: false,
    				shade: [0.3, '#000'],
    				area: ['100%', '100%'],
    				anim: 2,
    				resize: false,
    				content: 'indvProtocol/indvLoanChangeEdit.do?addOrUpdate=' + addOrUpdate +"&pbaAcctBsSgmtId=" + data.pbaAcctBsSgmtId,
    				end: function(){
    					tableReload(); 
    				}
    			});
    		}
    	});
    	
    	
    	//查询按钮点击事件
    	$("#downloadTemplateFile").on('click', function(){
    		window.location.href=basePath+'indvProtocol/downExcel.do';
    		return false;
    	});
    	
        form.on('submit(save)', function(data){
        	layer.close(popIndex);
        	return false;
        });
        
        var loadindex;
        function importExcel(){
        	var uploadInst = upload.render({
        		elem:'#excel',
        		url:'indvProtocol/readExcel.do',
        		accept:'file',
        		exts:'xlsx',
        		auto:false,
        		bindAction:'#save',
        		before:function(obj){
        			loadindex = layer.load();
        		},
        		done:function(res,index){
        			layer.close(loadindex);
    				layer.msg(res.msg, {time:4000});
    				tableReload(); 
        		},
        		error:function(e){
        			layer.alert('excel批量导入出错,错误信息如下:<br>'+e.responseText);
        			layer.close(loadindex);
        		}
        	});
        }
    	

    });
});
