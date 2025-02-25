initDict('orgCode', staticDict.orgCodeYillion);
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
		laydate.render({
            elem: '#sheetYear'
            ,type: 'year'
            ,theme: '#588fd0'
            ,format: 'yyyy'
        });

        /**
         * 全局变量
         */
		var baseExistFlag = 'N';
        var modelIndex = null; //标记模态框
        var dataObj = window.parent.$("body").data("dataObj"); //获取单条数据信息，判断是新增还是修改
		var pageType = dataObj ? "edit" : "add"; //根据页面初始数据判断该页面是新增还是修改
		
		var cashFlowsBsSgmt, cashFlows2002Sgmt, cashFlows2007Sgmt;
		if(pageType === 'edit'){
			//基础段
			cashFlowsBsSgmt = JSON.parse(document.getElementById("cashFlowsBsSgmt").value);
			//基本信息段
			cashFlows2002Sgmt = JSON.parse(document.getElementById("cashFlows2002Sgmt").value);
			//在保责任信息段
			cashFlows2007Sgmt = JSON.parse(document.getElementById("cashFlows2007Sgmt").value);
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
			var array = ['ENT_CERT_TYPE','SHEET_TYPE','ENT_BALANCE_SHEET_TYPE_DIVIDE','ENT_BALANCE_INF_REC_TYPE'];
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
						if (data.result[i].ENT_CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_CERT_TYPE},
								containerId : "entCertType"
							});
							continue;
						} else if (data.result[i].SHEET_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].SHEET_TYPE},
								containerId : "sheetType"
							});
							continue;
						} else if (data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE},
								containerId : "sheetTypeDivide"
							});
							continue;
						} else if (data.result[i].ENT_BALANCE_INF_REC_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_BALANCE_INF_REC_TYPE},
								containerId : "rptDateCode"
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
    	 * 监听所属机构顺带修改对应的业务管理机构
    	 */
    	form.on('select(orgCode)', function(data){
    		var cimoc = $("#orgCode").find("option:selected").attr("data-id");
    		$("#cimoc").val(cimoc);
    	});

        $.when(d0,d1).done(function (d0,d1) {
            /****************************************基础段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && cashFlowsBsSgmt){
                $("#baseSaveBtn").show().data("id",dataObj.ejaCashFlowsBsSgmtId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.ejaCashFlowsBsSgmtId);
                /*$("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.ejaCashFlowsBsSgmtId);*/
				$("#entName").val(cashFlowsBsSgmt.ENT_NAME);
                $("#entCertType").val(cashFlowsBsSgmt.ENT_CERT_TYPE);
                $("#entCertNum").val(cashFlowsBsSgmt.ENT_CERT_NUM);
                $("#sheetYear").val(cashFlowsBsSgmt.SHEET_YEAR);
                $("#sheetType").val(cashFlowsBsSgmt.SHEET_TYPE);
                $("#sheetTypeDivide").val(cashFlowsBsSgmt.SHEET_TYPE_DIVIDE);
                $("#auditFirmName").val(cashFlowsBsSgmt.AUDIT_FIRM_NAME);
                $("#auditorName").val(cashFlowsBsSgmt.AUDITOR_NAME);
                $("#auditTime").val(cashFlowsBsSgmt.AUDIT_TIME);
                $("#orgCode").val(cashFlowsBsSgmt.ORG_CODE);
                $("#cimoc").val(cashFlowsBsSgmt.CIMOC);
                $("#rptDateCode").val(cashFlowsBsSgmt.RPT_DATE_CODE);
                $("#isFilter").val(cashFlowsBsSgmt.IS_FILTER);
                $("#rptDate").val(cashFlowsBsSgmt.RPT_DATE);
                form.render('select');
                verify.dataValidation('base','E_CASH_FLOWS_BS',dataObj.ejaCashFlowsBsSgmtId,'form',false,false); //数据校验

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
				para.ejaCashFlowsBsSgmtId = $this.data("id");
				para.infRecType = $("#infRecType").val();
				para.entName = $("#entName").val();
				para.entCertType = $("#entCertType").val();
				para.entCertNum = $("#entCertNum").val();
				para.sheetYear = $("#sheetYear").val();
				para.sheetType = $("#sheetType").val();
				para.sheetTypeDivide = $("#sheetTypeDivide").val();
				para.auditFirmName = $("#auditFirmName").val();
				para.auditorName = $("#auditorName").val();
				para.auditTime = $("#auditTime").val();
				//para.orgName = $("#orgCode").next().find(".layui-this").html();
				para.orgCode = $("#orgCode").val();
				para.cimoc = $("#cimoc").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.isFilter = $("#isFilter").val();
				para.rptDate = $("#rptDate").val();
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'cashFlows/saveEnSecAcctInf.do', 
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
			                verify.dataValidation('base','E_CASH_FLOWS_BS',dataObj.ejaCashFlowsBsSgmtId,'form',true,false); //数据校验

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
                    para.ejaCashFlowsBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'cashFlows/delEnSecAcctInf.do', 
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

            /****************************************企业现金流量表02现金流量表段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && cashFlows2002Sgmt){
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#busiLines").find("option[value='"+cashFlows2002Sgmt.busi_lines+"']").data("id")},
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
						$("#busiDtilLines").val(cashFlows2002Sgmt.BUSI_DTIL_LINES);
						form.render('select');
					}
				});
				$("#totalCashInflowsFromOperat_old").val(cashFlows2002Sgmt.TOTAL_CASH_INFLOWS_FROM_OPERAT);
				$("#totalCashOutflowsFromOpera_old").val(cashFlows2002Sgmt.TOTAL_CASH_OUTFLOWS_FROM_OPERA);
				$("#netCashFlowsFromOperating_old").val(cashFlows2002Sgmt.NET_CASH_FLOWS_FROM_OPERATING);
				$("#totalCashInflowsFromInvest_old").val(cashFlows2002Sgmt.TOTAL_CASH_INFLOWS_FROM_INVEST);
				$("#totalCashOutflowsFromInves_old").val(cashFlows2002Sgmt.TOTAL_CASH_OUTFLOWS_FROM_INVES);
				$("#netCashFlowsFromInvesting_old").val(cashFlows2002Sgmt.NET_CASH_FLOWS_FROM_INVESTING_);
				$("#totalCashInflowsFromFinanc_old").val(cashFlows2002Sgmt.TOTAL_CASH_INFLOWS_FROM_FINANC);
				$("#totalCashOutflowsFromFinan_old").val(cashFlows2002Sgmt.TOTAL_CASH_OUTFLOWS_FROM_FINAN);
				$("#netCashFlowsFromFinancing_old").val(cashFlows2002Sgmt.NET_CASH_FLOWS_FROM_FINANCING_);
				$("#netIncreaseinCashAndCashE_old").val(cashFlows2002Sgmt.NET_INCREASEIN_CASH_AND_CASH_E);
				$("#cashReceivedFromSalesOfGo_old").val(cashFlows2002Sgmt.CASH_RECEIVED_FROM_SALES_OF_GO);
				$("#taxRefunds_old").val(cashFlows2002Sgmt.TAX_REFUNDS);
				$("#otherCashReceivedRelatingT_old").val(cashFlows2002Sgmt.OTHER_CASH_RECEIVED_RELATING_T);
				$("#cashPaidForGoodsAndServic_old").val(cashFlows2002Sgmt.CASH_PAID_FOR_GOODS_AND_SERVIC);
				$("#cashPaidToAndOnBehalfOf_old").val(cashFlows2002Sgmt.CASH_PAID_TO_AND_ON_BEHALF_OF_);
				$("#paymentsOfAllTypesOfTaxes_old").val(cashFlows2002Sgmt.PAYMENTS_OF_ALL_TYPES_OF_TAXES);
				$("#otherCashPaymentsFromOpera_old").val(cashFlows2002Sgmt.OTHER_CASH_PAYMENTS_FROM_OPERA);
				$("#cashReceivedFromReturnOfI_old").val(cashFlows2002Sgmt.CASH_RECEIVED_FROM_RETURN_OF_I);
				$("#cashReceivedFromOnvestments_old").val(cashFlows2002Sgmt.CASH_RECEIVED_FROM_ONVESTMENTS);
				$("#netCashReceivedFromDisposa_old").val(cashFlows2002Sgmt.NET_CASH_RECEIVED_FROM_DISPOSA);
				$("#cashReceivedRelatingToOthe_old").val(cashFlows2002Sgmt.CASH_RECEIVED_RELATING_TO_OTHE);
				$("#cashPaidToAcquireFixedAss_old").val(cashFlows2002Sgmt.CASH_PAID_TO_ACQUIRE_FIXED_ASS);
				$("#cashPaymentsForInvestments_old").val(cashFlows2002Sgmt.CASH_PAYMENTS_FOR_INVESTMENTS);
				$("#cashPaymentsRelatedToOthT_old").val(cashFlows2002Sgmt.CASH_PAYMENTS_RELATED_TO_OTH_T);
				$("#cashReceivedFromInvestors_old").val(cashFlows2002Sgmt.CASH_RECEIVED_FROM_INVESTORS);
				$("#cashFromBorrowings_old").val(cashFlows2002Sgmt.CASH_FROM_BORROWINGS);
				$("#otherCashReceivedRelatingC_old").val(cashFlows2002Sgmt.OTHER_CASH_RECEIVED_RELATING_C);
				$("#cashRepaymentsForDebts_old").val(cashFlows2002Sgmt.CASH_REPAYMENTS_FOR_DEBTS);
				$("#cashPaymentsForDistribution_old").val(cashFlows2002Sgmt.CASH_PAYMENTS_FOR_DISTRIBUTION);
				$("#cashPaymentsRelatedToOthC_old").val(cashFlows2002Sgmt.CASH_PAYMENTS_RELATED_TO_OTH_C);
				$("#effectOfExchangRateChanges_old").val(cashFlows2002Sgmt.EFFECT_OF_EXCHANG_RATE_CHANGES);
				$("#netProfit_old").val(cashFlows2002Sgmt.NET_PROFIT);
				$("#provisionForAssets_old").val(cashFlows2002Sgmt.PROVISION_FOR_ASSETS);
				$("#depreciationOfFixedAssets_old").val(cashFlows2002Sgmt.DEPRECIATION_OF_FIXED_ASSETS);
				$("#amortisationOfIntangibleAss_old").val(cashFlows2002Sgmt.AMORTISATION_OF_INTANGIBLE_ASS);
				$("#longTermDeferredExpensesAm_old").val(cashFlows2002Sgmt.LONG_TERM_DEFERRED_EXPENSES_AM);
				$("#decreaseOfDefferedExpenses_old").val(cashFlows2002Sgmt.DECREASE_OF_DEFFERED_EXPENSES);
				$("#additionOfAccuedExpense_old").val(cashFlows2002Sgmt.ADDITION_OF_ACCUED_EXPENSE);
				$("#lossesOnDisposalOfFixedAs_old").val(cashFlows2002Sgmt.LOSSES_ON_DISPOSAL_OF_FIXED_AS);
				$("#lossesOnScrappingOfFixedA_old").val(cashFlows2002Sgmt.LOSSES_ON_SCRAPPING_OF_FIXED_A);
				$("#financeExpense_old").val(cashFlows2002Sgmt.FINANCE_EXPENSE);
				$("#lossesArsingFromInvestment_old").val(cashFlows2002Sgmt.LOSSES_ARSING_FROM_INVESTMENT);
				$("#deferredTaxCredit_old").val(cashFlows2002Sgmt.DEFERRED_TAX_CREDIT);
				$("#decreaseInInventories_old").val(cashFlows2002Sgmt.DECREASE_IN_INVENTORIES);
				$("#decreaseinOperatingReceivabl_old").val(cashFlows2002Sgmt.DECREASEIN_OPERATING_RECEIVABL);
				$("#increaseinOperatingReceivabl_old").val(cashFlows2002Sgmt.INCREASEIN_OPERATING_RECEIVABL);
				$("#others_old").val(cashFlows2002Sgmt.OTHERS);
				$("#netCashFlowsFromOperating2_old").val(cashFlows2002Sgmt.NET_CASH_FLOWS_FROM_OPERATING2);
				$("#debtsTransferToCapital_old").val(cashFlows2002Sgmt.DEBTS_TRANSFER_TO_CAPITAL);
				$("#oneYearDueConvertibleBonds_old").val(cashFlows2002Sgmt.ONE_YEAR_DUE_CONVERTIBLE_BONDS);
				$("#financingRentToTheFixedAs_old").val(cashFlows2002Sgmt.FINANCING_RENT_TO_THE_FIXED_AS);
				$("#nonCashOthers_old").val(cashFlows2002Sgmt.NON_CASH_OTHERS);
				$("#cashAtTheEndOfPeriod_old").val(cashFlows2002Sgmt.CASH_AT_THE_END_OF_PERIOD);
				$("#cashAtTheBeginningOfTheP_old").val(cashFlows2002Sgmt.CASH_AT_THE_BEGINNING_OF_THE_P);
				$("#cashEquivalentsAtTheEndOf_old").val(cashFlows2002Sgmt.CASH_EQUIVALENTS_AT_THE_END_OF);
				$("#cashRquivalentsAtTheBeginn_old").val(cashFlows2002Sgmt.CASH_RQUIVALENTS_AT_THE_BEGINN);
				$("#netIncreaseInCashAndCash_old").val(cashFlows2002Sgmt.NET_INCREASE_IN_CASH_AND_CASH_);
				
				$("#basicSaveBtn").show().data("id",cashFlows2002Sgmt.EJB_CASH_FLOWS2002_SGMT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",cashFlows2002Sgmt.EJB_CASH_FLOWS2002_SGMT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				$("#newBox").hide(); //新老版本二择一逻辑
                verify.dataValidation('basic','E_CASH_FLOWS2002',cashFlows2002Sgmt.EJB_CASH_FLOWS2002_SGMT_ID,'form',false,false); //数据校验

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
				para.ejaCashFlowsBsSgmtId = dataObj.ejaCashFlowsBsSgmtId;
				para.ejbCashFlows2002SgmtId = $this.data("id");
				para.totalCashInflowsFromOperat_old = $("#totalCashInflowsFromOperat_old").val();
				para.totalCashOutflowsFromOpera_old = $("#totalCashOutflowsFromOpera_old").val();
				para.netCashFlowsFromOperating_old = $("#netCashFlowsFromOperating_old").val();
				para.totalCashInflowsFromInvest_old = $("#totalCashInflowsFromInvest_old").val();
				para.totalCashOutflowsFromInves_old = $("#totalCashOutflowsFromInves_old").val();
				para.netCashFlowsFromInvesting_old = $("#netCashFlowsFromInvesting_old").val();
				para.totalCashInflowsFromFinanc_old = $("#totalCashInflowsFromFinanc_old").val();
				para.totalCashOutflowsFromFinan_old = $("#totalCashOutflowsFromFinan_old").val();
				para.netCashFlowsFromFinancing_old = $("#netCashFlowsFromFinancing_old").val();
				para.netIncreaseinCashAndCashE_old = $("#netIncreaseinCashAndCashE_old").val();
				para.cashReceivedFromSalesOfGo_old = $("#cashReceivedFromSalesOfGo_old").val();
				para.taxRefunds_old = $("#taxRefunds_old").val();
				para.otherCashReceivedRelatingT_old = $("#otherCashReceivedRelatingT_old").val();
				para.cashPaidForGoodsAndServic_old = $("#cashPaidForGoodsAndServic_old").val();
				para.cashPaidToAndOnBehalfOf_old = $("#cashPaidToAndOnBehalfOf_old").val();
				para.paymentsOfAllTypesOfTaxes_old = $("#paymentsOfAllTypesOfTaxes_old").val();
				para.otherCashPaymentsFromOpera_old = $("#otherCashPaymentsFromOpera_old").val();
				para.cashReceivedFromReturnOfI_old = $("#cashReceivedFromReturnOfI_old").val();
				para.cashReceivedFromOnvestments_old = $("#cashReceivedFromOnvestments_old").val();
				para.netCashReceivedFromDisposa_old = $("#netCashReceivedFromDisposa_old").val();
				para.cashReceivedRelatingToOthe_old = $("#cashReceivedRelatingToOthe_old").val();
				para.cashPaidToAcquireFixedAss_old = $("#cashPaidToAcquireFixedAss_old").val();
				para.cashPaymentsForInvestments_old = $("#cashPaymentsForInvestments_old").val();
				para.cashPaymentsRelatedToOthT_old = $("#cashPaymentsRelatedToOthT_old").val();
				para.cashReceivedFromInvestors_old = $("#cashReceivedFromInvestors_old").val();
				para.cashFromBorrowings_old = $("#cashFromBorrowings_old").val();
				para.otherCashReceivedRelatingC_old = $("#otherCashReceivedRelatingC_old").val();
				para.cashRepaymentsForDebts_old = $("#cashRepaymentsForDebts_old").val();
				para.cashPaymentsForDistribution_old = $("#cashPaymentsForDistribution_old").val();
				para.cashPaymentsRelatedToOthC_old = $("#cashPaymentsRelatedToOthC_old").val();
				para.effectOfExchangRateChanges_old = $("#effectOfExchangRateChanges_old").val();
				para.netProfit_old = $("#netProfit_old").val();
				para.provisionForAssets_old = $("#provisionForAssets_old").val();
				para.depreciationOfFixedAssets_old = $("#depreciationOfFixedAssets_old").val();
				para.amortisationOfIntangibleAss_old = $("#amortisationOfIntangibleAss_old").val();
				para.longTermDeferredExpensesAm_old = $("#longTermDeferredExpensesAm_old").val();
				para.decreaseOfDefferedExpenses_old = $("#decreaseOfDefferedExpenses_old").val();
				para.additionOfAccuedExpense_old = $("#additionOfAccuedExpense_old").val();
				para.lossesOnDisposalOfFixedAs_old = $("#lossesOnDisposalOfFixedAs_old").val();
				para.lossesOnScrappingOfFixedA_old = $("#lossesOnScrappingOfFixedA_old").val();
				para.financeExpense_old = $("#financeExpense_old").val();
				para.lossesArsingFromInvestment_old = $("#lossesArsingFromInvestment_old").val();
				para.deferredTaxCredit_old = $("#deferredTaxCredit_old").val();
				para.decreaseInInventories_old = $("#decreaseInInventories_old").val();
				para.decreaseinOperatingReceivabl_old = $("#decreaseinOperatingReceivabl_old").val();
				para.increaseinOperatingReceivabl_old = $("#increaseinOperatingReceivabl_old").val();
				para.others_old = $("#others_old").val();
				para.netCashFlowsFromOperating2_old = $("#netCashFlowsFromOperating2_old").val();
				para.debtsTransferToCapital_old = $("#debtsTransferToCapital_old").val();
				para.oneYearDueConvertibleBonds_old = $("#oneYearDueConvertibleBonds_old").val();
				para.financingRentToTheFixedAs_old = $("#financingRentToTheFixedAs_old").val();
				para.nonCashOthers_old = $("#nonCashOthers_old").val();
				para.cashAtTheEndOfPeriod_old = $("#cashAtTheEndOfPeriod_old").val();
				para.cashAtTheBeginningOfTheP_old = $("#cashAtTheBeginningOfTheP_old").val();
				para.cashEquivalentsAtTheEndOf_old = $("#cashEquivalentsAtTheEndOf_old").val();
				para.cashRquivalentsAtTheBeginn_old = $("#cashRquivalentsAtTheBeginn_old").val();
				para.netIncreaseInCashAndCash_old = $("#netIncreaseInCashAndCash_old").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'cashFlows/save2002Sgmt.do', 
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
							$("#newBox").hide(); //新老版本二择一逻辑
			                verify.dataValidation('basic','E_CASH_FLOWS2002',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','E_CASH_FLOWS_BS',dataObj.ejaCashFlowsBsSgmtId,'form',true,false); //数据校验
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
                    para.ejaCashFlowsBsSgmtId = dataObj.ejaCashFlowsBsSgmtId;
                    para.ejbCashFlows2002SgmtId = $this.data("id");
					$.ajax({ 
						url      : 'cashFlows/del2002Sgmt.do', 
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
								$("#newBox").show(); //新老版本二择一逻辑
								document.getElementById("02sheet").reset();
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
            /****************************************企业现金流量表02现金流量表段结束****************************************/

            /****************************************企业现金流量表07现金流量表段****************************************/
            //判断是新增还是编辑
            if (dataObj && cashFlows2007Sgmt){
				$("#totalCashInflowsFromOperat_new").val(cashFlows2007Sgmt.TOTAL_CASH_INFLOWS_FROM_OPERAT);
				$("#netCashFlowsFromOperating_new").val(cashFlows2007Sgmt.NET_CASH_FLOWS_FROM_OPERATING);
				$("#netCashFlowsFromInvesting_new").val(cashFlows2007Sgmt.NET_CASH_FLOWS_FROM_INVESTING_);
				$("#netCashFlowsFromFinancing_new").val(cashFlows2007Sgmt.NET_CASH_FLOWS_FROM_FINANCING_);
				$("#netincreaseinCashAndCashEq_new").val(cashFlows2007Sgmt.NETINCREASEIN_CASH_AND_CASH_EQ);
				$("#theFinalCashAndCashEquiva_new").val(cashFlows2007Sgmt.THE_FINAL_CASH_AND_CASH_EQUIVA);
				$("#cashReceivedFromSalesOfGo_new").val(cashFlows2007Sgmt.CASH_RECEIVED_FROM_SALES_OF_GO);
				$("#taxRefunds_new").val(cashFlows2007Sgmt.TAX_REFUNDS);
				$("#otherCashReceivedRelatingJ_new").val(cashFlows2007Sgmt.OTHER_CASH_RECEIVED_RELATING_J);
				$("#cashPaidForGoodsAndServic_new").val(cashFlows2007Sgmt.CASH_PAID_FOR_GOODS_AND_SERVIC);
				$("#cashPaidToAndOnBehaLfOf_new").val(cashFlows2007Sgmt.CASH_PAID_TO_AND_ON_BEHA_LF_OF);
				$("#paymentsOfAllTypesOfTaxes_new").val(cashFlows2007Sgmt.PAYMENTS_OF_ALL_TYPES_OF_TAXES);
				$("#otherCashPaymentsFromOpera_new").val(cashFlows2007Sgmt.OTHER_CASH_PAYMENTS_FROM_OPERA);
				$("#totalCashOutflowsFromOpera_new").val(cashFlows2007Sgmt.TOTAL_CASH_OUTFLOWS_FROM_OPERA);
				$("#cashReceivedFromReturnOfI_new").val(cashFlows2007Sgmt.CASH_RECEIVED_FROM_RETURN_OF_I);
				$("#cashReceivedFromOnvestments_new").val(cashFlows2007Sgmt.CASH_RECEIVED_FROM_ONVESTMENTS);
				$("#netCashReceivedFromDisposa_new").val(cashFlows2007Sgmt.NET_CASH_RECEIVED_FROM_DISPOSA);
				$("#netCashInflowsOfDisposalO_new").val(cashFlows2007Sgmt.NET_CASH_INFLOWS_OF_DISPOSAL_O);
				$("#cashReceivedRelatingToOthe_new").val(cashFlows2007Sgmt.CASH_RECEIVED_RELATING_TO_OTHE);
				$("#totalCashInflowsFromInvest_new").val(cashFlows2007Sgmt.TOTAL_CASH_INFLOWS_FROM_INVEST);
				$("#cashPaidToAcquireFixedAss_new").val(cashFlows2007Sgmt.CASH_PAID_TO_ACQUIRE_FIXED_ASS);
				$("#cashPaymentsForInvestments_new").val(cashFlows2007Sgmt.CASH_PAYMENTS_FOR_INVESTMENTS);
				$("#netCashOutflowsOfProcureme_new").val(cashFlows2007Sgmt.NET_CASH_OUTFLOWS_OF_PROCUREME);
				$("#cashPaymentsRelatedToOthT_new").val(cashFlows2007Sgmt.CASH_PAYMENTS_RELATED_TO_OTH_T);
				$("#subTotalOfCashOutflows_new").val(cashFlows2007Sgmt.SUB_TOTAL_OF_CASH_OUTFLOWS);
				$("#cashReceivedFromInvestors_new").val(cashFlows2007Sgmt.CASH_RECEIVED_FROM_INVESTORS);
				$("#cashFromBorrowings_new").val(cashFlows2007Sgmt.CASH_FROM_BORROWINGS);
				$("#otherCashReceivedRelatingC_new").val(cashFlows2007Sgmt.OTHER_CASH_RECEIVED_RELATING_C);
				$("#totalCashInflowsFromFinanc_new").val(cashFlows2007Sgmt.TOTAL_CASH_INFLOWS_FROM_FINANC);
				$("#cashRepaymentsForDebts_new").val(cashFlows2007Sgmt.CASH_REPAYMENTS_FOR_DEBTS);
				$("#cashPaymentsForDistribution_new").val(cashFlows2007Sgmt.CASH_PAYMENTS_FOR_DISTRIBUTION);
				$("#cashPaymentsRelatedToOthC_new").val(cashFlows2007Sgmt.CASH_PAYMENTS_RELATED_TO_OTH_C);
				$("#totalCashOutflowsFromFinan_new").val(cashFlows2007Sgmt.TOTAL_CASH_OUTFLOWS_FROM_FINAN);
				$("#effectOfExchangRateChanges_new").val(cashFlows2007Sgmt.EFFECT_OF_EXCHANG_RATE_CHANGES);
				$("#initialCashAndCashEquivale_new").val(cashFlows2007Sgmt.INITIAL_CASH_AND_CASH_EQUIVALE);
				$("#netProfit_new").val(cashFlows2007Sgmt.NET_PROFIT);
				$("#provisionForAssetImpairment_new").val(cashFlows2007Sgmt.PROVISION_FOR_ASSET_IMPAIRMENT);
				$("#depreciationOfFixedAssets_new").val(cashFlows2007Sgmt.DEPRECIATION_OF_FIXED_ASSETS);
				$("#amortisationOfIntangibleAss_new").val(cashFlows2007Sgmt.AMORTISATION_OF_INTANGIBLE_ASS);
				$("#amortisationOfLongTermDeff_new").val(cashFlows2007Sgmt.AMORTISATION_OF_LONG_TERM_DEFF);
				$("#decreaseOfDefferedExpenses_new").val(cashFlows2007Sgmt.DECREASE_OF_DEFFERED_EXPENSES);
				$("#additionOfAccuedExpense_new").val(cashFlows2007Sgmt.ADDITION_OF_ACCUED_EXPENSE);
				$("#lossesOnDisposalOfFixedAs_new").val(cashFlows2007Sgmt.LOSSES_ON_DISPOSAL_OF_FIXED_AS);
				$("#lossesOnScrappingOfFixedA_new").val(cashFlows2007Sgmt.LOSSES_ON_SCRAPPING_OF_FIXED_A);
				$("#profitOrLossFromChangesIn_new").val(cashFlows2007Sgmt.PROFIT_OR_LOSS_FROM_CHANGES_IN);
				$("#financeExpense_new").val(cashFlows2007Sgmt.FINANCE_EXPENSE);
				$("#lossesArsingFromInvestment_new").val(cashFlows2007Sgmt.LOSSES_ARSING_FROM_INVESTMENT);
				$("#deferredIncomeTaxAssets_new").val(cashFlows2007Sgmt.DEFERRED_INCOME_TAX_ASSETS);
				$("#deferredIncomeTaxLiabilitie_new").val(cashFlows2007Sgmt.DEFERRED_INCOME_TAX_LIABILITIE);
				$("#decreaseinInventories_new").val(cashFlows2007Sgmt.DECREASEIN_INVENTORIES);
				$("#decreaseinOperatingReceivabl_new").val(cashFlows2007Sgmt.DECREASEIN_OPERATING_RECEIVABL);
				$("#increaseInOperatingReceivab_new").val(cashFlows2007Sgmt.INCREASE_IN_OPERATING_RECEIVAB);
				$("#others_new").val(cashFlows2007Sgmt.OTHERS);
				$("#netCashFlowsFromOperating2_new").val(cashFlows2007Sgmt.NET_CASH_FLOWS_FROM_OPERATING2);
				$("#debtsTransferToCapital_new").val(cashFlows2007Sgmt.DEBTS_TRANSFER_TO_CAPITAL);
				$("#oneYearDueConvertibleBonds_new").val(cashFlows2007Sgmt.ONE_YEAR_DUE_CONVERTIBLE_BONDS);
				$("#financingRentToTheFixedAs_new").val(cashFlows2007Sgmt.FINANCING_RENT_TO_THE_FIXED_AS);
				$("#nonCashOthers_new").val(cashFlows2007Sgmt.NON_CASH_OTHERS);
				$("#cashAtTheEndOfPeriod_new").val(cashFlows2007Sgmt.CASH_AT_THE_END_OF_PERIOD);
				$("#cashAtTheBeginningOfTheP_new").val(cashFlows2007Sgmt.CASH_AT_THE_BEGINNING_OF_THE_P);
				$("#cashEquivalentsAtTheEndOf_new").val(cashFlows2007Sgmt.CASH_EQUIVALENTS_AT_THE_END_OF);
				$("#cashEquivalentsAtTheBeginn_new").val(cashFlows2007Sgmt.CASH_EQUIVALENTS_AT_THE_BEGINN);
				$("#netincreaseinCashAndCashE2_new").val(cashFlows2007Sgmt.NETINCREASEIN_CASH_AND_CASH_E2);
				
				$("#insuranceSaveBtn").show().data("id",cashFlows2007Sgmt.EJC_CASH_FLOWS2007_SGMT_ID).data("type","edit");
				$("#insuranceDelBtn").show().data("id",cashFlows2007Sgmt.EJC_CASH_FLOWS2007_SGMT_ID);
				$("#insuranceSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				$("#oldBox").hide(); //新老版本二择一逻辑
                verify.dataValidation('insurance','E_CASH_FLOWS2007',cashFlows2007Sgmt.EJC_CASH_FLOWS2007_SGMT_ID,'form',false,false); //数据校验

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
				para.ejaCashFlowsBsSgmtId = dataObj.ejaCashFlowsBsSgmtId;
				para.ejbCashFlows2007SgmtId = $this.data("id");
				para.totalCashInflowsFromOperat_new = $("#totalCashInflowsFromOperat_new").val();
				para.netCashFlowsFromOperating_new = $("#netCashFlowsFromOperating_new").val();
				para.netCashFlowsFromInvesting_new = $("#netCashFlowsFromInvesting_new").val();
				para.netCashFlowsFromFinancing_new = $("#netCashFlowsFromFinancing_new").val();
				para.netincreaseinCashAndCashEq_new = $("#netincreaseinCashAndCashEq_new").val();
				para.theFinalCashAndCashEquiva_new = $("#theFinalCashAndCashEquiva_new").val();
				para.cashReceivedFromSalesOfGo_new = $("#cashReceivedFromSalesOfGo_new").val();
				para.taxRefunds_new = $("#taxRefunds_new").val();
				para.otherCashReceivedRelatingJ_new = $("#otherCashReceivedRelatingJ_new").val();
				para.cashPaidForGoodsAndServic_new = $("#cashPaidForGoodsAndServic_new").val();
				para.cashPaidToAndOnBehaLfOf_new = $("#cashPaidToAndOnBehaLfOf_new").val();
				para.paymentsOfAllTypesOfTaxes_new = $("#paymentsOfAllTypesOfTaxes_new").val();
				para.otherCashPaymentsFromOpera_new = $("#otherCashPaymentsFromOpera_new").val();
				para.totalCashOutflowsFromOpera_new = $("#totalCashOutflowsFromOpera_new").val();
				para.cashReceivedFromReturnOfI_new = $("#cashReceivedFromReturnOfI_new").val();
				para.cashReceivedFromOnvestments_new = $("#cashReceivedFromOnvestments_new").val();
				para.netCashReceivedFromDisposa_new = $("#netCashReceivedFromDisposa_new").val();
				para.netCashInflowsOfDisposalO_new = $("#netCashInflowsOfDisposalO_new").val();
				para.cashReceivedRelatingToOthe_new = $("#cashReceivedRelatingToOthe_new").val();
				para.totalCashInflowsFromInvest_new = $("#totalCashInflowsFromInvest_new").val();
				para.cashPaidToAcquireFixedAss_new = $("#cashPaidToAcquireFixedAss_new").val();
				para.cashPaymentsForInvestments_new = $("#cashPaymentsForInvestments_new").val();
				para.netCashOutflowsOfProcureme_new = $("#netCashOutflowsOfProcureme_new").val();
				para.cashPaymentsRelatedToOthT_new = $("#cashPaymentsRelatedToOthT_new").val();
				para.subTotalOfCashOutflows_new = $("#subTotalOfCashOutflows_new").val();
				para.cashReceivedFromInvestors_new = $("#cashReceivedFromInvestors_new").val();
				para.cashFromBorrowings_new = $("#cashFromBorrowings_new").val();
				para.otherCashReceivedRelatingC_new = $("#otherCashReceivedRelatingC_new").val();
				para.totalCashInflowsFromFinanc_new = $("#totalCashInflowsFromFinanc_new").val();
				para.cashRepaymentsForDebts_new = $("#cashRepaymentsForDebts_new").val();
				para.cashPaymentsForDistribution_new = $("#cashPaymentsForDistribution_new").val();
				para.cashPaymentsRelatedToOthC_new = $("#cashPaymentsRelatedToOthC_new").val();
				para.totalCashOutflowsFromFinan_new = $("#totalCashOutflowsFromFinan_new").val();
				para.effectOfExchangRateChanges_new = $("#effectOfExchangRateChanges_new").val();
				para.initialCashAndCashEquivale_new = $("#initialCashAndCashEquivale_new").val();
				para.netProfit_new = $("#netProfit_new").val();
				para.provisionForAssetImpairment_new = $("#provisionForAssetImpairment_new").val();
				para.depreciationOfFixedAssets_new = $("#depreciationOfFixedAssets_new").val();
				para.amortisationOfIntangibleAss_new = $("#amortisationOfIntangibleAss_new").val();
				para.amortisationOfLongTermDeff_new = $("#amortisationOfLongTermDeff_new").val();
				para.decreaseOfDefferedExpenses_new = $("#decreaseOfDefferedExpenses_new").val();
				para.additionOfAccuedExpense_new = $("#additionOfAccuedExpense_new").val();
				para.lossesOnDisposalOfFixedAs_new = $("#lossesOnDisposalOfFixedAs_new").val();
				para.lossesOnScrappingOfFixedA_new = $("#lossesOnScrappingOfFixedA_new").val();
				para.profitOrLossFromChangesIn_new = $("#profitOrLossFromChangesIn_new").val();
				para.financeExpense_new = $("#financeExpense_new").val();
				para.lossesArsingFromInvestment_new = $("#lossesArsingFromInvestment_new").val();
				para.deferredIncomeTaxAssets_new = $("#deferredIncomeTaxAssets_new").val();
				para.deferredIncomeTaxLiabilitie_new = $("#deferredIncomeTaxLiabilitie_new").val();
				para.decreaseinInventories_new = $("#decreaseinInventories_new").val();
				para.decreaseinOperatingReceivabl_new = $("#decreaseinOperatingReceivabl_new").val();
				para.increaseInOperatingReceivab_new = $("#increaseInOperatingReceivab_new").val();
				para.others_new = $("#others_new").val();
				para.netCashFlowsFromOperating2_new = $("#netCashFlowsFromOperating2_new").val();
				para.debtsTransferToCapital_new = $("#debtsTransferToCapital_new").val();
				para.oneYearDueConvertibleBonds_new = $("#oneYearDueConvertibleBonds_new").val();
				para.financingRentToTheFixedAs_new = $("#financingRentToTheFixedAs_new").val();
				para.nonCashOthers_new = $("#nonCashOthers_new").val();
				para.cashAtTheEndOfPeriod_new = $("#cashAtTheEndOfPeriod_new").val();
				para.cashAtTheBeginningOfTheP_new = $("#cashAtTheBeginningOfTheP_new").val();
				para.cashEquivalentsAtTheEndOf_new = $("#cashEquivalentsAtTheEndOf_new").val();
				para.cashEquivalentsAtTheBeginn_new = $("#cashEquivalentsAtTheBeginn_new").val();
				para.netincreaseinCashAndCashE2_new = $("#netincreaseinCashAndCashE2_new").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'cashFlows/save2007Sgmt.do', 
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
							$("#oldBox").hide(); //新老版本二择一逻辑
			                verify.dataValidation('insurance','E_CASH_FLOWS2007',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','E_CASH_FLOWS_BS',dataObj.ejaCashFlowsBsSgmtId,'form',true,false); //数据校验
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
                    para.ejaCashFlowsBsSgmtId = dataObj.ejaCashFlowsBsSgmtId;
                    para.ejbCashFlows2007SgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'cashFlows/del2007Sgmt.do',
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
								$("#oldBox").show(); //新老版本二择一逻辑
								document.getElementById("07sheet").reset();
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
            /****************************************企业现金流量表07现金流量表段****************************************/

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
