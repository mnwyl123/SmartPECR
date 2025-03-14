initDict('orgCode', staticDict.orgCodeYillion);
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
		var updateFlag = 'N';
		var modelIndex = null; //标记模态框
		var dataObj = window.parent.parent.$("body").data("dataObj"); //获取单条数据信息，判断是新增还是修改
		console.log(dataObj);
		var pageType = dataObj ? "edit" : "add"; //根据页面初始数据判断该页面是新增还是修改
		var addOrUpdate = parent.document.getElementById("addOrUpdate").value;
		
		var toolCol ;
		if(addOrUpdate === 'detail'){
			toolCol = "#dataTabToolBarTplDetail";
		}else{
			toolCol = "#dataTabToolBarTpl";
		}
		
		var acctBsSgmt, acctBsInfSgmt, ocInfoSgmt, acctDbtInfSgmt,feedBackError;
		if(pageType === 'edit'){
			//基础段
			acctBsSgmt = JSON.parse(parent.document.getElementById("acctBsSgmt").value);
			//基本信息段
			acctBsInfSgmt = JSON.parse(parent.document.getElementById("acctBsInfSgmt").value);
			//初始债权说明段
			ocInfoSgmt = JSON.parse(parent.document.getElementById("ocInfoSgmt").value);
			//非月度表现信息段
			acctDbtInfSgmt = JSON.parse(parent.document.getElementById("acctDbtInfSgmt").value);
			//反馈错误信息
			feedBackError = parent.document.getElementById("feedBackError").value;
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
			var array = ['PER_LOAN_RPT_DATE_CODE','ID_TYPE', 'PER_LOAN_BUSI_LINES', 'CURRENCY',
						'CERT_TYPE', 'PER_LOAN_ARLP_TYPE', 'PER_LOAN_ACCT_STATUS_C1', 'PER_LOAN_CHAN_TRAN_TYPE',
						'PER_LOAN_ORIG_DBT_CATE', 'INIT_RPY_STS','PER_LOAN_UPD_INF_REC_TYPE'];
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
								containerId : "idType"
							});
							continue;
						} else if(data.result[i].PER_LOAN_BUSI_LINES){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_LOAN_BUSI_LINES},
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
						} else if  (data.result[i].CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "infoIdType"
							});
							continue;
						} else if (data.result[i].PER_LOAN_ARLP_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_LOAN_ARLP_TYPE},
								containerId : "arlpType"
							});
							continue;
						} else if (data.result[i].PER_LOAN_ACCT_STATUS_C1){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_LOAN_ACCT_STATUS_C1},
								containerId : "nomonthAcctStatus"
							});
							continue;
						} else if (data.result[i].PER_LOAN_CHAN_TRAN_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_LOAN_CHAN_TRAN_TYPE},
								containerId : "chanTranType"
							});
							continue;
						} else if  (data.result[i].PER_LOAN_ORIG_DBT_CATE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_LOAN_ORIG_DBT_CATE},
								containerId : "origDbtCate"
							});
							continue;
						} else if (data.result[i].INIT_RPY_STS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].INIT_RPY_STS},
								containerId : "initRpySts"
							});
							continue;
						} else if (data.result[i].PER_LOAN_UPD_INF_REC_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_LOAN_UPD_INF_REC_TYPE},
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
	 * 监听借贷业务大类切换
	 */
	form.on('select(busiLines)', function(data){
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
						containerId : "busiDtlLines"
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
						containerId : "arlpCertType"
					});
				}
				form.render('select');
			}
		});
	});

	/**
	 * 监听还款责任人类型切换
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
		 $("#feedBackError").val(feedBackError);
			/****************************************基础段开始****************************************/
			//判断是新增还是编辑
			if (dataObj && acctBsSgmt){
        		$("div[data-value='" + acctBsSgmt.MDFC_SGMT_CODE + "']").css("display","block");

				$("#baseSaveBtn").show().data("id",dataObj.pbaAcctBsSgmtId).data("type","edit");
				$("#baseDelBtn").show().data("id",dataObj.pbaAcctBsSgmtId);
				$("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.pbaAcctBsSgmtId);
				$("#infRecType").val(acctBsSgmt.INF_REC_TYPE);
				$("#acctType").val(acctBsSgmt.ACCT_TYPE);
				$("#acctCode").val(acctBsSgmt.ACCT_CODE);
				$("#name").val(acctBsSgmt.NAME);
				$("#idType").val(acctBsSgmt.ID_TYPE);
				$("#idNum").val(acctBsSgmt.ID_NUM);
				$("#orgCode").val(acctBsSgmt.ORG_CODE);
				$("#mngmtOrgCode").val(acctBsSgmt.MNGMT_ORG_CODE);
				$("#isFilter").val(acctBsSgmt.IS_FILTER);
				$("#rptDate").val(acctBsSgmt.RPT_DATE);
				$("#mdfcSgmtCode").val(acctBsSgmt.MDFC_SGMT_CODE);
				 $("div[data-value]").hide();
			        if (acctBsSgmt.MDFC_SGMT_CODE === 'B'){
			            $("#name,#idNum,#mngmtOrgCode").css({
			                "background-color" : "#e2e2e2"
			            });
			            $("#idType").parent().css({
			                "background-color" : "#e2e2e2"
			            });
			            $("#name,#idNum,#mngmtOrgCode").removeAttr("readonly");
			            $("idType").removeAttr("disabled");
			        }else{
			            $("#name,#idNum,#mngmtOrgCode").css({
			                "background-color" : "transparent"
			            });
			            $("#idType").parent().css({
			                "background-color" : "transparent"
			            });
			            $("div[data-value='" + acctBsSgmt.MDFC_SGMT_CODE + "']").show();
			        }
				form.render('select');
				verify.dataValidation('base','I_ACCT_BS',dataObj.pbaAcctBsSgmtId,'form',false,false); //数据校验
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
			  
			//点击保存按钮   $(this) 当前按钮本身
			form.on('submit(dcAcctBsSgmtSub)', function(data){
				$("#mdfcSgmtCode,#idType,#orgCode,#isFilter,#rptDate").removeAttr("disabled");
				if(updateFlag ==='N'){
				var $this = $(this);
				var para = {};
				para.pbaAcctBsSgmtId = $this.data("id");
				para.infRecType = $("#infRecType").val();
				para.acctType = $("#acctType").val();
				para.acctCode = $("#acctCode").val();
				para.rptDate = $("#rptDate").val();
				para.name = $("#name").val();
				para.idType = $("#idType").val();
				para.idNum = $("#idNum").val();
				para.orgCode = $("#orgCode").val();
				//para.orgName = $("#orgCode").next().find(".layui-this").html();
				para.mngmtOrgCode = $("#mngmtOrgCode").val();
				para.isFilter = $("#isFilter").val();
				para.mdfcSgmtCode  =  $("#mdfcSgmtCode").val();
				if($("#mdfcSgmtCode").val()==='B'){
					   updateFlag = 'Y';
				}
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'indvLoanAcctInfo/acctBsSgmtAddOrEdit.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						 
						 baseExistFlag = 'Y';
						    layer.msg("操作成功");
                            $this.data("type","edit");
                            $("#baseDelBtn").show();
                            $("#delAllModelBtn,#pushAllModelBtn").show();
                            dataObj =para; //存储新数据	
            				verify.dataValidation('base','I_ACCT_BS', $this.data("id"),'form',true,false); //数据校验

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
					para.pbaAcctBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'indvLoanAcctInfo/acctBsSgmtDelete.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								if (pageType === "edit"){
									var index = parent.parent.layer.getFrameIndex(window.parent.name);//先得到当前iframe层的索引
									parent.parent.layer.close(index); //再执行关闭
								}else{
									window.location.reload();
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
			});
			//新增情况下基础段自动点击一下让基础段默认展开
			if (!dataObj){
				$("#baseAddBtn").click();
			}
			/****************************************基础段结束****************************************/

			/****************************************基本信息段开始****************************************/
			//判断是新增还是编辑
			if (dataObj && acctBsInfSgmt){
				$("#busiLines").val(acctBsInfSgmt.BUSI_LINES);
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#busiLines").find("option[value='"+acctBsInfSgmt.BUSI_LINES+"']").data("id")},
					type:'post',  
					cache:false,  
					dataType:'json',  
					success:function(data){
						if (data.result.length){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result},
								containerId : "busiDtlLines"
							});
						}
						$("#busiDtlLines").val(acctBsInfSgmt.BUSI_DTL_LINES);
						form.render('select');
					}
				});
				//$("#openDate").val(base.formatDate(new Date(data.result[0].openDate)).ymd);
				$("#openDate").val(acctBsInfSgmt.OPEN_DATE);
				$("#cy").val(acctBsInfSgmt.CY);
				$("#loanAmt").val(acctBsInfSgmt.LOAN_AMT);
				$("#basicSaveBtn").show().data("id",acctBsInfSgmt.PBB_ACCT_BS_INF_SGMT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",acctBsInfSgmt.PBB_ACCT_BS_INF_SGMT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');//同级下的div 添加css
				form.render('select');
				verify.dataValidation('basic','I_ACCT_BS_INF', acctBsInfSgmt.PBB_ACCT_BS_INF_SGMT_ID,'form',false,false); //数据校验

			}else{
				$("#basicAddBtn").show();
			}
			
			//点击新增按钮
			$("#basicAddBtn").on("click",function () {
				console.log(dataObj);
				console.log(baseExistFlag);
				console.log(updateFlag);
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
								$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
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
			form.on('submit(dcAcctBsInfSgmtSub)', function(data){
				var $this = $(this);
				var para = {};
				para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
				para.pbbAcctBsInfSgmtId = $this.data("id");
				para.busiLines = $("#busiLines").val();
				para.busiDtlLines = $("#busiDtlLines").val();
				para.openDate = $("#openDate").val();
				para.cy = $("#cy").val();
				para.acctCredLine = '';
				para.loanAmt = $("#loanAmt").val();
				para.flag = '';
				para.dueDate = '';
				para.repayMode = '';
				para.repayFreqcy = '';
				para.repayPrd = '';
				para.applyBusiDist = '';
				para.guarMode = '';
				para.othRepyGuarWay = '';
				para.assetTrandFlag = '';
				para.fundSou = '';
				para.loanForm = '';
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'indvLoanAcctInfo/saveAcctBsInfoSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){
					       layer.msg("操作成功");
                            $this.data("type","edit");
                            $("#basicDelBtn").show();
            				verify.dataValidation('basic','I_ACCT_BS_INF', $this.data("id"),'form',true,false); //数据校验
//            				verify.dataValidation('base','I_ACCT_BS', dataObj.pbaAcctBsSgmtId,'form',true,false); //数据校验
					 }
           	});
			});
			
			//点击删除按钮
			$("#basicDelBtn").on("click",function () {
				var $this = $(this);
				layer.confirm('确认删除', {anim: 6}, function(index){
					var para = {};
					para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
					para.pbbAcctBsInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'indvLoanAcctInfo/acctBsInfSgmtDel.do', 
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

            /****************************************相关还款责任人段开始**********************************/
			var rltInfoUrl;
			if(pageType === 'edit'){
				rltInfoUrl = 'indvLoanAcctInfo/getRltRepymtInfList.do?pbaAcctBsSgmtId='+ dataObj.pbaAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#dcRltRepymtInfSgmtAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'indvLoanAcctInfo/getRltRepymtInfList.do?pageType='+ pageType;
			}
            //渲染表格
			table.render({
				id   : 'dcRltRepymtInfSgmtTable',
				elem : '#dcRltRepymtInfSgmtTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"pbcRltRepymtInfSgmtId",title:"主键"},
					{align:"center",field:"INFO_ID_TYPE",title:"身份类别",templet:function(d){return renderColumnDict(d,'infoIdType',staticDict.infoIdType)}},
					{align:"center",field:"ARLP_NAME",title:"责任人名称"},
					{align:"center",field:"ARLP_CERT_TYPE",title:"责任人身份标识类型",templet:function(d){return renderColumnDictComsharHodIdType(d,'arlpCertType',staticDict.idType,staticDict.entCertMainType,'infoIdType')}},
					{align:"center",field:"ARLP_CERT_NUM",title:"责任人身份标识号码"},
					{align:"center",field:"ARLP_TYPE",title:"还款责任人类型",templet:function(d){return renderColumnDict(d,'arlpType',staticDict.arlpType)}},
					{align:"center",field:"ARLP_AMT",title:"还款责任金额"},
					{align:"center",field:"WARTY_SIGN",title:"联保标志",templet:function(d){return renderColumnDictComwartySign(d,'wartySign',staticDict.wartySign,'arlpType')}},
					{align:"center",field:"MAX_GUAR_MCC",title:"保证合同编号"},
					{align:"center",title:"操作",width:150,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#dcRltRepymtInfSgmtAddBtn").on("click",function () {
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
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
                    $.ajax({
    					type : "POST",  //请求方式
    					url  : "generateUUID/id.do",
    					success : function(data) {
    						if(data.success == true){
    							$("#saveResponsibleModelBtn").data("id",data.result);
    							
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
                        content: $('#responsibleEditModel')
                    });
                }else{
                    layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
                }
            });
			
            //工具栏操作
            table.on('tool(dcRltRepymtInfSgmtTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                    $("#infoIdType").val(data.infoIdType);
                    $("#arlpName").val(data.arlpName);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#infoIdType").find("option[value='"+data.infoIdType+"']").data("id")},
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
							$("#arlpCertType").val(data.arlpCertType);
							form.render('select'); 
						}
					});
                    $("#arlpCertNum").val(data.arlpCertNum);
                    $("#arlpType").val(data.arlpType);
                    $("#arlpAmt").val(data.arlpAmt);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#arlpType").find("option[value='"+data.arlpType+"']").data("id")},
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
							$("#wartySign").val(data.wartySign);
							//给指定下拉框绑定值，form.render('select')这会造成刷新所有的select控件，如果select多，效率会慢
							form.render('select');
						}
					});
                    $("#maxGuarMcc").val(data.maxGuarMcc);
                    form.render('select');
                    $("#saveResponsibleModelBtn").data("id",data.pbcRltRepymtInfSgmtId);
	                verify.dataValidation('dcRltRepymtInfSgmt','I_LOAN_RLT_REPYMT_INF',dataObj.paaBsSmgtId,'form',false,false); //数据校验
                    modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#responsibleEditModel')
                    });               
                     }else if(layEvent === 'delete'){//删除
     					var para = {};
    					para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
    					para.pbcRltRepymtInfSgmtId = data.pbcRltRepymtInfSgmtId;
    					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
    						$.ajax({ 
    							url      : 'indvLoanAcctInfo/rltRepymtInfDel.do', 
    							data     : {str : JSON.stringify(para)},
    							type     : 'post',  
    							cache    : false,  
    							dataType : 'json',  
    							success:function(data){ 
    								if (data.success == true){
    									layer.msg("操作成功");
    									table.reload('dcRltRepymtInfSgmtTable',{});
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
			  	var pbcRltRepymtInfSgmtId = $("#saveResponsibleModelBtn").data("id");
				$.ajax({
					type : "POST",  //请求方式
					url  : "indvLoanAcctInfo/saveRltRepymtInf.do",
					data : {rltData  :  JSON.stringify(data.field),
					        pbaAcctBsSgmtId : dataObj.pbaAcctBsSgmtId,
							pbcRltRepymtInfSgmtId : pbcRltRepymtInfSgmtId
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							 updateFlag = 'Y';
							layer.msg('操作成功', {time:3000});
                            table.reload('dcRltRepymtInfSgmtTable', {});
                            layer.close(modelIndex);
        	                verify.dataValidation('dcRltRepymtInfSgmt','I_LOAN_RLT_REPYMT_INF',pbcRltRepymtInfSgmtId,'form',true,false); //数据校验

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

            /****************************************相关还款责任人段结束**************************************/
			
			/****************************************初始债权说明段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && ocInfoSgmt){
				$("#initCredName").val(ocInfoSgmt.INIT_CRED_NAME);
				$("#initCredOrgNm").val(ocInfoSgmt.INIT_CRED_ORG_NM);
				$("#origDbtCate").val(ocInfoSgmt.ORIG_DBT_CATE);
				$("#initRpySts").val(ocInfoSgmt.INIT_RPY_STS);
				$("#descriptionSaveBtn").show().data("id",ocInfoSgmt.PBF_OC_INF_SGMT_ID).data("type","edit");
				$("#descriptionDelBtn").show().data("id",ocInfoSgmt.PBF_OC_INF_SGMT_ID);
				$("#descriptionSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
                verify.dataValidation('description','I_OC_INF',ocInfoSgmt.PBF_OC_INF_SGMT_ID,'form',false,false); //数据校验

            }else{
                $("#descriptionAddBtn").show();
            }
            
            //点击新增按钮
            $("#descriptionAddBtn").on("click",function () {
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#descriptionSaveBtn").show().data("id",data.result).data("type","add");
							    $("#descriptionDelBtn").data("id",data.result);
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
            form.on('submit(descriptionSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
				
				para.pbfOcInfSgmtId = $this.data("id");
				para.initCredName = $("#initCredName").val();
				para.initCredOrgNm = $("#initCredOrgNm").val();
				para.origDbtCate = $("#origDbtCate").val();
				para.initRpySts = $("#initRpySts").val();
				
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvLoanAcctInfo/saveOcInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
		                verify.dataValidation('description','I_OC_INF',$this.data("id"),'form',true,false); //数据校验
//		                verify.dataValidation('base','I_ACCT_BS', dataObj.pbaAcctBsSgmtId,'form',true,false);
						 updateFlag = 'Y';
						 layer.msg("操作成功");
                            $this.data("type","edit");
                            $("#descriptionDelBtn").show();
}
});

            });
            
			//点击删除按钮
            $("#descriptionDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
                    para.pbfOcInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvLoanAcctInfo/ocInfSgmtDel.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#descriptionAddBtn").show();
								$("#descriptionSaveBtn").hide();
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
            /****************************************初始债权说明段结束****************************************/

            /****************************************非月度表现信息段开始**************************************/
            //判断是新增还是编辑
            if (dataObj && acctDbtInfSgmt){
				$("#nomonthAcctStatus").val(acctDbtInfSgmt.NOMONTH_ACCT_STATUS);
				$("#nomonthAcctBal").val(acctDbtInfSgmt.NOMONTH_ACCT_BAL);
				$("#nomonthLatRpyAmt").val(acctDbtInfSgmt.NOMONTH_LAT_RPY_AMT);
				$("#nomonthLatRpyDate").val(acctDbtInfSgmt.NOMONTH_LAT_RPY_DATE);
				$("#nomonthCloseDate").val(acctDbtInfSgmt.NOMONTH_CLOSE_DATE);
				$("#noBehaviorSaveBtn").show().data("id",acctDbtInfSgmt.PBI_ACCT_DBT_INF_SGMT_ID).data("type","edit");
                $("#noBehaviorDelBtn").show().data("id",acctDbtInfSgmt.PBI_ACCT_DBT_INF_SGMT_ID);
				$("#noBehaviorSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
                verify.dataValidation('noBehavior','I_ACCT_DBT_INF',acctDbtInfSgmt.PBI_ACCT_DBT_INF_SGMT_ID,'form',false,false); //数据校验
            }else{
                $("#noBehaviorAddBtn").show();
            }
            
            //点击新增按钮
            $("#noBehaviorAddBtn").on("click",function () {
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#noBehaviorSaveBtn").show().data("id",data.result).data("type","add");
							    $("#noBehaviorDelBtn").data("id",data.result);
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
            form.on('submit(noBehaviorSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
       
				para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
				para.pbiAcctDbtInfSgmtId = $this.data("id");
				para.nomonthAcctStatus = $("#nomonthAcctStatus").val();
				para.nomonthAcctBal = $("#nomonthAcctBal").val();
				para.nomonthFiveCate = '';
				para.nomonthFiveCateAdjDate = '';
				para.nomonthRemRepPrd = '';
				para.nomonthRpyStatus = '';
				para.nomonthOverdPrd = '';
				para.nomonthTotOverd = '';
				para.nomonthLatRpyAmt = $("#nomonthLatRpyAmt").val();
				para.nomonthLatRpyDate = $("#nomonthLatRpyDate").val();
				para.nomonthCloseDate = $("#nomonthCloseDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'indvLoanAcctInfo/saveAcctDbtInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
		                verify.dataValidation('noBehavior','I_ACCT_DBT_INF',$this.data("id"),'form',true,false); //数据校验
//		                verify.dataValidation('base','I_ACCT_BS', dataObj.pbaAcctBsSgmtId,'form',true,false);
						 updateFlag = 'Y';
					 layer.msg("操作成功");
                            $this.data("type","edit");
                            $("#noBehaviorDelBtn").show();
}
});
 
            });
            //点击删除按钮
            $("#noBehaviorDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
                    para.pbiAcctDbtInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'indvLoanAcctInfo/acctDbtInfSgmtDel.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#noBehaviorAddBtn").show();
								$("#noBehaviorSaveBtn").hide();
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
            /****************************************非月度表现信息段结束**************************************/

            /****************************************特殊交易说明段开始****************************************/
			var busInfoUrl;
			if(pageType === 'edit'){
				busInfoUrl = 'indvLoanAcctInfo/getDspnSgmtList.do?pbaAcctBsSgmtId='+ dataObj.pbaAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#businessAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				busInfoUrl = 'indvLoanAcctInfo/getDspnSgmtList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'businessDataTable',
				elem : '#businessDataTable',
				url  : busInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"PBJ_AS_TRST_DSPN_SGMT_ID",title:"主键"},
					{align:"center",field:"CHAN_TRAN_TYPE",title:"交易类型",templet:function(d){return renderColumnDict(d,'CHAN_TRAN_TYPE',staticDict.perLoanChanTranType)}},
					{align:"center",field:"TRAN_DATE", title:"交易日期"},
					{align:"center",field:"TRAN_AMT",title:"交易金额"},
					{align:"center",field:"DUE_TRAN_MON",title:"到期日期变更月数"},
					{align:"center",field:"DET_INFO",title:"交易明细信息"},
					{align:"center",title:"操作",width:150,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#businessAddBtn").on("click",function () {
                if ((dataObj || baseExistFlag === 'Y')&& updateFlag ==='N'){
					$("#chanTranType").val("");
                    $("#tranDate").val("");
                    $("#tranAmt").val("");
                    $("#dueTranMon").val("");
                    $("#detInfo").val("");
                    //form.render('select');
                    $("#saveBusinessModelBtn").data("id","");
                    $.ajax({
    					type : "POST",  //请求方式
    					url  : "generateUUID/id.do",
    					success : function(data) {
    						if(data.success == true){
    							$("#saveBusinessModelBtn").data("id",data.result);
    							
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
                        area: ['60%', '65%'],
                        anim: 0,
                        resize: false,
                        content: $('#businessEditModel')
                    });
                }else{
                    layer.msg("请先确定基础段是否保存，或者您已经修改过一个信息段的信息");
                }
            });
            
			//工具栏操作
            table.on('tool(businessDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                    $("#chanTranType").val(data.CHAN_TRAN_TYPE);
                    $("#tranDate").val(data.TRAN_DATE);
                    $("#tranAmt").val(data.TRAN_AMT);
                    $("#dueTranMon").val(data.DUE_TRAN_MON);
                    $("#detInfo").val(data.DET_INFO);
                    //form.render('select');
                    $("#saveBusinessModelBtn").data("id",data.PBJ_AS_TRST_DSPN_SGMT_ID);
	                verify.dataValidation('noBehavior','I_AS_TRST_DSPN',$("#saveBusinessModelBtn").data("id"),'form',false,false); //数据校验
                    modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['60%', '65%'],
                        anim: 0,
                        resize: false,
                        content: $('#businessEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.pbaAcctBsSgmtId = dataObj.pbaAcctBsSgmtId;
					para.pbjAsTrstDspnSgmtId = data.PBJ_AS_TRST_DSPN_SGMT_ID;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'indvLoanAcctInfo/trstDspnSgmtDel.do',
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('businessDataTable',{});
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
            form.on('submit(saveBusinessModelBtn)', function(data){
				var pbjAsTrstDspnSgmtId = $("#saveBusinessModelBtn").data("id");
				$.ajax({
					type : "post",  //请求方式
					url  : "indvLoanAcctInfo/saveTrstDspnSgmt.do",
					data : {busData  :  JSON.stringify(data.field),
					        pbaAcctBsSgmtId     : dataObj.pbaAcctBsSgmtId,
							pbjAsTrstDspnSgmtId : pbjAsTrstDspnSgmtId
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							 updateFlag = 'Y';
							layer.msg('操作成功', {time:3000});
                            table.reload('businessDataTable', {});
                            layer.close(modelIndex);
        	                verify.dataValidation('noBehavior','I_AS_TRST_DSPN',pbjAsTrstDspnSgmtId,'form',true,false); //数据校验
//        	                verify.dataValidation('base','I_ACCT_BS', dataObj.pbaAcctBsSgmtId,'form',true,false);
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
 
            /****************************************特殊交易说明段结束****************************************/

            //判断是否是详情页面，如果是则禁用页面中的按钮和表单控件
            if (base.getrequest('addOrUpdate',true) === 'detail'){
                $(".layui-btn").not("#cancelAllModelBtn").hide().css("visibility","hidden").addClass("hide");
                $(".layui-input").prop("disabled",true);
                $("select").not("#pushPullSelect").prop("disabled",true);
                form.render();
                if (dataObj.businessStates === 'RKCG'){ //入库成功状态
                    $("#entireDelAllModelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#idChangeAllModelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#basicSegmentDelBtn,#noBehaviorSegmentDelBtn,#businessSegmentDelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#baseSegmentChangeBtn,#basicSegmentChangeBtn,#responsibleSegmentChangeBtn,#descriptionSegmentChangeBtn,#noBehaviorSegmentChangeBtn,#businessSegmentChangeBtn").show().css("visibility","visible").removeClass("hide");
                }
                if (dataObj.businessStates === 'AW'){ //待审核状态
                    $("#approvalAllBtn,#overruleAllBtn").show().css("visibility","visible").removeClass("hide");
                }
            }
			
		});

        /**
         * 取消模态框按钮
         */
        $("#cancelResponsibleModelBtn,#cancelBusinessModelBtn").on("click",function () {
            layer.close(modelIndex);
        });
        /**
         * 点击关闭按钮
         * 关闭iframe层
         */
        $("#cancelAllModelBtn").on("click",function () {
        	window.parent.parent.location.reload();
            var index = parent.parent.layer.getFrameIndex(window.parent.name); //先得到当前iframe层的索引
            parent.parent.layer.close(index); //再执行关闭
        });

        /**
         * 点击提交按钮
         * 在当前页面直接提交信息记录
         */
        $("#delAllModelBtn,#pushAllModelBtn,#approvalAllBtn").on("click",function () {
            var $this = $(this);
            layer.confirm('确认' + $this.html(), {anim: 6}, function(index){
                EasyAjax.post_json({
                        url: config.api_host + "pbaAcctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
                        data: dataObj
                    },
                    function (result) {
                        layer.msg("操作成功");
                        layer.close(index);
                        if (pageType === "edit"){
                            var index = parent.parent.layer.getFrameIndex(window.parent.name); //先得到当前iframe层的索引
                            parent.parent.layer.close(index); //再执行关闭
                        }else{
                            window.location.reload();
                        }
                    });
            });
        });
        $("#overruleAllBtn").on("click",function () {
            var $this = $(this);
            layer.prompt({anim: 6,title: '输入驳回原因，并确认',formType: 2,maxlength: 120}, function(value, index, elem){
                dataObj.rejectReason = value;
                EasyAjax.post_json({
                        url: config.api_host + "pbaAcctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
                        data: dataObj
                    },
                    function (result) {
                        layer.msg("操作成功");
                        layer.close(index);
                        if (pageType === "edit"){
                            var index = parent.parent.layer.getFrameIndex(window.parent.name); //先得到当前iframe层的索引
                            parent.parent.layer.close(index); //再执行关闭
                        }else{
                            window.location.reload();
                        }
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
                content: 'personLoanInfoEntireDelEdit.html?type=special'
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
                content: 'personLoanInfoIdChangeEdit.html?type=special'
            });
        });

        /**
         * 点击按段删除按钮
         */
        $("#basicSegmentDelBtn,#noBehaviorSegmentDelBtn,#businessSegmentDelBtn").on("click",function () {
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
                content: 'personLoanInfoSegmentDelEdit.html?type=special'
            });
        });

        /**
         * 点击按段更正按钮
         */
        $("#baseSegmentChangeBtn,#basicSegmentChangeBtn,#responsibleSegmentChangeBtn,#descriptionSegmentChangeBtn,#noBehaviorSegmentChangeBtn,#businessSegmentChangeBtn").on("click",function () {
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
                content: 'personLoanInfoSegmentChangeEdit.html?type=special'
            });
        });
	});
});
