initDict('orgCode', enterDict.orgCodeYillion);
/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laypage','laytpl'], function(){
	 var element = layui.element //获取element模块
		form = layui.form, //获取form模块
		layer = layui.layer, //获取layer模块
		laydate = layui.laydate, //获取laydate模块
		table = layui.table //获取table模块
		laypage = layui.laypage, //获取laypage模块
		laytpl = layui.laytpl;  //获取laytpl模块  模板引擎
    /**
     * 表格全局默认参数设置
     */
   	require(['static/js/pecr/module/base','static/js/pecr/module/verify'],function(base,verify){
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
    	var updateFlag = 'N';
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
        
        
        var enSecAcctInf, guarAcctBsInfSgmt, repymtInfSgmt,acctCredSgmt;
		if(pageType === 'edit'){
			//基础段
			enSecAcctInf = JSON.parse(document.getElementById("enSecAcctInf").value);
			//基本信息段
			guarAcctBsInfSgmt = JSON.parse(document.getElementById("guarAcctBsInfSgmt").value);
			//账户信息授信额度信息段
			acctCredSgmt = JSON.parse(document.getElementById("acctCredSgmt").value);
			//在保责任信息段
			repymtInfSgmt = JSON.parse(document.getElementById("repymtInfSgmt").value);
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
				 }   
			});
		};
		//查询所属机构
        queryOrg();
		

        /**
         * 初始化常量枚举值
         */
        var initEnumerationValue = function () {
                var array = ['ENT_GUAR_ACCT_TYPE','ENT_GUAR_RPT_DATE_CODE', 'ENT_GUAR_BUSI_LINES', 'ENT_CERT_MAIN_TYPE', 'CURRENCY', 
						 'ENT_GUAR_GUAR_MODE','ENT_GUAR_OTH_REPY_GUAR_WAY','CERT_TYPE','ENT_GUAR_ARLP_TYPE',
						 'ENT_GUAR_ACCT_STATUS','FIVE_CATE','COMP_ADV_FLAG','ID_TYPE','ENT_GUAR_UP_INF_REC_TYPE'];
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
                    success:  function (data) {
                    	for(var i=0;i<data.result.length;i++){
    						if (data.result[i].ENT_GUAR_ACCT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_ACCT_TYPE},
								containerId : "acctType"
							});
							continue;
						} 
						else if(data.result[i].ENT_CERT_MAIN_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
								containerId : "idType"
							});
							continue;
						} else if (data.result[i].ENT_GUAR_BUSI_LINES){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_BUSI_LINES},
								containerId : "busiLines"
							});
							continue;
						} else if (data.result[i].CURRENCY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CURRENCY},
								containerId : "cy"
							});
							continue;
						} else if  (data.result[i].ENT_GUAR_GUAR_MODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_GUAR_MODE},
								containerId : "guarMode"
							});
							continue;
						} else if (data.result[i].ENT_GUAR_OTH_REPY_GUAR_WAY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_OTH_REPY_GUAR_WAY},
								containerId : "othRepyGuarWay"
							});
							continue;
						} else if  (data.result[i].CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "infoIdType"
							});
							continue;
						} else if  (data.result[i].ENT_GUAR_ARLP_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_ARLP_TYPE},
								containerId : "arlpType"
							});
							continue;
						} else if  (data.result[i].ENT_GUAR_ACCT_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_ACCT_STATUS},
								containerId : "acctStatus"
							});
							continue;
						} else if  (data.result[i].FIVE_CATE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].FIVE_CATE},
								containerId : "fiveCate"
							});
							continue;
						} else if  (data.result[i].COMP_ADV_FLAG){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].COMP_ADV_FLAG},
								containerId : "compAdvFlag"
							});
							continue;
						}else if (data.result[i].ENT_GUAR_UP_INF_REC_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_GUAR_UP_INF_REC_TYPE},
								containerId : "mdfcSgmtCode"
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
         *监听担保业务大类切换
         */
        form.on('select(busiLines)', function(data){
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
    						containerId : "busiDtilLines"
    					});
    				form.render('select');
    			}
    		});
    	});
        /**
         *监听身份类别切换
         */
        form.on('select(infoIdType)', function(data){
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
    						containerId : "arlpCertType"
    					});
    				form.render('select');
    			}
    		});
    	});
        /**
         *监听还款责任人类型切换
         */
        form.on('select(arlpType)', function(data){
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
    						containerId : "wartySign"
    					});
    				form.render('select');
    			}
    		});
    	});

        /**
         * 监听待更正段段标切换
         */
        form.on('select(mdfcSgmtCode)', function(data){
            $("div[data-value]").hide();
            if (data.value === 'B'){
                $("#name,#idNum,#mngmtOrgCode").css({
                    "background-color" : "#e2e2e2"
                });
                $("#idType").parent().css({
                    "background-color" : "#e2e2e2"
                });
            }else{
                $("#name,#idNum,#mngmtOrgCode").css({
                    "background-color" : "transparent"
                });
                $("#idType").parent().css({
                    "background-color" : "transparent"
                });
                $("div[data-value='" + data.value + "']").show();
            }
        });
        $.when(d0,d1).done(function (d0,d1) {
            /****************************************基础段开始****************************************/
            //判断是新增还是编辑
        	if (dataObj && enSecAcctInf){
        		$("div[data-value='" + enSecAcctInf.MDFC_SGMT_CODE + "']").css("display","block");
        		$("#baseSaveBtn").show().data("id",dataObj.eeaGuarAcctBsSgmtId).data("type","edit");
        		$("#baseDelBtn").show().data("id",dataObj.eeaGuarAcctBsSgmtId);
                $("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.eeaGuarAcctBsSgmtId);
                $("#infRecType").val(enSecAcctInf.INF_REC_TYPE);
                $("#acctType").val(enSecAcctInf.ACCT_TYPE);
                $("#acctCode").val(enSecAcctInf.ACCT_CODE);
                $("#rptDateCode").val(enSecAcctInf.RPT_DATE_CODE);
                $("#name").val(enSecAcctInf.NAME);
                $("#idType").val(enSecAcctInf.ID_TYPE);
                $("#idNum").val(enSecAcctInf.ID_NUM);
                $("#orgCode").val(enSecAcctInf.ORG_CODE);
                $("#mngmtOrgCode").val(enSecAcctInf.MNGMT_ORG_CODE);
                $("#isFilter").val(enSecAcctInf.IS_FILTER);
                $("#rptDate").val(enSecAcctInf.RPT_DATE);
                $("#mdfcSgmtCode").val(enSecAcctInf.MDFC_SGMT_CODE);
                $("div[data-value]").hide();
                if (enSecAcctInf.MDFC_SGMT_CODE === 'B'){
                    $("#name,#idNum,#mngmtOrgCode").css({
                        "background-color" : "#e2e2e2"
                    });
                    $("#idType").parent().css({
                        "background-color" : "#e2e2e2"
                    });
                    $("#name,#idNum,#mngmtOrgCode").removeAttr("readonly");
                    $("#idType").removeAttr("disabled");
                }else{
                    $("#name,#idNum,#mngmtOrgCode").css({
                        "background-color" : "transparent"
                    });
                    $("#idType").parent().css({
                        "background-color" : "transparent"
                    });
                    $("div[data-value='" + enSecAcctInf.MDFC_SGMT_CODE + "']").show();
                }
                form.render('select');
                verify.dataValidation('base','E_GUAR_ACCT_BS',dataObj.eeaGuarAcctBsSgmtId,'form',false,false); //数据校验

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
            	$("#mdfcSgmtCode,#acctType,#idType,#orgCode,#isFilter,rptDate").removeAttr("disabled");
            	if(updateFlag ==='N'){
                var $this = $(this);
                	 var para = {};
                     para.eeaGuarAcctBsSgmtId = $this.data("id");
                     para.infRecType = $("#infRecType").val();
                     para.acctType = $("#acctType").val();
                     para.acctCode = $("#acctCode").val();
                     para.name = $("#name").val();
                     para.idType = $("#idType").val();
                     para.idNum = $("#idNum").val();
                     para.mngmtOrgCode = $("#mngmtOrgCode").val();
                     para.mdfcSgmtCode = $("#mdfcSgmtCode").val();
                     para.orgCode = $("#orgCode").val();
                     para.orgName = $("#orgCode").next().find(".layui-this").html();
                     para.isFilter = $("#isFilter").val();
                     para.rptDate = $("#rptDate").val();
                     para.mdfcSgmtCode  =  $("#mdfcSgmtCode").val();
     				if($("#mdfcSgmtCode").val()==='B'){
     					   updateFlag = 'Y';
     				}
            		//提交
    				$.ajax({  
					url      : 'enSecAcctInf/saveEnSecAcctInf.do', 
    					data     : {str : JSON.stringify(para), pageType :  $this.data("type")},
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
							 verify.dataValidation('base','E_GUAR_ACCT_BS',dataObj.eeaGuarAcctBsSgmtId,'form',true,false); //数据校验
    						} else {
    							layer.alert(data.msg);
    						}
    					 },
    					//请求失败，包含具体的错误信息
    					error : function(e){
    						layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
    					}					 
    				});
            	}else{
    				layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
    			}
            });
            //点击删除按钮
            $("#baseDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('删除基础段相当于删除该页面所有段信息，是否确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eeaGuarAcctBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'enSecAcctInf/delEnSecAcctInf.do', 
						data     : {str : JSON.stringify(para)},
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
            });
            //新增情况下基础段自动点击一下让基础段默认展开
            if (!dataObj){
                $("#baseAddBtn").click();
            }
            /****************************************基础段结束****************************************/

            /****************************************基本信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && guarAcctBsInfSgmt){
				$("#busiLines").val(guarAcctBsInfSgmt.BUSI_LINES);
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#busiLines").find("option[value='"+guarAcctBsInfSgmt.BUSI_LINES+"']").data("id")},
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data){
						if (data.result.length){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result},
								containerId : "busiDtilLines"
							});
						}
						$("#busiDtilLines").val(guarAcctBsInfSgmt.BUSI_DTIL_LINES);
						form.render('select');
					}
				});
				$("#openDate").val(guarAcctBsInfSgmt.OPEN_DATE);
				$("#cy").val(guarAcctBsInfSgmt.CY);
				$("#guarAmt").val(guarAcctBsInfSgmt.GUAR_MODE);
				$("#dueDate").val(guarAcctBsInfSgmt.DUE_DATE);
				$("#guarMode").val(guarAcctBsInfSgmt.GUAR_MODE);
				$("#othRepyGuarWay").val(guarAcctBsInfSgmt.OTH_REPY_GUARWAY);
				$("#secDep").val(guarAcctBsInfSgmt.SEC_DEP);
				$("#ctrctTxtCd").val(guarAcctBsInfSgmt.CTRCT_TXT_CODE);
				$("#basicSaveBtn").show().data("id",guarAcctBsInfSgmt.EEB_GUAR_ACCT_BS_INF_SGMT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",guarAcctBsInfSgmt.EEB_GUAR_ACCT_BS_INF_SGMT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('basic','E_GUAR_ACCT_BS_INF',guarAcctBsInfSgmt.EEB_GUAR_ACCT_BS_INF_SGMT_ID,'form',false,false); //数据校验

            }else{
                $("#basicAddBtn").show();
            }
            
            //点击新增按钮
            $("#basicAddBtn").on("click",function () {
            	if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
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
					layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
				}
			});
			
            //点击保存按钮
            form.on('submit(basicSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
				para.eebGuarAcctBsInfSgmtId = $this.data("id");
				para.busiLines = $("#busiLines").val();
				para.busiDtilLines = $("#busiDtilLines").val();
				para.openDate =$("#openDate").val();
				para.cy = $("#cy").val();
				para.guarAmt = $("#guarAmt").val();
				para.dueDate =$("#dueDate").val();
				para.guarMode = $("#guarMode").val();
				para.othRepyGuarway = $("#othRepyGuarWay").val();
				para.secDep = $("#secDep").val();
				para.ctrctTxtCd = $("#ctrctTxtCd").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'enSecAcctInf/saveGuarAcctBsInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							   updateFlag = 'Y';
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#basicDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('basic','E_GUAR_ACCT_BS_INF', $this.data("id"),'form',true,false); //数据校验
//							verify.dataValidation('base','E_GUAR_ACCT_BS',dataObj.eeaGuarAcctBsSgmtId,'form',true,false); //数据校验
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
            //批量删除
            $("#basicDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
                    para.eebGuarAcctBsInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'enSecAcctInf/guarAcctBsInfSgmtDel.do', 
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
            /****************************************基本信息段结束****************************************/

            /****************************************相关还款责任人段开始****************************************/
            var rltInfoUrl;
			if(pageType === 'edit'){
				rltInfoUrl = 'enSecAcctInf/getRltInfList.do?eeaGuarAcctBsSgmtId='+ dataObj.eeaGuarAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#responsibleAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'enSecAcctInf/getRltInfList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'responsibleDataTable',
				elem : '#responsibleDataTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EECRLTREPYMTINFSGMTID",title:"主键"},
					{align:"center",field:"INFOIDTYPE",title:"身份类别",templet: function(d){return renderColumnDict(d, 'INFOIDTYPE', enterDict.infoIdType)}},
					{align:"center",field:"ARLPNAME",title:"责任人名称"},
					{align:"center",field:"ARLPCERTTYPE",title:"责任人身份标识类型",templet: function(d){return renderColumnDictComsharHodIdType(d, 'ARLPCERTTYPE', enterDict.idType,enterDict.entCertMainType,'INFOIDTYPE')}},
					{align:"center",field:"ARLPCERTNUM",title:"责任人身份标识号码"},
					{align:"center",field:"ARLPTYPE",title:"还款责任人类型",templet: function(d){return renderColumnDict(d, 'ARLPTYPE', enterDict.entGuarArlpType)}},
					{align:"center",field:"ARLPAMT",title:"还款责任金额"},
					{align:"center",field:"WARTYSIGN",title:"联保标志",templet:function(d){return renderColumnDictComwartySign(d,'WARTYSIGN',enterDict.entLoanWartySign,'ARLPTYPE')}},
					{align:"center",field:"MAXGUARMCC",title:"保证合同编号"},
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
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
                	$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
//								$this.hide();
								console.log("data  "+data);
								 $("#saveResponsibleModelBtn").data("id",data.result);
								 console.log("id  "+$("#saveResponsibleModelBtn").data("id"));
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                    $("#infoIdType").val("");
                    $("#arlpName").val("");
                    $("#arlpCertType").val("");
                    $("#arlpCertNum").val("");
                    $("#arlpType").val("");
                    $("#arlpAmt").val("");
                    $("#wartySign").val("");
                    $("#maxGuarMcc").val("");
                    form.render('select');
                    $("#saveResponsibleModelBtn").data("id","");
					$("#cancelResponsibleModelBtn").data("id",dataObj.eeaGuarAcctBsSgmtId);
					modelIndex = layer.open({
                        type: 1,
                        title: "新增",
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#responsibleEditModel')
                    });
                }else{
                    layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
                }
            });
			
            //工具栏操作
            table.on('tool(responsibleDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                    $("#infoIdType").val(data.INFOIDTYPE);
                    $("#arlpName").val(data.ARLPNAME);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#infoIdType").find("option[value='"+data.INFOIDTYPE+"']").data("id")},
						type:'post',  
						cache:false,  
						dataType:'json',  
						success:function(dict){
							if (dict.result){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : dict.result},
									containerId : "arlpCertType"
								});
							}
							$("#arlpCertType").val(data.ARLPCERTTYPE);
							form.render('select'); 
						}
					});
                    $("#arlpCertNum").val(data.ARLPCERTNUM);
                    $("#arlpType").val(data.ARLPTYPE);
                    $("#arlpAmt").val(data.ARLPAMT);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#arlpType").find("option[value='"+data.ARLPTYPE+"']").data("id")},
						type:'post',  
						cache:false,  
						dataType:'json',  
						success:function(dict){
							if (dict.result.length){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : dict.result},
									containerId : "wartySign"
								});
							}
							$("#wartySign").val(data.WARTYSIGN);
							form.render('select');
						}
					});
                    $("#maxGuarMcc").val(data.MAXGUARMCC);
                    form.render('select');
                    $("#saveResponsibleModelBtn").data("id",data.EECRLTREPYMTINFSGMTID);
                    verify.dataValidation('responsible','E_SEC_RLT_REPYMT_INF', $("#saveResponsibleModelBtn").data("id"),'form',false,false); //数据校验
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
					para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
					para.eecRltRepymtInfSgmtId = data.EECRLTREPYMTINFSGMTID;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'enSecAcctInf/rltRepymtInfDel.do', 
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
            form.on('submit(saveResponsibleModelBtn)', function(data){
				$.ajax({
					type : "POST",  //请求方式
					url  : "enSecAcctInf/saveRltRepymtInf.do",
					data : {rltData  :  JSON.stringify(data.field),
							eeaGuarAcctBsSgmtId : dataObj.eeaGuarAcctBsSgmtId,
							eecRltRepymtInfSgmtId : $("#saveResponsibleModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							updateFlag ='Y';
							layer.msg('操作成功', {time:3000});
                            table.reload('responsibleDataTable', {});
                            layer.close(modelIndex);
                            verify.dataValidation('responsible','E_SEC_RLT_REPYMT_INF', $("#saveResponsibleModelBtn").data("id"),'form',true,false); //数据校验
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
            /****************************************相关还款责任人段结束****************************************/

            /****************************************抵质押物信息段开始****************************************/
            var mccInfoUrl;
			if(pageType === 'edit'){
				mccInfoUrl = 'enSecAcctInf/getMccInfList.do?eeaGuarAcctBsSgmtId='+ dataObj.eeaGuarAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#mortgageAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				mccInfoUrl = 'enSecAcctInf/getMccInfList.do?pageType='+ pageType;
			}
				
			//渲染表格
			table.render({
				id   : 'mortgageDataTable',
				elem : '#mortgageDataTable',
				url  : mccInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EED_GUAR_MOTGA_CLTAL_INF_ID",title:"主键"},
					{align:"center",field:"CCC",title:"抵（质）押合同标识码"},
					{align:"center",title:"操作",width:200,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#mortgageAddBtn").on("click",function () {
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
                    $("#ccc").val("");
                    $.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
//								$this.hide();
						$("#saveMortgageModelBtn").data("id",data.result);
							}else{
								layer.alert(data.msg);
							}
						},
						//请求失败，包含具体的错误信息
						error : function(e){
							layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
						}
					});
                  
					modelIndex = layer.open({
                        type: 1,
                        title: "新增",
                        shade: [0.3, '#000'],
                        area: ['60%', '60%'],
                        anim: 0,
                        resize: false,
                        content: $('#mortgageEditModel')
                    });
                }else{
                    layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
                }
            });
			
            //工具栏操作
            table.on('tool(mortgageDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                    $("#ccc").val(data.CCC);
                    form.render('select');
                    $("#saveMortgageModelBtn").data("id",data.EED_GUAR_MOTGA_CLTAL_INF_ID);
                    verify.dataValidation('mortgage','E_GUAR_MOTGA_CLTAL_INF',$("#saveMortgageModelBtn").data("id"),'form',false,false); //数据校验
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['60%', '60%'],
                        anim: 0,
                        resize: false,
                        content: $('#mortgageEditModel')
                    });
					
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
					para.eedGuarMotgaCltalInfId = data.EED_GUAR_MOTGA_CLTAL_INF_ID;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'enSecAcctInf/mccInfDel.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('mortgageDataTable',{});
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
            form.on('submit(saveMortgageModelBtn)', function(data){
				$.ajax({
					type : "post",  //请求方式
					url  : "enSecAcctInf/saveMccInf.do",
					data : {mccData  :  JSON.stringify(data.field),
							eeaGuarAcctBsSgmtId : dataObj.eeaGuarAcctBsSgmtId,
					        eedGuarMotgaCltalInfId : $("#saveMortgageModelBtn").data("id")
							},
							
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							updateFlag ='Y';
							layer.msg('操作成功', {time:3000});
                            table.reload('mortgageDataTable', {});
                            layer.close(modelIndex);
                            verify.dataValidation('mortgage','E_GUAR_MOTGA_CLTAL_INF',$("#saveMortgageModelBtn").data("id"),'form',true,false); //数据校验
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
            /****************************************抵质押物信息段结束****************************************/

            /****************************************在保责任信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && repymtInfSgmt){
            	$("#acctStatus").val(repymtInfSgmt.ACCT_STATUS);
				$("#loanAmt").val(repymtInfSgmt.LOAN_AMT);
				$("#repayPrd").val(repymtInfSgmt.REPAY_PRD);
				$("#fiveCate").val(repymtInfSgmt.FIVE_CATE);
				$("#fiveCateAdjDate").val(repymtInfSgmt.FIVE_CATE_ADJ_DATE);
				$("#riEx").val(repymtInfSgmt.RI_EX);
				$("#compAdvFlag").val(repymtInfSgmt.COMP_ADV_FLAG);
				$("#closeDate").val(repymtInfSgmt.CLOSE_DATE);
				$("#insuranceSaveBtn").show().data("id",repymtInfSgmt.EEF_GUAR_RLT_REPYMT_INF_SG_ID).data("type","edit");
				$("#insuranceDelBtn").show().data("id",repymtInfSgmt.EEF_GUAR_RLT_REPYMT_INF_SG_ID);
				$("#insuranceSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('insurance','E_GUAR_INSURANCE_INF',repymtInfSgmt.EEF_GUAR_RLT_REPYMT_INF_SG_ID,'form',false,false); //数据校验
            }else{
                $("#insuranceAddBtn").show();
            }
            
            //点击新增按钮
            $("#insuranceAddBtn").on("click",function () {
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
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
                    layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(insuranceSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
				para.eefGuarRltRepymtInfSgId = $this.data("id");
				para.acctStatus = $("#acctStatus").val();
				para.loanAmt = $("#loanAmt").val();
				para.repayPrd = $("#repayPrd").val();
				para.fiveCate = $("#fiveCate").val();
				para.fiveCateAdjDate = $("#fiveCateAdjDate").val();
				para.riEx = $("#riEx").val();
				para.compAdvFlag = $("#compAdvFlag").val();
				para.closeDate = $("#closeDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'enSecAcctInf/saveRepymtInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							updateFlag ='Y';
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#insuranceDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('insurance','E_GUAR_INSURANCE_INF', $this.data("id"),'form',true,false); //数据校验
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
                    para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
                    para.eefGuarRltRepymtInfSgId = $this.data("id");
                    $.ajax({ 
						url      : 'enSecAcctInf/delRepymtInfSgmt.do',
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
            /****************************************在保责任信息段结束****************************************/
            
            /****************************************授信额度信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && acctCredSgmt){
				$("#mcc").val(acctCredSgmt.MCC);
				$("#acctCredSgmtSaveBtn").show().data("id",acctCredSgmt.EEE_GUAR_ACCT_CRED_SGMT_ID).data("type","edit");
				$("#acctCredSgmtDelBtn").show().data("id",acctCredSgmt.EEE_GUAR_ACCT_CRED_SGMT_ID);
				$("#acctCredSgmtSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('amount','E_GUAR_ACCT_CRED',acctCredSgmt.EEE_GUAR_ACCT_CRED_SGMT_ID,'form',false,false); //数据校验
            }else{
                $("#acctCredSgmtAddBtn").show();
            }
            
            //点击新增按钮
            $("#acctCredSgmtAddBtn").on("click",function () {
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#acctCredSgmtSaveBtn").show().data("id",data.result).data("type","add");
							    $("#acctCredSgmtDelBtn").data("id",data.result);
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
                    layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
                }
            });
			
            //点击保存按钮
            form.on('submit(acctCredSgmtSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
				para.eeeGuarAcctCredSgmtId = $this.data("id");
				para.mcc = $("#mcc").val();

				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'enSecAcctInf/saveAcctCredSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							updateFlag ='Y';
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#acctCredSgmtDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('amount','E_GUAR_ACCT_CRED',dataObj.eeaGuarAcctBsSgmtId,'form',true,false); //数据校验
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
            $("#acctCredSgmtDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eeaGuarAcctBsSgmtId = dataObj.eeaGuarAcctBsSgmtId;
                    para.eeeGuarAcctCredSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'enSecAcctInf/delAcctCredSgmt.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#acctCredSgmtAddBtn").show();
								$("#acctCredSgmtSaveBtn").hide();
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
            /****************************************授信额度信息段开始****************************************/
            
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
        
    });
});
});
