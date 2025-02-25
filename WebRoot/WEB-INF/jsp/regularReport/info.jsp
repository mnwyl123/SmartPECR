<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./bicenterCommon.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
    <meta http-equiv="description" content="This is my page" />
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1"/> 
    <base href="<%=basePath%>">
    
    <title>My JSP 'reportViewer.jsp' starting page</title>
    
    <link rel="stylesheet" type="text/css" href="css/base/regularReportGrid.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/base/ui.all.css">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/json2005.js"></script>
	<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="js/jtip.js"></script>
	<script type="text/javascript" src="js/jquery.layout.js"></script>
	<script type="text/javascript" src="js/jquery.selectboxes.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript">
    </script>

<style type="text/css">
	body {
		padding:2em;
	}
	div {
		line-heigth: 100%;
		font-size:12pt;
		color:red;
	}
</style>

	</head>

	<body>
		<div id="centerPan" class="ui-layout-center" style="padding:0;margin:0;text-align:left;overflow:auto;"> 
			${info }
		</div>
		
	</body>
</html>
