<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
<!-- 一些额外的css -->
<link rel="stylesheet" href="plugins/layui/css/admin.css" media="all">
<!-- 客户化后的css，调整了字体和宽度等 -->
<link rel="stylesheet" href="plugins/layui/css/layui.custom.css" media="all">
</head>
<body>  
<input type="hidden" id="messageNamePd" value='${messageNamePd.REPORT_MESSAGE_NAME}'>
<div class="wrap">
	<div class="layui-form layui-form-pane" id="queryPanel">
		<div class="layui-colla-item">
		  <h3 class="layui-colla-title">数据检索
			<button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius pane-title-btn" id="queryBtn">
				查询  <i class="layui-icon layui-icon-search"></i>  
			</button> 
		  </h3>	
		  <div class="layui-colla-content layui-show" style="margin:1px 1px 0px 0px">
			<div class="layui-form-item">
				
				<div class="layui-inline">
				  <label class="layui-form-label">报文文件名</label>
				  <div class="layui-input-inline">
				
					<input type="text" name="reportMessageName" id="reportMessageName" autocomplete="off" class="layui-input"/>								
				  </div>
				</div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">短信通知状态</label>
				  <div class="layui-input-inline">
				  	<select  lay-search="" id="sendFeedbackState" name="sendFeedbackState">
					  <option value="">请选择</option>										 
					</select>
				  </div>
				</div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">贷款业务标识号</label>
				  <div class="layui-input-inline">
					<input type="text" name="acctCode" id="acctCode" autocomplete="off" class="layui-input"/>								
				  </div>
				</div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">证件类型</label>
				  <div class="layui-input-inline">
				  	<select  lay-search="" id="idType" name="idType">
					  <option value="">请选择</option>										 
					</select>
				  </div>
				</div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">证件号码</label>
				  <div class="layui-input-inline">
					<input type="text" name="idNum" id="idNum" autocomplete="off" class="layui-input"/>								
				  </div>
				</div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">姓名</label>
				  <div class="layui-input-inline">
					<input type="text" name="name" id="name" autocomplete="off" class="layui-input"/>								
				  </div>
				</div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">客户电话</label>
				  <div class="layui-input-inline">
					<input type="text" name="cellPhone" id="cellPhone" autocomplete="off" class="layui-input"/>								
				  </div>
				</div>
				
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div> 



<!-- 详情界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="dialog">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;">
			
			<div class="layui-inline">
			  <label class="layui-form-label">上报报文名</label>
			  <div class="layui-input-inline">
				<input type="text" name="REPORT_MESSAGE_NAME" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">账户标识码</label>
			  <div class="layui-input-inline">
				<input type="text" name="ACCT_CODE" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">结算/应还款日</label>
			  <div class="layui-input-inline">
				<input type="text" name="SETT_DATE" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">证件类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="idType_detail" readonly name="idType_idType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">证件号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="ID_NUM" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">客户姓名</label>
			  <div class="layui-input-inline">
				<input type="text" name="NAME" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">客户手机号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="CELL_PHONE" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">当前逾期期数</label>
			  <div class="layui-input-inline">
				<input type="text" name="OVERD_PRD" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">当前逾期总额</label>
			  <div class="layui-input-inline">
				<input type="text" name="TOT_OVERD" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">短信发送状态</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="sendFeedbackState_detail" readonly name="sendFeedbackState_detail">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			
			
			<div class="layui-inline">
			  <label class="layui-form-label">短信通知时间</label>
			  <div class="layui-input-inline">
				<input type="text" name="INFORM_TIME" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			
			<div class="layui-inline">
			  <label class="layui-form-label">全局流水号</label>
			  <div class="layui-input-inline">
				<input type="text" name="GLOBAL_SERIAL_NO" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">短信文本</label>
			  <div class="layui-input-inline">
				<input type="text" name="SEND_TEXT" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
		</div>
	</form>	
</div>





<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
 	<a class="layui-btn layui-btn-xs-column-toolbar" lay-event="detail">详情</a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">
	<button class="layui-btn layui-btn-xs layui-btn-radius" id="InformGivenStatusCount">特定状态短信重复通知 <i class="layui-icon layui-icon-file-b"></i></button>

</script>



<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript"
			src="plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript"
            src="plugins/attention/zDialog/zDialog.js"></script>
<script type="text/javascript">

//弹出层id
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;
//获取checkbox选中的数据
var date;


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
		    var initEnumerationValue = function(){
				var array = ['ID_TYPE','SEND_FEEDBACK_STATE'];
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
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ID_TYPE},
									containerId : "idType_detail"
								});
								continue;
							}else if(data.result[i].SEND_FEEDBACK_STATE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].SEND_FEEDBACK_STATE},
									containerId : "sendFeedbackState"
								});
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].SEND_FEEDBACK_STATE},
									containerId : "sendFeedbackState_detail"
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

		  
		  
		//展示已知数据  
		  table.render({
		    elem: '#tableDemo' //表格所固定的div
			,toolbar: '#toolbarHead'  //表格顶部工具栏
			,url:'indvTextMsgInform/dataList.do?REPORT_MESSAGE_NAME_QJ='+$('#messageNamePd').val() //url
		    ,cols: [[ 
		      {type:'numbers', fixed: 'left', width:50}	//列每行序号
		      ,{type:'checkbox', width:50} //列复选框
		      ,{field: 'REPORT_MESSAGE_NAME', align:'center', title: '报文文件名'}
		      ,{field: 'ACCT_CODE', align:'center', title: '账户标识码'}
		      ,{field: 'ID_TYPE', align:'center' , title: '证件类型',templet: function(d){return renderColumnDict(d, 'ID_TYPE', staticDict.idType)}}
		      ,{field: 'ID_NUM', align:'center', title: '证件号码'}
		      ,{field: 'NAME', align:'center', title: '客户姓名'}
		      ,{field: 'CELL_PHONE', align:'center', title: '客户电话'}
		      ,{field: 'SEND_FEEDBACK_STATE', align:'center' , title: '短信通知状态',templet: function(d){return renderColumnDict(d, 'SEND_FEEDBACK_STATE', staticDict.sendFeedbackState)}}
		      //,{field: 'INFORM_TIME', align:'center', title: '短信通知时间'}
		      ,{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
		    ]]
		    ,even: true  //行斑马线
			,page: true //是否分页
			,limit: 5 //初始每页显示条数
			,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
			,limits: [5, 10, 15]
			,done: function (res, curr, count) {
		        $('th').css({'background-color':'#0997F7',
					 'color':'#FFFFFF',
					 'font-family':'Microsoft Yahei',
					 'font-weight':'500',   //设置字体是否加粗
					 'font-size':'13px'});
			}
		  });
		
		
		
		  //查询按钮点击事件
		  $("#queryBtn").on('click', function(){
			  var REPORT_MESSAGE_NAME_QJ=$('#messageNamePd').val();
			  if(REPORT_MESSAGE_NAME_QJ==null || REPORT_MESSAGE_NAME_QJ==""){
				  table.reload('tableDemo', {
					  method : 'post',
					  where: {
						  'REPORT_MESSAGE_NAME': $('#reportMessageName').val(),
						  'SEND_FEEDBACK_STATE':$('#sendFeedbackState').val(),
						  'ACCT_CODE':$('#acctCode').val(),
						  'ID_TYPE':$('#idType').val(),
						  'ID_NUM':$('#idNum').val(),
						  'NAME':$('#name').val(),
						  'CELL_PHONE':$('#cellPhone').val()
					  }
				  }); 
			  }else{
				  table.reload('tableDemo', {
					  method : 'post',
					  where: {
						  
						  'SEND_FEEDBACK_STATE':$('#sendFeedbackState').val(),
						  'ACCT_CODE':$('#acctCode').val(),
						  'ID_TYPE':$('#idType').val(),
						  'ID_NUM':$('#idNum').val(),
						  'NAME':$('#name').val(),
						  'CELL_PHONE':$('#cellPhone').val()
					  }
				  }); 
			  }
			  return false;
		  });
		  
		 
		 //详情
		  table.on('tool(tableDemo)', function(obj){
			  form.val('exampleForm', {'REPORT_MESSAGE_NAME':'','SETT_DATE':'', 'ACCT_CODE':'', 'idType':'', 'ID_NUM':'', 'NAME':'', 'CELL_PHONE':'', 
					'OVERD_PRD':'', 'TOT_OVERD':'', 'sendFeedbackState':'', 'INFORM_TIME':'', 'GLOBAL_SERIAL_NO':'', 'SEND_TEXT':''});
			  var data = obj.data;
			  if(obj.event === 'detail'){
			    	//将该行数据在form中回显
			    	$("#idType_detail").val(data.ID_TYPE);
			    	$("#sendFeedbackState_detail").val(data.SEND_FEEDBACK_STATE);
			    	$("#idType_detail").attr("disabled",true);
			    	$("#sendFeedbackState_detail").attr("disabled",true);
			    	form.val('exampleForm', data);

			    	
			    	popIndex = layer.open({
						type :'1',
						title :'详情',
						content :$('#dialog'),
						area: ['40%', '80%']			
					});
			    	
			    }	
		  });
		 
		  
		  //查询按钮点击事件
		  $("#InformGivenStatusCount").on('click', function(){
			  var REPORT_MESSAGE_NAME_QJ = $('#messageNamePd').val();
			  if(REPORT_MESSAGE_NAME_QJ==null||REPORT_MESSAGE_NAME_QJ==""){
				  layer.msg("请由报文下载页面进入此页面调用该功能 ！");
				  return;
			  }else{
				  var SEND_FEEDBACK_STATE = $('#sendFeedbackState').val();
				  if(SEND_FEEDBACK_STATE==null ||SEND_FEEDBACK_STATE==""){
					  layer.msg("请在筛选框中对重发状态进行选择！");
					  return;
				  }else{
					  layer.confirm('确定要对发送状态为'+SEND_FEEDBACK_STATE+'的数据进行通知 ?', function(index){
						  	popIndex = layer.open({
					 			type:0,
					 			title:false,
					 			closeBtn:0,
					 			btn:false,
					 			content:"正在执行特定状态短信通知..."
					 			
					 		});
						  	$.ajax({
				        	  url: '<%=basePath%>indvTextMsgInform/sendInformGivenStatusCount.do?REPORT_MESSAGE_NAME='+REPORT_MESSAGE_NAME_QJ+'&SEND_FEEDBACK_STATE='+SEND_FEEDBACK_STATE,
				              type : "post",
				              cache:false,
							  Async:false,
							  processData : false,
							  contentType : false,
							  //请求成功
						       success : function(result) {
						    	   var message = result.message;
						    	   if(result.success == true){
						    		   sendInformGivenStatus(REPORT_MESSAGE_NAME_QJ,SEND_FEEDBACK_STATE,message);
						    		   
						     	   }else{
						     		  layer.alert(result.message);
						     	   }
						       },
						       //请求失败，包含具体的错误信息
						       error : function(e){
						    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
						       }
					       });
					  });
				  }
			  }
		  });
		 
		 
		function sendInformGivenStatus(REPORT_MESSAGE_NAME_QJ,SEND_FEEDBACK_STATE,message) {
			layer.confirm(message, function(index){
				popIndex = layer.open({
		 			type:0,
		 			title:false,
		 			closeBtn:0,
		 			btn:false,
		 			content:"正在执行特定状态短信通知..."
		 			
		 		});
				$.ajax({
		        	  url: '<%=basePath%>indvTextMsgInform/sendInformGivenStatus.do?REPORT_MESSAGE_NAME='+REPORT_MESSAGE_NAME_QJ+'&SEND_FEEDBACK_STATE='+SEND_FEEDBACK_STATE,
		              type : "post",              
		              cache:false,
					  Async:false,
					  processData : false,
					  contentType : false,
					  success : function(data) {		
						  layer.close(popIndex);
						  var messageGiven = data.message;
						  //alert(messageGiven);
						  layer.msg(messageGiven);				
						},
						error:function(){
							layer.close(popIndex);
							layer.msg("响应失败!");
						}
		          });
				
			});
		}
 }) 

 </script>
 </body>
 </html>

