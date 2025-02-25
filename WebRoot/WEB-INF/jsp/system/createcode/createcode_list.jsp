<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
<link rel="stylesheet" type="text/css" href="css/smartsense/styleScroll.css">
<link rel="stylesheet" type="text/css" href="css/smartsense/main.css" />
</head>
<body class="no-skin" onkeydown="KeyDown()">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
						<!-- 检索  -->
						<form action="createCode/list.do" method="post" name="Form" id="Form">
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
										    <c:if test="${QX.startButton == 1 }">
										    	<div class="btn-group float-f">
													<a class="btn btn-hanzi" onclick="productCode('add');" style="background-color: #42a9f8 !important;font-size: 14px;">启动生成器</a>
												</div>
											</c:if>
											<c:if test="${QX.batchDelete == 1 }">
												<div class="btn-group jianju2">
													<a class="btn btn-mini" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >
														<i class='iconfont icon-shape7'></i>
													</a>
												</div>
											</c:if>
										</td>
									</tr>
								</table>
								<!-- 检索  -->
							
								<table id="simple-table" class="table table-striped table-bordered table-hover">	
									<thead>
										<tr>
											<th class="center width35">
											<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
											</th>
											<th class="center width50">序号</th>
											<th class="center">说明</th>
											<th class="center">模块名</th>
											<th class="center">包名</th>
											<th class="center">类名</th>
											<th class="center">表名</th>
											<th class="center">创建时间</th>
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
														<label class="pos-rel"><input type='checkbox' name='ids' value="${var.CREATECODE_ID}" class="ace" /><span class="lbl"></span></label>
													</td>
													<td class='center'>${vs.index+1}</td>
															<td class="center">${var.TITLE}</td>
															<td class="center">${var.MODELNAME}</td>
															<td class="center">${var.PACKAGENAME}</td>
															<td class="center">${var.OBJECTNAME}</td>
															<td class="center">${fn:replace(var.TABLENAME, ',fh,', '')}</td>
															<td class="center">${var.CREATETIME}</td>
													<td class="center">
														<c:if test="${QX.edit != 1 && QX.delete != 1 }">
															<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
														</c:if>
														<div class="hidden-sm hidden-xs action-buttons">
														<c:if test="${QX.edit == 1 }">
															<a title="编辑"  onclick="productCode('${var.CREATECODE_ID}');">
																<i class="iconfont icon-bianji red1 bigger-120" title="编辑"></i>
															</a>
															</c:if>
															<c:if test="${QX.delete == 1 }">
															<a   onclick="del('${var.CREATECODE_ID}');">
																<i class="iconfont icon-shape7 green2  bigger-120" title="删除"></i>
															</a>
															</c:if>
														</div>
														<div class="hidden-md hidden-lg">
															<div class="inline pos-rel">
																<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
																	<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																</button>
					
																<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li>
																	<c:if test="${QX.edit == 1 }">
																		<a  onclick="productCode('${var.CREATECODE_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																			<span class="green">
																				<i class="iconfont icon-bianji red1"></i>
																			</span>
																		</a>
																	</c:if>
																	</li>
																	<li>
																	<c:if test="${QX.delete == 1 }">
																		<a  onclick="del('${var.CREATECODE_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																			<span class="red">
																				<i class="iconfont icon-shape7 green2"></i>
																			</span>
																		</a>
																	</c:if>
																	</li>
																</ul>
															</div>
														</div>
													</td>
												</tr>
											
											</c:forEach>
											</c:if>
											<c:if test="${QX.query != 1 }">
											<tr class="main_info">
												<td colspan="100" class="center" >无权限查看</td>
											</tr>
											</c:if>
										</c:when>
										<c:otherwise>
											<tr class="main_info">
												<td colspan="100" class="center" >没有相关数据</td>
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
						
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
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
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//动态获取fieldSet的高度，改变tab高度
		$(document).ready(function(){
			var sum = window.innerHeight;
			$(".tab").height(sum-95);
		});
		function KeyDown(){
		  if (event.keyCode == 13)
		  {
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
		$(function() {
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//启动代码生成器
		function productCode(CREATECODE_ID){
			 top.jzts();
			 window.location.href='<%=basePath%>createCode/goProductCode.do?CREATECODE_ID='+CREATECODE_ID;
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>createCode/delete.do?CREATECODE_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>createcode/goEdit.do?CREATECODE_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
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
								type:"POST",
								url:'<%=basePath%>createCode/deleteAll.do?tm='+new Date().getTime(),
						    	data:{DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache:false,
								success:function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
	</script>


</body>
</html>