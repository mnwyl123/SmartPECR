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
				  <label class="layui-form-label">提取日期</label>
				  <div class="layui-input-inline">
     					<input type="text" class="layui-input" id="rptDate" name="rptDate" placeholder=" - ">
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">信息记录类型</label>
				  <div class="layui-input-inline">
				  	<select  lay-search="" id="infRecType" name="infRecType">
					  <option value="">请选择</option>										 
					</select>
				  </div>
				</div>
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div> 

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
 
</script>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">
	<button class="layui-btn layui-btn-xs layui-btn-radius"  lay-event="messageBtn" id="generateMessage">txt报文下载 <i class="layui-icon layui-icon-download-circle"></i></button>
	<button class="layui-btn layui-btn-xs layui-btn-radius"  lay-event="encMessageBtn" id="generateEncMessage">enc报文下载 <i class="layui-icon layui-icon-download-circle"></i></button>
	<button class="layui-btn layui-btn-xs layui-btn-radius"  lay-event="uploadViewBtn" id="generateUploadView">回执上传 <i class="layui-icon layui-icon-upload-circle"></i></button>
	<button class="layui-btn layui-btn-xs layui-btn-radius"  lay-event="showFeedbackBtn" id="showFeedback">查看反馈详情 <i class="layui-icon layui-icon-file-b"></i></button>

</script>
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript"
			src="plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript"
            src="plugins/attention/zDialog/zDialog.js"></script>
<script type="text/javascript">

//初始化性别下拉字典
initDict('idType', enterDict.sex);
initDict('infRecType', enterDict.entSpDown);
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
				var array = ['ENDV_INFRECTYPE','REPORT_STATUS'];
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
							if (data.result[i].ENDV_INFRECTYPE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].ENDV_INFRECTYPE},
									containerId : "infRecType"
								});
								continue;
							}
						}
		                form.render('select');
//		                d1.resolve("渲染完成");
					}	     
			    });
		    };
		    //初始化常量枚举值
		    initEnumerationValue();
		});
 // form.render('select');
  laydate.render({
	  elem: '#rptDate'
	  ,range: true	
  });
//展示已知数据  
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarHead'  //表格顶部工具栏
	,url:'indvMessageDownLoad/dataList.do?type=entSp' //url
    ,cols: [[ 
      {type:'numbers', fixed: 'left', width:50}	//列每行序号
      ,{type:'checkbox', width:50} //列复选框
      ,{field: 'REPORT_MESSAGE_FILE_NAME', align:'center', title: '报送报文文件名'}
      ,{field: 'REPORT_MESSAGE_TYPE', align:'center' , title: '报送报文类型',templet: function(d){return renderColumnDict(d, 'report_message_type', enterDict.entAbnlMesPage)}}
//      ,{field: 'report_message_status', align:'center', title: '报文状态'} //列上要显示字典描述，renderColumnDict中第2个参数为当前列的field值，第3个参数为具体哪个字典变量
//      ,{field: 'create_success_time', align:'center', title: '创建完成时间'}
      ,{field: 'RECORD_NUM', align:'center', title: '报文记录数'}
      ,{field: 'REPORT_TIME', align:'center', title: '报送时间'}
	  ,{fixed: 'REPORT_MESSAGE_STATUS', align:'center', width:200 , title:'报文状态',fixed: 'right', templet: function(d){return renderColumnDict(d, 'REPORT_MESSAGE_STATUS', enterDict.reportMessageStatus)}} //行上的工具栏
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
	  table.reload('tableDemo', {
		  method : 'post',
		  where: {'rptDate':$('#rptDate').val(), 'infRecType':$('#infRecType').val()}}); 
	  return false;
  });
  //生成报文按钮点击事件
   table.on('toolbar(tableDemo)', function(obj){
     	//下载报文按钮点击事件  穆楠
		if(obj.event === 'messageBtn') {
			 //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var normalOrAbnormal ="indvnormal";
			 if(data.length==0){
					layer.msg("请选择需要生成报文的行");
					return ;
				}
			 	var str = "";
				for(var i = 0; i < data.length; i++){
					str+=checkStatus.data[i].TXT_REPORT_MESSAGE_FILE_PATH+","+checkStatus.data[i].REPORT_MESSAGE_FILE_NAME+";"
				}
				str = str.substr(0, str.length - 1);
				str= str.replace(/\\/g,'3tf55yh656jj644');
				layer.confirm('确定要下载选中的数据的报文吗？', {icon: 3, title: '提示信息'}, function (index){
					layer.msg('正在生成报文请稍后查看', {time:3000});
					window.location.href='<%=basePath%>indvMessageDownLoad/download.do?DATA_IDS='+str;
		  		});
		}
		//下载enc报文按钮点击事件
		if(obj.event === 'encMessageBtn') {
			 //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var normalOrAbnormal ="indvnormal";
			 if(data.length==0){
					layer.msg("请选择需要生成报文的行");
					return ;
				}
			 	var str = "";
				for(var i = 0; i < data.length; i++){
					str+=checkStatus.data[i].ENC_REPORT_MESSAGE_FILE_PATH+","+checkStatus.data[i].REPORT_MESSAGE_FILE_NAME+";"
				}
				str = str.substr(0, str.length - 1);
				str= str.replace(/\\/g,'3tf55yh656jj644');
				layer.confirm('确定要下载选中的数据的报文吗？', {icon: 3, title: '提示信息'}, function (index){
					layer.msg('正在生成报文请稍后查看', {time:3000});
					window.location.href='<%=basePath%>indvMessageDownLoad/download.do?DATA_IDS='+str;
		  		});
		}
		/* 上传并解析报文 */
		if(obj.event === 'uploadViewBtn') {
			var diag = new Dialog();
		      diag.Width = 400;
		      diag.Height = 170;
		      diag.Title = "上传并解析反馈报文";
		      diag.URL = '<%=basePath%>indvMessageDownLoad/generateUploadView.do';
		      diag.OKEvent = function() { //点击确定后调用的方法
		    	  if(diag.innerFrame.contentWindow.document.getElementById("tishi").style.display=="block"){
		    		  return;
		    	  }
		          var fileInput = diag.innerFrame.contentWindow.document.getElementById('files').files;
		          if(fileInput.length ==0 ){
		        	  diag.innerFrame.contentWindow.document.getElementById("tishi").style.display="block";
		        	  return;
		          }
				  var formData = new FormData();
				//源码
				  //formData.append("file", fileInput);
				  //韦宗英  update
				  formData.append("file", fileInput[0]);
				  //韦宗英  add
				  formData.append("isLocal", true);
				    diag.close();

				  var index = layer.msg('报文反馈中......',{
					  icon:16,
					  shade:0.3,
					  time:false
				  })
		          $.ajax({
		        	  url: '<%=basePath%>reportFeedBack/importFeedBackReport.do',
		              type : "post",
		              data : formData,
		              cache:false,
					  Async:false,
					  processData : false,
					  contentType : false,
					  success : function(data) {
							if (data == "true") {
								//diag.close();
								layer.msg("文件上传失败");
							} else {
								//diag.close();
								layer.msg("文件上传成功");
							}
							layer.close(index);
						},
						error:function(){
							//diag.close();
							layer.msg("文件上传失败");
							layer.close(index);
						}
		          });
		      diag.show();
		      diag.okButton.value=" 上传 ";
		      diag.cancelButton.value=" 取消 ";
		}
		//查看反馈详情  li
		if(obj.event === 'showFeedbackBtn') {
			  //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var normalOrAbnormal ="indvnormal";
			 if(data.length==0){
					layer.msg("请选择需要查看反馈详情的报文!");
					return ;
				}
			else if(data.length>1){
					layer.msg("只能选择查看一条报文反馈!");
					return ;
				}else{
				 	var str = "";
				 	<%-- str += checkStatus.data[0].report_message_status;
				 	if(str == 30){
				 		layer.alert('该报文反馈成功!');
				 	}else if(str == 40){
				 		str = "" + checkStatus.data[0].report_message_file_name;
				 		str= str.replace(/\\/g,'3tf55yh656jj644');
						window.location.href='<%=basePath%>indvMessageDownLoad/feedbackShow.do?REPORT_MESSAGE_FILE_NAME='+str; 	
				 	}else{
				 		layer.alert('该报文未反馈!');
				 	} --%>
				 	str = "" + checkStatus.data[0].report_message_file_name;
			 		str= str.replace(/\\/g,'3tf55yh656jj644');
					window.location.href='<%=basePath%>indvMessageDownLoad/feedbackShow.do?REPORT_MESSAGE_FILE_NAME='+str+'&REPORT_STATUS=1'; 	
				}
		}else if(obj.event === 'showFeedback2') {
			   //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var normalOrAbnormal ="indvnormal";
			 if(data.length==0){
					layer.msg("请选择需要查看反馈详情的报文!");
					return ;
				}
			else if(data.length>1){
					layer.msg("只能选择查看一条报文反馈!");
					return ;
				}else{
				 	var str = "";
				 	<%-- str += checkStatus.data[0].REPORT_MESSAGE_STATUS;
				 	if(str == 30){
				 		layer.alert('该报文反馈成功!');
				 	}else if(str == 40||str == 70||str == 80||str == 80){
				 		str = "" + checkStatus.data[0].REPORT_MESSAGE_FILE_NAME;
				 		str= str.replace(/\\/g,'3tf55yh656jj644');
				 		
						window.location.href='<%=basePath%>indvMessageDownLoad/feedbackShow.do?REPORT_MESSAGE_FILE_NAME='+str; 	
				 	}else{
				 		layer.alert('该报文未反馈!');
				 	} --%>
				 	str = "" + checkStatus.data[0].REPORT_MESSAGE_FILE_NAME;
			 		str= str.replace(/\\/g,'3tf55yh656jj644');
			 		
					window.location.href='<%=basePath%>indvMessageDownLoad/feedbackShow.do?REPORT_MESSAGE_FILE_NAME='+str+'&REPORT_STATUS=0'; 	
				}
	         $.ajax({
		        	  url: '<%=basePath%>reportFeedBack/importFeedBackReport.do',
		              type : "post",
		              data : formData,
		              cache:false,
					  Async:false,
					  processData : false,
					  contentType : false,
					  success : function(data) {
							if (data == "true") {
								diag.close();
								layer.msg("文件上传失败");
							} else {
								diag.close();
								layer.msg("文件上传成功");
							}
						},
						error:function(){
							diag.close();
							layer.msg("文件上传失败");
						}
		          });
		      };
		      diag.show();
		      diag.okButton.value=" 上传 ";
		      diag.cancelButton.value=" 取消 ";
		}
		//查看反馈详情  li
		if(obj.event === 'showFeedbackBtn') {
			  //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 var normalOrAbnormal ="indvnormal";
			 if(data.length==0){
					layer.msg("请选择需要查看反馈详情的报文!");
					return ;
				}
			else if(data.length>1){
					layer.msg("只能选择查看一条报文反馈!");
					return ;
				}else{
				 	var str = "";
				 	str += checkStatus.data[0].report_message_status;
				 	if(str == 30){
				 		layer.alert('该报文反馈成功!');
				 	}else if(str == 40){
				 		str = "" + checkStatus.data[0].report_message_file_name;
				 		str= str.replace(/\\/g,'3tf55yh656jj644');
						window.location.href='<%=basePath%>indvMessageDownLoad/feedbackShow.do?REPORT_MESSAGE_FILE_NAME='+str; 	
				 	}else{
				 		layer.alert('该报文未反馈!');
				 	}
				}
		}
	});
 }) 
 
</script>
</body>
</html>
