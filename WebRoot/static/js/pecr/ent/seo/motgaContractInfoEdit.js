/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laytpl'], function(){
    var element = layui.element; //获取element模块
	var	form = layui.form; //获取form模块
	var	layer = layui.layer; //获取layer模块
	var	laydate = layui.laydate; //获取laydate模块
	var	table = layui.table //获取table模块
	    laytpl = layui.laytpl;  //获取laytpl模块  模板引擎

    /**
     * 模块化加载
     * 自定义模块
     */
    require(['static/js/pecr/module/base'],function(base){
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
		
		var motgaCltalBsSgmt, motgaCltalInfSgmt;
		if(pageType === 'edit'){
			//基础段
			motgaCltalBsSgmt = JSON.parse(document.getElementById("motgaCltalBsSgmt").value);
			//基本信息段
			motgaCltalInfSgmt = JSON.parse(document.getElementById("motgaCltalInfSgmt").value);
		}

        var d0 = $.Deferred(),d1 = $.Deferred();
		
		/**
		* 查询所属机构
		*/
		var queryOrg = function () {
			var para = [{orgCode:'10001'},{orgCode:'10002'}];
			$.ajax({
				url:'dataDictCode/selectOrgList.do', 
				data:JSON.stringify(para),
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
					}
					d0.resolve("渲染完成");
				 },  	     
			});
		};
		//查询所属机构
        queryOrg();
		
		/**
         * 初始化常量枚举值
         */
        var initEnumerationValue = function () {
			var array = [
						'CC_RPT_DATE_CODE',
						'CC_GUAR_TYPE',
						'CURRENCY',
						'CC_MAX_GUAR',
						'CC_STATUS',
						'CERT_TYPE',
						'CC_PLE_TYPE',
						'CC_MOTGA_PROPT_IDTYPE',
						'A_DIVISION',
						'CC_VAL_ORG_TYPE',
						'CC_IMP_TYPE'
						];
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
						if (data.result[i].CC_RPT_DATE_CODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_RPT_DATE_CODE},
								containerId : "rptDateCode"
							});
							continue;
						} else if (data.result[i].CC_GUAR_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_GUAR_TYPE},
								containerId : "guarType"
							});
							continue;
						} else if(data.result[i].CURRENCY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CURRENCY},
								containerId : "cy"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CURRENCY},
								containerId : "pleCy"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CURRENCY},
								containerId : "impCy"
							});
							continue;
						} else if (data.result[i].CC_MAX_GUAR){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_MAX_GUAR},
								containerId : "maxGuar"
							});
							continue;
						} else if (data.result[i].CC_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_STATUS},
								containerId : "ccStatus"
							});
							continue;
						} else if  (data.result[i].CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "infoIdType_base"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "infoIdType"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "pledgorType"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "ippc"
							});
							continue;
						} else if (data.result[i].CC_PLE_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_PLE_TYPE},
								containerId : "pleType"
							});
							continue;
						} else if  (data.result[i].CC_MOTGA_PROPT_IDTYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_MOTGA_PROPT_IDTYPE},
								containerId : "motgaProptIdType"
							});
							continue;
						} else if  (data.result[i].A_DIVISION){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].A_DIVISION},
								containerId : "pleDistr"
							});
							continue;
						} else if  (data.result[i].CC_VAL_ORG_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_VAL_ORG_TYPE},
								containerId : "valOrgType"
							});
							continue;
						} else if  (data.result[i].CC_IMP_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CC_IMP_TYPE},
								containerId : "impType"
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
		 * 监听债务人身份类别切换
		 */
		form.on('select(infoIdType_base)', function(data){
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
							containerId : "certType"
						});
					}
					form.render('select');
				}
			});
		});

		/**
		 * 监听身份类别切换
		 */
		form.on('select(infoIdType)', function(data){
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
							containerId : "guarCertType"
						});
					}
					form.render('select');
				}
			});
		});
		
		/**
		 * 监听抵押人身份类别切换
		 */
		form.on('select(pledgorType)', function(data){
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
							containerId : "pleorCertType"
						});
					}
					form.render('select');
				}
			});
		});
		
		/**
		 * 监听出质人身份类别切换
		 */
		form.on('select(ippc)', function(data){
			$.ajax({
				url:'dataDictCode/selectCodeListByUperId.do', 
				data:{uperId: $(data.elem).find("option[value='" + data.value + "']").data("id")},
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data){
					base.renderTpl({
						tplId : "enumerationValueTpl",
						arr : {"list" : data.result},
						containerId : "pawnCertType"
					});
					form.render('select');
				}
			});
		});

        $.when(d0,d1).done(function (d0,d1) {
            /****************************************基础段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && motgaCltalBsSgmt){
				$("#baseSaveBtn").show().data("id",dataObj.efaMotgaCltalCtrctBsId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.efaMotgaCltalCtrctBsId);
                $("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.efaMotgaCltalCtrctBsId);
                $("#infRecType").val(motgaCltalBsSgmt.INF_REC_TYPE);
                $("#ccCode").val(motgaCltalBsSgmt.CC_CODE);
                $("#rptDateCode").val(motgaCltalBsSgmt.RPT_DATE_CODE);
                $("#infoIdType_base").val(motgaCltalBsSgmt.INFO_ID_TYPE);
                $("#name").val(motgaCltalBsSgmt.NAME);
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#infoIdType_base").find("option[value='" + motgaCltalBsSgmt.INFO_ID_TYPE+"']").data("id")},
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data){
						if (data.result.length){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result},
								containerId : "certType"
							});
						}
						$("#certType").val(motgaCltalBsSgmt.CERT_TYPE);
						form.render('select');
					}
				});
				$("#certNum").val(motgaCltalBsSgmt.CERT_NUM);
                $("#orgCode").val(motgaCltalBsSgmt.ORG_CODE);
                $("#mngmtOrgCode").val(motgaCltalBsSgmt.MNGMT_ORG_CODE);
                $("#isFilter").val(motgaCltalBsSgmt.IS_FILTER);
                $("#rptDate").val(motgaCltalBsSgmt.RPT_DATE);
                form.render('select');
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
							$("#delAllModelBtn,#pushAllModelBtn").show().data("id",data.result);
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
				para.efaMotgaCltalCtrctBsId = $this.data("id");
				para.infRecType = $("#infRecType").val();
				para.ccCode = $("#ccCode").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.infoIdType = $("#infoIdType_base").val();
				para.name = $("#name").val();
				para.certType = $("#certType").val();
				para.certNum = $("#certNum").val();
				para.orgCode = $("#orgCode").val();
				//para.orgName = $("#orgCode").next().find(".layui-this").html();
				para.mngmtOrgCode = $("#mngmtOrgCode").val();
				para.isFilter = $("#isFilter").val();
				para.rptDate = $("#rptDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'motgaInfoSeo/saveMotgaCltalSgmt.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#baseDelBtn").show();
								$("#delAllModelBtn,#pushAllModelBtn").show();
							}
							$this.data("type","edit");
							baseExistFlag = 'Y';
							dataObj = para; //存储新数据
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
                    para.efaMotgaCltalCtrctBsId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'motgaInfoSeo/delMotgaCltalSgmt.do', 
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

            /****************************************基本信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && motgaCltalInfSgmt){
				$("#guarType").val(motgaCltalInfSgmt.GUAR_TYPE);
				if(motgaCltalInfSgmt.GUAR_TYPE === '1'){
					$("#guarTypePawnContact").show();
					$("#guarTypeQualityContact").hide();
				}else if (motgaCltalInfSgmt.GUAR_TYPE === '2'){
					$("#guarTypePawnContact").hide();
					$("#guarTypeQualityContact").show();
				}else{
					$("#guarTypePawnContact").hide();
					$("#guarTypeQualityContact").hide();
				}
				$("#ccAmt").val(motgaCltalInfSgmt.CC_AMT);
				$("#cy").val(motgaCltalInfSgmt.CY);
				$("#ccValDate").val(motgaCltalInfSgmt.CC_VAL_DATE);
				$("#ccExpDate").val(motgaCltalInfSgmt.CC_EXP_DATE);
				$("#maxGuar").val(motgaCltalInfSgmt.MAX_GUAR);
				$("#ccStatus").val(motgaCltalInfSgmt.CC_STATUS);
				$("#basicSaveBtn").show().data("id",motgaCltalInfSgmt.EFB_MOTGA_CLTAL_BS_INF_SGMT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",motgaCltalInfSgmt.EFB_MOTGA_CLTAL_BS_INF_SGMT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
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
				if ($("#guarType").val() === '1'){
                    if ($("#qualityDataTable").next().find("td").length){
                        layer.msg("请先删除质物信息段");
                        return false;
                    }
                }else if ($("#guarType").val() === '2'){
                    if ($("#pawnDataTable").next().find("td").length){
                        layer.msg("请先删除抵押物信息段");
                        return false;
                    }
                }else{
                    if ($("#pawnDataTable").next().find("td").length){
                        layer.msg("请先删除抵押物信息段");
                        return false;
                    }
                    if ($("#qualityDataTable").next().find("td").length){
                        layer.msg("请先删除质物信息段");
                        return false;
                    }
                }
				
                var $this = $(this);
				var para = {};
				para.efaMotgaCltalCtrctBsId = dataObj.efaMotgaCltalCtrctBsId;
				para.efbMotgaCltalBsInfSgmtId = $this.data("id");
				para.guarType = $("#guarType").val();
				para.ccAmt = $("#ccAmt").val();
				para.cy = $("#cy").val();
				para.ccValDate = $("#ccValDate").val();
				para.ccExpDate = $("#ccExpDate").val();
				para.maxGuar = $("#maxGuar").val();
				para.ccStatus = $("#ccStatus").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'motgaInfoSeo/saveMotgaCltalInfo.do', 
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
							if ($("#guarType").val() === '1'){
                                $("#guarTypePawnContact").show();
                                $("#guarTypeQualityContact").hide();
                            }else if ($("#guarType").val() === '2'){
                                $("#guarTypePawnContact").hide();
                                $("#guarTypeQualityContact").show();
                            }else{
                                $("#guarTypePawnContact").hide();
                                $("#guarTypeQualityContact").hide();
                            }
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
				if ($("#guarType").val() === '1'){
                    if ($("#pawnDataTable").next().find("td").length){
                        layer.msg("请先删除抵押物信息段");
                        return false;
                    }
                }else if ($("#guarType").val() === '2'){
                    if ($("#qualityDataTable").next().find("td").length){
                        layer.msg("请先删除质物信息段");
                        return false;
                    }
                }else{
                    if ($("#pawnDataTable").next().find("td").length){
                        layer.msg("请先删除抵押物信息段");
                        return false;
                    }
                    if ($("#qualityDataTable").next().find("td").length){
                        layer.msg("请先删除质物信息段");
                        return false;
                    }
                }
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.efaMotgaCltalCtrctBsId = dataObj.efaMotgaCltalCtrctBsId;
                    para.efbMotgaCltalBsInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'motgaInfoSeo/delMotgaCltalInfo.do', 
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
								$("#guarTypePawnContact,#guarTypeQualityContact").hide();
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
            /****************************************基本信息段结束****************************************/

            /****************************************其他债务人信息段开始****************************************/
            var rltInfoUrl;
			if(pageType === 'edit'){
				rltInfoUrl = 'motgaInfoSeo/getComRecInfSgmtList.do?efaMotgaCltalCtrctBsId='+ dataObj.efaMotgaCltalCtrctBsId 
						+ "&pageType=" + pageType;
				$("#debtorAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'motgaInfoSeo/getComRecInfSgmtList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'debtorDataTable',
				elem : '#debtorDataTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EFC_COM_REC_INF_SGMT_ID",title:"主键"},
					{align:"center",field:"INFO_ID_TYPE",title:"身份类别"},
					{align:"center",field:"GUAR_NAME",title:"其他债务人名称"},
					{align:"center",field:"GUAR_CERT_TYPE",title:"其他债务人身份标识类型"},
					{align:"center",field:"GUAR_CERT_NUM",title:"其他债务人身份标识号码"},
					{align:"center",title:"操作",width:150,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});
		
            //点击新增按钮
            $("#debtorAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    $("#infoIdType").val("");
                    $("#guarName").val("");
                    $("#guarCertType").val("");
                    $("#guarCertNum").val("");
                    form.render('select');
                    $("#saveDebtorModelBtn").data("id","");
					modelIndex = layer.open({
                        type: 1,
                        title: "新增",
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#debtorEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(debtorDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
					$("#infoIdType").val(data.info_id_type);
                    $("#guarName").val(data.guar_name);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#infoIdType").find("option[value='"+data.info_id_type+"']").data("id")},
						type:'post',  
						cache:false,  
						dataType:'json',  
						success:function(dict){
							if (dict.result){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : dict.result},
									containerId : "guarCertType"
								});
							}
							$("#guarCertType").val(data.guar_cert_type);
							form.render('select'); 
						}
					});
					$("#guarCertNum").val(data.guar_cert_num);
                    form.render('select');
                    $("#saveDebtorModelBtn").data("id",data.efc_com_rec_inf_sgmt_id);
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#debtorEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.efaMotgaCltalCtrctBsId = dataObj.efaMotgaCltalCtrctBsId;
					para.efcComRecInfSgmtId = data.efc_com_rec_inf_sgmt_id;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'motgaInfoSeo/delComRecInfSgmt.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('debtorDataTable',{});
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
            form.on('submit(saveDebtorModelBtn)', function(data){
				$.ajax({
					type : "POST",  //请求方式
					url  : "motgaInfoSeo/saveComRecInfSgmt.do",
					data : {rltData  :  JSON.stringify(data.field),
					        efaMotgaCltalCtrctBsId : dataObj.efaMotgaCltalCtrctBsId,
							efcComRecInfSgmtId : $("#saveDebtorModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
                            table.reload('debtorDataTable', {});
                            layer.close(modelIndex);
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
            /****************************************其他债务人信息段结束****************************************/

            /****************************************抵押物信息段开始****************************************/
            var proptUrl;
			if(pageType === 'edit'){
				proptUrl = 'motgaInfoSeo/getMotgaProptInfList.do?efaMotgaCltalCtrctBsId='+ dataObj.efaMotgaCltalCtrctBsId 
						+ "&pageType=" + pageType;
				$("#pawnAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				proptUrl = 'motgaInfoSeo/getMotgaProptInfList.do?pageType='+ pageType;
			}
				
			//渲染表格
			table.render({
				id   : 'pawnDataTable',
				elem : '#pawnDataTable',
				url  : proptUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EFD_MOTGA_PROPT_INF_SGMT_ID",title:"主键"},
					{align:"center",field:"PLE_TYPE",title:"抵押物种类"},
					{align:"center",field:"MOTGA_PROPT_ID_TYPE",title:"抵押物识别号类型"},
					{align:"center",field:"PLE_CERT_ID",title:"抵押物唯一识别号"},
					{align:"center",field:"PLE_DISTR",title:"抵押物位置所在地行政区划"},
					{align:"center",field:"PLE_VALUE",title:"抵押物评估价值"},
					{align:"center",field:"PLE_CY",title:"币种"},
					{align:"center",field:"VAL_ORG_TYPE",title:"评估机构类型"},
					{align:"center",field:"VAL_DATE",title : "抵押物评估日期"},
					{align:"center",field:"PLEDGOR_TYPE",title:"抵押人身份类别"},
					{align:"center",field:"PLEDGOR_NAME",title:"抵押人名称"},
					{align:"center",field:"PLEOR_CERT_TYPE",title:"抵押人身份标识类型"},
					{align:"center",field:"PLEOR_CERT_NUM",title:"抵押人身份标识号码"},
					{align:"center",field:"PLE_DESC",title:"抵押物说明"},
					{align:"center",title:"操作",width:200,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#pawnAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    $("#pleType").val("");
                    $("#motgaProptIdType").val("");
                    $("#pleCertId").val("");
                    $("#pleDistr").val("");
                    $("#pleValue").val("");
                    $("#pleCy").val("");
                    $("#valOrgType").val("");
                    $("#valDate").val("");
                    $("#pledgorType").val("");
                    $("#pledgorName").val("");
                    $("#pleorCertType").val("");
                    $("#pleorCertNum").val("");
                    $("#pleDesc").val("");
                    form.render('select');
                    $("#savePawnModelBtn").data("id","");
					modelIndex = layer.open({
                        type: 1,
                        title: "新增",
                        shade: [0.3, '#000'],
                        area: ['80%', '80%'],
                        anim: 0,
                        resize: false,
                        content: $('#pawnEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(pawnDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
					$("#pleType").val(data.ple_type);
                    $("#motgaProptIdType").val(data.motga_propt_id_type);
                    $("#pleCertId").val(data.ple_cert_id);
                    $("#pleDistr").val(data.ple_distr);
                    $("#pleValue").val(data.ple_value);
                    $("#pleCy").val(data.ple_cy);
                    $("#valOrgType").val(data.val_org_type);
                    $("#valDate").val(data.val_date);
                    $("#pledgorType").val(data.pledgor_type);
                    $("#pledgorName").val(data.pledgor_name);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#pledgorType").find("option[value='" + data.pledgor_type+"']").data("id")},
						type:'post',  
						cache:false,  
						dataType:'json',  
						success:function(data1){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data1.result},
									containerId : "pleorCertType"
								});
							$("#pleorCertType").val(data.pleor_cert_type);
							form.render('select');
						}
					});
					$("#pleorCertNum").val(data.pleor_cert_num);
                    $("#pleDesc").val(data.ple_desc);
                    form.render('select');
                    $("#savePawnModelBtn").data("id",data.efd_motga_propt_inf_sgmt_id);
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['80%', '80%'],
                        anim: 0,
                        resize: false,
                        content: $('#pawnEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.efaMotgaCltalCtrctBsId = dataObj.efaMotgaCltalCtrctBsId;
					para.efdMotgaProptInfSgmtId = data.efd_motga_propt_inf_sgmt_id;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'motgaInfoSeo/delMotgaProptInf.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('pawnDataTable',{});
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
            form.on('submit(savePawnModelBtn)', function(data){
				$.ajax({
					type : "post",  //请求方式
					url  : "motgaInfoSeo/saveMotgaProptInf.do",
					data : {mccData  :  JSON.stringify(data.field),
					        efaMotgaCltalCtrctBsId : dataObj.efaMotgaCltalCtrctBsId,
							efdMotgaProptInfSgmtId : $("#savePawnModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
                            table.reload('pawnDataTable', {});
                            layer.close(modelIndex);
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

            /****************************************抵押物信息段结束****************************************/

            /****************************************质物信息段开始****************************************/
			var ctrctInfoUrl;
			if(pageType === 'edit'){
				ctrctInfoUrl = 'motgaInfoSeo/getCltalInfList.do?efaMotgaCltalCtrctBsId='+ dataObj.efaMotgaCltalCtrctBsId 
						+ "&pageType=" + pageType;
				$("#qualityAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				ctrctInfoUrl = 'motgaInfoSeo/getCltalInfList.do?pageType='+ pageType;
			}
				
			//渲染表格
			table.render({
				id   : 'qualityDataTable',
				elem : '#qualityDataTable',
				url  : ctrctInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EFE_CLTAL_INF_SGMT_ID",title:"主键"},
					{align:"center",field:"IMP_TYPE",title:"质物种类"},
					{align:"center",field:"IMP_VAL",title:"质物价值"},
					{align:"center",field:"IMP_CY",title:"币种"},
					{align:"center",field:"IPPC",title:"出质人身份类别"},
					{align:"center",field:"PAWN_NAME",title:"出质人名称"},
					{align:"center",field:"PAWN_CERT_TYPE",title:"出质人身份标识类型"},
					{align:"center",field:"PAWN_CERT_NUM",title:"出质人身份标识号码"},
					{align:"center",title:"操作",width:200,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#qualityAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    $("#impType").val("");
                    $("#impVal").val("");
                    $("#impCy").val("");
                    $("#ippc").val("");
                    $("#pawnName").val("");
                    $("#pawnCertType").val("");
                    $("#pawnCertNum").val("");
                    form.render('select');
                    $("#saveQualityModelBtn").data("id","");
					modelIndex = layer.open({
                        type: 1,
                        title: "新增",
                        shade: [0.3, '#000'],
                        area: ['80%', '80%'],
                        anim: 0,
                        resize: false,
                        content: $('#qualityEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(qualityDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
					$("#impType").val(data.imp_type);
                    $("#impVal").val(data.imp_val);
                    $("#impCy").val(data.imp_cy);
                    $("#ippc").val(data.ippc);
                    $("#pawnName").val(data.pawn_name);
                    $("#pawnCertNum").val(data.pawn_cert_num);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#ippc").find("option[value='" + data.ippc+"']").data("id")},
						type:'post',  
						cache:false,  
						dataType:'json',  
						success:function(data1){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : data1.result},
									containerId : "pawnCertType"
								});
								$("#pawnCertType").val(data.pawn_cert_type);					
			                    form.render('select');
						}
					});
					 form.render('select');
                    $("#saveQualityModelBtn").data("id",data.efe_cltal_inf_sgmt_id);
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['80%', '80%'],
                        anim: 0,
                        resize: false,
                        content: $('#qualityEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.efaMotgaCltalCtrctBsId = dataObj.efaMotgaCltalCtrctBsId;
					para.efeCltalInfSgmtId = data.efe_cltal_inf_sgmt_id;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'motgaInfoSeo/delCltalInf.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('qualityDataTable',{});
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
            form.on('submit(saveQualityModelBtn)', function(data){
				$.ajax({
					type : "post",  //请求方式
					url  : "motgaInfoSeo/saveCltalInf.do",
					data : {busData  :  JSON.stringify(data.field),
					        efaMotgaCltalCtrctBsId : dataObj.efaMotgaCltalCtrctBsId,
							efeCltalInfSgmtId : $("#saveQualityModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
                            table.reload('qualityDataTable', {});
                            layer.close(modelIndex);
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
            /****************************************质物信息段结束****************************************/

            //判断是否是详情页面，如果是则禁用页面中的按钮和表单控件
            if (base.getrequest('addOrUpdate') === 'detail'){
                $(".layui-btn").not("#cancelAllModelBtn").hide().css("visibility","hidden").addClass("hide");
                $(".layui-input").prop("disabled",true);
                $("select").not("#pushPullSelect").prop("disabled",true);
                form.render();
                if (dataObj.businessStates === 'RKCG'){ //入库成功状态
                    $("#entireDelAllModelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#idChangeAllModelBtn").show().css("visibility","visible").removeClass("hide");
                }
                if (dataObj.businessStates === 'AW'){ //待审核状态
                    $("#approvalAllBtn,#overruleAllBtn").show().css("visibility","visible").removeClass("hide");
                }
            }
        });

        /**
         * 取消模态框按钮
         */
        $("#cancelDebtorModelBtn,#cancelPawnModelBtn,#cancelQualityModelBtn").on("click",function () {
            layer.close(modelIndex);
        });

        /**
         * 点击取消按钮
         * 关闭iframe层
         */
        $("#cancelAllModelBtn").on("click",function () {
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
                        url: config.api_host + "efaMotgaCltalCtrctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                        url: config.api_host + "efaMotgaCltalCtrctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                content: 'enterprisePledgeInfoEntireDelEdit.html?type=special'
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
                content: 'enterprisePledgeInfoIdChangeEdit.html?type=special'
            });
        });

        /**
         * 页面初始化
         */

    });
});
