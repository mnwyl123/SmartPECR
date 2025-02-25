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
		
		var acctBsSgmt, acctInfSgmt;
		if(pageType === 'edit'){
			//基础段
			acctBsSgmt = JSON.parse(document.getElementById("acctBsSgmt").value);
			//基本信息段
			acctInfSgmt = JSON.parse(document.getElementById("acctInfSgmt").value);
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
			var array = ['ENT_CERT_TYPE','SHEET_TYPE', 'ENT_BALANCE_SHEET_TYPE_DIVIDE','ENT_BALANCE_INF_REC_TYPE'];
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
						} else if(data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_BALANCE_SHEET_TYPE_DIVIDE},
								containerId : "sheetTypeDivide"
							});
							continue;
						} else if(data.result[i].ENT_BALANCE_INF_REC_TYPE){
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
            if (dataObj && acctBsSgmt){
                $("#baseSaveBtn").show().data("id",dataObj.elaIncomeAndExpenseStatId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.elaIncomeAndExpenseStatId);
               /* $("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.elaIncomeAndExpenseStatId);*/
                $("#entName").val(acctBsSgmt.ENT_NAME);
                $("#entCertType").val(acctBsSgmt.ENT_CERT_TYPE);
                $("#entCertNum").val(acctBsSgmt.ENT_CERT_NUM);
                $("#sheetYear").val(acctBsSgmt.SHEET_YEAR);
                $("#sheetType").val(acctBsSgmt.SHEET_TYPE);
                $("#sheetTypeDivide").val(acctBsSgmt.SHEET_TYPE_DIVIDE);
                $("#auditFirmName").val(acctBsSgmt.AUDIT_FIRM_NAME);
                $("#auditorName").val(acctBsSgmt.AUDITOR_NAME);
                $("#auditTime").val(acctBsSgmt.AUDIT_TIME);
                $("#orgCode").val(acctBsSgmt.ORG_CODE);
                $("#cimoc").val(acctBsSgmt.CIMOC);
                $("#rptDateCode").val(acctBsSgmt.RPT_DATE_CODE);
                $("#isFilter").val(acctBsSgmt.IS_FILTER);
                $("#rptDate").val(acctBsSgmt.RPT_DATE);
                form.render('select');
                verify.dataValidation('base','E_INCOME_EXPENSE_BS',dataObj.elaIncomeAndExpenseStatId,'form',false,false); //数据校验
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
				para.elaIncomeAndExpenseStatId = $this.data("id");
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
				para.cimoc = $("#cimoc").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.isFilter = $("#isFilter").val();
				para.rptDate = $("#rptDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'ecdtreportinstie/saveAcctBsSgmt.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#baseDelBtn").show();
							/*	$("#delAllModelBtn,#pushAllModelBtn").show();*/
							}
							$this.data("type","edit");
							baseExistFlag = 'Y';
							dataObj = para; //存储新数据
							verify.dataValidation('base','E_INCOME_EXPENSE_BS',para.elaIncomeAndExpenseStatId,'form',true,false); //数据校验
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
                    para.elaIncomeAndExpenseStatId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'ecdtreportinstie/delAcctBsSgmt.do', 
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
            if (dataObj && acctInfSgmt){
            	$("#currentFinancialSubsidyCarr").val(acctInfSgmt.CURRENT_FINANCIAL_SUBSIDY_CARR);
                $("#currentUndertakingsCarriedO").val(acctInfSgmt.CURRENT_UNDERTAKINGS_CARRIED_O);
                $("#currentOperatingBalance").val(acctInfSgmt.CURRENT_OPERATING_BALANCE);
                $("#operatingBalanceMadeUpFor").val(acctInfSgmt.OPERATING_BALANCE_MADE_UP_FOR_);
                $("#nonFinancialSubsidyCarried").val(acctInfSgmt.NON_FINANCIAL_SUBSIDY_CARRIED_);
                $("#nonFinancialAidBalanceThis").val(acctInfSgmt.NON_FINANCIAL_AID_BALANCE_THIS);
                $("#publicFundTurnedInto").val(acctInfSgmt.PUBLIC_FUND_TURNED_INTO);
                $("#financialSubsidyRevenue").val(acctInfSgmt.FINANCIAL_SUBSIDY_REVENUE);
                $("#undertakingsExpenditureFinan").val(acctInfSgmt.UNDERTAKINGS_EXPENDITURE_FINAN);
                $("#undertakingsClassRevenue").val(acctInfSgmt.UNDERTAKINGS_CLASS_REVENUE);
                $("#undertakingsRevenue").val(acctInfSgmt.UNDERTAKINGS_REVENUE);
                $("#superiorSubsidyRevenue").val(acctInfSgmt.SUPERIOR_SUBSIDY_REVENUE);
                $("#revenueTurnedOverBySubsidi").val(acctInfSgmt.REVENUE_TURNED_OVER_BY_SUBSIDI);
                $("#otherRevenue").val(acctInfSgmt.OTHER_REVENUE);
                $("#donationIncome").val(acctInfSgmt.DONATION_INCOME);
                $("#undertakingsClassExpenditure").val(acctInfSgmt.UNDERTAKINGS_CLASS_EXPENDITURE);
                $("#undertakingsExpenditureNonF").val(acctInfSgmt.UNDERTAKINGS_EXPENDITURE_NON_F);
                $("#paymentToTheHigherAuthorit").val(acctInfSgmt.PAYMENT_TO_THE_HIGHER_AUTHORIT);
                $("#grantToTheAuxiliaryOrganiz").val(acctInfSgmt.GRANT_TO_THE_AUXILIARY_ORGANIZ);
                $("#otherExpenditure").val(acctInfSgmt.OTHER_EXPENDITURE);
                $("#operatingRevenue").val(acctInfSgmt.OPERATING_REVENUE);
                $("#operatingExpenditure").val(acctInfSgmt.OPERATING_EXPENDITURE);
                $("#nonFinancialAidCarriedOver").val(acctInfSgmt.NON_FINANCIAL_AID_CARRIED_OVER);
                $("#enterpriseincomeTaxPayable").val(acctInfSgmt.ENTERPRISEINCOME_TAX_PAYABLE);
                $("#specialFundsToExtract").val(acctInfSgmt.SPECIAL_FUNDS_TO_EXTRACT);
				
				$("#basicSaveBtn").show().data("id",acctInfSgmt.ELB_INCOME_AND_EXPENSE_STAT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",acctInfSgmt.ELB_INCOME_AND_EXPENSE_STAT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('basic','E_INCOME_EXPENSE',acctInfSgmt.ELB_INCOME_AND_EXPENSE_STAT_ID,'form',false,false); //数据校验
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
				para.elaIncomeAndExpenseStatId = dataObj.elaIncomeAndExpenseStatId;
				para.elbIncomeAndExpenseStatId = $this.data("id");
				para.currentFinancialSubsidyCarr = $("#currentFinancialSubsidyCarr").val();
                para.currentUndertakingsCarriedO = $("#currentUndertakingsCarriedO").val();
                para.currentOperatingBalance = $("#currentOperatingBalance").val();
                para.operatingBalanceMadeUpFor = $("#operatingBalanceMadeUpFor").val();
                para.nonFinancialSubsidyCarried = $("#nonFinancialSubsidyCarried").val();
                para.nonFinancialAidBalanceThis = $("#nonFinancialAidBalanceThis").val();
                para.publicFundTurnedInto = $("#publicFundTurnedInto").val();
                para.financialSubsidyRevenue = $("#financialSubsidyRevenue").val();
                para.undertakingsExpenditureFinan = $("#undertakingsExpenditureFinan").val();
                para.undertakingsClassRevenue = $("#undertakingsClassRevenue").val();
                para.undertakingsRevenue = $("#undertakingsRevenue").val();
                para.superiorSubsidyRevenue = $("#superiorSubsidyRevenue").val();
                para.revenueTurnedOverBySubsidi = $("#revenueTurnedOverBySubsidi").val();
                para.otherRevenue = $("#otherRevenue").val();
                para.donationIncome = $("#donationIncome").val();
                para.undertakingsClassExpenditure = $("#undertakingsClassExpenditure").val();
                para.undertakingsExpenditureNonF = $("#undertakingsExpenditureNonF").val();
                para.paymentToTheHigherAuthorit = $("#paymentToTheHigherAuthorit").val();
                para.grantToTheAuxiliaryOrganiz = $("#grantToTheAuxiliaryOrganiz").val();
                para.otherExpenditure = $("#otherExpenditure").val();
                para.operatingRevenue = $("#operatingRevenue").val();
                para.operatingExpenditure = $("#operatingExpenditure").val();
                para.nonFinancialAidCarriedOver = $("#nonFinancialAidCarriedOver").val();
                para.enterpriseincomeTaxPayable = $("#enterpriseincomeTaxPayable").val();
                para.specialFundsToExtract = $("#specialFundsToExtract").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'ecdtreportinstie/saveAcctInfoSgmt.do', 
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
							verify.dataValidation('basic','E_INCOME_EXPENSE',para.elbIncomeAndExpenseStatId,'form',true,false); //数据校验
							verify.dataValidation('base','E_INCOME_EXPENSE_BS',dataObj.elaIncomeAndExpenseStatId,'form',true,false); //数据校验
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
                    para.elaIncomeAndExpenseStatId = dataObj.elaIncomeAndExpenseStatId;
                    para.elbIncomeAndExpenseStatId = $this.data("id");
					$.ajax({ 
						url      : 'ecdtreportinstie/acctBsInfSgmtDel.do', 
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
								document.getElementById("incomeex").reset();
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


            //判断是否是详情页面，如果是则禁用页面中的按钮和表单控件
            if (base.getrequest('addOrUpdate') === 'detail'){
                $(".layui-btn").not("#cancelAllModelBtn").hide().css("visibility","hidden").addClass("hide");
                $(".layui-input").prop("disabled",true);
                $("select").not("#pushPullSelect").prop("disabled",true);
                form.render();
                if (dataObj.businessStates === 'RKCG'){ //入库成功状态
                   /* $("#entireDelAllModelBtn").show().css("visibility","visible").removeClass("hide");*/
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
