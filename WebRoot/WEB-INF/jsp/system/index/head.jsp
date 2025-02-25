		<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript" src="static/js/jquery-3.1.1.min.js"></script>
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed');}catch(e){}
				var locat = (window.location+'').split('/');
			</script>
	    

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<!-- <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>
 -->
				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<div class="navbar-brand">
						<span class="white" style="font-size:20px;line-height:40px;text-align:center;">
							<img src="static/login/images/logo.png" style="height:35px;" />${pd.SYSNAME} </span>
					</div> 
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav" id="headermenu">
						<c:forEach items="${menuList}" var="headmenu">
							<li>
								<a href="#" id="n${headmenu.id }" flag="menu">${headmenu.title }</a>
							</li>
						</c:forEach>
						<li title="即时聊天"  onclick="creatw();"><!-- creatw()在 WebRoot\plugins\websocketInstantMsg\websocket.js中 -->
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important"></span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-bell-o"></i>
									SmartSense Aadmin 即时通讯
								</li>
							</ul>
						</li>

						<li title="站内信"  target="mainFrame"  onclick="siMenu('z0','lm0','站内信',${locat}'fhsms/list.do?')" id="fhsmstss"><!-- fhsms()在 WebRoot\static\js\myjs\head.js中 -->
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span id="fhsmsCount" class="badge badge-success"></span>
							</a>
						</li>

						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown"  class="dropdown-toggle" href="#">
								<img class="nav-user-photo" src="static/ace/avatars/user.png" alt="Jason's Photo" />
								<!--<span class="user-info" id="user_info">
								</span>-->
								<i class="ace-icon fa fa-caret-down" style="color: #dddddd;"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a onclick="editUserH();" style="cursor:pointer;"><i class="ace-icon fa fa-cog"></i>修改资料</a><!-- editUserH()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li id="systemset">
									<a onclick="editSys();" style="cursor:pointer;"><i class="ace-icon fa fa-user"></i>系统设置</a><!-- editSys()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li id="orgset">
									<a onclick="changeOrg();" style="cursor:pointer;"><i class="ace-icon fa fa-cog"></i>机构切换</a><!-- changeOrg()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li class="divider"></li>
								<li>
									<a href="logout"><i class="ace-icon fa fa-power-off"></i>退出登录</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
					<span id="isInitPassword" style="display:none">${menuList}</span>
				</div>
				<script>
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

					$("#headermenu>li:first-child").addClass('active');

					$('#headermenu>li>a').click(function (e) {
				        e.preventDefault();
				        var $ul = $(this).parent().parent();
				        var content = $(this).html();
				        var id = $(this).attr('id');

				        var flag = $(this).attr("flag");
				        console.log(flag);
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
				        $("#currentMenuName").html(content);
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
				    		html += '<li class="hover highlight" id="n'+nodeList[i].id+'">';
				    		html += '<a style="cursor:pointer;" target="mainFrame" ';
				    		if(nodeList[i].url&&nodeList[i].url!="#"){
				    			html += ' onclick="siMenu(\'z'+nodeList[i].id+'\',\'lm'+ nodeList[i].id +'\',\''+nodeList[i].title +'\',\''+nodeList[i].url+'\')"';
				    		}
				    		if(nodeList[i].childNodeList){
				    			html += ' class="dropdown-toggle"';
				    		}
				    		html += '>';
				    		if(nodeList[i].icon){
				    			class1 = nodeList[i].icon;
				    		}
				    		html += '<span class="hover highlight '+ class1 +' menu-text"> '+nodeList[i].title +' </span>';
				    		if(nodeList[i].childNodeList){
				    			html += ' <b class="arrow fa fa-angle-down"></b>'
				    		}
				    		html += ' </a><b class="arrow"></b>';
				    		if(nodeList[i].childNodeList){
				    			var childNode = nodeList[i].childNodeList;
				    			html += '<ul class="submenu can-scroll ace-scroll scroll-disabled">';
				    			for(var j=0;j<childNode.length;j++){
				    				html += '<li class="hover highlight" id="z'+childNode[j].id+'">';
						    		html += '<a style="cursor:pointer;" target="mainFrame" ';
						    		if(childNode[j].url){
						    			html += ' onclick="siMenu(\'z'+childNode[j].id+'\',\'lm'+ childNode[j].id +'\',\''+childNode[j].title +'\',\''+childNode[j].url+'\')"';
						    		}
						    		if(childNode[j].childNodeList){
						    			html += ' class="dropdown-toggle"';
						    		}
						    		html += '>';
						    		if(childNode[j].icon){
						    			class1 = childNode[j].icon;
						    		}
						    		html += '<i class="'+ class1 +'"></i>'+childNode[j].title;
						    		if(childNode[j].childNodeList){
						    			html += ' <b class="arrow fa fa-angle-down"></b>'
						    		}
						    		html += ' </a><b class="arrow"></b>';
						    		if(childNode[j].childNodeList){
						    			var childNode1 = childNode[j].childNodeList;
						    			html += '<ul class="submenu can-scroll ace-scroll scroll-disabled">';
						    			for(var k=0;k<childNode1.length;k++){
						    				html += '<li class="hover highlight" id="z'+childNode1[k].id+'">';
								    		html += '<a style="cursor:pointer;" target="mainFrame" ';
								    		if(childNode1[k].url){
								    			html += ' onclick="siMenu(\'z'+childNode1[k].id+'\',\'lm'+ childNode1[k].id +'\',\''+childNode1[k].title +'\',\''+childNode1[k].url+'\')"';
								    		}
								    		if(childNode1[k].childNodeList){
								    			html += ' class="dropdown-toggle"';
								    		}
								    		html += '>';
								    		if(childNode1[k].icon){
								    			class1 = childNode1[k].icon;
								    		}
								    		html += '<i class="'+ class1 +'"></i>'+childNode1[k].title;
								    		if(childNode1[k].childNodeList){
								    			html += ' <b class="arrow fa fa-angle-down"></b>'
								    		}
								    		html += ' </a><b class="arrow"></b>';
								    			if(childNode1[k].childNodeList){
									    			var childNode2 = childNode1[k].childNodeList;
									    			html += '<ul class="submenu can-scroll ace-scroll scroll-disabled">';
									    			for(var h=0;h<childNode2.length;h++){
									    				html += '<li class="hover highlight" id="z'+childNode2[h].id+'">';
											    		html += '<a style="cursor:pointer;" target="mainFrame" ';
											    		if(childNode2[h].url){
											    			html += ' onclick="siMenu(\'z'+childNode2[h].id+'\',\'lm'+ childNode2[h].id +'\',\''+childNode2[h].title +'\',\''+childNode2[h].url+'\')"';
											    		}
											    		if(childNode2[h].childNodeList){
											    			html += ' class="dropdown-toggle"';
											    		}
											    		html += '>';
											    		if(childNode2[h].icon){
											    			class1 = childNode2[h].icon;
											    		}
											    		html += '<i class="'+ class1 +'"></i>'+childNode2[h].title;
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

				</script>
				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
		<div id="fhsmsobj"><!-- 站内信声音消息提示 --></div>
