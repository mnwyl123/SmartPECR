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
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<form action="user/readExcel.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
								<div id="zhongxin">
								<table style="width:95%;" >
									<tr>
										<td style="padding-top: 20px;">
										<div>
										<input type="file" id="files" multiple="multiple" name="excel" style="width:240px;" onchange="fileType(this)" />
										</div>
										<a id="tishi" class="tishi" style="display:none; font-size:5px;color:red">
										请选择enc格式的文件
										</a>
										</td>
									</tr>
								</table>
								</div>
								<!-- <div style="padding-top:13px;border-top:1px solid #cccccc;height:60px;position:fixed;bottom:0px;left:0px;width:100%;" align="center">
									<button type="submit" class="btn btn-orange btn-size1" onclick="save();">上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传</button>
									<button class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</button> 
								</div> -->
								<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
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

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->

	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/js/jquery.form.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript">
	function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.enc'){
	    	document.getElementById("tishi").style.display="block";
	    }else{
	    	document.getElementById("tishi").style.display="none";
	    }
	}
	
	

</script>
</body>
</html>