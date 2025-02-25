<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${pd.SYSNAME}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<link href="static/login/css/loginStyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="static/login/js/jquery.js"></script>
<script type="text/javascript" src="static/login/js/Particleground.js"></script>
<script type="text/javascript"
	src="static/login/js/verificationNumbers.js"></script>
<!-- 修改确认窗口 -->
<script type="text/javascript" src="static/ace/js/bootbox.js"></script>

<style>
.footer {
	padding-top: 2px;
	position: fixed;
	bottom: 0;
	z-index: 1030;
	width: 100%;
	height: 30px;
	text-align: center;
	background-color: #ffffff;
	display: block;
	padding-bottom: 20px;
}

input {
	line-height: normal;
	border-radius: 0px !important;
	color: #303030 !important;
	width: 222px;
	height: 38px !important;
	border-style: none;
}

label {
	margin-bottom: 0px !important;
	padding-left: 8px;
}

.row {
	line-height: 30px !important;
	color: #848484;
}

.button {
	width: 102px;
	height: 30px;
	color: white !important;
	background: #2291e4 !important;
	border-radius: 3px !important;
	border-style: none;
	margin: 30px 50px 30px 50px;
}

span {
	color: #999;
	font-size: 14px;
}

textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {
    background-color: #fff;
    border: 0px solid #ccc !important;
	padding:0px;
}
.top{
	padding-top: 30px !important;
	}
.top span{
	margin-left:10px !important;
	}
</style>

<script type="text/javascript">
	if (screen.width <= 1024) {
		document.write("<link rel='stylesheet' type='text/css' href='css/index_1024.css'/>");
	}
</script>
</head>
<body onkeydown="KeyDown()">

					<div class="wraper">
						<div class="top">
							<span>
								<img src="static/login/images/logo.png" width="200px"/>
								<lable style="font-size: 25px; color: black;">| Sm@rtPECR二代征信管理系统</lable>
							</span>
							<span style="float: right;">
							<a href="javascript:void(0);" onclick="SetHome(this);">设为首页</a> | <a
								href="javascript:void(0);" rel="sidebar" class="headerRight"
								onclick="AddFavorite(this);">加入收藏</a></span>
						</div>

						<div class="kj" style="background-image: url('static/login/images/login_07.png'); margin-top: -15px;">
							<div class="middle">
								<div class="left">
									<img src="static/login/images/left.png" />
								</div>
								<div class="right"
									style="background-image: url('static/login/images/right.png');">
									<p>用户登录</p>
									<img src="static/login/images/xian_05.png"
										style="width: 262px; margin-left: 50px;" />
									<form action="" method="post" name="loginForm" id="loginForm" class="admin_login">
									<div class="input-prepend">
										<span class="add-on"  style="-webkit-border-radius: 0 0 0 0;"><img src="static/login/images/user.png" /></span>
										<input type="text" name="loginname" id="loginname"  value="" placeholder="请输入用户名" onBlur="findC(this.value)"/>
									</div>
									<div class="input-prepend">
										<span class="add-on"  style="-webkit-border-radius: 0 0 0 0;"><img src="static/login/images/login.png" /></span>
										<input type="password" name="password" id="password" placeholder="请输入密码" value="" onBlur="findC(this.value)"/>
									</div>
										<div id="cDiv" class="input-prepend" style="display:none">
										<span class="add-on"  style="-webkit-border-radius: 0 0 0 0;"><img src="static/login/images/fa.png" /></span> 
										<select class="chosen-select form-control" name="company" id="company" style="text-indent: 0.3em;">
										   <option  value="" disabled selected style="display:none;">选择法人</option>
										</select>
										</div>
										<div id="cCode" style="display:none">
										<span class="add-on" 
										style="display: inline-block;width: auto; height: 36px; min-width: 16px;
												background-color: #ffffff;border: 1px solid #ffffff;vertical-align: middle;margin-right: -4px;"><img src="static/login/images/yan.png" /></span>
										<input type="text" name="code" id="code" class="login_code" style="width:100px;margin: 0px;" />
										<img  id="codeImg" alt="点击更换" title="点击更换" /> <font color="#186cab" id="changeImg" style="margin-left: 5px;">换一张</font>
										</div>
										<input type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录"
											class="submit_btn" onclick="severCheck();"
											style="width: 262px; height: 35px; background-color: #f57921;color:white !important;" id="dl" name="dl"/>
									</form>
								</div>
							</div>
						</div>
						<footer class="footer">
							<span>版权所有 :神州数码信息服务股份有限公司</span>
						</footer>
						</div>
	<script type="text/javascript">
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
			$("#changeImg").bind("click",changeCode);//换一张
		});
		
		function KeyDown()
		{
		  if (event.keyCode == 13)
		  {
		    event.returnValue=false;
		    event.cancel = true;
		    severCheck();
		  }
		}
			//设为首页
		function SetHome(obj){
			var url = window.location;
			try{
				$(obj).style.behavior=url+'(#default#homepage)';
				$(obj).setHomePage(url);
			}catch(e){
				if(window.netscape){
					try{
						netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
					}catch(e){
					alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
					}
				}else{
					alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
				}
			}
		}
		//加入收藏
		function AddFavorite(obj) {
			var url = window.location;
			var title = document.title;
			var nav = navigator.userAgent;
			//alert(title+"..."+url+"..."+nav+"...."+nav.indexOf("MSIE") +"...."+window.sidebar);
            if(nav.indexOf("MSIE")!=-1) { //针对IE
                window.external.addFavorite(url, title);
			}else if (nav.indexOf("Firefox")!=-1){ //针对火狐
				$(obj).attr("rel", "sidebar");
                $(obj).attr("title", title);
                $(obj).attr("href", url);
				//window.sidebar.addPanel("sd", "http://localhost:8089/SmartSence/", "");
            } else {
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
            }
		}
          //查询对应法人
            function findC(){
    			var USERNAME = $.trim($("#loginname").val());
    			$.ajax({
    				type: "POST",
    				url: 'login_findC',
    		    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
    				dataType:'json',
    				cache: false,
    				success: function(data){
    					if(USERNAME != "super"){
    						if(null == data.result){
    							$("#loginname").tips({
    									side : 1,
    									msg : "用户不存在",
    									bg : '#FF5080',
    									time : 1
    								});
    								$("#loginname").focus();
    						}else{
    							var modelMap = data.result;
    							var num=0;
    						   	var html = '';
    						   	$.each(modelMap, function(key, value){
    						   		num +=1;
    						   		html += '<option value="' + key + '">' + value + '</option>';
    						   	});
    						   	$('#company').html(html);
    						   	if(num>1){
    						   		document.getElementById("cDiv").style.display="";
    						   	}
    						}
    					}else{
    						var html = '';
    						html += '<option value="super">super用户无法人</option>';
    						$('#company').html(html);
    					}
    				}
    			});
    		}
		
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var company = $("#company").val();
				var password = $("#password").val();
				var code =loginname+",dcits,"+company+",dcits,"+password+",dcits,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="main/index";
						}else if("paserror" == data.result){
							$("#password").tips({
								side : 1,
								msg : "密码输入有误",
								bg : '#FF5080',
								time : 2
							});
							$("#password").focus();
							return false;
						}else if("Spaserror" == data.result){
							$("#password").tips({
								side : 1,
								msg : "密码输入有误",
								bg : '#FF5080',
								time : 2
							});
							$("#password").focus();
							document.getElementById("cCode").style.display="";
							return false;
						}else if("OutTimes" == data.result){
							$("#password").tips({
								side : 1,
								msg : "密码错误次数超过上限，已被锁定，请联系管理员",
								bg : '#FF5080',
								time : 2
							});
							$("#password").focus();
							return false;
						}else if("lock" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户已被锁定，请联系管理员",
								bg : '#FF5080',
								time : 2
							});
							$("#loginname").focus();
							return false;
						}else if("comInfo" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户缺少法人信息",
								bg : '#FF5080',
								time : 2
							});
							$("#loginname").focus();
							return false;
						}else if("ShowCode" == data.result){
							document.getElementById("cCode").style.display="";
							return false;
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误,请刷新验证码，并重新输入验证码！",
								bg : '#FF5080',
								time : 1
							});
							$("#code").focus();
							return false;
						}else if("hasU" == data.result){
							bootbox.dialog({
									message: "<span class='bigger-110'>一个浏览器只允许登陆一个用户!</span>",
									buttons:
									{
										"button" :
										 {
										   "label" : "确定",
											"className" : "btn-sm btn-success",
											"callback": function() {
											window.location.href='login_toLogin';
											}
										}
									}
							});
						}else if("InitPwd" == data.result || "ValidityPwd" == data.result){
							var str = "登陆密码与初始密码相同,请修改密码!";
							if("ValidityPwd" == data.result){
								str = "登陆密码过期,请修改密码!"; 
							}
							bootbox.confirm(str, function(result) {
								if(result) {
								bootbox.dialog({
								message: '<form class="form-horizontal" role="form" id="cpwd_form"><table id="table_report" class="table table-striped " style="width:80%;"><tr><td style="width:79px;text-align: right;padding-top: 13px;">密码:</td><td><input type="password" name="InitPwd" id="InitPwd"  maxlength="32" placeholder="输入密码" title="密码" style="width:98%;"/></td></tr><tr><td style="width:79px;text-align: right;padding-top: 13px;">确认密码:</td><td><input type="password" name="chkInitPwd" id="chkInitPwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td></tr></table></from>',
								buttons: 			
								{
									"button" :
									{
										"label" : "提交",
										"className" : "btn-sm btn-success",
										"callback": function() {
											if($("#InitPwd").val()==""){
												$("#InitPwd").tips({
													side:3,
													msg:'输入密码',
													bg:'#AE81FF',
													time:1
												});
												$("#InitPwd").focus();
												return false;
											}
											if($("#InitPwd").val()!=$("#chkInitPwd").val()){
												$("#chkInitPwd").tips({
													side:3,
													msg:'两次密码不相同',
													bg:'#AE81FF',
													time:1
												});
												$("#chkInitPwd").focus();
												return false;
											}
											var params = $("#InitPwd").val();
											$.ajax({
												type: "post",
												url: 'login_Pwdchange',
												data:{InitPwd:params,USER_ID:data.USERID,USERNAME:data.USERName},
												dataType:'json',
												cache: false,
												success: function(data) {
													if (data.result == "success") {
														bootbox.dialog({
															message: "<span class='bigger-110'>修改成功,请重新登陆!</span>",
															buttons:
																{
																"button" :
																	{
																	"label" : "确定",
																	"className" : "btn-sm btn-success",
																	"callback": function() {
																		window.location.href='login_toLogin';
																		}
																	}
																}
														});
													}else{
														$("#InitPwd").tips({
														side:3,
														msg:data.msg,
														bg:'#AE81FF',
														time:1
														});
														$("#InitPwd").focus();
													}
												}
										});
										return false;
										}
									}
								}
							});
						}
						})
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 1

							});
							$("#loginname").focus();
							return false;
						}
					}
				});
			}
		}

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#dl").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {
			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 1
				});
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '请重新输入密码',
					bg : '#AE81FF',
					time : 1
				});
				$("#password").focus();
				return false;
			}
			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 3
			})
			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('company', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#company").val('');
				$("#password").val('');
			}else{
			
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('company', $("#company").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		
		function quxiao() {
			$("#loginname").val('');
			$("#company").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var companyname = $.cookie('company');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(companyname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#company").val(companyname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
			}
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<c:if test="${'1' == pd.msg}">
		<script type="text/javascript">
		$(tsMsg());
		function tsMsg(){
			alert('已经有用户在本机登录，您暂时无法登录！');
		}
		</script>
	</c:if>
	<c:if test="${'2' == pd.msg}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				alert('您被系统管理员强制下线');
			}
		</script>
	</c:if>
	<script type="text/javascript" src="static/login/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/login/js/jquery.easing.1.3.js"></script>
	<!--<script type="text/javascript" src="static/login/js/jquery.mobile.customized.min.js"></script>  
	 <script type="text/javascript" src="static/login/js/camera.min.js"></script> 
	<script type="text/javascript" src="static/login/js/templatemo_script.js"></script>-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script> 
</body>
</html>
