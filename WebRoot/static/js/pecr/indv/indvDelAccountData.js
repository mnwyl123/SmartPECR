var locals = (window.location.href+'').split('/');
var basePath = locals[0]+'//'+locals[2]+'/'+locals[3]+'/';
//弹出层id
//initDict('orgCode', staticDict.orgCodeYillion);
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
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage','laytpl','upload'], function(){
	var element = layui.element
	form = layui.form,
	table = layui.table,
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate,
	laytpl = layui.laytpl;
	upload = layui.upload;
	require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
       element.init();//每个页面都有
		form.render();//每个页面都有
		
		  //日期输入框  按css将所有的date组件渲染
		  $(".datefield").each(function(){
			  laydate.render({
			    elem: this,
			    trigger:'click'
			  });
		  }); 
		  var initEnumerationValue = function () {
				var array = ['INDV_INFRECTYPE_DEL','DATA_STATUS_ZHCX','ID_TYPE'];
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
							if (data.result[i].INDV_INFRECTYPE_DEL){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].INDV_INFRECTYPE_DEL},
									containerId : "acctType"
								});
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].INDV_INFRECTYPE_DEL},
									containerId : "infRecType1"
								});
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].INDV_INFRECTYPE_DEL},
									containerId : "infRecType"
								});
								continue;
							}else if (data.result[i].DATA_STATUS_ZHCX){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].DATA_STATUS_ZHCX},
									containerId : "businessStates"
								});
								continue;
							}else if (data.result[i].ID_TYPE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ID_TYPE},
									containerId : "idType"
								});
								continue;
							}
						}
		                form.render('select');
		               // d1.resolve("渲染完成");
					}	     
			    });
		    };
    //初始化常量枚举值
    initEnumerationValue();
			  //日期输入框  按css将所有的date组件渲染
			  $(".datefield").each(function(){
				  laydate.render({
				    elem: this,
				    trigger:'click'
				  });
			  }); 
			 var initPopindex = function(type){
				 if(type==='114' || type==='134'){
					   $('#perdelStartDate').hide();
					   $('#perdelEndDate').hide();
					   $("#perdelSgmtCode").hide();
					   $("#perdelRecCode").hide();
					   $('#perName').show();
					   $('#perIdType').show();
					   $('#perIdNum').show();
					   $('#perInfSurcCode').show();
				   }
				 //整笔删除
				 if(type==='214' || type==='224' || type==='234') {
					 $('#perName').hide();
					 $('#perIdType').hide();
					 $('#perIdNum').hide();
					 $('#perInfSurcCode').hide();
					   $('#perdelStartDate').hide();
					   $('#perdelEndDate').hide();
					   $("#perdelSgmtCode").hide();
					   $("#perdelRecCode").show();
				   }
				 //按段删除
				 if(type==='213' || type==='223' || type==='233'){
					 $('#perName').hide();
					 $('#perIdType').hide();
					 $('#perIdNum').hide();
					 $('#perInfSurcCode').hide();
					   $('#perdelStartDate').show();
					   $('#perdelEndDate').show();
					   $("#perdelSgmtCode").show();
					   $("#perdelRecCode").show();
				   }
			 } ;
			
			        /**
			    	 * 监听变更类型切换
			    	 */
			    	form.on('select(infRecType1)', function(data){
			    		$.ajax({
			    			url:'dataDictCode/selectCodeListByUperId.do', 
			    			data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
			    			type:'post',  
			    			cache:false,  
			    			dataType:'json',  
			    			success:function(data){
										base.renderTpl({
											tplId : "enumerationValueTpl",
											arr : {"list" : data.result},
											containerId : "delSgmtCode"
										});
								form.render('select');
								//console.log($("#infRecType1").val());
								initPopindex($("#infRecType1").val()); 
			    			}
			    		});
			    		
			    	});
		table.render({
		elem: '#tableDemo' //表格所固定的div
		,toolbar: '#toolbarDemo'  //表格顶部工具栏
		,url:'delaccount/delaccountdataList.do' //url
		,cols: [[ 
		{type:'numbers'}	//列每行序号
		,{type:'checkbox'} //列复选框   
		//,{align : "center",hide: true, field:"pk",title:"主键"},
		,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType',staticDict.INFOTYPE)}}
		,{align : "center",field: 'name', title: '姓名'}
		//,{align : "center",field: 'idType', title: '证件类型',templet: function(d){return renderColumnDict(d, 'idType',staticDict.idType)}}
		,{align : "center",field: 'idNum', title: '证件号码'}
		,{align : "center",field: 'infSurcCode', title: '信息来源编码'}
		,{align : "center",field: 'delRecCode', title: '待删除业务标识码'}
		,{align : "center",field: 'delSgmtCode', title: '待删除段标'}
		,{align : "center",field: 'businessStates', title: '数据状态', templet:function(d){return renderColumnDict(d,'businessStates',staticDict.businessStates)}}
		,{align : "center",fixed: 'right', title:'操作', toolbar: '#barDemo',width:200} //行上的工具栏
		]]
		,even: true  //行斑马线
		,page: true //是否分页
		,limit: 10 //初始每页显示条数
		,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
		,limits: [10, 15, 20],
		//回调函数
		done: function (res, curr, count) {
		  $('th').css({'background-color':'#0997F7',
						 'color':'#FFFFFF',
						 'font-family':'Microsoft Yahei',
						 'font-weight':'500',   //设置字体是否加粗
						 'font-size':'13px'});
		  
		}
	});
		
		function tableReload(){
			table.reload('tableDemo', {
				method : 'post',
				where: {
					acctType      :   $('#acctType').val(), 
					acctCode      :   $('#acctCode').val(), 
					businessStates:$('#businessStates').val(),
					rptDate:$('#rptDate1').val()
					}
			}); 
		}
		
		
		//检索
		$("#queryBtn").on('click', function(){
			tableReload();
			return false;
		});
		//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
		table.on('tool(tableDemo)', function(obj){
			var data = obj.data;
			var PK = data.pk;
			var tableName = "";
			if(data.infRecType === '213'){
					tableName = "I_IN_ACCT_DEL";
				}else if(data.infRecType === '134'){
					tableName = "I_IN_ID_EFCT_INF_DLT"
				}else if(data.infRecType === '233'){
					tableName = "I_IN_SEC_ACCT_DEL";
				}else if(data.infRecType === '114'){
					tableName = "I_IN_BS_INF_DLT";
				}else if(data.infRecType === '223'){
					tableName = "I_IN_CTRCT_DEL";
				}else if(data.infRecType === '234'){
					tableName = "I_IN_SEC_ACCT_ENT_DEL";
				}else if(data.infRecType === '214'){
					tableName = "I_IN_ACCT_ENT_DEL";
				}else{//授信
					tableName = "I_IN_CTRCT_ENT_DEL";
				}
		if(obj.event === 'del'){
			layer.confirm('确定删除该条数据吗？', function(index){
			 $.ajax({
			      //请求方式
			      type : "POST",
			      //请求地址
			      url : "delaccount/delete.do",
			      //数据，json字符串
			      data : data,
			      //请求成功
			      success : function(result) {
				   	    layer.msg('删除成功', {time:3000});
				   	    tableReload();
				   	    layer.close(popIndex);
			      },
			      //请求失败，包含具体的错误信息
			      error : function(e){
			   	   layer.alert('删除出错,错误信息如下:<br>'+e.responseText);
			      }
			  });
				layer.close(index);
			});
		} else if(obj.event === 'edit'){
			addOrUpdate = "update";
			$.ajax({
		  	       //请求方式
		  	       type : "POST",
		  	       //请求地址
		  	       url : "validate/getErrorMessage.do",
		  	       //数据，json字符串
		  	       data :{pk:PK,tableName:tableName}, 
		  	       //请求成功
		  	       success : function(result) {
		  	    	   if(result.success == true){
		  	    		 var errorMessage="";
		  	    		 var data = result.result;
		  	    		 for(var i=0;i<data.length;i++){
		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
		  	    		 }
		  	    		$("#feedBackError").val(errorMessage);
		  	     	   }else{
		  	     		   layer.alert(result.msg);
		  	     	   }
		  	       },
		  	       //请求失败，包含具体的错误信息
		  	       error : function(e){
		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
		  	       }
		  	   });
		 	popIndex = layer.open({
				type :'1',
				title :'修改信息',
				content :$('#dialog'),
				area: ['40%', '65%']			
		 	});
		//将该行数据在form中回显
			$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
			$("#close").show().css("visibility","visible").removeClass("hide");
			$("#errorMessage").show();
			$(".layui-input").prop("disabled",false);
			$("select").prop("disabled",false);
			$("#infRecType1").val(data.infRecType);
			$("#name").val(data.name);
			$("#idType").val(data.idType);
			$("#idNum").val(data.idNum);
			$("#rptDate").val(data.rptDate);
			$("#infSurcCode").val(data.infSurcCode);
			if(data.infRecType ==='213' || data.infRecType ==='223' || data.infRecType ==='233'){
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#infRecType1").find("option[value='"+data.infRecType+"']").data("id")},
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data1){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data1.result},
							containerId : "delSgmtCode"
						});
						$("#delSgmtCode").val(data.delSgmtCode);	
						form.render('select');
					}
				});
			}
			$("#delRecCode").val(data.delRecCode);
			$("#pk").val(data.pk);
			$("#exampleSubmit").data("id",data.pk);
			initPopindex(data.infRecType);
			form.val('exampleForm', data);
			form.render('select');
		}
		else if(obj.event === 'more'){
			 $.ajax({
		  	       //请求方式
		  	       type : "POST",
		  	       //请求地址
		  	       url : "validate/getErrorMessage.do",
		  	       //数据，json字符串
		  	       data :{pk:PK,tableName:tableName}, 
		  	       //请求成功
		  	       success : function(result) {
		  	    	   if(result.success == true){
		  	    		 var errorMessage="";
		  	    		 var data = result.result;
		  	    		 for(var i=0;i<data.length;i++){
		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
		  	    		 }
		  	    		$("#feedBackError").val(errorMessage);
		  	     	   }else{
		  	     		   layer.alert(result.msg);
		  	     	   }
		  	       },
		  	       //请求失败，包含具体的错误信息
		  	       error : function(e){
		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
		  	       }
		  	   });
			layer.open({
					title: '详情',
					type: '1',
					content :$('#dialog'),
					area: ['40%', '65%']
				});
			$("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
			$("#close").hide().css("visibility","hidden").addClass("hide");
			$("#errorMessage").show();
			//$(".layui-input").prop("disabled",true);
			//$("select").prop("disabled",true);
			$("#infRecType1").attr("disabled", true);
			$("#name").attr("disabled", true);
			$("#idType").attr("disabled", true);
			$("#idNum").attr("disabled", true);
			$("#rptDate").attr("disabled", true);
			$("#infSurcCode").attr("disabled", true);
			if(data.infRecType ==='213' || data.infRecType ==='223' || data.infRecType ==='233'){
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#infRecType1").find("option[value='"+data.infRecType+"']").data("id")},
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data1){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data1.result},
							containerId : "delSgmtCode"
						});
						$("#delSgmtCode").val(data.delSgmtCode);	
						form.render('select');
					}
				});
			}
			$("#delRecCode").val(data.delRecCode);
			initPopindex(data.infRecType);
			$("#infRecType1").val(data.infRecType);
			form.val('exampleForm', data);
			form.render('select');
		}
		});
		//新增按钮点击事件
		table.on('toolbar(tableDemo)', function (obj) {
			switch (obj.event) {
				case 'addBtn':
					addOrUpdate = "add";
					//新增时对弹出框中的form数据清空
					$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
					$("#close").show().css("visibility","visible").removeClass("hide");
					$("#errorMessage").hide();
					$(".layui-input").prop("disabled",false);
					$("select").prop("disabled",false);
					$("#infRecType1").val('');
					$("#delRecCode").val('');
					$("#delSgmtCode").val('');
					$("#name").val('');
					$("#idType").val('');
					$("#idNum").val('');
					$("#rptDate").val('');
					$("#infSurcCode").val('');
					$("#feedBackError").val('');
					//显示所有的文本框
					$('#perdelStartDate').show();
				    $('#perdelEndDate').show();
				    $("#perdelSgmtCode").show();
				    $("#perdelRecCode").show();
				    $('#perName').show();
				    $('#perIdType').show();
				    $('#perIdNum').show();
				    $('#perInfSurcCode').show();
					form.val('exampleForm', {'infRecType1':'', 'delStartDate':'', 'delEndDate':'', 'delRecCode':'','delSgmtCode':'', 'name':'', 'idType':'', 'idNum':''});
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$("#exampleSubmit").data("id",data.result);
								
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
					popIndex = layer.open({
						type :'1',
						title :'新增',
						area: ['40%', '80%'],	
						content :$('#dialog')
					});
					form.render('select');
					break;
				case 'submitBtn':
					var infRecType = $('#acctType').val();
					if(infRecType === ""){
						layer.msg("请按照信息记录类型进行强制提交！", {time:3000});
						return ;
					}
					//获取选中的行信息
					 var checkStatus = table.checkStatus('tableDemo');
					 //获取选中行的数据
					 data=checkStatus.data;
					 var rptDate = $('#rptDate1').val();
					 if(data.length==0 && rptDate.length==0){
						layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期",{time:3000});
						return ;
					}
				 	var str = "";
					for(var i = 0; i < data.length; i++){
						str+=checkStatus.data[i].pk+",";
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
					break;
					case 'uploadFile':
						$("#uploadForm")[0].reset();
			   			popIndex = layer.open({
								type :'1',
								title :'Excel模板导入',
								content :$('#uploadPage'),
								area: ['60%', '70%']
							});
			   			form.render('select');
			};
		});
			
		
		//点击关闭按钮
		form.on('submit(close)', function(data){
			  layer.close(popIndex);
			  tableReload(); 
			  return false; 
		 });
		
		
		//新增或更新的实际数据库操作  
		form.on('submit(exampleSubmit)', function(data){
		
		var para = {};
		para.pk=$("#exampleSubmit").data("id");
		para.infRecType  = $("#infRecType1").val();
		para.delStartDate = $("#delStartDate").val();
		para.delEndDate = $("#delEndDate").val();
		para.delRecCode = $("#delRecCode").val();
		para.delSgmtCode = $("#delSgmtCode").val();
		para.infSurcCode =$("#infSurcCode").val();
		para.name = $("#name").val();
		para.idNum = $("#idNum").val();
		para.idType = $("#idType").val();
		para.rptDate = $("#rptDate").val();

		$.ajax({
		//请求方式
		type : "POST",
		//请求地址
		url : "delaccount/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
		//数据，json字符串
		data : para,
		//请求成功
		success : function(result) {
		   if(result.success == true){
			   	  dataObj = para;
			   	  layer.msg('操作成功', {time:3000});
			      layer.close(popIndex);
			      if(dataObj.infRecType === '213'){
					   verify.dataValidation('base','I_IN_ACCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '134'){
						verify.dataValidation('base','I_IN_ID_EFCT_INF_DLT',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '233'){
						verify.dataValidation('base','I_IN_SEC_ACCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '114'){
						verify.dataValidation('base','I_IN_BS_INF_DLT',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '223'){
						verify.dataValidation('base','I_IN_CTRCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '234'){
						verify.dataValidation('base','I_IN_SEC_ACCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else if(dataObj.infRecType === '214'){
						verify.dataValidation('base','I_IN_ACCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}else{//授信
						verify.dataValidation('base','I_IN_CTRCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
					}
			      tableReload(); 
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
	})
	
	    //查询按钮点击事件
    	$("#downloadTemplateFile114").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=114';
    		return false;
    	});
		
		$("#downloadTemplateFile134").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=134';
    		return false;
    	});
		
		$("#downloadTemplateFile213").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=213';
    		return false;
    	});
		
		$("#downloadTemplateFile214").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=214';
    		return false;
    	});
		
    	$("#downloadTemplateFile223").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=223';
    		return false;
    	});
		
		$("#downloadTemplateFile224").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=224';
    		return false;
    	});
		
		$("#downloadTemplateFile233").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=233';
    		return false;
    	});
		
		$("#downloadTemplateFile234").on('click', function(){
    		window.location.href=basePath+'delaccount/downExcel.do?type=234';
    		return false;
    	});
		
		
        form.on('submit(save)', function(data){
        	var loadindex = layer.load();
        	var upForm = document.getElementById("uploadForm");
        	var fData = new FormData(upForm);
        	var infRecType = $("#infRecType").val();
        	var filename = $("#excel").val();
        	if(filename.indexOf(infRecType) != -1){
        		$.ajax({
        			type : "POST",
        			url : "delaccount/readExcel.do",
        			data : fData,
        			asyno:false,
        			cache:false,
        			contentType:false,
        			processData:false,
        			//请求成功
        			success : function(result) {
        				layer.close(popIndex);
        				layer.close(loadindex);
        				layer.msg(result.msg, {time:4000});
        				tableReload(); 
        			},
    	    		error : function(e){
    	    			layer.alert('excel批量导入出错,错误信息如下:<br>'+e.responseText);
    	    			layer.close(loadindex);
    	    		}
        		});
        	}else{
        		layer.alert('选择的信息记录类型和导入的文件文件名不匹配，请确认是否匹配！');
        		layer.close(loadindex);
        	}
        	return false;
        });
		
	});
});
