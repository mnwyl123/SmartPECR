/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laytpl'], function(){
    var element = layui.element, //获取element模块
		form = layui.form, //获取form模块
		layer = layui.layer, //获取layer模块
		laydate = layui.laydate, //获取laydate模块
		table = layui.table //获取table模块
		laytpl = layui.laytpl;  //获取laytpl模块  模板引擎

	require(['static/js/pecr/module/base','static/js/pecr/module/config'],function (base,config){
		/**
		 * element组件渲染
		 * form组件渲染
		 */
		element.init();//每个页面都有
		form.render();//每个页面都有
		
		var loadFlag = 'N';
		
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
		var dataObj = window.parent.parent.$("body").data("dataObj"); //获取单条数据信息，判断是新增还是修改
		var pageType = dataObj ? "edit" : "add"; //根据页面初始数据判断该页面是新增还是修改
		var addOrUpdate = parent.document.getElementById("addOrUpdate").value;
		
		var toolCol ;
		if(addOrUpdate === 'detail'){
			toolCol = "#dataTabToolBarTplDetail";
		}else{
			toolCol = "#dataTabToolBarTpl";
		}
		
		var acctBsSgmt, acctBsInfSgmt, acctCredSgmt, creditorInfSgmt, lbltyInfSgmt;
		if(pageType === 'edit'){
			//基础段
			acctBsSgmt = JSON.parse(parent.document.getElementById("acctBsSgmt").value);
			//基本信息段
			acctBsInfSgmt = JSON.parse(parent.document.getElementById("acctBsInfSgmt").value);
			//授信额度信息段
			acctCredSgmt = JSON.parse(parent.document.getElementById("acctCredSgmt").value);
			//初始债权说明段
			creditorInfSgmt = JSON.parse(parent.document.getElementById("creditorInfSgmt").value);
			//还款表现信息段
			lbltyInfSgmt = JSON.parse(parent.document.getElementById("lbltyInfSgmt").value);
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
			var array = ['ENT_LOAN_RPT_DATE_CODE',
						 'ENT_CERT_MAIN_TYPE',
						 'ENT_LOAN_BUSI_LINES',
						 'CURRENCY',
						 'ENT_LOAN_REPAY_MODE_R1',
						 'ENT_LOAN_REPAY_FREQCY',
						 'A_DIVISION',
						 'ENT_LOAN_GUAR_MODE',
						 'ENT_LOAN_OTH_REPY_GUAR_WAY',
						 'ENT_LOA_FRM',
						 'TRADE_CLASSIFY',
						 'ENT_LOAN_FUND_SOU',
						 'ASSET_TRAND_FLAG',
						 'ENT_LOAN_ACCT_STATUS',
						 'FIVE_CATE',
						 'ENT_LOAN_RPMT_TYPE',
						 'CERT_TYPE',
						 'ENT_LOAN_ARLP_TYPE',
						 'ENT_LOAN_CHAN_TRAN_TYPE'];
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
						if (data.result[i].ENT_LOAN_RPT_DATE_CODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_RPT_DATE_CODE},
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
						} else if(data.result[i].ENT_LOAN_BUSI_LINES){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_BUSI_LINES},
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
						} else if  (data.result[i].ENT_LOAN_REPAY_MODE_R1){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_REPAY_MODE_R1},
								containerId : "repayMode"
							});
							continue;
						} else if (data.result[i].ENT_LOAN_REPAY_FREQCY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_REPAY_FREQCY},
								containerId : "repayFreqcy"
							});
							continue;
						} else if  (data.result[i].A_DIVISION){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].A_DIVISION},
								containerId : "applyBusiDist"
							});
							continue;
						} else if  (data.result[i].ENT_LOAN_GUAR_MODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_GUAR_MODE},
								containerId : "guarMode"
							});
							continue;
						} else if  (data.result[i].ENT_LOAN_OTH_REPY_GUAR_WAY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_OTH_REPY_GUAR_WAY},
								containerId : "othRepyGuarWay"
							});
							continue;
						} else if  (data.result[i].ENT_LOA_FRM){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOA_FRM},
								containerId : "loaFrm"
							});
							continue;
						} else if  (data.result[i].TRADE_CLASSIFY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].TRADE_CLASSIFY},
								containerId : "actInvest"
							});
							continue;
						} else if  (data.result[i].ENT_LOAN_FUND_SOU){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_FUND_SOU},
								containerId : "fundSou"
							});
							continue;
						} else if (data.result[i].ASSET_TRAND_FLAG){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ASSET_TRAND_FLAG},
								containerId : "assetTrandFlag"
							});
							continue;
						} else if (data.result[i].ENT_LOAN_ACCT_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_ACCT_STATUS},
								containerId : "acctStatus"
							});
							continue;
						} else if (data.result[i].FIVE_CATE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].FIVE_CATE},
								containerId : "fiveCate"
							});
							continue;
						} else if  (data.result[i].ENT_LOAN_RPMT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_RPMT_TYPE},
								containerId : "rpmtType"
							});
							continue;
						} else if (data.result[i].CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "arlpIdType"
							});
							continue;
						} else if (data.result[i].ENT_LOAN_ARLP_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_ARLP_TYPE},
								containerId : "arlpType"
							});
							continue;
						} else if (data.result[i].ENT_LOAN_CHAN_TRAN_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_LOAN_CHAN_TRAN_TYPE},
								containerId : "chanTranType"
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
	form.on('select(arlpIdType)', function(data){
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

	 $.when(d0,d1).done(function (d0,d1) {
			/****************************************基础段开始****************************************/
			//判断是新增还是编辑
			if (dataObj && acctBsSgmt){
				$("#baseSaveBtn").show().data("id",dataObj.edaAcctBsSgmtId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.edaAcctBsSgmtId);
                $("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.edaAcctBsSgmtId);
                $("#infRecType").val(acctBsSgmt.INF_REC_TYPE);
                $("#acctType").val(acctBsSgmt.ACCT_TYPE);
                $("#acctCode").val(acctBsSgmt.ACCT_CODE);
                $("#rptDateCode").val(acctBsSgmt.RPT_DATE_CODE);
                $("#name").val(acctBsSgmt.NAME);
                $("#idType").val(acctBsSgmt.ID_TYPE);
                $("#idNum").val(acctBsSgmt.ID_NUM);
                $("#orgCode").val(acctBsSgmt.ORG_CODE);
                $("#mngmtOrgCode").val(acctBsSgmt.MNGMT_ORG_CODE);
                $("#isFilter").val(acctBsSgmt.IS_FILTER);
                $("#rptDate").val(acctBsSgmt.RPT_DATE);
				form.render('select');
				//verify.dataValidation('base','PBA_ACCT_BS_SGMT',dataObj.pbaAcctBsSgmtId,'form',false); //数据校验
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
			form.on('submit(baseSaveBtn)', function(data){
				var $this = $(this);
				var para = {};
				para.edaAcctBsSgmtId = $this.data("id");
				para.infRecType = $("#infRecType").val();
				para.acctType = $("#acctType").val();
				para.acctCode = $("#acctCode").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.name = $("#name").val();
				para.idType = $("#idType").val();
				para.idNum = $("#idNum").val();
				para.orgCode = $("#orgCode").val();
				//para.orgName = $("#orgCode").next().find(".layui-this").html();
				para.mngmtOrgCode = $("#mngmtOrgCode").val();
				para.isFilter = $("#isFilter").val();
				para.rptDate = $("#rptDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'entLoanAcctInfoSeo/saveAcctBsSgmt.do', 
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
					para.edaAcctBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'entLoanAcctInfoSeo/deleteAcctBsSgmt.do',
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
				$("#openDate").val(acctBsInfSgmt.OPEN_DATE);
				$("#cy").val(acctBsInfSgmt.CY);
				$("#acctCredLine").val(acctBsInfSgmt.ACCT_CRED_LINE);
				$("#dueDate").val(acctBsInfSgmt.DUE_DATE);
				$("#repayMode").val(acctBsInfSgmt.REPAY_MODE);
				$("#repayFreqcy").val(acctBsInfSgmt.REPAY_FREQCY);
				$("#applyBusiDist").val(acctBsInfSgmt.APPLY_BUSI_DIST);
				$("#guarMode").val(acctBsInfSgmt.GUAR_MODE);
				$("#othRepyGuarWay").val(acctBsInfSgmt.OTH_REPY_GUAR_WAY);
				$("#loaFrm").val(acctBsInfSgmt.LOA_FRM);
				$("#actInvest").val(acctBsInfSgmt.ACT_INVEST);
				$("#fundSou").val(acctBsInfSgmt.FUND_SOU);
				$("#assetTrandFlag").val(acctBsInfSgmt.ASSET_TRAND_FLAG);
				$("#basicSaveBtn").show().data("id",acctBsInfSgmt.EDB_ACCT_BS_INF_SGMT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",acctBsInfSgmt.EDB_ACCT_BS_INF_SGMT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');//同级下的div 添加css
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
				var $this = $(this);
				var para = {};
				para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
				para.edbAcctBsInfSgmtId = $this.data("id");
				para.busiLines = $("#busiLines").val();
				para.busiDtlLines = $("#busiDtlLines").val();
				para.openDate = $("#openDate").val();
				para.cy = $("#cy").val();
				para.acctCredLine = $("#acctCredLine").val();
				para.loanAmt = '';
				para.flag = '';
				para.dueDate = $("#dueDate").val();
				para.repayMode = $("#repayMode").val();
				para.repayFreqcy = $("#repayFreqcy").val();
				para.applyBusiDist = $("#applyBusiDist").val();
				para.guarMode = $("#guarMode").val();
				para.othRepyGuarWay = $("#othRepyGuarWay").val();
				para.loanTimeLimCat = '';
				para.loaFrm = $("#loaFrm").val();
				para.actInvest = $("#actInvest").val();
				para.fundSou = $("#fundSou").val();
				para.assetTrandFlag = $("#assetTrandFlag").val();
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'entLoanAcctInfoSeo/saveAcctBsInfoSgmt.do',
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
					para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
                    para.edbAcctBsInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'entLoanAcctInfoSeo/acctBsInfSgmtDel.do', 
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
				rltInfoUrl = 'entLoanAcctInfoSeo/getRltRepymtInfList.do?edaAcctBsSgmtId='+ dataObj.edaAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#responsibleAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'entLoanAcctInfoSeo/getRltRepymtInfList.do?pageType='+ pageType;
			}
			
            //渲染表格
			table.render({
				id   : 'responsibleDataTable',
				elem : '#responsibleDataTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"edcRltRepymtInfSgmtId",title:"主键"},
					{align:"center",field:"arlpIdType",title:"身份类别",templet:function(d){return renderColumnDict(d,'arlpIdType',enterDict.infoIdType)}},
					{align:"center",field:"arlpName",title:"责任人名称"},
					{align:"center",field:"arlpCertType",title:"责任人身份标识类型",templet:function(d){return renderColumnDictComsharHodIdType(d,'arlpCertType',enterDict.idType,enterDict.entCertMainType,'arlpIdType')}},
					{align:"center",field:"arlpCertNum",title:"责任人身份标识号码"},
					{align:"center",field:"arlpType",title:"还款责任人类型",templet:function(d){return renderColumnDict(d,'arlpType',enterDict.entLoanArlpType)}},
					{align:"center",field:"arlpAmt",title:"还款责任金额"},
					{align:"center",field:"wartySign",title:"联保标志",templet:function(d){return renderColumnDictComwartySign(d,'wartySign',enterDict.entLoanWartySign,'arlpType')}},
					{align:"center",field:"maxGuarMcc",title:"保证合同编号"},
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
                    $("#arlpIdType").val("");
                    $("#arlpName").val("");
                    $("#arlpCertType").val("");
                    $("#arlpCertNum").val("");
                    $("#arlpType").val("");
                    $("#arlpAmt").val("");
                    $("#wartySign").val("");
                    $("#maxGuarMcc").val("");
                    form.render('select');
                    $("#saveResponsibleModelBtn").data("id","");
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
                    $("#arlpIdType").val(data.arlpIdType);
                    $("#arlpName").val(data.arlpName);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#arlpIdType").find("option[value='"+data.arlpIdType+"']").data("id")},
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
							form.render('select');
						}
					});
                    $("#maxGuarMcc").val(data.maxGuarMcc);
                    form.render('select');
                    $("#saveResponsibleModelBtn").data("id",data.edcRltRepymtInfSgmtId);
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
					para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
					para.edcRltRepymtInfSgmtId = data.edcRltRepymtInfSgmtId;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'entLoanAcctInfoSeo/rltRepymtInfDel.do', 
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
					url  : "entLoanAcctInfoSeo/saveRltRepymtInf.do",
					data : {rltData  :  JSON.stringify(data.field),
					        edaAcctBsSgmtId : dataObj.edaAcctBsSgmtId,
							edcRltRepymtInfSgmtId : $("#saveResponsibleModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
                            table.reload('responsibleDataTable', {});
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
     
            /****************************************相关还款责任人段结束**************************************/
			
			/****************************************还款表现信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && lbltyInfSgmt){
				$("#acctStatus").val(lbltyInfSgmt.ACCT_STATUS);
				$("#acctBal").val(lbltyInfSgmt.ACCT_BAL);
				$("#balChgDate").val(lbltyInfSgmt.BAL_CHG_DATE);
				$("#fiveCate").val(lbltyInfSgmt.FIVE_CATE);
				$("#fiveCateAdjDate").val(lbltyInfSgmt.FIVE_CATE_ADJ_DATE);
				$("#pymtPrd").val(lbltyInfSgmt.PYMT_PRD);
				$("#totOverd").val(lbltyInfSgmt.TOT_OVERD);
				$("#overdPrinc").val(lbltyInfSgmt.OVERD_PRINC);
				$("#overdDy").val(lbltyInfSgmt.OVERD_DY);
				$("#latRpyDate").val(lbltyInfSgmt.LAT_RPY_DATE);
				$("#latRpyAmt").val(lbltyInfSgmt.LAT_RPY_AMT);
				$("#latRpyPrincAmt").val(lbltyInfSgmt.LAT_RPY_PRINC_AMT);
				$("#rpmtType").val(lbltyInfSgmt.RPMT_TYPE);
				$("#latAgrrRpyDate").val(lbltyInfSgmt.LAT_AGRR_RPY_DATE);
				$("#latAgrrRpyAmt").val(lbltyInfSgmt.LAT_AGRR_RPY_AMT);
				$("#nxtAgrrRpyDate").val(lbltyInfSgmt.NXT_AGRR_RPY_DATE);
				$("#closeDate").val(lbltyInfSgmt.CLOSE_DATE);
				$("#behaviorSaveBtn").show().data("id",lbltyInfSgmt.EDG_ACT_LBLTY_INF_SGMT_ID).data("type","edit");
				$("#behaviorDelBtn").show().data("id",lbltyInfSgmt.EDG_ACT_LBLTY_INF_SGMT_ID);
				$("#behaviorSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
            }else{
                $("#behaviorAddBtn").show();
            }
            //点击新增按钮
            $("#behaviorAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#behaviorSaveBtn").show().data("id",data.result).data("type","add");
							    $("#behaviorDelBtn").data("id",data.result);
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
            form.on('submit(behaviorSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
				para.edgActLbltyInfSgmtId = $this.data("id");
				para.acctStatus = $("#acctStatus").val();
				para.acctBal = $("#acctBal").val();
				para.balChgDate = $("#balChgDate").val();
				para.fiveCate = $("#fiveCate").val();
				para.fiveCateAdjDate = $("#fiveCateAdjDate").val();
				para.pymtPrd = $("#pymtPrd").val();
				para.totOverd = $("#totOverd").val();
				para.overdPrinc = $("#overdPrinc").val();
				para.overdDy = $("#overdDy").val();
				para.latRpyDate = $("#latRpyDate").val();
				para.latRpyAmt = $("#latRpyAmt").val();
				para.latRpyPrincAmt = $("#latRpyPrincAmt").val();
				para.rpmtType = $("#rpmtType").val();
				para.latAgrrRpyDate = $("#latAgrrRpyDate").val();
				para.latAgrrRpyAmt = $("#latAgrrRpyAmt").val();
				para.nxtAgrrRpyDate = $("#nxtAgrrRpyDate").val();
				para.closeDate = $("#closeDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'entLoanAcctInfoSeo/saveLbltyInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#behaviorDelBtn").show();
							}
							$this.data("type","edit");
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
            $("#behaviorDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
                    para.edgActLbltyInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'entLoanAcctInfoSeo/deleteLbltyInfSgmt.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#behaviorAddBtn").show();
								$("#behaviorSaveBtn").hide();
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
            /****************************************还款表现信息段结束****************************************/

            /****************************************抵质押物信息段开始****************************************/
			var mccInfoUrl;
			if(pageType === 'edit'){
				mccInfoUrl = 'entLoanAcctInfoSeo/getMccInfList.do?edaAcctBsSgmtId='+ dataObj.edaAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#mortgageAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				mccInfoUrl = 'entLoanAcctInfoSeo/getMccInfList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'mortgageDataTable',
				elem : '#mortgageDataTable',
				url  : mccInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EDD_MOTGA_CLTAL_CTRCT_INF_ID ",title:"主键"},
					{align:"center",field:"CCC",title:"抵（质）押合同标识码"},
					{align:"center",title:"操作",width:300,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});
			
            //点击新增按钮
            $("#mortgageAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    $("#ccc").val("");
                    //form.render('select');
                    $("#saveMortgageModelBtn").data("id","");
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
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(mortgageDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                    $("#ccc").val(data.CCC);
                    //form.render('select');
                    $("#saveMortgageModelBtn").data("id",data.EDD_MOTGA_CLTAL_CTRCT_INF_ID);
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
					para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
					para.eddMotgaCltalCtrctInfId = data.EDD_MOTGA_CLTAL_CTRCT_INF_ID;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'entLoanAcctInfoSeo/mccInfDel.do', 
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
					url  : "entLoanAcctInfoSeo/saveMccInf.do",
					data : {mccData  :  JSON.stringify(data.field),
					        edaAcctBsSgmtId : dataObj.edaAcctBsSgmtId,
							eddMotgaCltalCtrctInfId : $("#saveMortgageModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
                            table.reload('mortgageDataTable', {});
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
           
            /****************************************抵质押物信息段结束****************************************/

            /****************************************授信额度信息段开始****************************************/
			//判断是新增还是编辑
			if (dataObj && acctCredSgmt){
				$("#mcc").val(acctCredSgmt.MCC);
				$("#amountSaveBtn").show().data("id",acctCredSgmt.EDE_ACCT_CRED_SGMT_ID).data("type","edit");
                $("#amountDelBtn").show().data("id",acctCredSgmt.EDE_ACCT_CRED_SGMT_ID);
				$("#amountSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');//同级下的div 添加css
			}else{
				$("#amountAddBtn").show();
			}
			
            //点击新增按钮
            $("#amountAddBtn").on("click",function () {
				if (dataObj || baseExistFlag === 'Y'){
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
					layer.msg("请先添加基础段信息");
				}
            });
            //点击保存按钮
            form.on('submit(amountSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
                para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
				para.edeAcctCredSgmtId = $this.data("id");
				para.mcc = $("#mcc").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'entLoanAcctInfoSeo/saveAcctCredSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#amountDelBtn").show();
							}
							$this.data("type","edit");
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
					para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
                    para.edeAcctCredSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'entLoanAcctInfoSeo/acctCredSgmtDel.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
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
            /****************************************授信额度信息段结束****************************************/

            /****************************************特殊交易说明段开始****************************************/
			var busInfoUrl;
			if(pageType === 'edit'){
				busInfoUrl = 'entLoanAcctInfoSeo/getDspnSgmtList.do?edaAcctBsSgmtId='+ dataObj.edaAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#businessAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				busInfoUrl = 'entLoanAcctInfoSeo/getDspnSgmtList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'businessDataTable',
				elem : '#businessDataTable',
				url  : busInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"EDH_ACCT_SPEC_TRST_DSPN_SG_ID ",title:"主键"},
					{align:"center",field:"CHAN_TRAN_TYPE",title:"交易类型",templet:function(d){return renderColumnDict(d,'CHAN_TRAN_TYPE',enterDict.entLoanChanTranType)}},
					{align:"center",field:"TRAN_DATE", title:"交易日期"},
					{align:"center",field:"TRAN_AMT",title:"交易金额"},
					{align:"center",field:"DUE_TRAN_MON",title:"到期日期变更月数"},
					{align:"center",field:"DET_INFO",title:"交易明细信息"},
					{align:"center",title:"操作",width:200,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#businessAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
					$("#chanTranType").val("");
                    $("#tranDate").val("");
                    $("#tranAmt").val("");
                    $("#dueTranMon").val("");
                    $("#detInfo").val("");
                    //form.render('select');
                    $("#saveBusinessModelBtn").data("id","");
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
                    layer.msg("请先添加基础段信息");
                }
            });
            
			//工具栏操作
            table.on('tool(businessDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                	$("#saveBusinessModelBtn").data("id",data.EDH_ACCT_SPEC_TRST_DSPN_SG_ID);
                	$("#chanTranType").val(data.CHAN_TRAN_TYPE);
                    $("#tranDate").val(data.TRAN_DATE);
                    $("#tranAmt").val(data.TRAN_AMT);
                    $("#dueTranMon").val(data.DUE_TRAN_MON);
                    $("#detInfo").val(data.DET_INFO);
                    form.render('select');
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
					para.edaAcctBsSgmtId = dataObj.edaAcctBsSgmtId;
					para.edhAcctSpecTrstDspnSgId = data.EDH_ACCT_SPEC_TRST_DSPN_SG_ID;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'entLoanAcctInfoSeo/trstDspnSgmtDel.do',
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
				$.ajax({
					type : "post",  //请求方式
					url  : "entLoanAcctInfoSeo/saveTrstDspnSgmt.do",
					data : {busData  :  JSON.stringify(data.field),
					        edaAcctBsSgmtId     : dataObj.edaAcctBsSgmtId,
							edhAcctSpecTrstDspnSgId : $("#saveBusinessModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
                            table.reload('businessDataTable', {});
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
                    $("#basicSegmentDelBtn,#behaviorSegmentDelBtn,#businessSegmentDelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#baseSegmentChangeBtn,#basicSegmentChangeBtn,#responsibleSegmentChangeBtn,#behaviorSegmentChangeBtn,#mortgageSegmentChangeBtn,#amountSegmentChangeBtn,#businessSegmentChangeBtn").show().css("visibility","visible").removeClass("hide");
                }
                if (dataObj.businessStates === 'AW'){ //待审核状态
                    $("#approvalAllBtn,#overruleAllBtn").show().css("visibility","visible").removeClass("hide");
                }
            }
		   
		});
		
		var loading = layer.load(1, {
			shade: false,
			time: 3 * 1000
		});

        /**
         * 取消模态框按钮
         */
        $("#cancelResponsibleModelBtn,#cancelMortgageModelBtn,#cancelBusinessModelBtn").on("click",function () {
            layer.close(modelIndex);
        });

        /**
         * 点击提交按钮
         * 在当前页面直接提交信息记录
         */
        $("#delAllModelBtn,#pushAllModelBtn,#approvalAllBtn").on("click",function () {
            var $this = $(this);
            layer.confirm('确认' + $this.html(), {anim: 6}, function(index){
                EasyAjax.post_json({
                        url: config.api_host + "edaAcctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                        url: config.api_host + "edaAcctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                content: 'enterpriseLoanInfoEntireDelEdit.html?type=special'
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
                content: 'enterpriseLoanInfoIdChangeEdit.html?type=special'
            });
        });

        /**
         * 点击按段删除按钮
         */
        $("#basicSegmentDelBtn,#behaviorSegmentDelBtn,#businessSegmentDelBtn").on("click",function () {
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
                content: 'enterpriseLoanInfoSegmentDelEdit.html?type=special'
            });
        });

        /**
         * 点击按段更正按钮
         */
        $("#baseSegmentChangeBtn,#basicSegmentChangeBtn,#responsibleSegmentChangeBtn,#behaviorSegmentChangeBtn,#mortgageSegmentChangeBtn,#amountSegmentChangeBtn,#businessSegmentChangeBtn").on("click",function () {
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
                content: 'enterpriseLoanInfoSegmentChangeEdit.html?type=special'
            });
        });
		
	});
});
