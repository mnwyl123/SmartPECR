<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存结果</title>
<base href="<%=basePath%>">
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="static/ace/css/ace.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script src="static/ace/js/bootbox.js"></script>
</head>
<body>
	<div id="zhongxin"></div>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg=="success" || msg==""){
			document.getElementById('zhongxin').style.display = 'none';
			top.Dialog.close();
		}else{
			bootbox.dialog({
				message: "<span class='bigger-110'>操作失败!</span>",  
				buttons: 			
				{
					"button" :
					{
						"label" : "确定",
						"className" : "btn-sm btn-success",
						"callback":function(){
							top.Dialog.close();
						}
					}
				}
			});
			
		}
	</script>
</body>
</html>