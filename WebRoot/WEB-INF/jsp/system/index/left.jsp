<div id="sidebar" class="sidebar responsive ace-save-state"><!--  menu-min -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
					<!--<div class="sidebar-shortcuts" id="sidebar-shortcuts" style="min-height: 32px;">
					 <div class="sidebar-shortcuts-large" style="text-align: left;padding-left: 12px;background-image: url(img/eryuyu.png);" id="liebiao">
						<span class="iconfont icon-liebiao" style="font-size:15px;-webkit-text-stroke-width:0;"><span id="currentMenuName">${menuList[0].title}</span></span>
					</div> 
					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="iconfont icon-liebiao sidebar-toggle sidebar-collapse" style="font-size:15px;-webkit-text-stroke-width:0;"></span>
						
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div>-->

				<ul class="nav nav-list" id="searchMu">

				<c:forEach items="${menuList[0].childNodeList}" var="menu1">
					<li class="" id="n${menu1.id }">
						<a style="cursor:pointer;" target="mainFrame" <c:if test="${not empty menu1.url && '#' != menu1.url}">target="mainFrame" onclick="siMenu('z${menu1.id }','lm${menu1.id }','${menu1.title }','${menu1.url }')"</c:if><c:if test="${null != menu1.childNodeList}"> class="dropdown-toggle"</c:if>>
						<span class=" ${menu1.icon == null ? 'menu-icon fa fa-leaf black' : menu1.icon} menu-text"> ${menu1.title } </span>
							<c:if test="${null != menu1.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
						</a>
						<b class="arrow"></b>
						<c:if test="${null != menu1.childNodeList}">
						<ul class="submenu">
						<c:forEach items="${menu1.childNodeList}" var="menu2">
							<li class="" id="z${menu2.id }">
								<a style="cursor:pointer;" <c:if test="${not empty menu2.url && '#' != menu2.url}">target="mainFrame" onclick="siMenu('z${menu2.id }','lm${menu1.id }','${menu2.title }','${menu2.url }')"</c:if><c:if test="${null != menu2.childNodeList}"> class="dropdown-toggle"</c:if>>
									<i class="${menu2.icon == null ? 'menu-icon fa fa-leaf black' : menu2.icon}"></i>
										${menu2.title }
									<c:if test="${null != menu2.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
								</a>
								<b class="arrow"></b>
								<c:if test="${null != menu2.childNodeList}">
								<ul class="submenu">
									<c:forEach items="${menu2.childNodeList}" var="menu3">
										<li class="" id="m${menu3.id }">
											<a style="cursor:pointer;" <c:if test="${not empty menu3.url && '#' != menu3.url}">target="mainFrame" onclick="siMenu('z${menu3.id }','lm${menu2.id }','${menu3.title }','${menu3.url }')"</c:if><c:if test="${null != menu3.childNodeList}"> class="dropdown-toggle"</c:if>>
												<i class="${menu3.icon == null ? 'menu-icon fa fa-leaf black' : menu3.icon}"></i>
													${menu3.title }
												<c:if test="${null != menu3.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
											</a>
											<b class="arrow"></b>
											<c:if test="${null != menu3.childNodeList}">
											<ul class="submenu">
												<c:forEach items="${menu3.childNodeList}" var="menu4">
												<li class="" id="k${menu4.id }">
													<a style="cursor:pointer;" <c:if test="${not empty menu4.url && '#' != menu4.url}">target="mainFrame" onclick="siMenu('z${menu4.id }','lm${menu3.id }','${menu4.title }','${menu4.url }')"</c:if><c:if test="${null != menu4.childNodeList}"> class="dropdown-toggle"</c:if>>
														<i class="${menu4.icon == null ? 'menu-icon fa fa-leaf black' : menu4.icon}"></i>
															<span>${menu4.title }</span>
														<c:if test="${null != menu4.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
													</a>
													<b class="arrow"></b>
														<c:if test="${null != menu4.childNodeList}">
															<ul class="submenu">
																<c:forEach items="${menu4.childNodeList}" var="menu5">
																<li class="" id="k${menu5.id }">
																	<a style="cursor:pointer;" <c:if test="${not empty menu5.url && '#' != menu5.url}">target="mainFrame" onclick="siMenu('z${menu5.id }','lm${menu4.id }','${menu5.title }','${menu5.url }')"</c:if><c:if test="${null != menu5.childNodeList}"> class="dropdown-toggle"</c:if>>
																		<i class="${menu5.icon == null ? 'menu-icon fa fa-leaf black' : menu5.icon}"></i>
																			<span>${menu5.title }</span>
																		<c:if test="${null != menu5.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
																	</a>
																	<b class="arrow"></b>
																</li>
																</c:forEach>
															</ul>
														</c:if>
												</li>
												</c:forEach>
											</ul>
											</c:if>
										</li>
									</c:forEach>
								</ul>
								</c:if>
							</li>
						</c:forEach>
						</ul>
						</c:if>
					</li>
				</c:forEach>
				</ul><!-- /.nav-list -->
				<div style="position: fixed;bottom: 4px;line-height: 27px;border-top: 1px #42A9F8 solid;width: 180px;">
					<div style="margin-left:5px">登录用户：<span style="color:#42A9F8">${pd.name}</span></div>
					<div style="margin-left:5px">用户机构：<span style="color:#42A9F8">${pd.org}</span></div>
					<div style="margin-left:5px">当前日期：<span style="color:#42A9F8" id="time"></span></div>
				</div>

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse" style="display:none;">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
				<script type="text/javascript">
					// console.log(${menuList});
					function queryTree(){
						var searchMenu = $.trim($("#nav-search-input").val());
						if(searchMenu!=null && searchMenu !="" && searchMenu !="搜索..."){
							$('#searchMu').find('li').each(function(){
								if(($(this).text()).indexOf(searchMenu)>-1){
									console.log($(this).html()+"....");
									this.focus();
								} else {
									$(this).blur();
								}
							})
						}
					}
					
					function setTime(){
						var date = new Date();
						var year = date.getFullYear();
						var mouth = date.getMonth() + 1;
						var day = date.getDate();
						$("#time").html(year+"-"+mouth+"-"+day);
					};
					setTime();
				</script>
			</div>