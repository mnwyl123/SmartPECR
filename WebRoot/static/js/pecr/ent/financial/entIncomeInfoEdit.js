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
		
		var incomeStatement, incomeStatement02, incomeStatement07;
		if(pageType === 'edit'){
			//基础段
			incomeStatement = JSON.parse(document.getElementById("incomeStatement").value);
			//2002 企业利润及利润分配表
			incomeStatement02 = JSON.parse(document.getElementById("incomeStatement02").value);
			//2007 企业利润及利润分配表
			incomeStatement07 = JSON.parse(document.getElementById("incomeStatement07").value);
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
			var array = ['ENT_CERT_MAIN_TYPE',
						 'SHEET_TYPE',
						 'ENT_BALANCE_INF_REC_TYPE',
						 'ENT_BALANCE_SHEET_TYPE_DIVIDE'];
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
						if (data.result[i].ENT_CERT_MAIN_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
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
						} else if(data.result[i].ENT_BALANCE_INF_REC_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_BALANCE_INF_REC_TYPE},
								containerId : "rptDateCode"
							});
							continue;
						} else if (data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE},
								containerId : "sheetTypeDivide"
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
            if (dataObj && incomeStatement){
				$("#baseSaveBtn").show().data("id",dataObj.eiaIncomeStatementProfitId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.eiaIncomeStatementProfitId);
                /*$("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.eiaIncomeStatementProfitId);*/
                $("#infRecType").val(incomeStatement.INF_REC_TYPE);
                $("#entName").val(incomeStatement.ENT_NAME);
                $("#entCertType").val(incomeStatement.ENT_CERT_TYPE);
                $("#entCertNum").val(incomeStatement.ENT_CERT_NUM);
                $("#sheetYear").val(incomeStatement.SHEET_YEAR);
                $("#sheetType").val(incomeStatement.SHEET_TYPE);
                $("#sheetTypeDivide").val(incomeStatement.SHEET_TYPE_DIVIDE);
                $("#auditFirmName").val(incomeStatement.AUDIT_FIRM_NAME);
                $("#auditorName").val(incomeStatement.AUDITOR_NAME);
                $("#auditTime").val(incomeStatement.AUDIT_TIME);
                $("#orgCode").val(incomeStatement.ORG_CODE);
                $("#cimoc").val(incomeStatement.CIMOC);
                $("#rptDateCode").val(incomeStatement.RPT_DATE_CODE);
                $("#isFilter").val(incomeStatement.IS_FILTER);
                $("#rptDate").val(incomeStatement.RPT_DATE);
                form.render('select');
                verify.dataValidation('base','E_INCOME_STATEMENT',dataObj.eiaIncomeStatementProfitId,'form',false,false); //数据校验

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
							$("#delAllModelBtn,#pushAllModelBtn").data("id",data.result); 
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
				para.eiaIncomeStatementProfitId = $this.data("id");
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
				para.orgCode = $("#orgCode").val();
				//para.orgName = $("#orgCode").next().find(".layui-this").html();
				para.cimoc = $("#cimoc").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.isFilter = $("#isFilter").val();
				para.rptDate = $("#rptDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'entIncomeInfo/saveIncomeStatement.do', 
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
			                verify.dataValidation('base','E_INCOME_STATEMENT',$this.data("id"),'form',true,false); //数据校验

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
                    para.eiaIncomeStatementProfitId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'entIncomeInfo/delIncomeStatement.do', 
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

            /*****************************2002版利润及利润分配表段开始*********************************/
            //判断是新增还是编辑
            if (dataObj && incomeStatement02){
				$("#mainRevenuefRevenue_old").val(incomeStatement02.MAIN_REVENUEF_REVENUE);
				$("#principleBusinessProfit_old").val(incomeStatement02.PRINCIPLE_BUSINESS_PROFIT);
				$("#operatingProfits_old").val(incomeStatement02.OPERATING_PROFITS);
				$("#totalProfit_old").val(incomeStatement02.TOTAL_PROFIT);
				$("#netProfit_old").val(incomeStatement02.NET_PROFIT);
				$("#salesIncomeOfExportGoodsP_old").val(incomeStatement02.SALES_INCOME_OF_EXPORT_GOODS_P);
				$("#salesIncomeOfImportGoodsP_old").val(incomeStatement02.SALES_INCOME_OF_IMPORT_GOODS_P);
				$("#discountAndAllowance_old").val(incomeStatement02.DISCOUNT_AND_ALLOWANCE);
				$("#netAmountOfIncomeFromMain_old").val(incomeStatement02.NET_AMOUNT_OF_INCOME_FROM_MAIN);
				$("#mainOperatingCost_old").val(incomeStatement02.MAIN_OPERATING_COST);
				$("#salesIncomeOfExportProduct_old").val(incomeStatement02.SALES_INCOME_OF_EXPORT_PRODUCT);
				$("#principleBusinessTaxAndExt_old").val(incomeStatement02.PRINCIPLE_BUSINESS_TAX_AND_EXT);
				$("#operationExpense_old").val(incomeStatement02.OPERATION_EXPENSE);
				$("#othersOperatingCost_old").val(incomeStatement02.OTHERS_OPERATING_COST);
				$("#deferredIncome_old").val(incomeStatement02.DEFERRED_INCOME);
				$("#incomeFromSalesAgency_old").val(incomeStatement02.INCOME_FROM_SALES_AGENCY);
				$("#otherOperatingIncome_old").val(incomeStatement02.OTHER_OPERATING_INCOME);
				$("#otherBusinessProfit_old").val(incomeStatement02.OTHER_BUSINESS_PROFIT);
				$("#sellingExpenses_old").val(incomeStatement02.SELLING_EXPENSES);
				$("#generalAndAdministrativeExp_old").val(incomeStatement02.GENERAL_AND_ADMINISTRATIVE_EXP);
				$("#financialExpenses_old").val(incomeStatement02.FINANCIAL_EXPENSES);
				$("#othersExpenses_old").val(incomeStatement02.OTHERS_EXPENSES);
				$("#investmentIncome_old").val(incomeStatement02.INVESTMENT_INCOME);
				$("#futuresIncome_old").val(incomeStatement02.FUTURES_INCOME);
				$("#allowanceIncome_old").val(incomeStatement02.ALLOWANCE_INCOME);
				$("#allowanceIncomeBeforeAllowa_old").val(incomeStatement02.ALLOWANCE_INCOME_BEFORE_ALLOWA);
				$("#nonOperatingIncome_old").val(incomeStatement02.NON_OPERATING_INCOME);
				$("#netGainOnDisposalOfFixed_old").val(incomeStatement02.NET_GAIN_ON_DISPOSAL_OF_FIXED);
				$("#incomeFromNonCurrencyTrade_old").val(incomeStatement02.INCOME_FROM_NON_CURRENCY_TRADE);
				$("#incomeFromSalesOfIntangibl_old").val(incomeStatement02.INCOME_FROM_SALES_OF_INTANGIBL);
				$("#incomeFromPenalty_old").val(incomeStatement02.INCOME_FROM_PENALTY);
				$("#othersIncome_old").val(incomeStatement02.OTHERS_INCOME);
				$("#calculatingFromTheContentS_old").val(incomeStatement02.CALCULATING_FROM_THE_CONTENT_S);
				$("#nonOperatingExpenses_old").val(incomeStatement02.NON_OPERATING_EXPENSES);
				$("#lossFromDisposalOfFixedAs_old").val(incomeStatement02.LOSS_FROM_DISPOSAL_OF_FIXED_AS);
				$("#exchangeOfNonMonetaryAsset_old").val(incomeStatement02.EXCHANGE_OF_NON_MONETARY_ASSET);
				$("#lossOfLawsuits_old").val(incomeStatement02.LOSS_OF_LAWSUITS);
				$("#paymentForDonation_old").val(incomeStatement02.PAYMENT_FOR_DONATION);
				$("#otherPayments_old").val(incomeStatement02.OTHER_PAYMENTS);
				$("#balanceOfContentSalary_old").val(incomeStatement02.BALANCE_OF_CONTENT_SALARY);
				$("#incometax_old").val(incomeStatement02.INCOMETAX);
				$("#imparimentLoss_old").val(incomeStatement02.IMPARIMENT_LOSS);
				$("#unrealizedinvestmentLosses_old").val(incomeStatement02.UNREALIZEDINVESTMENT_LOSSES);
				$("#profitDistributionAtBeginni_old").val(incomeStatement02.PROFIT_DISTRIBUTION_AT_BEGINNI);
				$("#compensationOfSurplusReserv_old").val(incomeStatement02.COMPENSATION_OF_SURPLUS_RESERV);
				$("#otherAdjustmentFactors_old").val(incomeStatement02.OTHER_ADJUSTMENT_FACTORS);
				$("#profitAvailableForDistribut_old").val(incomeStatement02.PROFIT_AVAILABLE_FOR_DISTRIBUT);
				$("#profitReservedForASingleit_old").val(incomeStatement02.PROFIT_RESERVED_FOR_A_SINGLEIT);
				$("#supplementaryCurrentCapital_old").val(incomeStatement02.SUPPLEMENTARY_CURRENT_CAPITAL);
				$("#appropriationOfStatutorySur_old").val(incomeStatement02.APPROPRIATION_OF_STATUTORY_SUR);
				$("#appropriationOfStatutoryWel_old").val(incomeStatement02.APPROPRIATION_OF_STATUTORY_WEL);
				$("#appropriationOfStaffincentiv_old").val(incomeStatement02.APPROPRIATION_OF_STAFFINCENTIV);
				$("#appropriationOfReserveFund_old").val(incomeStatement02.APPROPRIATION_OF_RESERVE_FUND);
				$("#appropriationOfEnterpriseEx_old").val(incomeStatement02.APPROPRIATION_OF_ENTERPRISE_EX);
				$("#profitsCapitalizadOnReturn_old").val(incomeStatement02.PROFITS_CAPITALIZAD_ON_RETURN);
				$("#others_old").val(incomeStatement02.OTHERS);
				$("#profitAvailableForOwnersDi_old").val(incomeStatement02.PROFIT_AVAILABLE_FOR_OWNERS_DI);
				$("#preferredStockDividendsPaya_old").val(incomeStatement02.PREFERRED_STOCK_DIVIDENDS_PAYA);
				$("#withdrawalOtherCommonAccumu_old").val(incomeStatement02.WITHDRAWAL_OTHER_COMMON_ACCUMU);
				$("#payableDividendsOfCommonSt_old").val(incomeStatement02.PAYABLE_DIVIDENDS_OF_COMMON_ST);
				$("#transferFromOrdinaryShares_old").val(incomeStatement02.TRANSFER_FROM_ORDINARY_SHARES);
				$("#othersForOwners_old").val(incomeStatement02.OTHERS_FOR_OWNERS);
				$("#unappropriatedProfit_old").val(incomeStatement02.UNAPPROPRIATED_PROFIT);
				$("#lossCompensatedBeforeTheTa_old").val(incomeStatement02.LOSS_COMPENSATED_BEFORE_THE_TA);
				$("#oldSaveBtn").show().data("id",incomeStatement02.EIB_INCOME_STATEMENT_PROFIT_ID).data("type","edit");
				$("#oldDelBtn").show().data("id",incomeStatement02.EIB_INCOME_STATEMENT_PROFIT_ID/*eib_income_statement_profit_id*/);
				$("#oldSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				$("#newBox").hide(); //新老版本二择一逻辑
                verify.dataValidation('old','E_INCOME_STATEMENT_02',incomeStatement02.EIB_INCOME_STATEMENT_PROFIT_ID,'form',false,false); //数据校验

            }else{
                $("#oldAddBtn").show();
            }
			
			//点击新增按钮
			$("#oldAddBtn").on("click",function () {
				if (dataObj || baseExistFlag === 'Y'){
					var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#oldSaveBtn").show().data("id",data.result).data("type","add");
								$("#oldDelBtn").data("id",data.result);
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
            form.on('submit(oldSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.eiaIncomeStatementProfitId = dataObj.eiaIncomeStatementProfitId;
				para.eibIncomeStatementProfitId = $this.data("id");
				para.mainRevenuefRevenue = $("#mainRevenuefRevenue_old").val();
				para.principleBusinessProfit = $("#principleBusinessProfit_old").val();
				para.operatingProfits = $("#operatingProfits_old").val();
				para.totalProfit = $("#totalProfit_old").val();
				para.netProfit = $("#netProfit_old").val();
				para.salesIncomeOfExportGoodsP = $("#salesIncomeOfExportGoodsP_old").val();
				para.salesIncomeOfImportGoodsP = $("#salesIncomeOfImportGoodsP_old").val();
				para.discountAndAllowance = $("#discountAndAllowance_old").val();
				para.netAmountOfIncomeFromMain = $("#netAmountOfIncomeFromMain_old").val();
				para.mainOperatingCost = $("#mainOperatingCost_old").val();
				para.salesIncomeOfExportProduct = $("#salesIncomeOfExportProduct_old").val();
				para.principleBusinessTaxAndExt = $("#principleBusinessTaxAndExt_old").val();
				para.operationExpense = $("#operationExpense_old").val();
				para.othersOperatingCost = $("#othersOperatingCost_old").val();
				para.deferredIncome = $("#deferredIncome_old").val();
				para.incomeFromSalesAgency = $("#incomeFromSalesAgency_old").val();
				para.otherOperatingIncome = $("#otherOperatingIncome_old").val();
				para.otherBusinessProfit = $("#otherBusinessProfit_old").val();
				para.sellingExpenses = $("#sellingExpenses_old").val();
				para.generalAndAdministrativeExp = $("#generalAndAdministrativeExp_old").val();
				para.financialExpenses = $("#financialExpenses_old").val();
				para.othersExpenses = $("#othersExpenses_old").val();
				para.investmentIncome = $("#investmentIncome_old").val();
				para.futuresIncome = $("#futuresIncome_old").val();
				para.allowanceIncome = $("#allowanceIncome_old").val();
				para.allowanceIncomeBeforeAllowa = $("#allowanceIncomeBeforeAllowa_old").val();
				para.nonOperatingIncome = $("#nonOperatingIncome_old").val();
				para.netGainOnDisposalOfFixed = $("#netGainOnDisposalOfFixed_old").val();
				para.incomeFromNonCurrencyTrade = $("#incomeFromNonCurrencyTrade_old").val();
				para.incomeFromSalesOfIntangibl = $("#incomeFromSalesOfIntangibl_old").val();
				para.incomeFromPenalty = $("#incomeFromPenalty_old").val();
				para.othersIncome = $("#othersIncome_old").val();
				para.calculatingFromTheContentS = $("#calculatingFromTheContentS_old").val();
				para.nonOperatingExpenses = $("#nonOperatingExpenses_old").val();
				para.lossFromDisposalOfFixedAs = $("#lossFromDisposalOfFixedAs_old").val();
				para.exchangeOfNonMonetaryAsset = $("#exchangeOfNonMonetaryAsset_old").val();
				para.lossOfLawsuits = $("#lossOfLawsuits_old").val();
				para.paymentForDonation = $("#paymentForDonation_old").val();
				para.otherPayments = $("#otherPayments_old").val();
				para.balanceOfContentSalary = $("#balanceOfContentSalary_old").val();
				para.incometax = $("#incometax_old").val();
				para.imparimentLoss = $("#imparimentLoss_old").val();
				para.unrealizedinvestmentLosses = $("#unrealizedinvestmentLosses_old").val();
				para.profitDistributionAtBeginni = $("#profitDistributionAtBeginni_old").val();
				para.compensationOfSurplusReserv = $("#compensationOfSurplusReserv_old").val();
				para.otherAdjustmentFactors = $("#otherAdjustmentFactors_old").val();
				para.profitAvailableForDistribut = $("#profitAvailableForDistribut_old").val();
				para.profitReservedForASingleit = $("#profitReservedForASingleit_old").val();
				para.supplementaryCurrentCapital = $("#supplementaryCurrentCapital_old").val();
				para.appropriationOfStatutorySur = $("#appropriationOfStatutorySur_old").val();
				para.appropriationOfStatutoryWel = $("#appropriationOfStatutoryWel_old").val();
				para.appropriationOfStaffincentiv = $("#appropriationOfStaffincentiv_old").val();
				para.appropriationOfReserveFund = $("#appropriationOfReserveFund_old").val();
				para.appropriationOfEnterpriseEx = $("#appropriationOfEnterpriseEx_old").val();
				para.profitsCapitalizadOnReturn = $("#profitsCapitalizadOnReturn_old").val();
				para.others = $("#others_old").val();
				para.profitAvailableForOwnersDi = $("#profitAvailableForOwnersDi_old").val();
				para.preferredStockDividendsPaya = $("#preferredStockDividendsPaya_old").val();
				para.withdrawalOtherCommonAccumu = $("#withdrawalOtherCommonAccumu_old").val();
				para.payableDividendsOfCommonSt = $("#payableDividendsOfCommonSt_old").val();
				para.transferFromOrdinaryShares = $("#transferFromOrdinaryShares_old").val();
				para.othersForOwners = $("#othersForOwners_old").val();
				para.unappropriatedProfit = $("#unappropriatedProfit_old").val();
				para.lossCompensatedBeforeTheTa = $("#lossCompensatedBeforeTheTa_old").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'entIncomeInfo/saveIncomeState2002.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#oldDelBtn").show();
							}
							$this.data("type","edit");
							$("#newBox").hide(); //新老版本二择一逻辑
			                verify.dataValidation('old','E_INCOME_STATEMENT_02',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','E_INCOME_STATEMENT',dataObj.eiaIncomeStatementProfitId,'form',true,false); //数据校验
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
            $("#oldDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eiaIncomeStatementProfitId = dataObj.eiaIncomeStatementProfitId;
                    para.eibIncomeStatementProfitId = $this.data("id");
					$.ajax({ 
						url      : 'entIncomeInfo/delIncome2002.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#oldAddBtn").show();
								$("#oldSaveBtn").hide();
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
            
            /******************************2002版利润及利润分配表段结束************************************/

            /******************************2007版利润及利润分配表段开始************************************/
            //判断是新增还是编辑
            if (dataObj && incomeStatement07){
				$("#revenueOfSales_new").val(incomeStatement07.REVENUE_OF_SALES);
				$("#operatingProfits_new").val(incomeStatement07.OPERATING_PROFITS);
				$("#profitBeforeTax_new").val(incomeStatement07.PROFIT_BEFORE_TAX);
				$("#netProfit_new").val(incomeStatement07.NET_PROFIT);
				$("#costOfSales_new").val(incomeStatement07.COST_OF_SALES);
				$("#businessAndOtherTaxes_new").val(incomeStatement07.BUSINESS_AND_OTHER_TAXES);
				$("#sellingExpenses_new").val(incomeStatement07.SELLING_EXPENSES);
				$("#generalAndAdministrativeExp_new").val(incomeStatement07.GENERAL_AND_ADMINISTRATIVE_EXP);
				$("#financialExpense_new").val(incomeStatement07.FINANCIAL_EXPENSE);
				$("#impairmentLossOfAssets_new").val(incomeStatement07.IMPAIRMENT_LOSS_OF_ASSETS);
				$("#profitOrLossArisingFromCh_new").val(incomeStatement07.PROFIT_OR_LOSS_ARISING_FROM_CH);
				$("#investmentIncome_new").val(incomeStatement07.INVESTMENT_INCOME);
				$("#investmentIncomeFromAffilia_new").val(incomeStatement07.INVESTMENT_INCOME_FROM_AFFILIA);
				$("#nonOperatingIncome_new").val(incomeStatement07.NON_OPERATING_INCOME);
				$("#nonOperatingExpenses_new").val(incomeStatement07.NON_OPERATING_EXPENSES);
				$("#nonCurrentassets_new").val(incomeStatement07.NON_CURRENTASSETS);
				$("#incomeTaxExpense_new").val(incomeStatement07.INCOME_TAX_EXPENSE);
				$("#basicearningsPerShare_new").val(incomeStatement07.BASICEARNINGS_PER_SHARE);
				$("#dilutedEarningsPerShare_new").val(incomeStatement07.DILUTED_EARNINGS_PER_SHARE);
				$("#newSaveBtn").show().data("id",incomeStatement07.EIC_INCOME_STATEMENT_PROFIT_ID).data("type","edit");
				$("#newDelBtn").show().data("id",incomeStatement07.EIC_INCOME_STATEMENT_PROFIT_ID/*eic_income_statement_profit_id*/);
				$("#newSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				$("#oldBox").hide(); //新老版本二择一逻辑
                verify.dataValidation('new','E_INCOME_STATEMENT_07',incomeStatement07.EIC_INCOME_STATEMENT_PROFIT_ID,'form',false,false); //数据校验

            }else{
                $("#newAddBtn").show();
            }
            //点击新增按钮
            $("#newAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#newSaveBtn").show().data("id",data.result).data("type","add");
								$("#newDelBtn").data("id",data.result);
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
            form.on('submit(newSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.eiaIncomeStatementProfitId = dataObj.eiaIncomeStatementProfitId;
				para.eicIncomeStatementProfitId = $this.data("id");
				para.revenueOfSales = $("#revenueOfSales_new").val();
				para.operatingProfits = $("#operatingProfits_new").val();
				para.profitBeforeTax = $("#profitBeforeTax_new").val();
				para.netProfit = $("#netProfit_new").val();
				para.costOfSales = $("#costOfSales_new").val();
				para.businessAndOtherTaxes = $("#businessAndOtherTaxes_new").val();
				para.sellingExpenses = $("#sellingExpenses_new").val();
				para.generalAndAdministrativeExp = $("#generalAndAdministrativeExp_new").val();
				para.financialExpense = $("#financialExpense_new").val();
				para.impairmentLossOfAssets = $("#impairmentLossOfAssets_new").val();
				para.profitOrLossArisingFromCh = $("#profitOrLossArisingFromCh_new").val();
				para.investmentIncome = $("#investmentIncome_new").val();
				para.investmentIncomeFromAffilia = $("#investmentIncomeFromAffilia_new").val();
				para.nonOperatingIncome = $("#nonOperatingIncome_new").val();
				para.nonOperatingExpenses = $("#nonOperatingExpenses_new").val();
				para.nonCurrentassets = $("#nonCurrentassets_new").val();
				para.incomeTaxExpense = $("#incomeTaxExpense_new").val();
				para.basicearningsPerShare = $("#basicearningsPerShare_new").val();
				para.dilutedEarningsPerShare = $("#dilutedEarningsPerShare_new").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'entIncomeInfo/saveIncomeState2007.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#newDelBtn").show();
							}
							$this.data("type","edit");
							$("#oldBox").hide(); //新老版本二择一逻辑
			                verify.dataValidation('new','E_INCOME_STATEMENT_07',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','E_INCOME_STATEMENT',dataObj.eiaIncomeStatementProfitId,'form',true,false); //数据校验
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
            $("#newDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eiaIncomeStatementProfitId = dataObj.eiaIncomeStatementProfitId;
                    para.eicIncomeStatementProfitId = $this.data("id");
                    $.ajax({ 
						url      : 'entIncomeInfo/delIncomeState2007.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#newAddBtn").show();
								$("#newSaveBtn").hide();
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
            /*****************************2007版利润及利润分配表段结束**********************************/

            //判断是否是详情页面，如果是则禁用页面中的按钮和表单控件
            if (base.getrequest('addOrUpdate') === 'detail'){
                $(".layui-btn").not("#cancelAllModelBtn").hide().css("visibility","hidden").addClass("hide");
                $(".layui-input").prop("disabled",true);
                $("select").not("#pushPullSelect").prop("disabled",true);
                form.render();
                if (dataObj.businessStates === 'RKCG'){ //入库成功状态
                    $("#entireDelAllModelBtn").show().css("visibility","visible").removeClass("hide");
                }
                if (dataObj.businessStates === 'AW'){ //待审核状态
                    $("#approvalAllBtn,#overruleAllBtn").show().css("visibility","visible").removeClass("hide");
                }
            }
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
                        url: config.api_host + "eiaIncomeStatementProfitAp/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                        url: config.api_host + "eiaIncomeStatementProfitAp/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                content: 'enterpriseProfitInfoEntireDelEdit.html?type=special'
            });
        });

        /**
         * 页面初始化
         */

    });
});
