/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laypage','laytpl'], function(){
	 var element = layui.element, //获取element模块
		form = layui.form, //获取form模块
		layer = layui.layer, //获取layer模块
		laydate = layui.laydate, //获取laydate模块
		table = layui.table //获取table模块
		laypage = layui.laypage, //获取laypage模块
		laytpl = layui.laytpl;  //获取laytpl模块  模板引擎
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
       
        /**
         * 页面布局使用
         * 数据表格中计算高度部分的固定高度
         */
        var fixedHeight = $(".wrap>.layui-form:first").height() + 20 + 5 + 33;

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
					/*if (data.result.length){
						base.renderTpl({
							tplId : "orgTpl",
							  arr : {"list" : data.result},
							containerId : "orgCode"
						});
						
					}*/
			form.render('select');
				 }	     
			});
		};

        /**
         * 初始化常量枚举值
         */
        var initEnumerationValue = function () {
        	var array = ['ENT_CERT_MAIN_TYPE','ENT_CERT_MAIN_TYPE','PER_CREDIT_RPT_DATE_CODE','DATA_STATUS_ZHCX','ENT_CREDIT_UP_INF_REC_TYPE'];
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
                success:  function (data) {
                	for(var i=0;i<data.result.length;i++){
                		if (data.result[i].ENT_CERT_MAIN_TYPE){
							base.renderTpl({
                                tplId : "enumerationValueTpl",
                                arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
                                containerId : "acctType"
							});
							base.renderTpl({
                                tplId : "enumerationValueTpl",
                                arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
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
    					}else if (data.result[i].ENT_CREDIT_UP_INF_REC_TYPE){
    						base.renderTpl({
    							tplId : "enumerationValueTpl",
    							arr : {"list" : data.result[i].ENT_CREDIT_UP_INF_REC_TYPE},
    							containerId : "mdfcSgmtCode"
    						});
    						continue;
    					}
                    }
                	 form.render('select');
                }
				});
        };

        /**
         * 初始化列表
         */
        
        
      //初始化列表
    	table.render({
    		elem: '#dataTable', //表格所固定的div
    		toolbar: '#toolbarHead',  //表格顶部工具栏
    		url:'entUpDaccountData/ctrctChangeBsSgmtList.do',
    		cols: [[
				{type:'numbers'},	//列每行序号
				{type:'checkbox'},  //列复选框
				{field: 'egaCtrctBsSgmtId', title: '主键', hide: true},
//				{field: 'mngmtOrgCode', align:'center', title: '所属机构'},
				{field: 'infRecType', align:'center', title: '信息记录类型', templet:function(d){return renderColumnDict(d,'infRecType',enterDict.infRecType)}},
				{field: 'contractCode', align:'center', title: '授信协议标识码'},
				{field: 'rptDate', align:'center', title: '信息报告日期'},
//				{field: 'rptDateCode', align:'center', title: '报告时点说明代码', templet:function(d){return renderColDict(d,'PER_CREDIT_RPT_DATE_CODE','rptDateCode')}},
				{field: 'name', align:'center', title: '受信人名称'},
				{field: 'idType', align:'center', title: '受信人身份标识类型类型', templet:function(d){return renderColumnDict(d,'idType',enterDict.arlpCertType)}},
				{field: 'idNum', align:'center', title: '受信人身份标识号码'},
				{align : "center",field: 'businessStates', title: '数据状态',templet: function(d){return renderColumnDict(d, 'businessStates',enterDict.dataStatusBlxs)}},
				{align : "center",field: 'mdfcSgmtCode', title: '待更正段段标',templet: function(d){return renderColumnDict(d, 'mdfcSgmtCode',enterDict.entCreditUpInfRecType)}},
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


        /**
         * 点击新增按钮
         * 
         */
    	table.on('toolbar(dataTable)', function(obj){
	    	if(obj.event === 'addBtn') {
	   			 popIndex = layer.open({
	   				type: 2,
	   				title: '获取企业授信协议上报历史数据列表',
	   				shadeClose: false,
	   				shade: [0.3, '#000'],
	   				area: ['80%', '70%'],
	   				anim: 2,
	   				resize: false,
	   				content: 'entUpDaccountData/goEntProtocolSearch.do',
	   				end: function(){
	   					tableReload(); 
	   				}
	   			});
	   		}else if(obj.event === 'submitBtn') {
	   			//获取选中的行信息
	   			 var checkStatus = table.checkStatus('dataTable');
	   			 //获取选中行的数据
	   			 data=checkStatus.data;
	   			 var infRecType ="422";
	   			 var rptDate = $('#rptDate').val();
	   			 if(data.length==0 && rptDate.length==0){
	   				layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期");
	   				return ;
	   			}
	   		 	var str = "";
	   			for(var i = 0; i < data.length; i++){
	   				str+=checkStatus.data[i].egaCtrctBsSgmtId+","
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
	   		}
    	});
    	
    	function tableReload(){
    		table.reload('dataTable', {
    			method : 'post',
    			where: {
    				rptDate   :   $('#rptDate').val(), 
    				name      :   $('#name').val(), 
    				contractCode      :   $('#contractCode').val(), 
    				businessStates:$('#businessStates').val()
    				}
    		}); 
    	}
        
        $("#queryBtn").on('click', function(){
        	tableReload();
    		return false;
    	});
        /**
         * 工具栏操作
         */
        table.on('tool(dataTable)', function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            addOrUpdate = 'edit';
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
                    content:  'entUpDaccountData/entProtocolChangeEdit.do?addOrUpdate=' + addOrUpdate
					 + '&egaCtrctBsSgmtId=' + data.egaCtrctBsSgmtId,
					 end: function(){
						 tableReload();
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
                    content: 'entUpDaccountData/entProtocolChangeEdit.do?addOrUpdate=' + addOrUpdate
					 + '&egaCtrctBsSgmtId=' + data.egaCtrctBsSgmtId,
                    end: function(){
                    	tableReload();
    				}
                });
            }else if (layEvent === 'deleteInfo'){
    			layer.confirm('确认要删除该条信息？', function(index){
    				$.ajax({
    					type : "POST",
    					url : "enCtrctInfo/deleteOneRecord.do",
    					data : data,
    					success : function(result) {
    						if(result.success){
    							layer.msg('删除成功', {time:3000});
    						}else{
    							layer.msg(result.msg, {time:3000});
    						}
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
    		}
        });

        /**
         * 页面初始化
         */
        initEnumerationValue(); //初始化常量枚举值

    });
});
