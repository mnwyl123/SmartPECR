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
		
		var balanceBsSgmt, balanceSheet2002, balanceSheet2007;
		if(pageType === 'edit'){
			//基础段
			balanceBsSgmt = JSON.parse(document.getElementById("balanceBsSgmt").value);
			//2002版资产负债表段
			balanceSheet2002 = JSON.parse(document.getElementById("balanceSheet2002").value);
			//2007版资产负债表段
			balanceSheet2007 = JSON.parse(document.getElementById("balanceSheet2007").value);
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
            if (dataObj && balanceBsSgmt){
				$("#baseSaveBtn").show().data("id",dataObj.ehaBalanceSheetBsSgmtId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.ehaBalanceSheetBsSgmtId);
               /* $("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.ehaBalanceSheetBsSgmtId);*/
                $("#infRecType").val(balanceBsSgmt.INF_REC_TYPE);
                $("#entName").val(balanceBsSgmt.ENT_NAME);
                $("#entCertType").val(balanceBsSgmt.ENT_CERT_TYPE);
                $("#entCertNum").val(balanceBsSgmt.ENT_CERT_NUM);
                $("#sheetYear").val(balanceBsSgmt.SHEET_YEAR);
                $("#sheetType").val(balanceBsSgmt.SHEET_TYPE);
                $("#sheetTypeDivide").val(balanceBsSgmt.SHEET_TYPE_DIVIDE);
                $("#auditFirmName").val(balanceBsSgmt.AUDIT_FIRM_NAME);
                $("#auditorName").val(balanceBsSgmt.AUDITOR_NAME);
                $("#auditTime").val(balanceBsSgmt.AUDIT_TIME);
                $("#orgCode").val(balanceBsSgmt.ORG_CODE);
                $("#cimoc").val(balanceBsSgmt.CIMOC);
                $("#rptDateCode").val(balanceBsSgmt.RPT_DATE_CODE);
                $("#isFilter").val(balanceBsSgmt.IS_FILTER);
                $("#rptDate").val(balanceBsSgmt.RPT_DATE);
                form.render('select');
                verify.dataValidation('base','E_BALANCE_SHEET_BS',dataObj.ehaBalanceSheetBsSgmtId,'form',false,false); //数据校验

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
							/*$("#delAllModelBtn,#pushAllModelBtn").data("id",data.result); */
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
				para.ehaBalanceSheetBsSgmtId = $this.data("id");
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
					url      : 'entBalanceInfo/saveBalanceSheetBsSgmt.do', 
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
			                verify.dataValidation('base','E_BALANCE_SHEET_BS',dataObj.ehaBalanceSheetBsSgmtId,'form',true,false); //数据校验

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
                    para.ehaBalanceSheetBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'entBalanceInfo/delBalanceSheetBsSgmt.do', 
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

            /****************************************2002版资产负债表段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && balanceSheet2002){
				$("#totalCurrentAssets_old").val(balanceSheet2002.TOTAL_CURRENT_ASSETS);
				$("#totalFixedAssets_old").val(balanceSheet2002.TOTAL_FIXED_ASSETS);
				$("#totalAssets_old").val(balanceSheet2002.TOTAL_ASSETS);
				$("#totalCurrentLiabilities_old").val(balanceSheet2002.TOTAL_CURRENT_LIABILITIES);
				$("#totalLongTermLiabilities_old").val(balanceSheet2002.TOTAL_LONG_TERM_LIABILITIES);
				$("#totalEquity_old").val(balanceSheet2002.TOTAL_EQUITY);
				$("#totalEquityAndLiabilities_old").val(balanceSheet2002.TOTAL_EQUITY_AND_LIABILITIES);
				$("#currencyFunds_old").val(balanceSheet2002.CURRENCY_FUNDS);
				$("#shortTermInvestments_old").val(balanceSheet2002.SHORT_TERM_INVESTMENTS);
				$("#notesReceivable_old").val(balanceSheet2002.NOTES_RECEIVABLE);
				$("#dividendsReceivable_old").val(balanceSheet2002.DIVIDENDS_RECEIVABLE);
				$("#interestReceivable_old").val(balanceSheet2002.INTEREST_RECEIVABLE);
				$("#accountsReceivable_old").val(balanceSheet2002.ACCOUNTS_RECEIVABLE);
				$("#otherReceivables_old").val(balanceSheet2002.OTHER_RECEIVABLES);
				$("#prepayments_old").val(balanceSheet2002.PREPAYMENTS);
				$("#futureGuarantee_old").val(balanceSheet2002.FUTURE_GUARANTEE);
				$("#allowanceReceivable_old").val(balanceSheet2002.ALLOWANCE_RECEIVABLE);
				$("#exportDrawbackReceivable_old").val(balanceSheet2002.EXPORT_DRAWBACK_RECEIVABLE);
				$("#inventories_old").val(balanceSheet2002.INVENTORIES);
				$("#rawMaterials_old").val(balanceSheet2002.RAW_MATERIALS);
				$("#finishedProducts_old").val(balanceSheet2002.FINISHED_PRODUCTS);
				$("#deferredExpenses_old").val(balanceSheet2002.DEFERRED_EXPENSES);
				$("#unsettledGlonCurrentAssets_old").val(balanceSheet2002.UNSETTLED_GLON_CURRENT_ASSETS);
				$("#longTermDebentureInvestment_old").val(balanceSheet2002.LONG_TERM_DEBENTURE_INVESTMENT);
				$("#otherCurrentAssets_old").val(balanceSheet2002.OTHER_CURRENT_ASSETS);
				$("#longTermInvestment_old").val(balanceSheet2002.LONG_TERM_INVESTMENT);
				$("#longTermEquityInvestment_old").val(balanceSheet2002.LONG_TERM_EQUITY_INVESTMENT);
				$("#longTermSecuritiesInvestmen_old").val(balanceSheet2002.LONG_TERM_SECURITIES_INVESTMEN);
				$("#incorporatingPriceDifference_old").val(balanceSheet2002.INCORPORATING_PRICE_DIFFERENCE);
				$("#totalLongTermInvestment_old").val(balanceSheet2002.TOTAL_LONG_TERM_INVESTMENT);
				$("#originalCostOfFixedAsset_old").val(balanceSheet2002.ORIGINAL_COST_OF_FIXED_ASSET);
				$("#fixedAssetAccumulatedDeprec_old").val(balanceSheet2002.FIXED_ASSET_ACCUMULATED_DEPREC);
				$("#fixedAssetsNetValue_old").val(balanceSheet2002.FIXED_ASSETS_NET_VALUE);
				$("#provisionForimpairmentOfFix_old").val(balanceSheet2002.PROVISION_FORIMPAIRMENT_OF_FIX);
				$("#netValueOfFixedAssets_old").val(balanceSheet2002.NET_VALUE_OF_FIXED_ASSETS);
				$("#fixedAssetsPendingForDispo_old").val(balanceSheet2002.FIXED_ASSETS_PENDING_FOR_DISPO);
				$("#constructionMaterials_old").val(balanceSheet2002.CONSTRUCTION_MATERIALS);
				$("#constructioninProgress_old").val(balanceSheet2002.CONSTRUCTIONIN_PROGRESS);
				$("#unsettledGlOnFixedAssets_old").val(balanceSheet2002.UNSETTLED_GL_ON_FIXED_ASSETS);
				$("#intangibleAssets_old").val(balanceSheet2002.INTANGIBLE_ASSETS);
				$("#landUseRights_old").val(balanceSheet2002.LAND_USE_RIGHTS);
				$("#deferredAssets_old").val(balanceSheet2002.DEFERRED_ASSETS);
				$("#includingFixedAssetsRepair_old").val(balanceSheet2002.INCLUDING_FIXED_ASSETS_REPAIR);
				$("#improvementExpenditureOfFix_old").val(balanceSheet2002.IMPROVEMENT_EXPENDITURE_OF_FIX);
				$("#otherLongTermAssets_old").val(balanceSheet2002.OTHER_LONG_TERM_ASSETS);
				$("#amongItSpeciallyApprovedRe_old").val(balanceSheet2002.AMONG_IT_SPECIALLY_APPROVED_RE);
				$("#totalintangibleAssetsAndOth_old").val(balanceSheet2002.TOTALINTANGIBLE_ASSETS_AND_OTH);
				$("#deferredAssetsDebits_old").val(balanceSheet2002.DEFERRED_ASSETS_DEBITS);
				$("#shortTermBorrowings_old").val(balanceSheet2002.SHORT_TERM_BORROWINGS);
				$("#notesPayable_old").val(balanceSheet2002.NOTES_PAYABLE);
				$("#accountsPayable_old").val(balanceSheet2002.ACCOUNTS_PAYABLE);
				$("#receiptsinAdvance_old").val(balanceSheet2002.RECEIPTSIN_ADVANCE);
				$("#wagesOrSalariesPayables_old").val(balanceSheet2002.WAGES_OR_SALARIES_PAYABLES);
				$("#employeeBenefits_old").val(balanceSheet2002.EMPLOYEE_BENEFITS);
				$("#incomePayable_old").val(balanceSheet2002.INCOME_PAYABLE);
				$("#taxesPayable_old").val(balanceSheet2002.TAXES_PAYABLE);
				$("#otherPayableToGovernment_old").val(balanceSheet2002.OTHER_PAYABLE_TO_GOVERNMENT);
				$("#otherPayable_old").val(balanceSheet2002.OTHER_PAYABLE);
				$("#provisionForExpenses_old").val(balanceSheet2002.PROVISION_FOR_EXPENSES);
				$("#provisions_old").val(balanceSheet2002.PROVISIONS);
				$("#longTermLiabilitiesDueWith_old").val(balanceSheet2002.LONG_TERM_LIABILITIES_DUE_WITH);
				$("#otherCurrentLiabilities_old").val(balanceSheet2002.OTHER_CURRENT_LIABILITIES);
				$("#longTermBorrowings_old").val(balanceSheet2002.LONG_TERM_BORROWINGS);
				$("#bondsPayable_old").val(balanceSheet2002.BONDS_PAYABLE);
				$("#longTermPayables_old").val(balanceSheet2002.LONG_TERM_PAYABLES);
				$("#grantsPayable_old").val(balanceSheet2002.GRANTS_PAYABLE);
				$("#otherLongTermLiabilities_old").val(balanceSheet2002.OTHER_LONG_TERM_LIABILITIES);
				$("#specialReserveFund_old").val(balanceSheet2002.SPECIAL_RESERVE_FUND);
				$("#deferredTaxationCredit_old").val(balanceSheet2002.DEFERRED_TAXATION_CREDIT);
				$("#totalliabilities_old").val(balanceSheet2002.TOTALLIABILITIES);
				$("#minorityInterest_old").val(balanceSheet2002.MINORITY_INTEREST);
				$("#paidinCapital_old").val(balanceSheet2002.PAIDIN_CAPITAL);
				$("#nationalCapital_old").val(balanceSheet2002.NATIONAL_CAPITAL);
				$("#collectiveCapital_old").val(balanceSheet2002.COLLECTIVE_CAPITAL);
				$("#legalPersonsCapital_old").val(balanceSheet2002.LEGAL_PERSONS_CAPITAL);
				$("#stateOwnedLegalPersonsCapi_old").val(balanceSheet2002.STATE_OWNED_LEGAL_PERSONS_CAPI);
				$("#collectiveLegalPersonsCapit_old").val(balanceSheet2002.COLLECTIVE_LEGAL_PERSONS_CAPIT);
				$("#personalCapital_old").val(balanceSheet2002.PERSONAL_CAPITAL);
				$("#foreignBusinessmensCapital_old").val(balanceSheet2002.FOREIGN_BUSINESSMENS_CAPITAL);
				$("#capitalrRserve_old").val(balanceSheet2002.CAPITALR_RSERVE);
				$("#surplusReserve_old").val(balanceSheet2002.SURPLUS_RESERVE);
				$("#statutorySurplusReserve_old").val(balanceSheet2002.STATUTORY_SURPLUS_RESERVE);
				$("#publicWelfareFund_old").val(balanceSheet2002.PUBLIC_WELFARE_FUND);
				$("#supplermentaryCurrentCapital_old").val(balanceSheet2002.SUPPLERMENTARY_CURRENT_CAPITAL);
				$("#unaffirmedinvestmentLoss_old").val(balanceSheet2002.UNAFFIRMEDINVESTMENT_LOSS);
				$("#unappropriatedProfit_old").val(balanceSheet2002.UNAPPROPRIATED_PROFIT);
				$("#differenceOnTranslationOfF_old").val(balanceSheet2002.DIFFERENCE_ON_TRANSLATION_OF_F);
				$("#oldSaveBtn").show().data("id",balanceSheet2002.EHB_BALANCE_SHEET2002_SGMT_ID).data("type","edit");
				$("#oldDelBtn").show().data("id",balanceSheet2002.EHB_BALANCE_SHEET2002_SGMT_ID);
				$("#oldSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				$("#newBox").hide(); //新老版本二择一逻辑
                verify.dataValidation('old','E_BALANCE_SHEET02',balanceSheet2002.EHB_BALANCE_SHEET2002_SGMT_ID,'form',false,false); //数据校验

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
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'entBalanceInfo/saveBalanceSheet2002Sgmt.do', 
					data     : {str : JSON.stringify(data.field), 
					            ehaBalanceSheetBsSgmtId : dataObj.ehaBalanceSheetBsSgmtId,
								ehbBalanceSheet2002SgmtId :$this.data("id"),
					            pageType : $this.data("type")},
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
			                verify.dataValidation('old','E_BALANCE_SHEET02',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','E_BALANCE_SHEET_BS',dataObj.ehaBalanceSheetBsSgmtId,'form',true,false); //数据校验
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
                    para.ehaBalanceSheetBsSgmtId = dataObj.ehaBalanceSheetBsSgmtId;
                    para.ehbBalanceSheet2002SgmtId = $this.data("id");
					$.ajax({ 
						url      : 'entBalanceInfo/delBalanceSheet2002Sgmt.do', 
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
            /*************************************2002版资产负债表段结束************************************/

            /*************************************2007版资产负债表段开始************************************/
            //判断是新增还是编辑
            if (dataObj && balanceSheet2007){
				$("#totalCurrentAssets_new").val(balanceSheet2007.TOTAL_CURRENT_ASSETS);
				$("#totalNonCurrentAssets_new").val(balanceSheet2007.TOTAL_NON_CURRENT_ASSETS);
				$("#totalAssets_new").val(balanceSheet2007.TOTAL_ASSETS);
				$("#totalCurrentLiabilities_new").val(balanceSheet2007.TOTAL_CURRENT_LIABILITIES);
				$("#totalNonCurrentLiabilities_new").val(balanceSheet2007.TOTAL_NON_CURRENT_LIABILITIES);
				$("#totalLiabilities_new").val(balanceSheet2007.TOTAL_LIABILITIES);
				$("#totalEquity_new").val(balanceSheet2007.TOTAL_EQUITY);
				$("#totalEquityAndLiabilities_new").val(balanceSheet2007.TOTAL_EQUITY_AND_LIABILITIES);
				$("#currencyFunds_new").val(balanceSheet2007.CURRENCY_FUNDS);
				$("#financialAssetsHeldForTrad_new").val(balanceSheet2007.FINANCIAL_ASSETS_HELD_FOR_TRAD);
				$("#notesReceivable_new").val(balanceSheet2007.NOTES_RECEIVABLE);
				$("#accountsReceivable_new").val(balanceSheet2007.ACCOUNTS_RECEIVABLE);
				$("#prepayments_new").val(balanceSheet2007.PREPAYMENTS);
				$("#interestReceivable_new").val(balanceSheet2007.INTEREST_RECEIVABLE);
				$("#dividendsReceivable_new").val(balanceSheet2007.DIVIDENDS_RECEIVABLE);
				$("#otherReceivables_new").val(balanceSheet2007.OTHER_RECEIVABLES);
				$("#inventories_new").val(balanceSheet2007.INVENTORIES);
				$("#currentPortionOfNonCurrent_new").val(balanceSheet2007.CURRENT_PORTION_OF_NON_CURRENT);
				$("#otherCurrentAssets_new").val(balanceSheet2007.OTHER_CURRENT_ASSETS);
				$("#financialAssetsAvailableFor_new").val(balanceSheet2007.FINANCIAL_ASSETS_AVAILABLE_FOR);
				$("#heldToMaturityInvestments_new").val(balanceSheet2007.HELD_TO_MATURITY_INVESTMENTS);
				$("#longTermEquityInvestment_new").val(balanceSheet2007.LONG_TERM_EQUITY_INVESTMENT);
				$("#longTermReceivables_new").val(balanceSheet2007.LONG_TERM_RECEIVABLES);
				$("#investmentProperties_new").val(balanceSheet2007.INVESTMENT_PROPERTIES);
				$("#fixedAssets_new").val(balanceSheet2007.FIXED_ASSETS);
				$("#constructionInProgress_new").val(balanceSheet2007.CONSTRUCTION_IN_PROGRESS);
				$("#constructionMaterials_new").val(balanceSheet2007.CONSTRUCTION_MATERIALS);
				$("#fixedAssetsPendingForDispo_new").val(balanceSheet2007.FIXED_ASSETS_PENDING_FOR_DISPO);
				$("#nonCurrentBiologicalAssets_new").val(balanceSheet2007.NON_CURRENT_BIOLOGICAL_ASSETS);
				$("#oilAndGasAssets_new").val(balanceSheet2007.OIL_AND_GAS_ASSETS);
				$("#intangibleAssets_new").val(balanceSheet2007.INTANGIBLE_ASSETS);
				$("#developmentDisbursements_new").val(balanceSheet2007.DEVELOPMENT_DISBURSEMENTS);
				$("#goodWill_new").val(balanceSheet2007.GOOD_WILL);
				$("#longTermDeferredExpenses_new").val(balanceSheet2007.LONG_TERM_DEFERRED_EXPENSES);
				$("#deferredTaxAssets_new").val(balanceSheet2007.DEFERRED_TAX_ASSETS);
				$("#otherNonCurrentAssets_new").val(balanceSheet2007.OTHER_NON_CURRENT_ASSETS);
				$("#shortTermBorrowings_new").val(balanceSheet2007.SHORT_TERM_BORROWINGS);
				$("#financialLiabilitiesHeldFor_new").val(balanceSheet2007.FINANCIAL_LIABILITIES_HELD_FOR);
				$("#notesPayable_new").val(balanceSheet2007.NOTES_PAYABLE);
				$("#accountsPayable_new").val(balanceSheet2007.ACCOUNTS_PAYABLE);
				$("#receiptsinAdvance_new").val(balanceSheet2007.RECEIPTSIN_ADVANCE);
				$("#interestPayable_new").val(balanceSheet2007.INTEREST_PAYABLE);
				$("#employeeBenefitsPayable_new").val(balanceSheet2007.EMPLOYEE_BENEFITS_PAYABLE);
				$("#taxsPayable_new").val(balanceSheet2007.TAXS_PAYABLE);
				$("#dividendsPayable_new").val(balanceSheet2007.DIVIDENDS_PAYABLE);
				$("#otherPayables_new").val(balanceSheet2007.OTHER_PAYABLES);
				$("#currentPortionOfLongTermL_new").val(balanceSheet2007.CURRENT_PORTION_OF_LONG_TERM_L);
				$("#otherCurrentLiabilities_new").val(balanceSheet2007.OTHER_CURRENT_LIABILITIES);
				$("#longTermBorrowings_new").val(balanceSheet2007.LONG_TERM_BORROWINGS);
				$("#bondsPayables_new").val(balanceSheet2007.BONDS_PAYABLES);
				$("#longTermPayables_new").val(balanceSheet2007.LONG_TERM_PAYABLES);
				$("#grantsPayable_new").val(balanceSheet2007.GRANTS_PAYABLE);
				$("#provisions_new").val(balanceSheet2007.PROVISIONS);
				$("#deferredTaxLiabilities_new").val(balanceSheet2007.DEFERRED_TAX_LIABILITIES);
				$("#otherNonCurrentLiabilities_new").val(balanceSheet2007.OTHER_NON_CURRENT_LIABILITIES);
				$("#paidinCapitalOrShareCapita_new").val(balanceSheet2007.PAIDIN_CAPITAL_OR_SHARE_CAPITA);
				$("#capitalrRserve_new").val(balanceSheet2007.CAPITALR_RSERVE);
				$("#lessTreasuryStocks_new").val(balanceSheet2007.LESS_TREASURY_STOCKS);
				$("#surplusReserve_new").val(balanceSheet2007.SURPLUS_RESERVE);
				$("#unappropriatedProfit_new").val(balanceSheet2007.UNAPPROPRIATED_PROFIT);
				$("#newSaveBtn").show().data("id",balanceSheet2007.EHC_BALANCE_SHEET2007_SGMT_ID).data("type","edit");
				$("#newDelBtn").show().data("id",balanceSheet2007.EHC_BALANCE_SHEET2007_SGMT_ID);
				$("#newSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				$("#oldBox").hide(); //新老版本二择一逻辑
                verify.dataValidation('new','E_BALANCE_SHEET07',balanceSheet2007.EHC_BALANCE_SHEET2007_SGMT_ID,'form',false,false); //数据校验

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
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'entBalanceInfo/saveBalanceSheet2007Sgmt.do', 
					data     : {str:JSON.stringify(data.field), 
					            ehaBalanceSheetBsSgmtId : dataObj.ehaBalanceSheetBsSgmtId,
								ehbBalanceSheet2007SgmtId :$this.data("id"),
					            pageType : $this.data("type")},
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
			                verify.dataValidation('new','E_BALANCE_SHEET07',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','E_BALANCE_SHEET_BS',dataObj.ehaBalanceSheetBsSgmtId,'form',true,false); //数据校验
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
                    para.ehaBalanceSheetBsSgmtId = dataObj.ehaBalanceSheetBsSgmtId;
                    para.ehcBalanceSheet2007SgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'entBalanceInfo/delBalanceSheet2007Sgmt.do',
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
            /**********************************2007版资产负债表段结束**************************************/

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
                        url: config.api_host + "ehaBalanceSheetBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                        url: config.api_host + "ehaBalanceSheetBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                content: 'enterpriseAssetsInfoEntireDelEdit.html?type=special'
            });
        });

        /**
         * 页面初始化
         */

    });
});
