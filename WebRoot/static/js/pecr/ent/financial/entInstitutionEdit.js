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
		
		var institutionInfo, institutionSheet;
		if(pageType === 'edit'){
			//基础段
			institutionInfo = JSON.parse(document.getElementById("institutionInfo").value);
			//2002 企业利润及利润分配表
			institutionSheet = JSON.parse(document.getElementById("institutionSheet").value);
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
			var array = ['ENT_CERT_TYPE',
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
            //判断是新增还是编辑eka_institution_balance_sht_id
            if (dataObj && institutionInfo){
				$("#baseSaveBtn").show().data("id",dataObj.ekaInstitutionBalanceShtId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.ekaInstitutionBalanceShtId);
                /*$("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.ekaInstitutionBalanceShtId);*/
                $("#infRecType").val(institutionInfo.INF_REC_TYPE);
                $("#entName").val(institutionInfo.ENT_NAME);
                $("#entCertType").val(institutionInfo.ENT_CERT_TYPE);
                $("#entCertNum").val(institutionInfo.ENT_CERT_NUM);
                $("#sheetYear").val(institutionInfo.SHEET_YEAR);
                $("#sheetType").val(institutionInfo.SHEET_TYPE);
                $("#sheetTypeDivide").val(institutionInfo.SHEET_TYPE_DIVIDE);
                $("#auditFirmName").val(institutionInfo.AUDIT_FIRM_NAME);
                $("#auditorName").val(institutionInfo.AUDITOR_NAME);
                $("#auditTime").val(institutionInfo.AUDIT_TIME);
                $("#orgCode").val(institutionInfo.ORG_CODE);
                $("#cimoc").val(institutionInfo.CIMOC);
                $("#rptDateCode").val(institutionInfo.RPT_DATE_CODE);
                $("#isFilter").val(institutionInfo.IS_FILTER);
                $("#rptDate").val(institutionInfo.RPT_DATE);
                form.render('select');
                verify.dataValidation('base','E_INSTITU_BALANCE_BS',dataObj.ekaInstitutionBalanceShtId,'form',false,false); //数据校验

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
				para.ekaInstitutionBalanceShtId = $this.data("id");
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
					url      : 'entInstitutionInfo/saveInstitution.do', 
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
								table.reload('entInstitutionTab',{});
							}
							$this.data("type","edit");
							baseExistFlag = 'Y';
							dataObj = para; //存储新数据
			                verify.dataValidation('base','E_INSTITU_BALANCE_BS',dataObj.ekaInstitutionBalanceShtId,'form',true,false); //数据校验

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
                    para.ekaInstitutionBalanceShtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'entInstitutionInfo/delInstitutionBs.do', 
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
								table.reload('entInstitutionTab',{});
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

            /*********************************事业单位资产负债表段开始*********************************/
            //判断是新增还是编辑
            if (dataObj && institutionSheet){
				$("#totalCurrentAssets").val(institutionSheet.TOTAL_CURRENT_ASSETS);
				$("#totalNonCurrentAssets").val(institutionSheet.TOTAL_NON_CURRENT_ASSETS);
				$("#totalAssets").val(institutionSheet.TOTAL_ASSETS);
				$("#totalCurrentLiabilities").val(institutionSheet.TOTAL_CURRENT_LIABILITIES);
				$("#totalNonCurrentLiabilities").val(institutionSheet.TOTAL_NON_CURRENT_LIABILITIES);
				$("#totalLiabilities").val(institutionSheet.TOTAL_LIABILITIES);
				$("#totalNetAssets").val(institutionSheet.TOTAL_NET_ASSETS);
				$("#totalLiabilitiesAndNetAsse").val(institutionSheet.TOTAL_LIABILITIES_AND_NET_ASSE);
				$("#currencyFunds").val(institutionSheet.CURRENCY_FUNDS);
				$("#shortTermInvestments").val(institutionSheet.SHORT_TERM_INVESTMENTS);
				$("#amountOfFinancialReturn").val(institutionSheet.AMOUNT_OF_FINANCIAL_RETURN);
				$("#notesReceivable").val(institutionSheet.NOTES_RECEIVABLE);
				$("#accountsReceivable").val(institutionSheet.ACCOUNTS_RECEIVABLE);
				$("#prepayments").val(institutionSheet.PREPAYMENTS);
				$("#otherReceivables").val(institutionSheet.OTHER_RECEIVABLES);
				$("#inventories").val(institutionSheet.INVENTORIES);
				$("#otherCurrentAssets").val(institutionSheet.OTHER_CURRENT_ASSETS);
				$("#longTermInvestment").val(institutionSheet.LONG_TERM_INVESTMENT);
				$("#fixedAssets").val(institutionSheet.FIXED_ASSETS);
				$("#originalCostOfFixedAsset").val(institutionSheet.ORIGINAL_COST_OF_FIXED_ASSET);
				$("#fixedAssetAccumulatedDeprec").val(institutionSheet.FIXED_ASSET_ACCUMULATED_DEPREC);
				$("#constructionInProcess").val(institutionSheet.CONSTRUCTION_IN_PROCESS);
				$("#intangibleAssets").val(institutionSheet.INTANGIBLE_ASSETS);
				$("#originalPriceOfIntangibleA").val(institutionSheet.ORIGINAL_PRICE_OF_INTANGIBLE_A);
				$("#accumulatedAmortization").val(institutionSheet.ACCUMULATED_AMORTIZATION);
				$("#assetsToBeProcessedPending").val(institutionSheet.ASSETS_TO_BE_PROCESSED_PENDING);
				$("#shortTermBorrowings").val(institutionSheet.SHORT_TERM_BORROWINGS);
				$("#taxPayable").val(institutionSheet.TAX_PAYABLE);
				$("#treasuryPayable").val(institutionSheet.TREASURY_PAYABLE);
				$("#payableFinancialSpecialAcco").val(institutionSheet.PAYABLE_FINANCIAL_SPECIAL_ACCO);
				$("#employeeBenefitsPayable").val(institutionSheet.EMPLOYEE_BENEFITS_PAYABLE);
				$("#notesPayable").val(institutionSheet.NOTES_PAYABLE);
				$("#accountsPayable").val(institutionSheet.ACCOUNTS_PAYABLE);
				$("#receiptsInAdvance").val(institutionSheet.RECEIPTS_IN_ADVANCE);
				$("#otherPayables").val(institutionSheet.OTHER_PAYABLES);
				$("#otherCurrentLiabilities").val(institutionSheet.OTHER_CURRENT_LIABILITIES);
				$("#longTermBorrowings").val(institutionSheet.LONG_TERM_BORROWINGS);
				$("#longTermPayables").val(institutionSheet.LONG_TERM_PAYABLES);
				$("#enterpriseFund").val(institutionSheet.ENTERPRISE_FUND);
				$("#nonCurrentAssetsFund").val(institutionSheet.NON_CURRENT_ASSETS_FUND);
				$("#specialPurposeFunds").val(institutionSheet.SPECIAL_PURPOSE_FUNDS);
				$("#financialAidCarriedOver").val(institutionSheet.FINANCIAL_AID_CARRIED_OVER);
				$("#financialAidBalance").val(institutionSheet.FINANCIAL_AID_BALANCE);
				$("#nonFinancialAidCarriedOver").val(institutionSheet.NON_FINANCIAL_AID_CARRIED_OVER);
				$("#nonFinancialAidBalance").val(institutionSheet.NON_FINANCIAL_AID_BALANCE);
				$("#undertakingsBalance").val(institutionSheet.UNDERTAKINGS_BALANCE);
				$("#operatingBalance").val(institutionSheet.OPERATING_BALANCE);
				$("#mainSaveBtn").show().data("id",institutionSheet.EKB_INSTITUTION_BALANCE_SHT_ID).data("type","edit");
				$("#mainDelBtn").show().data("id",institutionSheet.EKB_INSTITUTION_BALANCE_SHT_ID);
				$("#mainSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
                verify.dataValidation('main','E_INSTITU_BALANCE',institutionSheet.EKB_INSTITUTION_BALANCE_SHT_ID,'form',false,false); //数据校验

            }else{
                $("#mainAddBtn").show();
            }
			
			//点击新增按钮
			$("#mainAddBtn").on("click",function () {
				if (dataObj || baseExistFlag === 'Y'){
					var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#mainSaveBtn").show().data("id",data.result).data("type","add");
								$("#mainDelBtn").data("id",data.result);
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
            form.on('submit(mainSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.ekaInstitutionBalanceShtId = dataObj.ekaInstitutionBalanceShtId;
				para.ekbInstitutionBalanceShtId = $this.data("id");
				para.totalCurrentAssets = $("#totalCurrentAssets").val();
				para.totalNonCurrentAssets = $("#totalNonCurrentAssets").val();
				para.totalAssets = $("#totalAssets").val();
				para.totalCurrentLiabilities = $("#totalCurrentLiabilities").val();
				para.totalNonCurrentLiabilities = $("#totalNonCurrentLiabilities").val();
				para.totalLiabilities = $("#totalLiabilities").val();
				para.totalNetAssets = $("#totalNetAssets").val();
				para.totalLiabilitiesAndNetAsse = $("#totalLiabilitiesAndNetAsse").val();
				para.currencyFunds = $("#currencyFunds").val();
				para.shortTermInvestments = $("#shortTermInvestments").val();
				para.amountOfFinancialReturn = $("#amountOfFinancialReturn").val();
				para.notesReceivable = $("#notesReceivable").val();
				para.accountsReceivable = $("#accountsReceivable").val();
				para.prepayments = $("#prepayments").val();
				para.otherReceivables = $("#otherReceivables").val();
				para.inventories = $("#inventories").val();
				para.otherCurrentAssets = $("#otherCurrentAssets").val();
				para.longTermInvestment = $("#longTermInvestment").val();
				para.fixedAssets = $("#fixedAssets").val();
				para.originalCostOfFixedAsset = $("#originalCostOfFixedAsset").val();
				para.fixedAssetAccumulatedDeprec = $("#fixedAssetAccumulatedDeprec").val();
				para.constructionInProcess = $("#constructionInProcess").val();
				para.intangibleAssets = $("#intangibleAssets").val();
				para.originalPriceOfIntangibleA = $("#originalPriceOfIntangibleA").val();
				para.accumulatedAmortization = $("#accumulatedAmortization").val();
				para.assetsToBeProcessedPending = $("#assetsToBeProcessedPending").val();
				para.shortTermBorrowings = $("#shortTermBorrowings").val();
				para.taxPayable = $("#taxPayable").val();
				para.treasuryPayable = $("#treasuryPayable").val();
				para.payableFinancialSpecialAcco = $("#payableFinancialSpecialAcco").val();
				para.employeeBenefitsPayable = $("#employeeBenefitsPayable").val();
				para.notesPayable = $("#notesPayable").val();
				para.accountsPayable = $("#accountsPayable").val();
				para.receiptsInAdvance = $("#receiptsInAdvance").val();
				para.otherPayables = $("#otherPayables").val();
				para.otherCurrentLiabilities = $("#otherCurrentLiabilities").val();
				para.longTermBorrowings = $("#longTermBorrowings").val();
				para.longTermPayables = $("#longTermPayables").val();
				para.enterpriseFund = $("#enterpriseFund").val();
				para.nonCurrentAssetsFund = $("#nonCurrentAssetsFund").val();
				para.specialPurposeFunds = $("#specialPurposeFunds").val();
				para.financialAidCarriedOver = $("#financialAidCarriedOver").val();
				para.financialAidBalance = $("#financialAidBalance").val();
				para.nonFinancialAidCarriedOver = $("#nonFinancialAidCarriedOver").val();
				para.nonFinancialAidBalance = $("#nonFinancialAidBalance").val();
				para.undertakingsBalance = $("#undertakingsBalance").val();
				para.operatingBalance = $("#operatingBalance").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'entInstitutionInfo/saveInsBalance.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#mainDelBtn").show();
							}
							$this.data("type","edit");
			                verify.dataValidation('main','E_INSTITU_BALANCE',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','E_INSTITU_BALANCE_BS',dataObj.ekaInstitutionBalanceShtId,'form',true,false); //数据校验
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
            $("#mainDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.ekaInstitutionBalanceShtId = dataObj.ekaInstitutionBalanceShtId;
                    para.ekbInstitutionBalanceShtId = $this.data("id");
					$.ajax({ 
						url      : 'entInstitutionInfo/delInsBalance.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#mainAddBtn").show();
								$("#mainSaveBtn").hide();
								$this.hide();
								$this.parent().children('div.layui-colla-content').removeClass('layui-show');
								document.getElementById("institutionBalanceSheet").reset();
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
                        url: config.api_host + "ekaInstitutionBalanceSheet/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                        url: config.api_host + "ekaInstitutionBalanceSheet/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                content: 'enterpriseDebtInfoEntireDelEdit.html?type=special'
            });
        });

        /**
         * 页面初始化
         */

    });
});
