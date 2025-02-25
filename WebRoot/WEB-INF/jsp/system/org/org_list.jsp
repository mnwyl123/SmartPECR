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
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 图标 -->
	<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/smartsense/styleScroll.css">
	<link rel="stylesheet" type="text/css" href="css/smartsense/main.css" />
	<style type="text/css">
		.no-skin{
			overflow-x:hidden;
		}
	</style>
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
							<form action="org/list.do?menuId=${menuId}" method="post" name="Form" id="Form">
								<!-- 检索  -->
								<fieldset class="hidden-xs " id="fieldset1">
									<div class="row style_m">
										<c:if test="${QX.query == 1 }">
											<div class="col-xs-3 text-right">
												<label>关键字搜索:</label>
											</div>
											<div class="col-xs-3">
												<input value="${pd.keywords }" type="text" name="keywords"
													id="keywords" placeholder="搜&nbsp;索..." title="" />
											</div>
											<div class="col-xs-2 text-right">
												<label>查询范围:</label>
											</div>
											<div class="col-xs-4">
												<select name="ORG_ID" id="ORG_ID">
													<option value="">选择范围</option>
													<option value="${ORG_ID}"
														<c:if test="${ORG_ID != ''}">selected</c:if>>本级</option>
													<option value=""
														<c:if test="${ORG_ID == ''}">selected</c:if>>全部</option>
												</select>
											</div>
										</c:if>
									</div>
									<div>
										<input type="button" value="查   询" class="button btn-orange"
											onclick="gsearch();" />
									</div>
								</fieldset>
								<!-- end检索 -->
								<div class="tab">
									<table class="margin-5 width-100">
										<tr>
											<td class="text-left jianju" style="margin-left:10px;">
												<c:if test="${QX.add == 1 }">
													<div class="btn-group jianju" >
												   		<a class="btn btn-mini" onclick="add('${pd.ORG_ID}');">
												   		<i class="iconfont icon-tianjia "  title="新增"></i></a>
													</div>
												</c:if>
												<c:if test="${null != (pd.PARENT_ID) && (pd.PARENT_ID) != ''}">
													<div class="btn-group jianju2">
													 	<a class="btn btn-mini btn-orange" onclick="goSondict('${pd.PARENT_ID}');">
													 	<i class="iconfont icon-fanhui " title="新增"></i></a>
													</div>
												</c:if>
											</td>
										</tr>
									</table>
									<!-- 检索  -->
									<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
										<thead>
											<tr>
												<th class="center width50">序号</th>
												<th class="center">名称</th>
												<th class="center">英文</th>
												<th class="center">编码</th>
												<th class="center">负责人</th>
												<th class="center">法人</th>
												<th class="center width-10" >操作</th>
											</tr>
										</thead>
																
										<tbody>
										<!-- 开始循环 -->	
										<c:choose>
											<c:when test="${not empty varList}">
											 <c:if test="${QX.query == 1 }">
												<c:forEach items="${varList}" var="var" varStatus="vs">
													<tr>
														<td class='center'>${vs.index+1}</td>
														<td class='center' ><a href="javascript:goSondict('${var.orgId }')">${var.name}&nbsp;<i class="iconfont icon-chakanxiaji orange1" ></i></a></td>
														<td class='center'>${var.nameEn}</td>
														<td class='center'>${var.orgCode}</td>
														<td class='center'>${var.headman}</td>
														<td class='center'>${var.company}</td>
														<td class="center">
														<c:if test="${QX.edit != 1 && QX.delete != 1 }">
															<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
														</c:if>
														<div class="hidden-sm hidden-xs action-buttons" style="width:100%;">	
															<c:if test="${QX.edit == 1 }">
															<a  href="javascript:edit('${var.orgId}');"> 
														    <i class="iconfont icon-bianji red1 marginLR-10" title="编辑" ></i>
														   </a>
														   </c:if>
														   <c:if test="${QX.delete == 1 }"> 
														   <a  href="javascript:del('${var.orgId}');"> 
														   <i class="iconfont icon-shape7 green2 " style="cursor: pointer;" title="删除"></i>
														   </a>
														 </c:if> 
														  </div>
														 <div class="hidden-md hidden-lg">
																<div class="inline pos-rel">
																	<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>
						
																	<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<c:if test="${QX.edit == 1 }">
																		<li>
																			<a style="cursor:pointer;" onclick="edit('${var.orgId}');" class="tooltip-success" data-rel="tooltip" title="修改">
																				<span class="green">
																					<i class="iconfont icon-bianji red1 bigger-120"></i>
																				</span>
																			</a>
																		</li>
																		</c:if>
																		<c:if test="${QX.delete == 1 }">
																		<li>
																			<a style="cursor:pointer;" onclick="del('${var.orgId}');" class="tooltip-error" data-rel="tooltip" title="删除">
																				<span class="red">
																					<i class="iconfont icon-shape7 green2 bigger-120"></i>
																				</span>
																			</a>
																		</li>
																		</c:if>
																	</ul>
																</div>
															</div> 
														</td>
													</tr>
												</c:forEach>
											 </c:if>
											 <c:if test="${QX.query != 1 }">
											      <tr class="main_info">
													<td colspan="7" class="center" >您无权查看</td>
												</tr>
											 </c:if>
											</c:when>
											<c:otherwise>
												<tr class="main_info">
													<td colspan="7" class="center" >没有相关数据</td>
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
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		top.hangge();
		var sum = window.innerHeight;
		$(".tab").height(sum-95);
		//xianshi();
	});
	function KeyDown(){
	  if (event.keyCode == 13){
	    event.returnValue=false;
	    event.cancel = true;
	    gsearch();
	  }
	}
	//检索
	function gsearch(){
		top.jzts();
		$("#Form").submit();
	}
	
	//去此ID下子级列表
	function goSondict(PARENT_ID){
		top.jzts();
		window.location.href="<%=basePath%>org/list.do?ORG_ID="+PARENT_ID+"&menuId=${menuId}";
	};
	
	//新增
	function add(ORG_ID){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>org/goAdd.do?ORG_ID='+ORG_ID;
		 diag.Width = 500;
		 diag.Height = 610;
		 diag.CancelEvent = function(){ //关闭事件
			 if('none' == diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display){
				 window.location.href="<%=basePath%>org/list.do?ORG_ID=${ORG_ID}&dnowPage=${page.currentPage}&menuId==${menuId}";
			}
			diag.close();
		 };
		 diag.show();
	}
	
	//删除
	function del(Id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>org/delete.do?ORG_ID="+Id+"&tm="+new Date().getTime()+"&menuId==${menuId}";
				$.get(url,function(data){
					if("success" == data.result){
						window.location.href="<%=basePath%>org/list.do?ORG_ID=${ORG_ID}&dnowPage=${page.currentPage}&menuId==${menuId}";
					}else if("false" == data.result){
						top.hangge();
						bootbox.dialog({
							message: "<span class='bigger-110'>删除失败！请先删除子级部门.</span>",
							buttons: 			
							{
								"button" :
								{
									"label" : "确定",
									"className" : "btn-sm btn-success"
								}
							}
						});
					}else if("error" == data.result){
						top.hangge();
						bootbox.dialog({
							message: "<span class='bigger-110'>删除失败！资源已被占用!!</span>",
							buttons: 			
							{
								"button" :
								{
									"label" : "确定",
									"className" : "btn-sm btn-success"
								}
							}
						});
					}
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
		 diag.URL = '<%=basePath%>org/goEdit.do?ORG_ID='+Id;
		 diag.Width = 500;
		 diag.Height = 610;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 window.location.href="<%=basePath%>org/list.do?ORG_ID=${ORG_ID}&dnowPage=${page.currentPage}&menuId==${menuId}";
			}
			diag.close();
		 };
		 diag.show();
	}
	
</script>
</html>