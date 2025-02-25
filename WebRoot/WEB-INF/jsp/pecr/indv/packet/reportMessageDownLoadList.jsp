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
     					<input type="text" class="layui-input"  autocomplete="off" id="rptDate" name="rptDate" placeholder=" - ">
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">报文状态</label>
				  <div class="layui-input-inline">
				  	<select  lay-search="" id="reportMessageStatus" name="reportMessageStatus">
					  <option value="">请选择</option>								 
					</select>
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
	<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="generateMessage" id="generateMessage">txt报文下载 <i class="layui-icon layui-icon-download-circle"></i></button>
	<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="generateEncMessage" id="generateEncMessage">enc报文下载 <i class="layui-icon layui-icon-download-circle"></i></button>
	<button class="layui-btn layui-btn-xs layui-btn-radius"  lay-event="showFeedback" id="showFeedback">错误文件下载 <i class="layui-icon layui-icon-download-circle"></i></button>
	<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="feedAllSuccess" id="feedAllSuccess">反馈全部成功 <i class="layui-icon layui-icon-note"></i></button>

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

//初始化性别下拉字典
initDict('reportMessageStatus', staticDict.reportMessageStatus);
initDict('infRecType', staticDict.infRecTypeIndv);

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
				var array = ['REPORT_STATUS'];
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
							if (data.result[i].REPORT_STATUS){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].REPORT_STATUS},
									containerId : "reportMessageStatus"
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
		 	//initEnumerationValue();
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
	,url:'indvMessageDownLoad/dataList.do' //url
    ,cols: [[ 
      {type:'numbers', fixed: 'left', width:50}	//列每行序号
      ,{type:'checkbox', width:50} //列复选框
      ,{field: 'report_message_file_name', align:'center', title: '报送报文文件名',width:280}
      ,{field: 'report_message_type', align:'center' , title: '报送报文类型',width:240,templet: function(d){return renderColumnDict(d, 'report_message_type', staticDict.infRecTypeIndv)}}
      ,{field: 'record_num', align:'center', title: '报文记录数'}
      ,{field: 'report_time', align:'center', title: '报送时间'}
      ,{field: 'create_time', align:'center', title: '生成时间'}
      ,{field: 'operator_user', align:'center', title: '操作人'}
	  ,{field: 'report_message_status', align:'center', title:'报文状态', templet: function(d){return renderColumnDict(d, 'report_message_status', staticDict.reportMessageStatus)}} //行上的工具栏
	  ,{field: 'description', align:'center', title: '反馈说明'}
    ]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 15 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [15, 30, 50]
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
		  where: {'rptDate':$('#rptDate').val(), 'infRecType':$('#infRecType').val(), 'reportMessageStatus':$('#reportMessageStatus').val()}}); 
	  return false;
  });
  //下载报文按钮点击事件
  table.on('toolbar(tableDemo)', function(obj){
	   if(obj.event === 'showFeedback') {
			//获取选中的行信息
  			 var checkStatus = table.checkStatus('tableDemo');
  			 //获取选中行的数据
  			 data=checkStatus.data;
  			 if(data.length==0){
  				layer.msg("请选择需要查看报文对应的错误文件!");
  				return ;
  			} else{
  			 	var str = "";
				for(var i=0; i<data.length; i++ ){
					str += checkStatus.data[i].FEEDBACK_MESSAGE_FILE_PATH+";";
					if(checkStatus.data[i].report_message_status != '20'
							&& checkStatus.data[i].report_message_status != '50'
							&& checkStatus.data[i].report_message_status != '70'
							&& checkStatus.data[i].report_message_status != '80'){
						layer.msg("报文状态为：预处理全失败；预处理部分失败才会存在错误文件，请重新选择！");
						return ;
					}
				}
				str = str.substr(0, str.length - 1);
				str = str.replace(/\\/g, '3tf55yh656jj644');
				layer.confirm('确定要下载选中的数据的报文吗？', {icon: 3, title: '提示信息'}, function (index){
					window.location.href='<%=basePath%>indvMessageDownLoad/download.do?DATA_IDS='+str; 	
					layer.close(index);
		  		});
  			}
		}else if(obj.event === 'generateMessage') {
			 //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 if(data.length==0){
				layer.msg("请选择需要下载的txt报文！");
				return ;
			}
		 	var str = "";
			for(var i = 0; i < data.length; i++){
				str+=checkStatus.data[i].txt_report_message_file_path+";"
			}
			str = str.substr(0, str.length - 1);
			str = str.replace(/\\/g, '3tf55yh656jj644');
			layer.confirm('确定要下载选中的数据的报文吗？', {icon: 3, title: '提示信息'}, function (index){
				window.location.href='<%=basePath%>indvMessageDownLoad/download.do?DATA_IDS='+str;
				layer.close(index);
	  		});
		}else if(obj.event === 'generateEncMessage') {
			 //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 if(data.length==0){
					layer.msg("请选择需要下载的enc报文 ");
					return ;
				}
			 	var str = "";
				for(var i = 0; i < data.length; i++){
					str+=checkStatus.data[i].enc_report_message_file_path+";"
					if(checkStatus.data[i].report_message_status != '60'){
						layer.msg("存在报文状态不是预处理成功的数据记录，请重新选择！");
						return ;
					}
				}
				str = str.substr(0, str.length - 1);
				str = str.replace(/\\/g, '3tf55yh656jj644');
				layer.confirm('确定要下载选中的数据的报文吗？', {icon: 3, title: '提示信息'}, function (index){
					window.location.href='<%=basePath%>indvMessageDownLoad/download.do?DATA_IDS='+str;
					layer.close(index);
		  		});
		}else if(obj.event === 'feedAllSuccess') {
			 //获取选中的行信息
			 var checkStatus = table.checkStatus('tableDemo');
			 //获取选中行的数据
			 data=checkStatus.data;
			 if(data.length==0){
				 layer.msg("请选择报文状态是预处理成功的数据记录!");
				 return ;
			 }
			 var str = "";
			for(var i = 0; i < data.length; i++){
				str+=checkStatus.data[i].report_message_type+","+checkStatus.data[i].report_message_file_name+";"
				if(checkStatus.data[i].report_message_status != '60'){
					layer.msg("存在报文状态不是预处理成功的数据记录，请重新选择！");
					return ;
				}
			}
			str = str.substr(0, str.length - 1);
			layer.confirm('是否确定选中的报文全部反馈成功？', {icon: 3, title: '提示信息'}, function (index){
				$.ajax({
					type : "POST",  //请求方式
					url : "indvMessageDownLoad/changeReportStatusAllSucc.do", //请求地址
					data : {str:str},           //数据，json字符串
					success : function(result) { //请求成功
						layer.msg(result.msg, {time:3000});
						 table.reload('tableDemo', {
							  method : 'post',
							  where: {'rptDate':$('#rptDate').val(), 'infRecType':$('#infRecType').val(), 'reportMessageStatus':$('#reportMessageStatus').val()}}); 
					},
					error : function(e){ //请求失败，包含具体的错误信息
						layer.alert('生成出错,错误信息如下:<br>' + e.responseText);
					}
				});
			});
		}
	
  });
	   
})
   

 
</script>
</body>
</html>
