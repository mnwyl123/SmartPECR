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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<form action="operation/list.do" method="post" name="userForm" id="logForm">
							<!-- 检索  -->
							<fieldset class="hidden-xs " id="fieldset1">
								<c:if test="${QX.query == 1 }">
									<div class="row style_m">
										<div class="col-xs-3 text-right">
											<label>关键字搜索:</label>
										</div>
										<div class="col-xs-3">
											<input value="${pd.keywords }"  type="text" name="keywords" id="nav-search-input" placeholder="搜&nbsp;索..." title="" />
										</div>
										<div class="col-xs-2 text-right">
											<label>操作日期:</label>
										</div>
										<div class="col-xs-4 style_t">
											<input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd"   placeholder="开始日期" title="开始日期"/>---
											<input  class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd"  placeholder="结束日期" title="结束日期"/>
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
											<c:if test="${QX.downLoad == 1 }">
											<div class="btn-group jianju">
												<a class="btn btn-mini" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="iconfont icon-xiazai" style="font-size:18px;"></i></a>
											</div>
											</c:if>
										</td>
									</tr>
								</table>
								<!-- 检索  -->
							
								<table id="simple-table" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center width50">序号</th>
											<th class="center">用户名</th>
											<!-- <th class="center">用户ID</th> -->
											<th class="center">用户所属机构</th>
											<th class="center">IP地址</th>
											<th class="center">MAC地址</th>
											<th class="center">访问URL</th>
											<th class="center">操作时间</th>
											<th class="center">具体操作描述</th>
										</tr>
									</thead>
															
									<tbody>
										
									<!-- 开始循环 -->	
									<c:choose>
										<c:when test="${not empty varList}">
										<c:if test="${QX.query == 1 }">
											<c:forEach items="${varList}" var="log" varStatus="vs">	
												<tr>
													<td class='center'>${vs.index+1}</td>
													<td class="center">${log.USERNAME }</td>
													<%-- <td class="center">${log.NAME }</td> --%>
													<td class="center">${log.ORG }</td>
													<td class="center">${log.IP }</td>
													<td class="center">${log.MAC }</td>
													<td class="center">${log.OPERATION_URL}</td>
													<td class="center">${log.OPERATION_TIME}</td>
													<td class="center">${log.OPERATION_DESC}</td>
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
												<td colspan="9" class="center">没有相关数据</td>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>

<script type="text/javascript">
$(top.hangge());
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
    searchs();
  }
}
//检索
function searchs(){
	top.jzts();
	$("#logForm").submit();
}
//重置
function resets(){
	$("#nav-search-input").val("");
	$("#lastLoginStart").val("");
	$("#lastLoginEnd").val("");
	//$("#logForm")[0].reset();
}



$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});	
});

//导出excel
function toExcel(){
	var keywords = $("#nav-search-input").val();
	var lastLoginStart = $("#lastLoginStart").val();
	var lastLoginEnd = $("#lastLoginEnd").val();
	window.location.href='<%=basePath%>operation/excel.do?keywords='+keywords+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd;
}
		
</script>
</html>
