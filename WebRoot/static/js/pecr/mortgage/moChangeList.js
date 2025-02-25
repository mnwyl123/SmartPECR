initDict('businessStates', staticDict.businessStates);
//弹出层id
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;

layui.use(['element', 'form','layer','laydate','table','laytpl'], function(){
    var element = layui.element
    	form = layui.form
    	layer = layui.layer
    	laydate = layui.laydate
    	table = layui.table
    	laytpl = layui.laytpl;  
  
    require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
		/**
		 * element组件渲染
		 * form组件渲染
		 */
		element.init();//每个页面都有
		form.render();//每个页面都有
		
        table.render({
        	elem: '#acc' //表格所固定的div
        			,toolbar: '#toolbarDemo'  //表格顶部工具栏
        				,url:'moChange/motgaContractInfoList.do' //url
        					,cols: [[ 
        						{type:'numbers'}	//列每行序号
        						,{type:'checkbox'} //列复选框
        						,{align : "center",hide: true, field:"efwMocId",title:"主键"}
        						,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType', staticDict.motgaInfrectype)}}
        						,{align : "center",field: 'lastUpdateTime', title: '变更日期'}
        						,{align : "center",field: 'odBnesCode', title: '原业务标识码'}
        						,{align : "center",field: 'nwBnesCode', title: '新业务标识码'}
        						,{align : "center",field: 'operatorUser', title: '操作员'}
        						,{align : "center",field: 'businessStates', title: '数据状态',templet: function(d){return renderColumnDict(d, 'businessStates', staticDict.businessStates)}}
        						,{align : "center",fixed: 'right', title:'操作',toolbar: '#barDemo'} //行上的工具栏
        						]],
        						even: true,  //行斑马线
        						page: true, //是否分页
        						limit: 10, //初始每页显示条数
        						height: $(document).height() - $('#acc').offset().top - $('#queryPanel').height() - 25,
        						limits: [5,10, 15],
        						//回调函数
        						done: function (res, curr,count) {
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
  
        	//检索
        	$("#queryBtn").on('click', function(){
        		table.reload('acc', {
        			method : 'post',
        			where: {
        				businessStates  : $('#businessStates').val(),
    			        rptDate  : $('#rptDate').val()
        				}
        		}); 
        		return false;
        	});
        	//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
        	table.on('tool(acc)', function(obj){
        		var data = obj.data;
        		if(obj.event === 'del'){
        			layer.confirm('是否确定删除该条数据？', function(index){
        				$.ajax({
        					//请求方式
        					type : "POST",
        					//请求地址
        					url : "moChange/delMotgaContractInfo.do",
        					//数据，json字符串
        					data : data,
        					//请求成功
        					success : function(result) {
        						if(result.success){
        							layer.msg('删除成功');
        						}else{
        							layer.msg('删除失败');
        						}
        						table.reload('acc', {
        		        			method : 'post',
        		        			where: {
        		        				businessStates  : $('#businessStates').val(),
        		    			        rptDate  : $('#rptDate').val()
        		        				}
        		        		}); 
        						layer.close(popIndex);
        					},
        					//请求失败，包含具体的错误信息
        					error : function(e){
        						layer.alert('删除出错,错误信息如下:<br>'+e.responseText);
        					}
        				});
        			});
        		} else if(obj.event === 'edit'){
        			addOrUpdate = "update";
        			popIndex = layer.open({
        				type :'1',
        				title :'修改信息',
        				content :$('#dialog'),
        				area: ['40%', '50%']			
        			});
        			//将该行数据在form中回显
        			$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
        			$("#lastUpdateTime").prop("disabled",false);
    				$("#odBnesCode").prop("disabled",false);
    				$("#nwBnesCode").prop("disabled",false);
        			$("#infRecType").prop("disabled",false);
        			 $("#exampleSubmit").data("id",data.efwMocId);
        			form.val('exampleForm', data);
        			verify.dataValidation('dialog','MOC_ID_CAGS_INF',data.efwMocId,'form',false,false); //数据校验结果回显
        			form.render('select');
        		}
        		else if(obj.event === 'more'){
        			popIndex = layer.open({
        				title: '详情',
        				type: '1',
        				content :$('#dialog'),
        				area: ['40%', '50%']
        			});
        			$("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
        			$("#lastUpdateTime").prop("disabled",true);
    				$("#odBnesCode").prop("disabled",true);
    				$("#nwBnesCode").prop("disabled",true);
        			$("#infRecType").prop("disabled",true);
        			form.val('exampleForm', data);
        			$(".errorFormBox").html("");
        			form.render('select');
        		}
        	});
        	//新增按钮点击事件
        	table.on('toolbar(acc)', function (obj) {
        		switch (obj.event) {
        			case 'addBtn':
        				addOrUpdate = "add";
                		//新增时对弹出框中的form数据清空
        				$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
            			$("#lastUpdateTime").prop("disabled",false);
        				$("#odBnesCode").prop("disabled",false);
        				$("#nwBnesCode").prop("disabled",false);
            			$("#infRecType").prop("disabled",false);
        				$("#infRecType").val('');
        				$(".errorFormBox").html("");
                		form.val('exampleForm', {'infRecType':'', 'lastUpdateTime':'', 'odBnesCode':'', 'nwBnesCode':''});
                		$.ajax({
      						type : "POST",  //请求方式
      						url  : "generateUUID/id.do",
      						success : function(data) {
      							if(data.success == true){
      								$("#efwMocId").val(data.result);
      							}else{
      								layer.alert(data.msg);
      							}
      						},
      						//请求失败，包含具体的错误信息
      						error : function(e){
      							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
      						}
      					});
                		popIndex= layer.open({
                			type :'1',
                			title :'新增用户',
                			content :$('#dialog'),
                			area: ['40%', '50%']			
                		});
                		
                		form.render('select');
                		break;
        			case 'submitBtn':
        				//获取选中的行信息
        				 var checkStatus = table.checkStatus('acc');
        				 //获取选中行的数据
        				 data=checkStatus.data;
        				 var infRecType ="511";
        				 var rptDate = $('#rptDate').val();
        				 if(data.length==0 && rptDate.length==0){
        					layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期");
        					return ;
        				}
        			 	var str = "";
        				for(var i = 0; i < data.length; i++){
        					str+=checkStatus.data[i].efwMocId+","
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
        							table.reload('acc', {
        								method : 'post',
        								where: {
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
        		};
        	});
        	//新增或更新的实际数据库操作
        	form.on('submit(exampleSubmit)', function(data){
        		var para = {};
        		 para.infRecType= $("#infRecType").val();
        		 para.efwMocId= $("#efwMocId").val();
        		 para.lastUpdateTime = $("#lastUpdateTime").val();
        		 para.odBnesCode = $("#odBnesCode").val();
        		 para.nwBnesCode = $("#nwBnesCode").val();
        		$.ajax({
        			//请求方式
        			type : "POST",
        			//请求地址
        			url : "moChange/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
        			//数据，json字符串
       			     data : para,
        			//请求成功
        			success : function(result) {
        				if(result.success == true){
        					verify.dataValidation('dialog','MOC_ID_CAGS_INF',$("#efwMocId").val(),'form',true,false,true); //数据校验
        					layer.msg('操作成功');
        					table.reload('acc', 
    							{method : 'post',
        						 where:{
    								businessStates  : $('#businessStates').val(),
							        rptDate  : $('#rptDate').val()
    								}
        					});
        					layer.close(popIndex);
        				}else{
        					layer.alert(result.msg);
        				}
        			},
        			//请求失败，包含具体的错误信息
        			error : function(e){
        				layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
        			}
        		});
        		return false;//防止页面跳转
        	});
        	
            form.on('submit(close)', function(data){
            	  layer.close(popIndex);
            	  table.reload('acc', {
            		  method : 'post',
            		  where:{
            			  businessStates  : $('#businessStates').val(),
					        rptDate  : $('#rptDate').val()
        		  }}); 
        		return false;
        	  });
  });
  });
