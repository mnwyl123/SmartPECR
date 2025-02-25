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
layui.use(['form', 'laydate','layer', 'element', 'table','laypage','laytpl'], function()
{
  var element = layui.element
  form = layui.form,
  table = layui.table,
  layer = layui.layer, //获取layer模块
  laypage = layui.laypage, //获取laypage模块
  laytpl = layui.laytpl, //获取laytpl模块  模板引擎
  laydate = layui.laydate;
  require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){

	//日期输入框  按css将所有的date组件渲染
		$(".datefield").each(function(){
			laydate.render({
				elem: this,
				trigger:'click',
				theme: '#588fd0',
				format: 'yyyy-MM-dd'
			});
		});
		laydate.render({
          elem: '#sheetYear'
          ,type: 'year'
          ,theme: '#588fd0'
          ,format: 'yyyy'
          ,trigger:'click'
      });
  /*laydate.render({
	    elem: '#date'
	  });*/
		element.init();//每个页面都有
		form.render();//每个页面都有
		 var selectAdd = function(data,selectId){
			 var getTpl = document.getElementById("enumerationValueTpl").innerHTML;
			 var  containerId = document.getElementById(selectId);
			laytpl(getTpl).render({list:data}, function(html){
				containerId.innerHTML = html;
			});
		 }
     
		  var initEnumerationValue = function () {
				var array = ['ENT_INFRECTYPE_DEL','DATA_STATUS_ZHCX','ENT_CERT_MAIN_TYPE','PER_GUAR_DEL_INF_REC_TYPE','SHEET_TYPE','ENT_BALANCE_SHEET_TYPE_DIVIDE'];
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
							if (data.result[i].ENT_INFRECTYPE_DEL){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ENT_INFRECTYPE_DEL},
									containerId : "acctType"
								});
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ENT_INFRECTYPE_DEL},
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
							}else if (data.result[i].ENT_CERT_MAIN_TYPE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
									containerId : "idType"
								});
								continue;
							}else if (data.result[i].SHEET_TYPE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].SHEET_TYPE},
									containerId : "sheetType"
								});
								continue;
							} else if(data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE},
									containerId : "sheetTypeDivide"
								});
								continue;
							} 
						}
						form.render('select');
						}
				    });
		        };
		        var initPopindex = function(type){
					 if(type==='314'){
						   $('#perDelStartDate').hide();
						   $('#perDelEndDate').hide();
						   $("#perdelSgmtCode").hide();
						   $("#perDelRecCode").hide();
						   $("#perSheetYear").hide();
						   $("#perSheetType").hide();
						   $('#perInfSurcCode').show()
						   $("#perSheetTypeDivide").hide();
						   $("#entName").show();
						   $("#entIdType").show();
						   $("#entIdNum").show();
					   }
					 if(type==='414' || type==='424' || type==='444') {
						   $('#perDelStartDate').hide();
						   $('#perDelEndDate').hide();
						   $("#perdelSgmtCode").hide();
						   $('#perInfSurcCode').hide();
						   $("#perSheetYear").hide();
						   $("#perSheetType").hide();
						   $("#perSheetTypeDivide").hide();
						   $("#perDelRecCode").show();
						   $("#entName").hide();
						   $("#entIdType").hide();
						   $("#entIdNum").hide();
					   }
					 if(type==='614' || type==='624' || type==='634'|| type==='544'|| type==='654'){
						   $('#perDelStartDate').hide();
						   $('#perDelEndDate').hide();
						   $("#perdelSgmtCode").hide();
						   $("#perDelRecCode").hide();
						   $('#perInfSurcCode').hide();
						   $("#perSheetYear").show();
						   $("#perSheetType").show();
						   $("#perSheetTypeDivide").show();
						   $("#entName").show();
						   $("#entIdType").show();
						   $("#entIdNum").show();
					 }
					 if(type==='413' || type==='423' || type==='443'){
						   $('#perInfSurcCode').hide();
						   $('#perDelStartDate').show();
						   $('#perDelEndDate').show();
						   $("#perdelSgmtCode").show();
						   $("#perDelRecCode").show();
						   $("#perSheetYear").hide();
						   $("#perSheetType").hide();
						   $("#perSheetTypeDivide").hide();
						   $("#entName").hide();
						   $("#entIdType").hide();
						   $("#entIdNum").hide();
					   }
					
				 } ;
		        //初始化常量枚举值
		        initEnumerationValue();
		        /**
		    	 * 监听变更类型切换
		    	 */
		    	form.on('select(infRecType)', function(data){
		    		$.ajax({
		    			url:'dataDictCode/selectCodeListByUperId.do', 
		    			data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
		    			type:'post',  
		    			cache:false,  
		    			dataType:'json',  
		    			success:function(data){
		    				selectAdd(data.result,'delSgmtCode');
		    				base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result},
								containerId : "delSgmtCode"
							});
		    				form.render('select');
		    				initPopindex($("#infRecType").val());
		    			}
		    		});
		    		
		    	});
    table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'entDelAccount/delaccountdataList.do' //url
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框   
      ,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColumnDict(d, 'infRecType',enterDict.entDelMesPage)}}
      ,{align : "center",field: 'name', title: '企业名称'}
      //,{align : "center",field: 'idType', title: '企业身份标识类型',templet: function(d){return renderColumnDict(d, 'idType',enterDict.entCertMainType)}}
      ,{align : "center",field: 'idNum', title: '企业身份标识号码'}
      ,{align : "center",field: 'delRecCode', title: '待删除业务标识码'}
	  ,{align : "center",field: 'operatorUser', title: '操作员'}
	  ,{align : "center",field: 'businessStates', title: '状态',templet: function(d){return renderColumnDict(d, 'businessStates',enterDict.dataStatusBlxs)}}
	  ,{align : "center",fixed: 'right', title:'操作', toolbar: '#barDemo', width:200} //行上的工具栏
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
  	  table.reload('tableDemo',{
		  method : 'post',
		  where: {
			 'infRecType'      :   $('#acctType').val(), 
			 'delRecCode'      :   $('#delRecCode1').val(), 
			 'businessStates':$('#businessStates').val(),
			 'idNum' : $('#idNum1').val()
		  }
	  });
    }
  
  //查询
  $("#queryBtn").on('click',function(){
	  tableReload();
	  return false;
  });
//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
table.on('tool(tableDemo)', function(obj){
  var data = obj.data;
  var PK = data.pk;
  var tableName = "";
  if(data.infRecType =='314'){
	  tableName = "E_BS_INF_DLT";
  }else if(data.infRecType =='413'){
	  tableName = "E_ACCT_INF_DEL";
  }else if(data.infRecType == '414'){
	  tableName = "E_ACCT_INF_ENT_DEL";
  }else if(data.infRecType =='423'){
	  tableName = "E_CTRCT_INF_DEL";
  }else if(data.infRecType == '424'){
	  tableName = "E_CTRCT_INF_ENT_DEL";
  }else if(data.infRecType =='443'){
	  tableName = "E_SEC_ACCT_DEL";
  }else if(data.infRecType == '444'){
	  tableName = "E_SEC_ACCT_ENT_DEL";
  }else if(data.infRecType == '614'){
	  tableName = "E_BALANCE_SHEET_DLT";
  }else if(data.infRecType == '624'){
	  tableName = "E_IN_COME_ENT_DEL";
  }else if(data.infRecType=='634'){
	  tableName = "E_CASH_FLOW_ENT_DEL";
  }else if(data.infRecType=='644'){
	  tableName = "E_ASSETS_DEBT_ENT_DEL";
  }else{
	  tableName = "E_IN_OUT_ENT_DEL";
  }
  if(obj.event === 'del'){
    layer.confirm('确定删除该条数据记录吗？', function(index){
 	  $.ajax({
 	       //请求方式
 	       type : "POST",
 	       //请求地址
 	       url : "entDelAccount/delete.do",
 	       //数据，json字符串
 	       data : data,
 	       //请求成功
 	       success : function(result) {
 	    	  layer.msg('删除成功', {time:3000});
 	    	  tableReload();
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
			area: ['70%', '70%']			
		});
  	//将该行数据在form中回显
  	$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
  	$("#close").show();
  	$("#errorMessage").show();
	$(".layui-input").prop("disabled",false);
	$("select").prop("disabled",false);
	$("#infRecType").val(data.infRecType);	
	$("#name").val(data.name);	
	$("#idType").val(data.idType);
	$("#idNum").val(data.idNum);	
	$("#delEndDate").val(data.delEndDate);
	$("#delStartDate").val(data.delStartDate);
	$("#infSurcCode").val(data.infSurcCode);	
	$("#sheetYear").val(data.sheetYear);
	$("#sheetType").val(data.sheetType);	
	$("#sheetTypeDivide").val(data.sheetTypeDivide);
	$("#rptDate").val(data.rptDate);
	initPopindex(data.infRecType);
	
	if(data.infRecType ==='413' || data.infRecType ==='423' || data.infRecType ==='443'){
		$.ajax({
			url:'dataDictCode/selectCodeListByUperId.do', 
			data:{uperId:$("#infRecType").find("option[value='"+data.infRecType+"']").data("id")},
			type:'post',  
			cache:false,  
			dataType:'json',  
			success:function(data1){
				selectAdd(data1.result,'delSgmtCode');
				$("#delSgmtCode").val(data.delSgmtCode);	
				form.render('select');
			}
		});
	}
	$("#delRecCode").val(data.delRecCode);
	$("#pbyInAcctDelId").val(data.pbyInAcctDelId);
	$("#pk").val(data.pk);
	 $("#exampleSubmit").data("id",data.pk);
	 form.render('select');
	form.val('exampleForm', data);
	 if(data.infRecType === '413'){
         verify.dataValidation('base','E_ACCT_INF_DEL',data.pk,'form',false,false); //数据校验
	    }else if(data.infRecType === '443'){
            verify.dataValidation('base','E_SEC_ACCT_DEL',data.pk,'form',false,false); //数据校验

		}else if(data.infRecType === '423'){
            verify.dataValidation('base','E_CTRCT_INF_DEL',data.pk,'form',false,false); //数据校验

		}else if(data.infRecType === '444'){
            verify.dataValidation('base','E_SEC_ACCT_ENT_DEL',data.pk,'form',false,false); //数据校验

		}else if(data.infRecType === '414'){
            verify.dataValidation('base','E_ACCT_INF_ENT_DEL',data.pk,'form',false,false); //数据校验

		}else if(data.infRecType === '424'){
            verify.dataValidation('base','E_CTRCT_INF_ENT_DEL',data.pk,'form',false,false); //数据校验
            
		}else if(data.infRecType === '314'){
            verify.dataValidation('base','E_BS_INF_DLT',data.pk,'form',false,false); //数据校验
            
		}else if(data.infRecType === '614'){
            verify.dataValidation('base','E_BALANCE_SHEET_DLT',data.pk,'form',false,false); //数据校验
            
		}else if(data.infRecType === '624'){
            verify.dataValidation('base','E_IN_COME_ENT_DEL',data.pk,'form',false,false); //数据校验
            
		}else if(data.infRecType === '634'){
            verify.dataValidation('base','E_CASH_FLOW_ENT_DEL',data.pk,'form',false,false); //数据校验
            
		}else if(data.infRecType === '644'){
            verify.dataValidation('base','E_ASSETS_DEBT_ENT_DEL',data.pk,'form',false,false); //数据校验
            
		}else if(data.infRecType === '654'){
            verify.dataValidation('base','E_IN_OUT_ENT_DEL',data.pk,'form',false,false); //数据校验
            
		}
	
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
	  popIndex = layer.open({
			title: '详情',
			type: '1',
			content :$('#dialog'),
			area: ['70%', '70%']
		});
	  	$("#exampleSubmit").hide().css("visibility","hidden").addClass("hide");
	  	$("#close").hide();
	  	$("#errorMessage").show();
		$("#infRecType").val(data.infRecType);
		$("#name").val(data.name);	
		$("#idType").val(data.idType);
		$("#idNum").val(data.idNum);
		$("#delEndDate").val(data.delEndDate);
		$("#delStartDate").val(data.delStartDate);
		$("#infSurcCode").val(data.infSurcCode);	
		$("#sheetYear").val(data.sheetYear);
		$("#sheetType").val(data.sheetType);	
		$("#sheetTypeDivide").val(data.sheetTypeDivide);
		$("#rptDate").val(data.rptDate);
		form.render('select');
		initPopindex(data.infRecType);
		if(data.infRecType ==='413' || data.infRecType ==='423' || data.infRecType ==='443'){
			$.ajax({
				url:'dataDictCode/selectCodeListByUperId.do', 
				data:{uperId:$("#infRecType").find("option[value='"+data.infRecType+"']").data("id")},
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data1){
					selectAdd(data1.result,'delSgmtCode');
					$("#delSgmtCode").val(data.delSgmtCode);	
					form.render('select');
				}
			});
		}
		$("#delRecCode").val(data.delRecCode);
		form.val('exampleForm', data);
		form.render('select');
  }
});
 //新增按钮点击事件
table.on('toolbar(tableDemo)', function (obj) {
	switch (obj.event) {
		case 'addBtn':
			addOrUpdate = "add";
			$("#exampleSubmit").show().css("visibility","visible").removeClass("hide");
			$("#close").show();
			$("#errorMessage").hide();
			$(".layui-input").prop("disabled",false);
			$("select").prop("disabled",false);
			/*$("#infRecType").val('');
			$("#delRecCode").val('');
			$("#delSgmtCode").val('');
			$("#infSurcCode").val('');	
			$("#name").val('');	
			$("#idType").val('');	
			$("#idNum").val('');
			$("#feedBackError").val('');
			$("#rptDate").val('');*/
			$("#exampleForm")[0].reset();
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
				area: ['70%', '70%'],	
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
			 var rptDate = $('#rptDate').val();
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
	};
});
		//新增或更新的实际数据库操作  
		form.on('submit(exampleSubmit)', function(data){
			var para = {};
			/* para.pk=$("#pbyInAcctDelId").val();
			 console.log(pbyInAcctDelId);*/
			 para.pk=$("#exampleSubmit").data("id");
			 para.infRecType  = $("#infRecType").val();
			 para.delStartDate = $("#delStartDate").val();
			 para.delEndDate = $("#delEndDate").val();
			 para.delRecCode = $("#delRecCode").val();
			 para.name = $("#name").val();
			 para.idType = $("#idType").val();
			 para.idNum = $("#idNum").val();
			 para.delSgmtCode = $("#delSgmtCode").val();
			 para.infSurcCode = $("#infSurcCode").val();	
			 para.sheetYear = $("#sheetYear").val();
			 para.sheetType = $("#sheetType").val();	
			 para.sheetTypeDivide =	$("#sheetTypeDivide").val();
			 para.rptDate = $("#rptDate").val();
		   $.ajax({
		     //请求方式
		     type : "POST",
		     //请求地址
		     url : "entDelAccount/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
		     //数据，json字符串
		     data : para,
		     //请求成功
		     success : function(result) {
		  	   if(result.success == true){
		  		 dataObj = para;
		  	   	  layer.msg('操作成功', {time:3000});
		   	      layer.close(popIndex);
		   	   if(dataObj.infRecType === '413'){
		           verify.dataValidation('base','E_ACCT_INF_DEL',dataObj.pk,'form',true,false,true); //数据校验
				    }else if(dataObj.infRecType === '443'){
			            verify.dataValidation('base','E_SEC_ACCT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			
					}else if(dataObj.infRecType === '423'){
			            verify.dataValidation('base','E_CTRCT_INF_DEL',dataObj.pk,'form',true,false,true); //数据校验
			
					}else if(dataObj.infRecType === '444'){
			            verify.dataValidation('base','E_SEC_ACCT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			
					}else if(dataObj.infRecType === '414'){
			            verify.dataValidation('base','E_ACCT_INF_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			
					}else if(dataObj.infRecType === '424'){
			            verify.dataValidation('base','E_CTRCT_INF_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			            
					}else if(dataObj.infRecType === '314'){
			            verify.dataValidation('base','E_BS_INF_DLT',dataObj.pk,'form',true,false,true); //数据校验
			            
					}else if(dataObj.infRecType === '614'){
			            verify.dataValidation('base','E_BALANCE_SHEET_DLT',dataObj.pk,'form',true,false,true); //数据校验
			            
					}else if(dataObj.infRecType === '624'){
			            verify.dataValidation('base','E_IN_COME_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			            
					}else if(dataObj.infRecType === '634'){
			            verify.dataValidation('base','E_CASH_FLOW_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			            
					}else if(dataObj.infRecType === '644'){
			            verify.dataValidation('base','E_ASSETS_DEBT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			            
					}else if(dataObj.infRecType === '654'){
			            verify.dataValidation('base','E_IN_OUT_ENT_DEL',dataObj.pk,'form',true,false,true); //数据校验
			            
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
			});
		});
  });
