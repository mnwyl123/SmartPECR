<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>${pd.SYSNAME}</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
 <!-- <link rel="stylesheet" href="static/ace/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="static/ace/css/bootstrap.css" />
<link rel="stylesheet" href="static/ace/css/font-awesome.css" />
<!--page specific plugin styles
text fonts-->
<link rel="stylesheet" href="static/ace/css/ace-fonts.css" /> 
<!-- ace styles -->
<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
<link rel="stylesheet" type="text/css" href="css/smartsense/styleScroll.css">
<link rel="stylesheet" type="text/css" href="css/smartsense/main.css" />

<!--查看图片插件 -->
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/zoomimage.css" />
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/custom.css" />
<script type="text/javascript" src="plugins/zoomimage/js/eye.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/utils.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/zoomimage.js"></script>
<script type="text/javascript" src="plugins/zoomimage/js/layout.js"></script>
<!--查看图片插件 -->
</head>
<body class="no-skin" onkeydown="KeyDown()">
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<form action="pictures/list.do" method="post" name="Form" id="Form">
					<!-- 检索  -->
					<fieldset class="hidden-xs " id="fieldset1">
						<c:if test="${QX.query == 1 }">
							<div class="row style_m">
								<div class="col-xs-3 text-right">
									<label>关键字搜索:</label>
								</div>
								<div class="col-xs-3">
									<input value="${pd.keywords }"  type="text" name="keywords" id="keywords" placeholder="搜&nbsp;索..." title="" />
								</div>
							</div>
							<div>
								<input type="button" value="查   询" class="button btn-orange" onclick="searchs();" />
							</div>
						</c:if>
					</fieldset>
					<!-- end检索 -->
					<div class="tab">
						<table class="margin-5 width-100">
							<tr>
								<td class="text-left jianju" style="margin-left:10px;">
									<c:if test="${QX.add == 1 }">
										<div class="btn-group jianju" >
										<a class="btn btn-mini" onclick="add();"><i class="iconfont icon-tianjia"></i></a>
										</div>
									</c:if> 
									<c:if test="${QX.batchDelete == 1 }">
									  <div class="btn-group jianju2" >
										<a title="批量删除" class="btn btn-mini"
											onclick="makeAll('确定要删除选中的数据吗?');">
											<i class='iconfont icon-shape7'></i></a>
									  </div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center width35" onclick="selectAll()">
									<label><input type="checkbox" id="zcheckbox" class="ace" /><span class="lbl"></span></label>
									</th>
									<th class="center width50">序号</th>
									<th class="center" >图片</th>
									<th class="center" >标题</th>
									<th class="center" >图片名</th>
									<th class="center" >创建时间</th>
									<th class="center" >属于</th>
									<th class="center" >备注</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.query == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label><input type='checkbox' name='ids' class="ace" value="${var.PICTURES_ID}" /><span class="lbl"></span></label>
											</td>
											<td class='center'>${vs.index+1}</td>
											<td class="center">
											<a href="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" title="${var.TITLE}" class="bwGal"><img src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" alt="${var.TITLE}" width="100"></a>
											</td>
											<td class="center">${var.TITLE}</td>
											<td class="center">${var.NAME}</td>
											<td class="center">${var.CREATETIME}</td>
											<td class="center">${var.MASTER_ID}</td>
											<td class="center">${var.BZ}</td>
											<td class="center">
											<div class="action-buttons">
											<c:if test="${QX.edit != 1 && QX.delete != 1 }">
											<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
											</c:if>
												<c:if test="${QX.edit == 1 }">
												<a  class="green" onclick="edit('${var.PICTURES_ID}');" title="编辑">
													<i class="iconfont icon-bianji red1"></i>
												</a>
												</c:if>
												&nbsp;
												<c:if test="${QX.delete == 1 }">
												<a  class="red" onclick="del('${var.PICTURES_ID}','${var.PATH}');" title="删除">
													<i class="iconfont icon-shape7 green2"></i>
												</a>
												</c:if>
												</div>
											</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="9" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="9" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
					<div class="page-header fenye">
					<table class="width-100">
							<tr>
								<td class="align-top center"><div class="pagination">${page.pageStr}</div></td>
							</tr>
						</table>
					</div>
			</form>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
	<script type="text/javascript">
		$(top.hangge());
		//动态获取fieldSet的高度，改变tab高度
		$(document).ready(function(){
			var sum = window.innerHeight;
			$(".tab").height(sum-95);
		});
		function KeyDown(){
		  if (event.keyCode == 13){
		    event.returnValue=false;
		    event.cancel = true;
		    searchs();
		  }
		}
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>pictures/goAdd.do';
			 diag.Width = 800;
			 diag.Height = 490;
			 diag.CancelEvent = function(){ //关闭事件
				 if('${page.currentPage}' == '0'){
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				 }else{
					 nextPage(${page.currentPage});
				 }
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id,PATH){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>pictures/delete.do?PICTURES_ID="+Id+"&PATH="+PATH+"&tm="+new Date().getTime();
					$.get(url,function(data){
						top.jzts();
						 setTimeout("self.location=self.location",100);
					});
				};
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>pictures/goEdit.do?PICTURES_ID='+Id;
			 diag.Width = 550;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//全选 （是/否）
		function selectAll(){
			 var checklist = document.getElementsByName ("ids");
			   if(document.getElementById("zcheckbox").checked){
			   for(var i=0;i<checklist.length;i++){
			      checklist[i].checked = 1;
			   } 
			 }else{
			  for(var j=0;j<checklist.length;j++){
			     checklist[j].checked = 0;
			  }
			 }
		}
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>pictures/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		}
	</script>
	<style type="text/css">
	/* li {list-style-type:none;} */
	</style>
	<!-- <ul class="navigationTabs">
           <li><a></a></li>
           <li></li>
       </ul> -->
</html>

