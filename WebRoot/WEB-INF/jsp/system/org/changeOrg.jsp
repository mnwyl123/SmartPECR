<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<!-- jsp文件头和头部 -->
		<%@ include file="../../system/index/top.jsp"%>
		
	
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12" style="padding:0;">
					
					<form action="head/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin">
						<table id="table_report" class="table table-striped table-bordered table-hover">
									<thead>
								<tr>
									<th class="center" style="width:35px;">
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">机构编码</th>
									<th class="center">机构名称</th>
									<th class="center">负责人</th>
									<th class="center">部门职能</th>
									<th class="center">电话</th>
									<th class="center">法人</th>
									<th class="center">备注</th>
								</tr>
							</thead>					
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty OrgList}">
									<c:forEach items="${OrgList}" var="org" varStatus="vs">											
										<tr ondblclick="saveD('${org.orgId}')">
											<td class='center' style="width: 30px;">
												<label><input type='radio' id="${org.orgId}" name='ORG_ID' value="${org.orgId }" class="ace"  <c:if test="${pd.Code==org.orgCode}">checked</c:if>/><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${org.orgCode }</td>
											<td class="center">${org.name }</td>
											<td class="center">${org.headman}</td>
											<td class="center">${org.functions}</td>
											<td class="center">${org.tel}</td>
											<td class="center">${org.company}</td>
											<td class="center">${org.orgDesc}</td>
										</tr>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						</div>
						<div style="padding-top: 13px;position:fixed;bottom:0;width:100%" class="modal-footer center">
							<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>					
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
</div>
<!-- /.main-container -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			var str = '';
			for(var i=0;i < document.getElementsByName('ORG_ID').length;i++)
			{
				  if(document.getElementsByName('ORG_ID')[i].checked){
				  	str = document.getElementsByName('ORG_ID')[i].value;
				  }
			}
			localStorage.setItem("changeOrg",'1');
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		//************************************20181204
		function saveD(ORG_ID){
			$('input:radio[name="ORG_ID"]').removeAttr('checked');
			$("#"+ORG_ID).attr("checked","checked");
			var str = ORG_ID;
			localStorage.setItem("changeOrg",'1');
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		</script>
</body>
</html>