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
				  <label class="layui-form-label">上报报文名(无后缀)</label>
				  <div class="layui-input-inline">
     					<input type="text" name="reportFile"  autocomplete="off" class="layui-input" id="reportFile" lay-verify="required">
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
				<div class="layui-inline">
				  <label class="layui-form-label">获取途径</label>
				  <div class="layui-input-inline">
				  	<select  lay-search="" id="isCheck" name="isCheck">
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
<a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="errorInfo" id="errorInfo">错误详情</a>
</script>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">
	<button class="layui-btn layui-btn-xs layui-btn-radius"  lay-event="generateUploadView" id="generateUploadView">反馈报文上传 <i class="layui-icon layui-icon-upload-circle"></i></button>
	<button class="layui-btn layui-btn-xs layui-btn-radius"  lay-event="feedbackTXTDownload"  id="feedbackTXTDownload">反馈报文txt下载<i class="layui-icon layui-icon-download-circle"></i></button>
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
<script type="text/javascript">

initDict('isCheck', staticDict.errorInfoResource);
$('#isCheck').val('1');
//弹出层id
var popIndex;
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
				var array = ['INFRECTYPE'];
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
							if (data.result[i].INFRECTYPE){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data.result[i].INFRECTYPE},
									containerId : "infRecType"
								});
								continue;
							}
						}
		                form.render('select');
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
	,url:'feedbackMessage/dataList.do' //url
    ,cols: [[ 
      {type:'numbers', fixed: 'left', width:50}	//列每行序号
      ,{type:'checkbox', width:50} //列复选框
      ,{field: 'REPORT_MESSAGE_TYPE', align:'center' , title: '报送报文类型',templet: function(d){return renderColumnDict(d, 'REPORT_MESSAGE_TYPE', staticDict.infRecTypePOE)}}
      ,{field: 'REPORT_MESSAGE_NAME', align:'center', title: '上报报文名'}
      ,{field: 'FEED_BACK_REPORT_NAME', align:'center', title: '反馈报文名'}
      ,{field: 'IS_CHECK', align:'center', title: '获取途径',templet: function(d){return renderColumnDict(d, 'IS_CHECK', staticDict.errorInfoResource)}}
      ,{align : "center",fixed: 'right', title:'操作', toolbar: '#opraBarRow'} //行上的工具栏
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
  
  function queryFun(){
	  table.reload('tableDemo', {
		  method : 'post',
		  where: {'reportFile':$('#reportFile').val(), 'infRecType':$('#infRecType').val(),'isCheck':$('#isCheck').val()}
	  }); 
  }
  
  
  //查询按钮点击事件
  $("#queryBtn").on('click', function(){
	  queryFun();
	  return false;
  });

  
//生成enc报文按钮点击事件
  table.on('toolbar(tableDemo)', function(obj){
  	   if(obj.event === 'feedbackTXTDownload') {
  		   //获取选中的行信息
  			 var checkStatus = table.checkStatus('tableDemo');
  			 //获取选中行的数据
  			 data=checkStatus.data;
  			 if(data.length==0){
  				layer.msg("请选择需要查看反馈详情的报文!");
  				return ;
  			} else{
  			 	var str = "";
				for(var i=0; i<data.length; i++ ){
					str += checkStatus.data[i].FEEDBACK_MESSAGE_FILE_PATH+";";
				}
				str = str.substr(0, str.length - 1);
				window.location.href='<%=basePath%>indvMessageDownLoad/download.do?DATA_IDS='+str; 	
  			}
  		}else if(obj.event === 'generateUploadView') {
  			var diag = new top.Dialog();
  		      diag.Width = 500;
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
  		          diag.innerFrame.contentWindow.document.getElementById("zhongxin2").style.display="block";
  		          diag.innerFrame.contentWindow.document.getElementById("jzts").style.display="none";
  				  var formData = new FormData();
  				  //formData.append("file", fileInput);
  				  //韦宗英  update
  				  formData.append("file", fileInput[0]);
  				  //韦宗英  add
  				  formData.append("isLocal", false);
  		          $.ajax({
  		        	  url: '<%=basePath%>reportFeedBack/importFeedBackReport.do',
  		              type : "post",
  		              data : formData,
  		              cache:false,
  					  Async:false,
  					  processData : false,
  					  contentType : false,
  					  success : function(data) {
  						  	diag.innerFrame.contentWindow.document.getElementById("zhongxin2").style.display="none";
  						  	diag.innerFrame.contentWindow.document.getElementById("jzts").style.display="block";
  							if (data.success) {
  								queryFun();
  								diag.close();
  								layer.msg("文件上传成功!!!"+data.msg, {time:3000});
  							} else {
  								queryFun();
  								diag.close();
  								layer.msg("文件上传失败!!!"+data.msg, {time:3000});
  							}
  						},
  						error:function(){
  							diag.innerFrame.contentWindow.document.getElementById("zhongxin2").style.display="none";
  							diag.innerFrame.contentWindow.document.getElementById("jzts").style.display="block";
  							diag.close();
  							layer.msg("文件上传失败", {time:3000});
  						}
  		          });
  		      };
  		      diag.show();
  		      diag.okButton.value=" 上传 ";
  		      diag.cancelButton.value=" 取消 ";
  		}
  	
     });
     
  table.on('tool(tableDemo)', function(obj){
	    var data = obj.data;
	    $("body").data("dataObj",data);
	    layer.open({
			type: 2,
			title: '错误详情',
			shadeClose: false,
			shade: [0.3, '#000'],
			area: ['100%', '100%'],
			anim: 2,
			resize: false,
			content: 'feedbackMessage/dataErrorInfoPage.do',
			end: function(){
				queryFun();
			}
		});
	  });
  
 }); 
 
</script>
</body>
</html>
