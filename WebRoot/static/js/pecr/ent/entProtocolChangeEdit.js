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
	 table.set({
			page : false, //是否开启分页
			even : true, //是否开启隔行换色
			cellMinWidth : 80 //单元格的最小宽度
		});
	 
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
    			trigger:'click'
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
        
       
		var ctrctBsSgmt, creditLimSgmt;
		if(pageType === 'edit'){
			//基础段
			ctrctBsSgmt = JSON.parse(document.getElementById("ctrctBsSgmt").value);
			//额度信息段
			creditLimSgmt = JSON.parse(document.getElementById("creditLimSgmt").value);
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
                var array = ['PER_CREDIT_RPT_DATE_CODE','CERT_TYPE','ENT_CREDIT_LIM_TYPE','CREDIT_LIM_TYPE','CREDIT_LIM_TYPE','ENT_CERT_MAIN_TYPE','CREDIT_CON_STATUS','CURRENCY','ENT_CREDIT_UP_INF_REC_TYPE'];
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
                    		if (data.result[i].PER_CREDIT_RPT_DATE_CODE){
    							base.renderTpl({
    								tplId : "enumerationValueTpl",
    								arr : {"list" : data.result[i].PER_CREDIT_RPT_DATE_CODE},
    								containerId : "rptDateCode"
    							});
    							continue;
    						} else if (data.result[i].ENT_CERT_MAIN_TYPE){
    							base.renderTpl({
                                    tplId : "enumerationValueTpl",
                                    arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
                                    containerId : "idType"
    							});
    							continue;
    						}else if(data.result[i].CERT_TYPE){
    							 base.renderTpl({
    		                            tplId : "enumerationValueTpl",
    		                            arr : {"list" : data.result[i].CERT_TYPE},
    		                            containerId : "brerType"
    		                        });
    							 continue;
    						}else if(data.result[i].ENT_CREDIT_LIM_TYPE){
   							 base.renderTpl({
		                            tplId : "enumerationValueTpl",
		                            arr : {"list" : data.result[i].ENT_CREDIT_LIM_TYPE},
		                            containerId : "creditLimType"
		                        });
							 continue;
						}else if(data.result[i].CREDIT_LIM_TYPE){
  							 base.renderTpl({
		                            tplId : "enumerationValueTpl",
		                            arr : {"list" : data.result[i].CREDIT_LIM_TYPE},
		                            containerId : "limLoopFlg"
		                        });
							 continue;
						}else if(data.result[i].CREDIT_CON_STATUS){
  							 base.renderTpl({
		                            tplId : "enumerationValueTpl",
		                            arr : {"list" : data.result[i].CREDIT_CON_STATUS},
		                            containerId : "conStatus"
		                        });
							 continue;
						}else if(data.result[i].CURRENCY){
  							 base.renderTpl({
		                            tplId : "enumerationValueTpl",
		                            arr : {"list" : data.result[i].CURRENCY},
		                            containerId : "cy"
		                        });
							 continue;
						}else if (data.result[i].ENT_CREDIT_UP_INF_REC_TYPE){
    						base.renderTpl({
    							tplId : "enumerationValueTpl",
    							arr : {"list" : data.result[i].ENT_CREDIT_UP_INF_REC_TYPE},
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
         * 监听共同受信人身份类别切换
         */
        form.on('select(brerType)', function(data){
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
    						containerId : "certRelIdType"
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
			if (dataObj && ctrctBsSgmt){
				$("div[data-value='" + ctrctBsSgmt.MDFC_SGMT_CODE + "']").css("display","block");
				$("#baseSaveBtn").show().data("id",ctrctBsSgmt.EGA_CTRCT_BS_SGMT_ID).data("type","edit");
				$("#baseDelBtn").show().data("id",ctrctBsSgmt.EGA_CTRCT_BS_SGMT_ID);
				$("#delAllModelBtn,#pushAllModelBtn").show().data("id",ctrctBsSgmt.EGA_CTRCT_BS_SGMT_ID);
				$("#infRecType").val(ctrctBsSgmt.INF_REC_TYPE);
				$("#contractCode").val(ctrctBsSgmt.CONTRACT_CODE);
				$("#rptDateCode").val(ctrctBsSgmt.RPT_DATE_CODE);
				$("#name").val(ctrctBsSgmt.NAME);
				$("#idType").val(ctrctBsSgmt.ID_TYPE);
				$("#idNum").val(ctrctBsSgmt.ID_NUM);
				$("#orgCode").val(ctrctBsSgmt.ORG_CODE);
				$("#mngmtOrgCode").val(ctrctBsSgmt.MNGMT_ORG_CODE);
				$("#isFilter").val(ctrctBsSgmt.IS_FILTER);
				$("#rptDate").val(ctrctBsSgmt.RPT_DATE);
				$("#mdfcSgmtCode").val(ctrctBsSgmt.MDFC_SGMT_CODE);
				 $("div[data-value]").hide();
		            if (ctrctBsSgmt.MDFC_SGMT_CODE === 'B'){
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
		                $("div[data-value='" + ctrctBsSgmt.MDFC_SGMT_CODE + "']").show();
		            }
				form.render('select');
                verify.dataValidation('base','E_CTRCT_BS',ctrctBsSgmt.EGA_CTRCT_BS_SGMT_ID,'form',false,false); //数据校验

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
				$("#idType,#orgCode,#isFilter,#rptDate,#mdfcSgmtCode").removeAttr("disabled");
				if(updateFlag ==='N'){
				var $this = $(this);
				var para = {};
				para.egaCtrctBsSgmtId = $this.data("id");
				para.infRecType = $("#infRecType").val();
				para.contractCode = $("#contractCode").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.name = $("#name").val();
				para.idType = $("#idType").val();
				para.idNum = $("#idNum").val();
				para.orgCode = $("#orgCode").val();
				para.orgName = $("#orgCode").next().find(".layui-this").html();
				para.mngmtOrgCode = $("#mngmtOrgCode").val();
				para.isFilter = $("#isFilter").val();
				para.rptDate = $("#rptDate").val();
				para.mdfcSgmtCode= $("#mdfcSgmtCode").val();
				if($("#mdfcSgmtCode").val()==='B'){
					   updateFlag = 'Y';
				}
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url	  : 'enCtrctInfo/saveCtrctBsSgmt.do', 
					data	 : {str : JSON.stringify(para), pageType : $this.data("type")},
					type	 : 'post',  
					cache	: false,  
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
			                verify.dataValidation('base','E_CTRCT_BS',$this.data("id"),'form',true,false); //数据校验

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
					para.pdaGuarAcctBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url	  : 'enCtrctInfo/deleteOneRecord.do', 
						data	 : {str : JSON.stringify(para)},
						type	 : 'post',  
						cache	: false,  
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

			/****************************************共同受信人信息段开始****************************************/
			var commInfoUrl;
			if(pageType === 'edit'){
				commInfoUrl = 'enCtrctInfo/getRltInfList.do?egaCtrctBsSgmtId='+ dataObj.egaCtrctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#commonAddBtn").parent().show().children('div.layui-colla-content').addClass('layui-show');
			} else {
				commInfoUrl = 'enCtrctInfo/getRltInfList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'commonDataTable',
				elem : '#commonDataTable',
				url  : commInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EGB_CTRCT_CERT_REL_SGMT_ID",title:"主键"},
					{align : "center",field : "BRER_TYPE",title : "共同受信人身份类别", templet:function(d){return renderColumnDict(d,'BRER_TYPE',enterDict.infoIdType)}},
					{align : "center",field : "CERT_REL_NAME",title : "共同受信人名称"},
					{align : "center",field : "CERT_REL_IDTYPE",title : "共同受信人身份标识类型",templet:function(d){return renderColumnDictComsharHodIdType(d,'CERT_REL_IDTYPE',enterDict.idType,enterDict.entCertMainType,'BRER_TYPE')}},
					{align : "center",field : "CERT_REL_ID_NUM",title : "共同受信人身份标识号码"},
					{align : "center",title : "操作",width : 200,toolbar : toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});
		
			//点击新增按钮
			$("#commonAddBtn").on("click",function () {
				if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
					$("#brerType").val("");
					$("#certRelName").val("");
					$("#certRelIdtype").val("");
					$("#certRelIdNum").val("");
					form.render('select');
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){

								$("#saveCommonModelBtn").data("id",data.result);
								console.log("id     "+$("#saveCommonModelBtn").data("id"));
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
						area: ['80%', '85%'],
						anim: 0,
						resize: false,
						content: $('#commonEditModel')
					});
				}else{
					layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
				}
			});
			
			//工具栏操作
			table.on('tool(commonDataTable)', function(obj){
				var data = obj.data;
				var layEvent = obj.event;
				if (layEvent === 'edit'){ //编辑
					console.log(data);
					$("#brerType").val(data.BRER_TYPE);
					$("#certRelName").val(data.CERT_REL_NAME);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#brerType").find("option[value='"+data.BRER_TYPE+"']").data("id")},
						type:'post',  
						cache:false,  
						dataType:'json',  
						success:function(dict){
							if (dict.result){
								base.renderTpl({
									tplId : "enumerationValueTpl",
									arr : {"list" : dict.result},
									containerId : "certRelIdType"
								});
							}
							$("#certRelIdType").val(data.CERT_REL_IDTYPE);
							form.render('select'); 
						}
					});
					$("#certRelIdNum").val(data.CERT_REL_ID_NUM);
					$("#saveCommonModelBtn").data("id",data.EGB_CTRCT_CERT_REL_SGMT_ID);
					form.render('select');
					modelIndex = layer.open({
						type: 1,
						title: "编辑",
						area: ['80%', '85%'],
						anim: 0,
						resize: false,
						content: $('#commonEditModel')
					});
					  verify.dataValidation('common','E_CTRCT_CERT_REL',$("#saveCommonModelBtn").data("id"),'form',false,false); //数据校验
				} else if(layEvent === 'delete'){//删除
					var para = {};
					para.egaCtrctBsSgmtId = dataObj.egaCtrctBsSgmtId;
					para.egbCtrctCertRelSgmtId = data.EGB_CTRCT_CERT_REL_SGMT_ID;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url	  : 'enCtrctInfo/delCtrctCertRelSgmt.do', 
							data	 : {str : JSON.stringify(para)},
							type	 : 'post',  
							cache	: false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									 updateFlag = 'Y';
									layer.msg("操作成功");
									table.reload('commonDataTable',{});
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
			form.on('submit(saveCommonModelBtn)', function(data){
				$.ajax({
					type : "POST",  //请求方式
					url  : "enCtrctInfo/saveCtrctCertRelSgmt.do",
					data : {rltData  :  JSON.stringify(data.field),
						    egaCtrctBsSgmtId : dataObj.egaCtrctBsSgmtId,
						    egbCtrctCertRelSgmtId : $("#saveCommonModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
							table.reload('commonDataTable', {});
							layer.close(modelIndex);
							  verify.dataValidation('common','E_CTRCT_CERT_REL',$("#saveCommonModelBtn").data("id"),'form',true,false); //数据校验
//							  verify.dataValidation('base','E_CTRCT_BS',dataObj.egaCtrctBsSgmtId,'form',true,false); //数据校验
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
			/****************************************共同受信人信息段结束****************************************/

			
			/****************************************额度信息段开始****************************************/
			if (dataObj && creditLimSgmt){
				$("#creditLimType").val(creditLimSgmt.CREDIT_LIM_TYPE);
				$("#limLoopFlg").val(creditLimSgmt.LIM_LOOP_FLG);
				$("#creditLim").val(creditLimSgmt.CREDIT_LIM);
				$("#cy").val(creditLimSgmt.CY);
				$("#conEffDate").val(creditLimSgmt.CON_EFF_DATE);
				$("#conExpDate").val(creditLimSgmt.CON_EXP_DATE);
				$("#conStatus").val(creditLimSgmt.CON_STATUS);
				$("#creditRestCode").val(creditLimSgmt.CREDIT_REST_CODE);
				$("#creditRest").val(creditLimSgmt.CREDIT_REST);
				$("#amountSaveBtn").show().data("id",creditLimSgmt.EGC_CREDIT_LIM_SGMT_ID).data("type","edit");
				$("#amountDelBtn").show().data("id",creditLimSgmt.EGC_CREDIT_LIM_SGMT_ID);
				$("#amount").show();
				$("#common").hide();
				$("#amountSaveBtn").parent().show().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				 verify.dataValidation('amount','E_CREDIT_LIM',creditLimSgmt.EGC_CREDIT_LIM_SGMT_ID,'form',false,false); //数据校验
			}else{
				$("#amountAddBtn").show();
			}
			
			//点击新增按钮
			$("#amountAddBtn").on("click",function () {
				if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
					var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#amountSaveBtn").show().data("id",data.result).data("type","add");
								$("#amountDelBtn").data("id",data.result);
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
			form.on('submit(amountSaveBtn)', function(data){
				var $this = $(this);
				var para = {};
				para.egaCtrctBsSgmtId = dataObj.egaCtrctBsSgmtId;
				para.egcCreditLimSgmtId = $this.data("id");
				para.creditLimType = $("#creditLimType").val();
				para.limLoopFlg = $("#limLoopFlg").val();
				para.creditLim = $("#creditLim").val();
				para.cy = $("#cy").val();
				para.conEffDate = $("#conEffDate").val();
				para.conExpDate = $("#conExpDate").val();
				para.conStatus = $("#conStatus").val();
				para.creditRestCode = $("#creditRestCode").val();
				para.creditRest = $("#creditRest").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url	  : 'enCtrctInfo/saveCreditLimSgmt.do', 
					data	 : {str:JSON.stringify(para), pageType : $this.data("type")},
					type	 : 'post',  
					cache	: false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							 updateFlag = 'Y';
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#amountDelBtn").show();
							}
							$this.data("type","edit");
							 verify.dataValidation('amount','E_CREDIT_LIM',$this.data("id"),'form',true,false); //数据校验
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
			$("#amountDelBtn").on("click",function () {
				var $this = $(this);
				layer.confirm('确认删除', {anim: 6}, function(index){
					var para = {};
					para.pdaGuarAcctBsSgmtId = dataObj.pdaGuarAcctBsSgmtId;
					para.pdbGuarAcctInfSgmtId = $this.data("id");
					$.ajax({ 
						url	  : 'enCtrctInfo/delCreditLimSgmt.do', 
						data	 : {str : JSON.stringify(para)},
						type	 : 'post',  
						cache	: false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#amountAddBtn").show();
								$("#amountSaveBtn").hide();
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
            /****************************************额度信息段结束****************************************/

            //判断是否是详情页面，如果是则禁用页面中的按钮和表单控件
            if (base.getrequest('addOrUpdate') === 'detail'){
                $(".layui-btn").not("#cancelAllModelBtn").hide().css("visibility","hidden").addClass("hide");
                $(".layui-input").prop("disabled",true);
                $("select").not("#pushPullSelect").prop("disabled",true);
                form.render();
            }

        /**
         * 取消模态框按钮
         */
        $("#cancelCommonModelBtn").on("click",function () {
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
