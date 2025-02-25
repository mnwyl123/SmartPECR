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
	<base href="<%=basePath%>">
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="plugins/tab/js/framework.js"></script>
	<link href="plugins/tab/css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link href="static/ace/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link  rel="stylesheet" type="text/css" id="skin" prePath="plugins/tab/" /><!--默认相对于根目录路径为../，可添加prePath属性自定义相对路径，如prePath="<%=request.getContextPath()%>"-->
	<script type="text/javascript" charset="utf-8" src="plugins/tab/js/tab.js"></script>
	<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
	<link rel="stylesheet" type="text/css" href="static/ace/css/font-awesome.css">
	<script type="text/javascript" charset="utf-8" src="static/ace/js/bootstrap.js"></script>
	<script type="text/javascript" charset="utf-8" src="static/ace/js/bootstrap-contextmenu.js"></script>
    <style>
		.tabactive{
			border-top-right-radius: 8px;
			border-top-left-radius: 8px;
			background-color: #f97e11 !important;
		}
		.tabactive td:first-child{
			color:#FFFFFF !important;
			padding-left:8px !important;
			padding-right:2px !important;
		}
		.tabactive td:last-child{
			color:#FFFFFF !important;
			padding-left:2px !important;
			padding-right:8px !important;
		}
		.tabactive td>.iconfont{
			color:#FFFFFF !important;
		}
		.tabactive1{
			background-color: #f97e11 !important;
			height:30px !important;
			width:30px !important;
		}
		.tabactive1 td>.iconfont{
			color:#FFFFFF !important;
		}
		.tabactive1 td{
			padding-top:8px !important;
		}
		#tab1_index1 td{
			padding-top:8px !important;
		}
		.benma_ui_tab .tab_close_noselected {
		    background-position: -1000px -28px;
		}
		#tab1_index1{
			margin-right:2px;
		}
		.icon-htmal5icon06{
			line-height: 12px;
    		width: 27px;
		}
		.tab_mouse_over{
			background-color: #1693f1 !important;
		}
    </style>
	</head>
<body>
<div id="tab_menu">
</div>
<div style="width:100%;">
	<div id="page" style="width:100%;height:100%;">
	</div>
	<div id="context-menu">
	  	<ul class="dropdown-menu" role="menu">
			<li><a tabindex="-1" onclick="closeThis();">关闭当前</a></li>
			<li><a tabindex="-1" onclick="closeOthers()">关闭其他标签</a></li>
	    	<li><a tabindex="-1" onclick="closeAll()">关闭所有标签</a></li>
	  </ul>
	</div>
</div>
</body>
<script type="text/javascript">

function tabAddHandler(mid,mtitle,murl){
	tab.close(mid);
	tab.update({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.add({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.activate(mid);
}
 var tab;	
 function closeAll(){
	 $("table.tab_item").each(function(){
		 if($(this).attr("id") != "tab1_index1") {
			$("#"+$(this).attr("id")).find(".icon-cuohao").click();
		 }
	 });
 }
 function closeOthers(){
	 $("table.tab_item").each(function(){
		 if($(this).attr("id") != "tab1_index1" && $(this).attr("id") != $("#context-menu").attr("tabId")) {
			$("#"+$(this).attr("id")).find(".icon-cuohao").click();
		 }
	 });
 }
 function closeThis() {
	 var id = $("#context-menu").attr("tabId");
	 tab.close(id);
 }
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top"
	});
	tab.addZhuYe( {
		id :'tab1_index1',
		title :'<i class="iconfont icon-htmal5icon06" style="font-size:26px;width=30px;"></i>',
		url :"<%=basePath%>login_default.do",
		isClosed :false
	});
	$("#tab1_index1").css("background-color","eeeff0");
	$("#tab1_index1");
	$("#tab1_index1").css("font-size","26px");
	
});

	function cmainFrameT(){
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT  - 41) + 'px';
	}
	cmainFrameT();
	window.onresize=function(){  
		cmainFrameT();
	};

</script>
</html>

