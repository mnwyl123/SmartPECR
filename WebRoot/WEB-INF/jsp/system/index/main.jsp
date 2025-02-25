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
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>${pd.SYSNAME}</title>
		<meta name="description" content="overview &amp; stats" />
		<link rel="shortcut icon" href="img/favicon.ico"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="static/ace/css/font-awesome.css" />
		<link rel="stylesheet" href="static/ace/css/ace-fonts.css" />
		<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<script src="static/js/jquery-3.1.1.min.js"></script>
		<style type="text/css">
			.navbar-default {
				background-color: #42a9f8;
				border-color: #e7e7e7;
			}
			.ace-nav > li > a {
				padding: 0 8px !important;
				min-width: 0px;
			}
			#headermenu>li {
				margin: 0px 1px;
			}
			#headermenu > li > a:hover, #headermenu > li > a:focus {
			    background-color: #f38c31 !important;
			    color: white;
			    border-radius: 3px;
			    height: 26px;
			    line-height: 26px;
			    margin-top: 7px;
			    padding: 0px 2px;
			}
			#headermenu>li>ul>.active>a,#headermenu>.active>a {
			    background-color: #f38c31 !important;
			    color: white;
			    border-radius: 3px;
			    height: 26px;
			    line-height: 26px;
			    margin-top: 7px;
			    padding: 0px 2px;
			}
			#headermenu > li >.dropdown-toggle:hover, #headermenu > li >.dropdown-toggle:focus, #headermenu > li.open > a {
			    background-color: #42a9f8 !important;
			    color: white;
			    border-radius: 3px;
			    height: 26px;
			    line-height: 26px;
			    margin-top: 7px;
			    padding: 0px 2px;
			}
			.navbar .navbar-brand {
			    color: #FFF;
			    font-size: 24px;
			    text-shadow: none;
			    padding-top: 1px;
			    padding-bottom: 0px;
			    height: auto;
			}

			.ace-nav > li.light-blue > a {
			    background-color: #42a9f8;
			}
			.ace-nav > li > a > .badge {
			    position: relative;
			    top: -8px;
			    left: -10px;
			    padding-right: 4px;
			    padding-left: 4px;
			}
			/*滚动条样式*/
			::-webkit-scrollbar {
				width: 8px;
				height: 3px;
			}
			
			::-webkit-scrollbar-track {
				background-color: #eaedf7;
			}
			
			::-webkit-scrollbar-thumb {
				background-color: #c8e2f8;
				border-radius:2px;
			}
			
			::-webkit-scrollbar-thumb:hover {
				/*background-color: #8ac6f4;*/
				background:-webkit-gradient(linear,0 0, 0 bottom, from(#bce0fc), to(#64b2ed));
				border-radius:2px;
			}
			
			::-webkit-scrollbar-thumb:active {
				/*background-color: #8ac6f4;*/
				background:-webkit-gradient(linear,0 0, 0 bottom, from(#bce0fc), to(#64b2ed));
				border-radius:4px;
			}
			
			#right > li > a:hover, #right > li > a:focus{
			    background-color: #42a9f8;
			    color: #FFF;
			}
			
		</style>
	</head>

	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="navbar-header pull-left" style="width:25%">
					<div class="navbar-brand">
						<small><span class="white" style="font-size:20px;line-height:40px;text-align:center;"><img src="static/login/images/logo.png" style="height:35px;" />${pd.SYSNAME} </span></small>
					</div> 
				</div>
				<div class="navbar-buttons navbar-header pull-right" role="navigation" >
					<ul class="nav ace-nav" id="right">
						<li title="站内信"  target="mainFrame"  onclick="siMenu('z0','lm0','站内信',${locat}'fhsms/list.do?')" id="fhsmstss"><!-- fhsms()在 WebRoot\static\js\myjs\head.js中 -->
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span id="fhsmsCount" class="badge badge-success"></span>
							</a>
						</li>
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown"  class="dropdown-toggle" href="#">
								<img class="nav-user-photo" src="static/ace/avatars/avatar2.png" alt="Jason's Photo" />
								<!--<span class="user-info" id="user_info">
								</span>-->
								<i class="ace-icon fa fa-caret-down" style="color: #dddddd;"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a onclick="editUserH();" style="cursor:pointer;"><i class="ace-icon fa fa-cog"></i>修改资料</a>
								</li>
								<li id="systemset">
									<a onclick="editSys();" style="cursor:pointer;"><i class="ace-icon fa fa-user"></i>系统设置</a>
								</li>
								<li id="orgset">
									<a onclick="changeOrg();" style="cursor:pointer;"><i class="ace-icon fa fa-cog"></i>机构切换</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="logout"><i class="ace-icon fa fa-power-off"></i>退出登录</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="navbar-buttons navbar-header pull-right" role="navigation" style="width:60%;">
					<ul class="nav ace-nav pull-right" id="headermenu">
						<c:forEach items="${menuList}" var="headmenu" varStatus="vs">
							<c:if test="${vs.index <= 7}">
								<li>
									<a href="#" id="n${headmenu.id }" flag="menu">${headmenu.title }</a>
								</li>
							</c:if>
						</c:forEach>
						<li class="light-blue dropdown-modal" id="more">
							<a data-toggle="dropdown"  class="dropdown-toggle" href="#">
								更多<i class="ace-icon fa fa-caret-down" style="color: #dddddd;"></i>
							</a>
							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<c:forEach items="${menuList}" var="headmenu" varStatus="vs">
									<c:if test="${vs.index > 7}">
										<li>
											<a style="cursor:pointer;" href="#" id="n${headmenu.id }" flag="menu">
												${headmenu.title}
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>
		<div class="main-container ace-save-state" id="main-container">
			<div id="sidebar" class="sidebar responsive ace-save-state">
				<ul class="nav nav-list" id="searchMu">
					<c:forEach items="${menuList[0].childNodeList}" var="menu">
						<li class="" id="n${menu.id }">
						<a style="cursor:pointer;" 
							<c:if test="${not empty menu.url && '#' != menu.url}">target="mainFrame" onclick="siMenu('z${menu.id }','lm${menu.id }','${menu.title }','${menu.url }')"</c:if>
							<c:if test="${null != menu.childNodeList}"> class="dropdown-toggle"</c:if>>
							<i class="${menu.icon == null ? 'menu-icon fa fa-leaf black' : menu.icon} "></i>
							<span class="menu-text"> ${menu.title }</span>
							<c:if test="${null != menu.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
						</a>
						<b class="arrow"></b>
						<c:if test="${null != menu.childNodeList}">
						<ul class="submenu">
							<c:forEach items="${menu.childNodeList}" var="menu1">
								<li class="" id="n${menu1.id }">
									<a style="cursor:pointer;" 
										<c:if test="${not empty menu1.url && '#' != menu1.url}">target="mainFrame" onclick="siMenu('z${menu1.id }','lm${menu1.id }','${menu1.title }','${menu1.url }')"</c:if>
										<c:if test="${null != menu1.childNodeList}"> class="dropdown-toggle"</c:if>>
										<i class="${menu.icon == null ? 'menu-icon fa fa-leaf black' : menu1.icon} "></i>
										<span class="menu-text"> ${menu1.title }</span>
										<c:if test="${null != menu1.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
									</a>
									<b class="arrow"></b>
									<c:if test="${null != menu1.childNodeList}">
									<ul class="submenu">
										<c:forEach items="${menu1.childNodeList}" var="menu2">
											<li class="" id="n${menu2.id }">
												<a style="cursor:pointer;" 
													<c:if test="${not empty menu2.url && '#' != menu2.url}">target="mainFrame" onclick="siMenu('z${menu2.id }','lm${menu2.id }','${menu2.title }','${menu2.url }')"</c:if>
													<c:if test="${null != menu2.childNodeList}"> class="dropdown-toggle"</c:if>>
													<i class="${menu2.icon == null ? 'menu-icon fa fa-leaf black' : menu2.icon} "></i>
													<span class="menu-text"> ${menu2.title }</span>
													<c:if test="${null != menu2.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
												</a>
												<b class="arrow"></b>
												<c:if test="${null != menu2.childNodeList}">
												<ul class="submenu">
													<c:forEach items="${menu2.childNodeList}" var="menu3">
														<li class="" id="n${menu3.id }">
															<a style="cursor:pointer;" 
																<c:if test="${not empty menu3.url && '#' != menu3.url}">target="mainFrame" onclick="siMenu('z${menu3.id }','lm${menu3.id }','${menu3.title }','${menu3.url }')"</c:if>
																<c:if test="${null != menu3.childNodeList}"> class="dropdown-toggle"</c:if>>
																<i class="${menu3.icon == null ? 'menu-icon fa fa-leaf black' : menu3.icon} "></i>
																<span class="menu-text"> ${menu3.title }</span>
																<c:if test="${null != menu3.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
															</a>
															<b class="arrow"></b>
													</c:forEach>
												</ul>
												</c:if>
										</c:forEach>
									</ul>
									</c:if>
							</c:forEach>
						</ul>
						</c:if>
					</c:forEach>
				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<div id="jzts"
						style="display: none; width: 100%; position: fixed; z-index: 99999999;">
						<div style="padding-left: 70%; padding-top: 1px;">
							<div style="float: left; margin-top: 3px;">
								<img src="static/images/loadingi.gif" />
							</div>
							<div style="margin-top: 6px;">
								<h4 class="lighter block red">&nbsp;加载中 ...</h4>
							</div>
						</div>
					</div>
					<div>
						<iframe name="mainFrame" id="mainFrame" frameborder="0" src="tab.do" style="margin: 0 auto; width: 100%; height: 100%;"></iframe>
					</div>
				</div>
				<div style="text-align: center;padding-top: 3px; height: 30px; width: 100%; position: fixed; z-index: 999; background-color: #dddddd; border-top: 1px solid #d5d3d3; bottom: 0;">
								神州数码融信软件版权所有</div>
			</div><!-- /.main-content -->
			<div class="footer" style="display:none">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">神州数码融信软件版权所有</span>
							&copy; 
						</span>
					</div>
					<!-- /section:basics/footer -->
				</div>
			</div>
		</div><!-- /.main-container -->
		
		<script src="static/ace/js/bootstrap.js"></script>
		<script src="static/ace/js/ace/ace.js"></script>
		<script src="static/ace/js/ace/ace.basics.js"></script>
		<script src="static/ace/js/ace/ace.sidebar.js"></script>
		<script src="static/ace/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="static/ace/js/ace/ace.submenu-hover.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
		<script type="text/javascript" src="plugins/tab/js/tab.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/index.js"></script>
		<!--引入弹窗组件start-->
		<script type="text/javascript"
			src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript"
			src="plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>

		<script type="text/javascript">
			var menuData = '';
			$.ajax({
				type: "get",
				url: 'menu/tree.do',
				dataType:'json',
				cache: false,
				success: function(data) {
					menuData = data;
				}
			});
			
			$(document).ready(function(){
				$('#more').hide();
				var liList = $('#more>ul').children('li');
				if(liList.length>0){
					$('#more').show();
				}
			});

			//end 
			
			$('#headermenu>li>a').click(function (e) {
		        e.preventDefault();
		        var $ul = $(this).parent().parent();
		        var content = $(this).html();
		        var id = $(this).attr('id');

		        var flag = $(this).attr("flag");
		        if(flag!="menu"){
		        	return;
		        }

		        var $thisli = $(this).parent();
		        if($thisli.hasClass('active')){
		        	return;
		        }
		        var $liList = $($ul).find("li");
		        for(var i=0; i<$liList.length; i++){
		        	if($($liList[i]).hasClass('active')){
		        		$($liList[i]).removeClass('active');
		        		changeLeftMenu(id);
		        	}
		        }
		        $thisli.addClass('active');
		        
		        var $headermenuLi = $("#more>ul").children("li");
		        for(var i=0; i<$headermenuLi.length; i++){
		        	if($($headermenuLi[i]).hasClass('active')){
		        		$($headermenuLi[i]).removeClass('active');
		        	}
		        }
		        
		        if($("#more").hasClass('active')){
		        	$("#more").removeClass('active');
		        }
		    });
			
			$('#more>ul>li>a').click(function (e) {
		        e.preventDefault();
		        var $ul = $(this).parent().parent();
		        var content = $(this).html();
		        var id = $(this).attr('id');
				//alert(id);
		        var flag = $(this).attr("flag");
		        if(flag!="menu"){
		        	return;
		        }
		        
		        var $headermenuLi = $("#headermenu").children("li");
		        for(var i=0; i<$headermenuLi.length; i++){
		        	if($($headermenuLi[i]).hasClass('active')){
		        		$($headermenuLi[i]).removeClass('active');
		        	}
		        }
		        
		        if(!$("#more").hasClass('active')){
		        	$("#more").addClass('active');
		        }

		        var $thisli = $(this).parent();
		        if($thisli.hasClass('active')){
		        	return;
		        }
		        var $liList = $($ul).find("li");
		        for(var i=0; i<$liList.length; i++){
		        	if($($liList[i]).hasClass('active')){
		        		$($liList[i]).removeClass('active');
		        	}
		        }
		        changeLeftMenu(id);
		        $thisli.addClass('active');
		    });

		    function changeLeftMenu(id){
		    	var menuNode = getMenuNodeById(id);
		    	createLeftMenu(menuNode.childNodeList);
		    }

			function getMenuNodeById(id){
				for(var index in menuData){
					if(("n" + menuData[index].id)==id){
						return menuData[index];
						break;
					}
					continue;
				}
		    }

		    function createLeftMenu(nodeList){
		    	var html="";
		    	var class1 = 'menu-icon fa fa-leaf black';
		    	for(var i=0; i<nodeList.length; i++){
		    		html += '<li class="" id="n'+nodeList[i].id+'">';
		    		html += '<a style="cursor:pointer;"';
		    		if(nodeList[i].url&&nodeList[i].url!="#"){
		    			html += ' target="mainFrame" onclick="siMenu(\'z'+nodeList[i].id+'\',\'lm'+ nodeList[i].id +'\',\''+nodeList[i].title +'\',\''+nodeList[i].url+'\')"';
		    		}
		    		if(nodeList[i].childNodeList){
		    			html += ' class="dropdown-toggle"';
		    		}
		    		html += '>';
		    		if(nodeList[i].icon){
		    			class1 = nodeList[i].icon;
		    		}
		    		html += '<i class="'+ class1 +'"></i>';
		    		html += '<span class="menu-text">'+nodeList[i].title +' </span>';
		    		if(nodeList[i].childNodeList){
		    			html += ' <b class="arrow fa fa-angle-down"></b>'
		    		}
		    		html += ' </a><b class="arrow"></b>';
		    		if(nodeList[i].childNodeList){
		    			var childNode = nodeList[i].childNodeList;
		    			html += '<ul class="submenu can-scroll ace-scroll scroll-disabled">';
		    			for(var j=0;j<childNode.length;j++){
		    				html += '<li class="" id="z'+childNode[j].id+'">';
				    		html += '<a style="cursor:pointer;"';
				    		if(childNode[j].url&&childNode[j].url!="#"){
				    			html += '  target="mainFrame" onclick="siMenu(\'z'+childNode[j].id+'\',\'lm'+ childNode[j].id +'\',\''+childNode[j].title +'\',\''+childNode[j].url+'\')"';
				    		}
				    		if(childNode[j].childNodeList){
				    			html += ' class="dropdown-toggle"';
				    		}
				    		html += '>';
				    		if(childNode[j].icon){
				    			class1 = childNode[j].icon;
				    		}
				    		html += '<i class="'+ class1 +'"></i>';
		    				html += '<span class="menu-text">'+childNode[j].title +' </span>';
				    		if(childNode[j].childNodeList){
				    			html += ' <b class="arrow fa fa-angle-down"></b>'
				    		}
				    		html += ' </a><b class="arrow"></b>';
				    		if(childNode[j].childNodeList){
				    			var childNode1 = childNode[j].childNodeList;
				    			html += '<ul class="submenu can-scroll ace-scroll scroll-disabled">';
				    			for(var k=0;k<childNode1.length;k++){
				    				html += '<li class="" id="z'+childNode1[k].id+'">';
						    		html += '<a style="cursor:pointer;" target="mainFrame" ';
						    		if(childNode1[k].url&&childNode1[k].url!="#"){
						    			html += ' onclick="siMenu(\'z'+childNode1[k].id+'\',\'lm'+ childNode1[k].id +'\',\''+childNode1[k].title +'\',\''+childNode1[k].url+'\')"';
						    		}
						    		if(childNode1[k].childNodeList){
						    			html += ' class="dropdown-toggle"';
						    		}
						    		html += '>';
						    		if(childNode1[k].icon){
						    			class1 = childNode1[k].icon;
						    		}
						    		html += '<i class="'+ class1 +'"></i>';
		    						html += '<span class="menu-text">'+childNode1[k].title +' </span>';
						    		if(childNode1[k].childNodeList){
						    			html += ' <b class="arrow fa fa-angle-down"></b>'
						    		}
						    		html += ' </a><b class="arrow"></b>';
						    			if(childNode1[k].childNodeList){
							    			var childNode2 = childNode1[k].childNodeList;
							    			html += '<ul class="submenu can-scroll ace-scroll scroll-disabled">';
							    			for(var h=0;h<childNode2.length;h++){
							    				html += '<li class="" id="z'+childNode2[h].id+'">';
									    		html += '<a style="cursor:pointer;" ';
									    		if(childNode2[h].url&&childNode2[h].url!="#"){
									    			html += ' target="mainFrame" onclick="siMenu(\'z'+childNode2[h].id+'\',\'lm'+ childNode2[h].id +'\',\''+childNode2[h].title +'\',\''+childNode2[h].url+'\')"';
									    		}
									    		if(childNode2[h].childNodeList){
									    			html += ' class="dropdown-toggle"';
									    		}
									    		html += '>';
									    		if(childNode2[h].icon){
									    			class1 = childNode2[h].icon;
									    		}
									    		html += '<i class="'+ class1 +'"></i>';
		    									html += '<span class="menu-text">'+childNode2[h].title +' </span>';
									    		if(childNode2[h].childNodeList){
									    			html += ' <b class="arrow fa fa-angle-down"></b>'
									    		}
									    		html += ' </a><b class="arrow"></b>';
									    		html += '</li>';
							    			}
							    			html += '</ul>';
							    		}
						    		html += '</li>';
				    			}
				    			html += '</ul>';
				    		}
				    		html += '</li>';
		    			}
		    			html += '</ul>';
		    		}
		    		html += '</li>';
		    	}
		    	//console.log(html);
		    	
		    	$("#searchMu").html(html);
		    }
		    $("#headermenu>li:first-child").addClass('active');
		</script>
	</body>
</html>
