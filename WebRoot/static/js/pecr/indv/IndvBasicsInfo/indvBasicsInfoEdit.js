/*initDict('orgCode', staticDict.orgCodeYillion);*/
/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laytpl'], function(){
    var element = layui.element //获取element模块
		form = layui.form, //获取form模块
		layer = layui.layer, //获取layer模块
		laydate = layui.laydate, //获取laydate模块
		table = layui.table //获取table模块
	    laytpl = layui.laytpl;  //获取laytpl模块  模板引擎

    /**
     * 模块化加载
     * 自定义模块
     */
    require(['static/js/pecr/module/base','static/js/pecr/module/verify','static/js/pecr/module/config'],function(base,verify,config){
        /**
         * element组件渲染
         * form组件渲染
         */
        element.init();//每个页面都有
        form.render();//每个页面都有
		
		//日期输入框  按css将所有的date组件渲染
		$(".datefield").each(function(){
			laydate.render({
				elem: this,
				trigger:'click',
				theme: '#588fd0',
				format: 'yyyy-MM-dd'
			});
		});
	
        /**
         * 全局变量
         */
		var baseExistFlag = 'N';
        var modelIndex = null; //标记模态框
        var dataObj = window.parent.$("body").data("dataObj"); //获取单条数据信息，判断是新增还是修改
		var pageType = dataObj ? "edit" : "add"; //根据页面初始数据判断该页面是新增还是修改
		var addOrUpdate = document.getElementById("addOrUpdate").value;
		
		var toolCol ;
		if(addOrUpdate === 'detail'){
			toolCol = "#dataTableToolBarTplDetail";
		}else{
			toolCol = "#dataTableToolBarTpl";
		}
		
		var basBsSgmt, basFcsInfoSgmt, basSpsInfoSgmt,basEduInfoSgmt,basOctpnInfoSgmt,basRedncInfoSgmt,basMlgInfoSgmt,basIncInfSgmt;
		if(pageType === 'edit'){
			//基础段
			basBsSgmt = JSON.parse(document.getElementById("basBsSgmt").value);
			//基本概况段
			basFcsInfoSgmt = JSON.parse(document.getElementById("basFcsInfoSgmt").value);
			//在保责任信息段
			basSpsInfoSgmt = JSON.parse(document.getElementById("basSpsInfoSgmt").value);
			//教育信息段
			basEduInfoSgmt = JSON.parse(document.getElementById("basEduInfoSgmt").value);
			basOctpnInfoSgmt = JSON.parse(document.getElementById("basOctpnInfoSgmt").value);
			basRedncInfoSgmt = JSON.parse(document.getElementById("basRedncInfoSgmt").value);
			basMlgInfoSgmt = JSON.parse(document.getElementById("basMlgInfoSgmt").value);
			basIncInfSgmt = JSON.parse(document.getElementById("basIncInfSgmt").value);
		}

        var d0 = $.Deferred(),d1 = $.Deferred();
		
		/**
		* 查询所属机构
		*/
		var queryOrg = function () {
			$.ajax({
				url:'dataDictCode/selectOrgList.do', 
				contentType : "application/json;charsetset=UTF-8",
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data){ 
					if (data.result.length){
						base.renderTpl({
							tplId : "orgTpl",
							  arr : {"list" : data.result},
							containerId : "orgCode"
						});
						form.render('select');
						d0.resolve("渲染完成");
					}
				 },  	     
			});
		};
		//查询所属机构
        queryOrg();
		
		/**
         * 初始化常量枚举值
         */
        var initEnumerationValue = function () {
			var array = ['ID_TYPE','PAA_RPT_DATE_CODE','PER_CUSTOMER_TYPE','SEX','W_C_A_R_N_CODES','EDU_LEVEL','ACA_DEGREE','EMP_STATUS'
				,'CPN_TYPE','A_DIVISION','OCCUPATION','TITLE','TECH_TITLE','RESI_STATUS','MARI_STATUS','TRADE_BIG_CLASSIFY'];
			var selectData = [];
			for(var i=0; i<array.length; i++ ){
				var node = {};
				node.systemCodeType = array[i];
				selectData.push(node);
			}
			$.ajax({  
			    url:'dataDictCode/selectCodeTypeList.do', 
				data:{DATA_IDS : JSON.stringify(selectData)},  
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data){
					for(var i=0;i<data.result.length;i++){
						if (data.result[i].ID_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ID_TYPE},
								containerId : "othIdType"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ID_TYPE},
								containerId : "idType"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ID_TYPE},
								containerId : "spoIdType"
							});
							continue;
						} else if (data.result[i].PAA_RPT_DATE_CODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PAA_RPT_DATE_CODE},
								containerId : "rptDateCode"
							});
							continue;
						} else if (data.result[i].TRADE_BIG_CLASSIFY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].TRADE_BIG_CLASSIFY},
								containerId : "industry"
							});
							continue;
						} else if(data.result[i].PER_CUSTOMER_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_CUSTOMER_TYPE},
								containerId : "customerType"
							});
							continue;
						} else if(data.result[i].SEX){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].SEX},
								containerId : "sex"
							});
							continue;
						} else if(data.result[i].W_C_A_R_N_CODES){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].W_C_A_R_N_CODES},
								containerId : "nation"
							});
							continue;
						} else if(data.result[i].EDU_LEVEL){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].EDU_LEVEL},
								containerId : "eduLevel"
							});
							continue;
						} else if(data.result[i].ACA_DEGREE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ACA_DEGREE},
								containerId : "acaDegree"
							});
							continue;
						} else if(data.result[i].EMP_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].EMP_STATUS},
								containerId : "empStatus"
							});
							continue;
						} else if(data.result[i].CPN_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CPN_TYPE},
								containerId : "cpnType"
							});
							continue;
						} else if(data.result[i].A_DIVISION){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].A_DIVISION},
								containerId : "cpnDist"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].A_DIVISION},
								containerId : "resiDist"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].A_DIVISION},
								containerId : "mailDist"
							});
							continue;
						} else if(data.result[i].OCCUPATION){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].OCCUPATION},
								containerId : "occupation"
							});
							continue;
						} else if(data.result[i].TITLE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].TITLE},
								containerId : "title"
							});
							continue;
						} else if(data.result[i].TECH_TITLE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].TECH_TITLE},
								containerId : "techTitle"
							});
							continue;
						} else if(data.result[i].RESI_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].RESI_STATUS},
								containerId : "resiStatus"
							});
							continue;
						} else if(data.result[i].MARI_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].MARI_STATUS},
								containerId : "mariStatus"
							});
							continue;
						}
					}
                    form.render('select');
                    d1.resolve("渲染完成");
				}	     
		    });
        };
        //初始化常量枚举值
        initEnumerationValue();
		
		/**
		 * 监听担保业务大类切换
		 */
		form.on('select(nation)', function(data){
			$.ajax({
				url:'dataDictCode/selectCodeListByUperId.do', 
				data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data){
					if (data.result.length){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result},
							containerId : "hhDist"
						});
					}
					form.render('select');
				}
			});
		});
		
		
		/**
		 * 监听所属机构顺带修改对应的业务管理机构
		 */
		form.on('select(orgCode)', function(data){
			var cimoc = $("#orgCode").find("option:selected").attr("data-id");
			$("#cimoc").val(cimoc);
		});


        $.when(d0,d1).done(function (d0,d1) {
            /****************************************基础段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basBsSgmt){
                $("#baseSaveBtn").show().data("id",dataObj.paaBsSmgtId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.paaBsSmgtId);
                /*$("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.paaBsSmgtId);*/
                
                $("#infRecType").val(basBsSgmt.INF_REC_TYPE);
                $("#name").val(basBsSgmt.NAME);
                $("#idType").val(basBsSgmt.ID_TYPE);
                $("#idNum").val(basBsSgmt.ID_NUM);
                $("#infSurcCode").val(basBsSgmt.INF_SURC_CODE);
                $("#rptDateCode").val(basBsSgmt.RPT_DATE_CODE);
                $("#orgCode").val(basBsSgmt.ORG_CODE);
                $("#customerType").val(basBsSgmt.CUSTOMER_TYPE);
                $("#cimoc").val(basBsSgmt.CIMOC);
                $("#isFilter").val(basBsSgmt.IS_FILTER);
                $("#rptDate").val(basBsSgmt.RPT_DATE);
                
                form.render('select');
                verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',false,false); //数据校验
            }else{
                $("#baseAddBtn").show();
            }
			
			//点击新增按钮
			$("#baseAddBtn").on("click",function () {
				var $this = $(this);
				$.ajax({
					type : "POST",  //请求方式
					url  : "generateUUID/id.do",
					success : function(data) {
						if(data.success == true){
							$this.hide();
							$("#baseSaveBtn").show().data("id",data.result).data("type","add");
							$("#baseDelBtn").data("id",data.result);
							/*$("#delAllModelBtn,#pushAllModelBtn").show().data("id",data.result);*/
						}else{
							layer.alert(data.msg);
						}
					},
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}
				});
			});
	
            //点击保存按钮
            form.on('submit(baseSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = $this.data("id");
				para.infRecType = $("#infRecType").val();
                para.name = $("#name").val();
                para.idType = $("#idType").val();
                para.idNum = $("#idNum").val();
                para.infSurcCode = $("#infSurcCode").val();
                para.rptDateCode = $("#rptDateCode").val();
                para.orgCode = $("#orgCode").val();
                para.orgName = $("#orgCode").next().find(".layui-this").html();
                para.customerType = $("#customerType").val();
                para.cimoc = $("#cimoc").val();
                para.isFilter = $("#isFilter").val();
                para.rptDate = $("#rptDate").val();
				console.log("基础段id"+para.paaBsSmgtId);
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasBsSgmt.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#baseDelBtn").show();
								/*$("#delAllModelBtn,#pushAllModelBtn").show();*/
							}
							$this.data("type","edit");
							baseExistFlag = 'Y';
							dataObj = para; //存储新数据
			                verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验

						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#baseDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('删除基础段相当于删除该页面所有段信息，是否确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'indvBasicsInfo/deletePcBsSgmt.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
								parent.layer.close(index); //再执行关闭
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            //新增情况下基础段自动点击一下让基础段默认展开
            if (!dataObj){
                $("#baseAddBtn").click();
            }
            /****************************************基础段结束****************************************/

            /****************************************其他标识段开始****************************************/
            var rltInfoUrl;
			if(pageType === 'edit'){
				rltInfoUrl = 'indvBasicsInfo/getIdSmgtList.do?paaBsSmgtId='+ dataObj.paaBsSmgtId 
						+ "&pageType=" + pageType;
				$("#responsibleAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'indvBasicsInfo/getIdSmgtList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'responsibleDataTable',
				elem : '#responsibleDataTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"pabIdSgmtId",title:"主键"},
					{align : "center",field : "alias",title : "姓名"},
                    {align : "center",field : "othIdType",title : "证件类型", templet:function(d){return renderColumnDict(d, 'othIdType', staticDict.idType)}},
                    {align : "center",field : "othIdNum",title : "证件号码"},
                    {align : "center",field : "idInfoUpDate",title : "信息更新日期"},
					{align:"center",title:"操作",width:200,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});
		
            //点击新增按钮
            $("#responsibleAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                	$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$("#saveResponsibleModelAddBtn").data("id",data.result);
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                	$("#alias").val("");
                    $("#othIdType").val("");
                    $("#othIdNum").val("");
                    $("#idInfoUpDate").val("");
                    form.render('select');
//                    $("#saveResponsibleModelAddBtn").data("id","");
					$("#cancelResponsibleModelBtn").data("id",dataObj.paaBsSmgtId);
					modelIndex = layer.open({
                        type: 1,
                        title: "新增",
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#responsibleEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(responsibleDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                	$("#alias").val(data.alias);
                    $("#othIdType").val(data.othIdType);
                    $("#othIdNum").val(data.othIdNum);
                    $("#idInfoUpDate").val(data.idInfoUpDate);
                    form.render('select');
                    $("#saveResponsibleModelAddBtn").data("id",data.pabIdSgmtId);
                    verify.dataValidation('saveResponsible','I_ID', $("#saveResponsibleModelAddBtn").data("id"),'form',false,false); //获取错误校验信息
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#responsibleEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.paaBsSmgtId = dataObj.paaBsSmgtId;
					para.pabIdSgmtId = data.pabIdSgmtId;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'indvBasicsInfo/deletePcBasIdSgmt.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('responsibleDataTable',{});
									layer.close(modelIndex);
								} else {
									layer.alert(data.msg);
								}
							 },
							//请求失败，包含具体的错误信息
							error : function(e){
								layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
							}					 
						});
                    });
				}
            });
			
            //点击保存按钮
            form.on('submit(saveResponsibleModelAddBtn)', function(data){
            	console.log(dataObj.paaBsSmgtId);
				$.ajax({
					type : "POST",  //请求方式
					url  : "indvBasicsInfo/addOrUpdatePcBasBsSgmt.do",
					data : {rltData  :  JSON.stringify(data.field),
					        paaBsSmgtId : dataObj.paaBsSmgtId,
					        pabIdSgmtId : $("#saveResponsibleModelAddBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
							var newrltInfoUrl = 'indvBasicsInfo/getIdSmgtList.do?paaBsSmgtId='+ dataObj.paaBsSmgtId + '&pageType=edit';
                            table.reload('responsibleDataTable', {url:newrltInfoUrl});
                            layer.close(modelIndex);
                            verify.dataValidation('responsible','I_ID', $("#saveResponsibleModelAddBtn").data("id"),'form1',true,false); //数据校验
                            verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验
						}else{
							layer.alert(result.msg);
						}
					},
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}
				});
				return false;//防止页面跳转
            });
            /****************************************其他标识段结束****************************************/
            
            /****************************************基本概况段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basFcsInfoSgmt){
				$("#nation").val(basFcsInfoSgmt.NATION);
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#nation").find("option[value='"+basFcsInfoSgmt.NATION+"']").data("id")},
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data){
						if (data.result.length){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result},
								containerId : "hhDist"
							});
						}
						$("#hhDist").val(basFcsInfoSgmt.HH_DIST);
						form.render('select');
					}
				});
				$("#sex").val(basFcsInfoSgmt.SEX);
				$("#dob").val(basFcsInfoSgmt.D_O_B);
				$("#houseAdd").val(basFcsInfoSgmt.HOUSE_ADD);
				$("#cellPhone").val(basFcsInfoSgmt.CELL_PHONE);
				$("#email").val(basFcsInfoSgmt.EMAIL);
				$("#fcsInfoUpDate").val(basFcsInfoSgmt.FCS_INFO_UP_DATE);
				
				$("#basicSaveBtn").show().data("id",basFcsInfoSgmt.PAC_FCS_INF_SGMT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",basFcsInfoSgmt.PAC_FCS_INF_SGMT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('basic','I_FCS_INF',basFcsInfoSgmt.PAC_FCS_INF_SGMT_ID,'form',false,false); //数据校验
            }else{
                $("#basicAddBtn").show();
            }
			
			//点击新增按钮
			$("#basicAddBtn").on("click",function () {
				if (dataObj || baseExistFlag === 'Y'){
					var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#basicSaveBtn").show().data("id",data.result).data("type","add");
							    $("#basicDelBtn").data("id",data.result);
								$this.parent().children('div.layui-colla-content').addClass('layui-show');
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
				}else{
					layer.msg("请先添加基础段信息");
				}
			});
			
            //点击保存按钮
            form.on('submit(basicSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = dataObj.paaBsSmgtId;
				para.pacFcsInfSgmtId = $this.data("id");
				para.sex = $("#sex").val();
                para.dob = $("#dob").val();
                para.nation = $("#nation").val();
                para.hhDist = $("#hhDist").val();
                para.houseAdd = $("#houseAdd").val();
                para.cellPhone = $("#cellPhone").val();
                para.email = $("#email").val();
                para.fcsInfoUpDate = $("#fcsInfoUpDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasFcsInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#basicDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('basic','I_FCS_INF',$this.data("id"),'form',true,false); //数据校验
							verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验
						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#basicDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = dataObj.paaBsSmgtId;
                    para.pacFcsInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'indvBasicsInfo/PcBasFcsInfSgmtDel.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#basicAddBtn").show();
								$("#basicSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            /****************************************基本概况段结束****************************************/


            /****************************************教育信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basEduInfoSgmt){
				$("#eduLevel").val(basEduInfoSgmt.EDU_LEVEL);
				$("#acaDegree").val(basEduInfoSgmt.ACA_DEGREE);
				$("#eduInfoUpDate").val(basEduInfoSgmt.EDU_INFO_UP_DATE);
				
				$("#insuranceSaveBtn").show().data("id",basEduInfoSgmt.PAD_EDU_INF_SGMT_ID).data("type","edit");
				$("#insuranceDelBtn").show().data("id",basEduInfoSgmt.PAD_EDU_INF_SGMT_ID);
				$("#insuranceSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('insurance','I_EDU_INF',basEduInfoSgmt.PAD_EDU_INF_SGMT_ID,'form',false,false); //数据校验
            }else{
                $("#insuranceAddBtn").show();
            }
            //点击新增按钮
            $("#insuranceAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#insuranceSaveBtn").show().data("id",data.result).data("type","add");
							    $("#insuranceDelBtn").data("id",data.result);
								$this.parent().children('div.layui-colla-content').addClass('layui-show');
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(insuranceSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = dataObj.paaBsSmgtId;
				para.padEduInfSgmtId = $this.data("id");
				para.eduLevel = $("#eduLevel").val();
                para.acaDegree = $("#acaDegree").val();
                para.eduInfoUpDate = $("#eduInfoUpDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasEduInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#insuranceDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('insurance','I_EDU_INF',$this.data("id"),'form',true,false); //数据校验
							verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验

						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#insuranceDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = dataObj.paaBsSmgtId;
                    para.padEduInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvBasicsInfo/delPcBasEduInfSgmtById.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#insuranceAddBtn").show();
								$("#insuranceSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            /****************************************教育信息段结束****************************************/

            /****************************************职业信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basOctpnInfoSgmt){
				$("#empStatus").val(basOctpnInfoSgmt.EMP_STATUS);
				$("#cpnName").val(basOctpnInfoSgmt.CPN_NAME);
				$("#cpnType").val(basOctpnInfoSgmt.CPN_TYPE);
				$("#industry").val(basOctpnInfoSgmt.INDUSTRY);
				$("#cpnAddr").val(basOctpnInfoSgmt.CPN_ADDR);
				$("#cpnPc").val(basOctpnInfoSgmt.CPN_PC);
				$("#cpnDist").val(basOctpnInfoSgmt.CPN_DIST);
				$("#cpnTEL").val(basOctpnInfoSgmt.CPN_T_E_L);
				$("#occupation").val(basOctpnInfoSgmt.OCCUPATION);
				$("#title").val(basOctpnInfoSgmt.TITLE);
				$("#techTitle").val(basOctpnInfoSgmt.TECH_TITLE);
				$("#workStartDate").val(basOctpnInfoSgmt.WORK_START_DATE);
				$("#octpnInfoUpDate").val(basOctpnInfoSgmt.OCTPN_INFO_UP_DATE);
				
				$("#jobSaveBtn").show().data("id",basOctpnInfoSgmt.PAE_OCTPN_INF_SGMT_ID).data("type","edit");
				$("#jobDelBtn").show().data("id",basOctpnInfoSgmt.PAE_OCTPN_INF_SGMT_ID);
				$("#jobSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('job','I_OCTPN_INF',basOctpnInfoSgmt.PAE_OCTPN_INF_SGMT_ID,'form',false,false); //数据校验

            }else{
                $("#jobAddBtn").show();
            }
            //点击新增按钮
            $("#jobAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#jobSaveBtn").show().data("id",data.result).data("type","add");
							    $("#jobDelBtn").data("id",data.result);
								$this.parent().children('div.layui-colla-content').addClass('layui-show');
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(jobSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = dataObj.paaBsSmgtId;
				para.paeOctpnInfSgmtId = $this.data("id");
				para.empStatus = $("#empStatus").val();
                para.cpnName = $("#cpnName").val();
                para.cpnType = $("#cpnType").val();
                para.industry = $("#industry").val();
                para.cpnAddr = $("#cpnAddr").val();
                para.cpnPc = $("#cpnPc").val();
                para.cpnDist = $("#cpnDist").val();
                para.cpnTEL = $("#cpnTEL").val();
                para.occupation = $("#occupation").val();
                para.title = $("#title").val();
                para.techTitle = $("#techTitle").val();
                para.workStartDate = $("#workStartDate").val();
                para.octpnInfoUpDate = $("#octpnInfoUpDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasOctpnInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#jobDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('job','I_OCTPN_INF',$this.data("id"),'form',true,false); //数据校验
							verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验
						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#jobDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = dataObj.paaBsSmgtId;
                    para.paeOctpnInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvBasicsInfo/delPcBasOctpnInfSgmtById.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#jobAddBtn").show();
								$("#jobSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            /****************************************职业信息段结束****************************************/
            
            /****************************************居住地址段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basRedncInfoSgmt){
				$("#resiStatus").val(basRedncInfoSgmt.RESI_STATUS);
				$("#resiAddr").val(basRedncInfoSgmt.RESI_ADDR);
				$("#resiPc").val(basRedncInfoSgmt.RESI_PC);
				$("#resiDist").val(basRedncInfoSgmt.RESI_DIST);
				$("#homeTel").val(basRedncInfoSgmt.HOME_TEL);
				$("#resiInfoUpDate").val(basRedncInfoSgmt.RESI_INFO_UP_DATE);
				
				$("#liveSaveBtn").show().data("id",basRedncInfoSgmt.PAF_REDNC_INF_SGMT_ID).data("type","edit");
				$("#liveDelBtn").show().data("id",basRedncInfoSgmt.PAF_REDNC_INF_SGMT_ID);
				$("#liveSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('live','I_REDNC_INF',basRedncInfoSgmt.PAF_REDNC_INF_SGMT_ID,'form',false,false); //数据校验

            }else{
                $("#liveAddBtn").show();
            }
            //点击新增按钮
            $("#liveAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#liveSaveBtn").show().data("id",data.result).data("type","add");
							    $("#liveDelBtn").data("id",data.result);
								$this.parent().children('div.layui-colla-content').addClass('layui-show');
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(liveSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = dataObj.paaBsSmgtId;
				para.pafRedncInfSgmtId = $this.data("id");
				para.resiStatus = $("#resiStatus").val();
                para.resiAddr = $("#resiAddr").val();
                para.resiPc = $("#resiPc").val();
                para.resiDist = $("#resiDist").val();
                para.homeTel = $("#homeTel").val();
                para.resiInfoUpDate = $("#resiInfoUpDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasRedncInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#liveDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('live','I_REDNC_INF',$this.data("id"),'form',true,false); //数据校验
							verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验
						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#liveDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = dataObj.paaBsSmgtId;
                    para.pafRedncInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvBasicsInfo/delPcBasRedncInfSgmtById.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#liveAddBtn").show();
								$("#liveSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            /****************************************居住地址段结束****************************************/
            
            /****************************************通讯地址信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basMlgInfoSgmt){
				$("#mailAddr").val(basMlgInfoSgmt.MAIL_ADDR);
				$("#mailPc").val(basMlgInfoSgmt.MAIL_PC);
				$("#mailDist").val(basMlgInfoSgmt.MAIL_DIST);
				$("#mlgInfoUpDate").val(basMlgInfoSgmt.MLG_INFO_UP_DATE);
				
				$("#communicationSaveBtn").show().data("id",basMlgInfoSgmt.PAG_MLG_INF_SGMT_ID).data("type","edit");
				$("#communicationDelBtn").show().data("id",basMlgInfoSgmt.PAG_MLG_INF_SGMT_ID);
				$("#communicationSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('communication','I_MLG_INF',basMlgInfoSgmt.PAG_MLG_INF_SGMT_ID,'form',false,false); //数据校验

            }else{
                $("#communicationAddBtn").show();
            }
            //点击新增按钮
            $("#communicationAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#communicationSaveBtn").show().data("id",data.result).data("type","add");
							    $("#communicationDelBtn").data("id",data.result);
								$this.parent().children('div.layui-colla-content').addClass('layui-show');
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(communicationSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = dataObj.paaBsSmgtId;
				para.pagMlgInfSgmtId = $this.data("id");
				para.mailAddr = $("#mailAddr").val();
                para.mailPc = $("#mailPc").val();
                para.mailDist = $("#mailDist").val();
                para.mlgInfoUpDate = $("#mlgInfoUpDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasMlgInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#communicationDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('communication','I_MLG_INF',$this.data("id"),'form',true,false); //数据校验
							verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验
						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#communicationDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = dataObj.paaBsSmgtId;
                    para.pagMlgInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvBasicsInfo/delPcBasMlgInfSgmtById.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#communicationAddBtn").show();
								$("#communicationSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            /****************************************通讯地址信息段结束****************************************/
            
            /****************************************婚姻信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basSpsInfoSgmt){
				$("#mariStatus").val(basSpsInfoSgmt.MARI_STATUS);
				$("#spoName").val(basSpsInfoSgmt.SPO_NAME);
				$("#spoIdType").val(basSpsInfoSgmt.SPO_ID_TYPE);
				$("#spoIdNum").val(basSpsInfoSgmt.SPO_ID_NUM);
				$("#spoTel").val(basSpsInfoSgmt.SPO_TEL);
				$("#spsCmpyNm").val(basSpsInfoSgmt.SPS_CMPY_NM);
				$("#spsInfoUpDate").val(basSpsInfoSgmt.SPS_INFO_UP_DATE);
				
				$("#marriageSaveBtn").show().data("id",basSpsInfoSgmt.PAH_SPS_INF_SGMT_ID).data("type","edit");
				$("#marriageDelBtn").show().data("id",basSpsInfoSgmt.PAH_SPS_INF_SGMT_ID);
				$("#marriageSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('marriage','I_SPS_INF',basSpsInfoSgmt.PAH_SPS_INF_SGMT_ID,'form',false,false); //数据校验

            }else{
                $("#marriageAddBtn").show();
            }
            //点击新增按钮
            $("#marriageAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#marriageSaveBtn").show().data("id",data.result).data("type","add");
							    $("#marriageDelBtn").data("id",data.result);
								$this.parent().children('div.layui-colla-content').addClass('layui-show');
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(marriageSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = dataObj.paaBsSmgtId;
				para.pahSpsInfSgmtId = $this.data("id");
				 para.mariStatus = $("#mariStatus").val();
                 para.spoName = $("#spoName").val();
                 para.spoIdType = $("#spoIdType").val();
                 para.spoIdNum = $("#spoIdNum").val();
                 para.spoTel = $("#spoTel").val();
                 para.spsCmpyNm = $("#spsCmpyNm").val();
                 para.spsInfoUpDate = $("#spsInfoUpDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasSpsInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#marriageDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('marriage','I_SPS_INF',$this.data("id"),'form',true,false); //数据校验
							verify.dataValidation('base','I_BS',dataObj.paaBsSmgtId,'form',true,false); //数据校验
						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#marriageDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = dataObj.paaBsSmgtId;
                    para.pahSpsInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvBasicsInfo/delPcBasSpsInfSgmtById.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#marriageAddBtn").show();
								$("#marriageSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            /****************************************婚姻信息段结束****************************************/
            
            /****************************************收入信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && basIncInfSgmt){
				$("#annlInc").val(basIncInfSgmt.ANNL_INC);
				$("#taxIncome").val(basIncInfSgmt.TAX_INCOME);
				$("#incInfoUpDate").val(basIncInfSgmt.INC_INFO_UP_DATE);
				
				$("#incomeSaveBtn").show().data("id",basIncInfSgmt.PAI_INC_INF_SGMT_ID).data("type","edit");
				$("#incomeDelBtn").show().data("id",basIncInfSgmt.PAI_INC_INF_SGMT_ID);
				$("#incomeSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('income','I_INC_INF',basIncInfSgmt.PAI_INC_INF_SGMT_ID,'form',false,false); //数据校验

            }else{
                $("#incomeAddBtn").show();
            }
            //点击新增按钮
            $("#incomeAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#incomeSaveBtn").show().data("id",data.result).data("type","add");
							    $("#incomeDelBtn").data("id",data.result);
								$this.parent().children('div.layui-colla-content').addClass('layui-show');
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(incomeSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.paaBsSmgtId = dataObj.paaBsSmgtId;
				para.paiIncInfSgmtId = $this.data("id");
				para.annlInc = $("#annlInc").val();
                para.taxIncome = $("#taxIncome").val();
                para.incInfoUpDate = $("#incInfoUpDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvBasicsInfo/updatePcBasIncInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#incomeDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('income','I_INC_INF',$this.data("id"),'form',true,false); //数据校验

						} else {
							layer.alert(data.msg);
						}
					 },
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
					}					 
				});
            });
			
            //点击删除按钮
            $("#incomeDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.paaBsSmgtId = dataObj.paaBsSmgtId;
                    para.paiIncInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvBasicsInfo/delPcBasIncInfSgmtById.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#incomeAddBtn").show();
								$("#incomeSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
							} else {
								layer.alert(data.msg);
							}
						 },
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}					 
					});
                });
            });
            /****************************************收入信息段结束****************************************/
            
            //判断是否是详情页面，如果是则禁用页面中的按钮和表单控件
            if (base.getrequest('addOrUpdate') === 'detail'){
                $(".layui-btn").not("#cancelAllModelBtn").hide().css("visibility","hidden").addClass("hide");
                $(".layui-input").prop("disabled",true);
                $("select").not("#pushPullSelect").prop("disabled",true);
                form.render();
                if (dataObj.businessStates === 'RKCG'){ //入库成功状态
                    $("#entireDelAllModelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#idChangeAllModelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#basicSegmentDelBtn,#insuranceSegmentDelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#baseSegmentChangeBtn,#basicSegmentChangeBtn,#responsibleSegmentChangeBtn,#mortgageSegmentChangeBtn,#insuranceSegmentChangeBtn").show().css("visibility","visible").removeClass("hide");
                }
                if (dataObj.businessStates === 'AW'){ //待审核状态
                    $("#approvalAllBtn,#overruleAllBtn").show().css("visibility","visible").removeClass("hide");
                }
            }
        });

        /**
         * 取消模态框按钮
         */
        $("#cancelResponsibleModelBtn,#cancelMortgageModelBtn").on("click",function () {
            layer.close(modelIndex);
        });

        /**
         * 点击取消按钮
         * 关闭iframe层
         */
        $("#cancelAllModelBtn").on("click",function () {
//        	window.parent.location.reload();
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });

        /**
         * 点击提交按钮
         * 在当前页面直接提交信息记录
         */
        $("#delAllModelBtn,#pushAllModelBtn,#approvalAllBtn").on("click",function () {
            var $this = $(this);
            layer.confirm('确认' + $this.html(), {anim: 6}, function(index){
                EasyAjax.post_json({
                        url: config.api_host + "pdaGuarAcctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
                        data: dataObj
                    },
                    function (result) {
                        layer.msg("操作成功");
                        layer.close(index);
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    });
            });
        });
        $("#overruleAllBtn").on("click",function () {
            var $this = $(this);
            layer.prompt({anim: 6,title: '输入驳回原因，并确认',formType: 2,maxlength: 120}, function(value, index, elem){
                dataObj.rejectReason = value;
                EasyAjax.post_json({
                        url: config.api_host + "pdaGuarAcctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
                        data: dataObj
                    },
                    function (result) {
                        layer.msg("操作成功");
                        layer.close(index);
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    });
            });
        });

        /**
         * 点击生成整笔删除报文按钮
         */
        $("#entireDelAllModelBtn").on("click",function () {
            $("body").data("dataObj",dataObj);
            layer.open({
                type: 2,
                title: '生成整笔删除报文',
                shadeClose: false,
                shade: [0.3, '#000'],
                area: ['100%', '100%'],
                anim: 2,
                resize: false,
                content: 'personGuaranteeInfoEntireDelEdit.html?type=special'
            });
        });

        /**
         * 点击标识变更按钮
         */
        $("#idChangeAllModelBtn").on("click",function () {
            $("body").data("dataObj",dataObj);
            layer.open({
                type: 2,
                title: '标识变更',
                shadeClose: false,
                shade: [0.3, '#000'],
                area: ['100%', '100%'],
                anim: 2,
                resize: false,
                content: 'personGuaranteeInfoIdChangeEdit.html?type=special'
            });
        });

        /**
         * 点击按段删除按钮
         */
        $("#basicSegmentDelBtn,#insuranceSegmentDelBtn").on("click",function () {
            dataObj.delSgmtCode = $(this).data("value");
            $("body").data("dataObj",dataObj);
            layer.open({
                type: 2,
                title: '按段删除',
                shadeClose: false,
                shade: [0.3, '#000'],
                area: ['100%', '100%'],
                anim: 2,
                resize: false,
                content: 'personGuaranteeInfoSegmentDelEdit.html?type=special'
            });
        });

        /**
         * 点击按段更正按钮
         */
        $("#baseSegmentChangeBtn,#basicSegmentChangeBtn,#responsibleSegmentChangeBtn,#mortgageSegmentChangeBtn,#insuranceSegmentChangeBtn").on("click",function () {
            dataObj.mdfcSgmtCode = $(this).data("value");
            $("body").data("dataObj",dataObj);
            layer.open({
                type: 2,
                title: '按段更正',
                shadeClose: false,
                shade: [0.3, '#000'],
                area: ['100%', '100%'],
                anim: 2,
                resize: false,
                content: 'personGuaranteeInfoSegmentChangeEdit.html?type=special'
            });
        });

        /**
         * 页面初始化
         */

    });
});
