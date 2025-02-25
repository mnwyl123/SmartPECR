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
	 var form = layui.form,
	  element = layui.element,
	  table = layui.table,
	  layer = layui.layer, //获取layer模块
	  laypage = layui.laypage, //获取laypage模块
	  laytpl = layui.laytpl, //获取laytpl模块  模板引擎
	  laydate = layui.laydate;
	  require(['static/js/pecr/module/base'],function (base){
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
					var array = ['INDV_INFRECTYPE_UPDATE'];
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
									if (data.result[i].INDV_INFRECTYPE_UPDATE){
										selectAdd(data.result[i].INDV_INFRECTYPE_UPDATE,'infRecType');
										selectAdd(data.result[i].INDV_INFRECTYPE_UPDATE,'infRecType1');
								}	
								form.render('select');
							}
							}
					    });
			        };
			        //初始化常量枚举值
			        initEnumerationValue();
			    	/**
			    	 * 监听变更类型切换
			    	
			    	form.on('select(infRecType)', function(data){
			    		$.ajax({
			    			url:'dataDictCode/selectCodesListByUperId.do', 
			    			data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
			    			type:'post',  
			    			cache:false,  
			    			dataType:'json',  
			    			success:function(data){
			    				for(var i=0;i<data.result.length;i++){
										selectAdd(data.result[i].COLUMN,'updateSgmtCode');
									    selectAdd(data.result[i].ACCT,'acctType');
									    form.render('select');
			    				}
			    			}
			    		});
			    	});
			    	 */
			    	
			        
			        /**
			    	 * 监听变更类型切换
			    	 */
			    	form.on('select(infRecType1)', function(data){
			    		$.ajax({
			    			url:'dataDictCode/selectCodesListByUperId.do', 
			    			data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
			    			type:'post',  
			    			cache:false,  
			    			dataType:'json',  
			    			success:function(data){
			    				for(var i=0;i<data.result.length;i++){
									selectAdd(data.result[i].COLUMN,'updateSgmtCode');
								    selectAdd(data.result[i].ACCT,'acctType');
								    form.render('select');
		    				}
			    			}
			    		});
			    	});
    table.render({
    elem: '#tableDemo' //表格所固定的div
    ,id:'pbyInMdfcId'
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'upDaccountData/dataList.do' //url 
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框   
      ,{align : "center",field: 'infRecType', title: '信息记录类型',templet: function(d){return renderColDict(d, 'INDV_INFRECTYPE_ACCOUNT','infRecType')}}
      ,{align : "center",field: 'acctType', title: '账户类型'}
      ,{align : "center",field: 'updateRecCode', title: '待更正业务标识码'}
      ,{align : "center",field: 'updateSgmtCode', title: '待更正段段标'}
      ,{align : "center",field: 'updateStartDate', title: '待更正起始日期'}
      ,{align : "center",field: 'updateEndDate', title: '待更正结束日期'}
	  ,{align : "center",field: 'operatorUser', title: '操作员'}
	  ,{align : "center",fixed: 'right', title:'操作', toolbar: '#barDemo', width:200} //行上的工具栏
    ]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 5 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [5, 10, 15],
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
  
//检索
  $("#queryBtn").on('click', function(){
      table.reload('tableDemo', {'where':{'infRecType':$('#infRecType').val(), 'acctType':$('#acctType').val(), 'updateRecCode':$('#updateRecCode').val(), 'updateSgmtCode':$('#updateSgmtCode').val(), 'updateStartDate':$('#updateStartDate').val(), 'updateEndDate':$('#updateEndDate').val(), 'operatorUser':$('#operatorUser').val()}});
	  return false;
  });
//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
table.on('tool(tableDemo)', function(obj){
  var data = obj.data;
  if(obj.event === 'del'){
    layer.confirm('真的删除行么', function(index){
 	  $.ajax({
 	       //请求方式
 	       type : "POST",
 	       //请求地址
 	       url : "upDaccountData/delete.do",
 	       //数据，json字符串
 	       data : data,
 	       //请求成功
 	       success : function(result) {
 	    	  layer.msg('删除成功', {time:3000});
 	         table.reload('tableDemo', {'where':{'infRecType':$('#infRecType').val(), 'acctType':$('#acctType').val(), 'updateRecCode':$('#updateRecCode').val(), 'updateSgmtCode':$('#updateSgmtCode').val(), 'updateStartDate':$('#updateStartDate').val(), 'updateEndDate':$('#updateEndDate').val(), 'operatorUser':$('#operatorUser').val()}});
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
  	popIndex = layer.open({
			type :'1',
			title :'修改信息',
			content :$('#dialog'),
			area: ['40%', '70%']			
		});
  	//将该行数据在form中回显
  	form.val('exampleForm', data);
  	form.render('select');
  	//下面批量设置只读的操作可以在数据详情界面补录和查看时批量增加或删除readOnly属性，而不用在每个input组件上单个判断
  	//$("input").attr('readonly', true);
  	//$("textarea").attr('readonly', true);
  }
  else if(obj.event === 'more'){
  	layer.open({
		  title: '详情',
		  type: '1',
		  content :$('#dialog'),
		  area: ['40%', '70%']
		});
	form.val('exampleForm', data);
	form.render('select');
  }
});
 //新增按钮点击事件
$('#addBtn').on('click', function(){
	
	addOrUpdate = "add";
	//新增时对弹出框中的form数据清空
	form.val('exampleForm', {'infRecType':'', 'acctType':'', 'updateRecCode':'','updateSgmtCode':'','updateStartDate':'','updateEndDate':''});
    popIndex = layer.open({
		type :'1',
		title :'新增用户',
		content :$('#dialog'),
		area: ['40%', '70%']			
	});
  });
//新增或更新的实际数据库操作
form.on('submit(exampleSubmit)', function(data){	
	   $.ajax({
	     //请求方式
	     type : "POST",
	     //请求地址
	     url : "upDaccountData/addOrUpdateUser.do?addOrUpdate="+addOrUpdate,
	     //数据，json字符串
	     data : data.field,
	     //请求成功
	     success : function(result) {
	  	   if(result.success == true){
	   	   	  layer.msg('操作成功', {time:3000});
	   	      table.reload('tableDemo', {'where':{'infRecType':$('#infRecType').val(), 'acctType':$('#acctType').val(), 'updateRecCode':$('#updateRecCode').val(), 'updateSgmtCode':$('#updateSgmtCode').val(), 'updateStartDate':$('#updateStartDate').val(), 'updateEndDate':$('#updateEndDate').val(), 'operatorUser':$('#operatorUser').val()}});
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

	  });
  });