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
		
		var acctBsSgmt, acctInfSgmt, repymtInfSgmt;
		if(pageType === 'edit'){
			//基础段
			acctBsSgmt = JSON.parse(document.getElementById("acctBsSgmt").value);
			//基本信息段
			acctInfSgmt = JSON.parse(document.getElementById("acctInfSgmt").value);
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
				 },  	     
			});
		};
		//查询所属机构
        queryOrg();
		
		/**
         * 初始化常量枚举值
         */
        var initEnumerationValue = function () {
			var array = ['PER_GUAR_ACCT_TYPE','PER_GUAR_RPT_DATE_CODE', 'PER_GUAR_BUSI_LINES', 'ID_TYPE', 'CURRENCY', 
						 'PER_GUAR_GUAR_MODE','PER_GUAR_OTH_REPY_GUAR_WAY','CERT_TYPE','PER_GUAR_ARLP_TYPE',
						 'PER_GUAR_ACCT_STATUS','FIVE_CATE','COMP_ADV_FLAG'];
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
						if (data.result[i].PER_GUAR_ACCT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_GUAR_ACCT_TYPE},
								containerId : "acctType"
							});
							continue;
						} else if (data.result[i].PER_GUAR_RPT_DATE_CODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_GUAR_RPT_DATE_CODE},
								containerId : "rptDateCode"
							});
							continue;
						} else if(data.result[i].ID_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ID_TYPE},
								containerId : "idType"
							});
							continue;
						} else if (data.result[i].PER_GUAR_BUSI_LINES){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_GUAR_BUSI_LINES},
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
						} else if  (data.result[i].PER_GUAR_GUAR_MODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_GUAR_GUAR_MODE},
								containerId : "guarMode"
							});
							continue;
						} else if (data.result[i].PER_GUAR_OTH_REPY_GUAR_WAY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_GUAR_OTH_REPY_GUAR_WAY},
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
						} else if  (data.result[i].PER_GUAR_ARLP_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_GUAR_ARLP_TYPE},
								containerId : "arlpType"
							});
							continue;
						} else if  (data.result[i].PER_GUAR_ACCT_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_GUAR_ACCT_STATUS},
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
		 * 监听担保业务大类切换
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
							containerId : "busiDtilLines"
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
		 * 监听所属机构顺带修改对应的业务管理机构
		 */
		form.on('select(orgCode)', function(data){
			var cimoc = $("#orgCode").find("option:selected").attr("data-id");
			$("#mngmtOrgCode").val(cimoc);
		});

        $.when(d0,d1).done(function (d0,d1) {
            /****************************************基础段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && acctBsSgmt){
                $("#baseSaveBtn").show().data("id",dataObj.pdaGuarAcctBsSgmtId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.pdaGuarAcctBsSgmtId);
               /* $("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.pdaGuarAcctBsSgmtId);*/
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
                verify.dataValidation('base','I_GUAR_ACCT_BS',dataObj.pdaGuarAcctBsSgmtId,'form',false,false); //数据校验

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
				para.pdaGuarAcctBsSgmtId = $this.data("id");
				para.infRecType = $("#infRecType").val();
				para.acctType = $("#acctType").val();
				para.acctCode = $("#acctCode").val();
				para.rptDate = $("#rptDate").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.name = $("#name").val();
				para.idType = $("#idType").val();
				para.idNum = $("#idNum").val();
				para.orgCode = $("#orgCode").val();
				//para.orgName = $("#orgCode").next().find(".layui-this").html();
				para.mngmtOrgCode = $("#mngmtOrgCode").val();
				para.isFilter = $("#isFilter").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'indvGuarAcctInfo/saveAcctBsSgmt.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
    		                verify.dataValidation('base','I_GUAR_ACCT_BS',$this.data("id"),'form',true,false); //数据校验

							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#baseDelBtn").show();
								/*$("#delAllModelBtn,#pushAllModelBtn").show();*/
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
                    para.pdaGuarAcctBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'indvGuarAcctInfo/delAcctBsSgmt.do', 
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
				$("#busiLines").val(acctInfSgmt.BUSI_LINES);
				$.ajax({
					url:'dataDictCode/selectCodeListByUperId.do', 
					data:{uperId:$("#busiLines").find("option[value='"+acctInfSgmt.BUSI_LINES+"']").data("id")},
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
						$("#busiDtilLines").val(acctInfSgmt.BUSI_DTIL_LINES);
						form.render('select');
					}
				});
				$("#openDate").val(acctInfSgmt.OPEN_DATE);
				$("#cy").val(acctInfSgmt.CY);
				$("#acctCredLine").val(acctInfSgmt.ACCT_CRED_LINE);
				$("#dueDate").val(acctInfSgmt.DUE_DATE);
				$("#guarMode").val(acctInfSgmt.GUAR_MODE);
				$("#othRepyGuarWay").val(acctInfSgmt.OTH_REPY_GUAR_WAY);
				$("#secDep").val(acctInfSgmt.SEC_DEP);
				$("#ctrctTxtCd").val(acctInfSgmt.CTRCT_TXT_CD);
				$("#basicSaveBtn").show().data("id",acctInfSgmt.PDB_GUAR_ACCT_INF_SGMT_ID).data("type","edit");
				$("#basicDelBtn").show().data("id",acctInfSgmt.PDB_GUAR_ACCT_INF_SGMT_ID);
				$("#basicSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
                verify.dataValidation('basic','I_GUAR_ACCT_INF',acctInfSgmt.PDB_GUAR_ACCT_INF_SGMT_ID,'form',false,false); //数据校验

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
								//20210121修改方便校验相关还款责任人等有关联的信息段
								var PDB_GUAR_ACCT_INF_SGMT_ID = '{"PDB_GUAR_ACCT_INF_SGMT_ID":"'+data.result+'"}'
								acctInfSgmt = JSON.parse(PDB_GUAR_ACCT_INF_SGMT_ID);
								PDB_GUAR_ACCT_INF_SGMT_ID
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
				para.pdaGuarAcctBsSgmtId = dataObj.pdaGuarAcctBsSgmtId;
				para.pdbGuarAcctInfSgmtId = $this.data("id");
				para.busiLines = $("#busiLines").val();
				para.busiDtilLines = $("#busiDtilLines").val();
				para.openDate = $("#openDate").val();
				para.cy = $("#cy").val();
				para.acctCredLine = $("#acctCredLine").val();
				para.dueDate = $("#dueDate").val();
				para.guarMode = $("#guarMode").val();
				para.othRepyGuarWay = $("#othRepyGuarWay").val();
				para.secDep = $("#secDep").val();
				para.ctrctTxtCd = $("#ctrctTxtCd").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'indvGuarAcctInfo/saveAcctInfoSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							verify.dataValidation('basic','I_GUAR_ACCT_INF', $this.data("id"),'form',true,false);
							 verify.dataValidation('base','I_GUAR_ACCT_BS',dataObj.pdaGuarAcctBsSgmtId,'form',true,false);
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
                    para.pdaGuarAcctBsSgmtId = dataObj.pdaGuarAcctBsSgmtId;
                    para.pdbGuarAcctInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'indvGuarAcctInfo/delAcctBsInfSgmt.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
				                verify.dataValidation('basic','I_GUAR_ACCT_INF',$this.data("id"),'form',true,false); //数据校验

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
				rltInfoUrl = 'indvGuarAcctInfo/getRltInfList.do?pdaGuarAcctBsSgmtId='+ dataObj.pdaGuarAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#responsibleAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'indvGuarAcctInfo/getRltInfList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'responsibleDataTable',
				elem : '#responsibleDataTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"pdcRltRepymtInfSgmtId",title:"主键"},
					{align:"center",field:"infoIdType",title:"身份类别",templet: function(d){return renderColumnDict(d, 'infoIdType', staticDict.infoIdType)}},
					{align:"center",field:"arlpName",title:"责任人名称"},
					{align:"center",field:"arlpCertType",title:"责任人身份标识类型",templet: function(d){return renderColumnDictComsharHodIdType(d, 'arlpCertType',staticDict.idType ,staticDict.entCertMainType,'infoIdType')}},
					{align:"center",field:"arlpCertNum",title:"责任人身份标识号码"},
					{align:"center",field:"arlpType",title:"还款责任人类型",templet: function(d){return renderColumnDict(d, 'arlpType', staticDict.arlpType)}},
					{align:"center",field:"arlpAmt",title:"还款责任金额"},
					{align:"center",field:"wartySign",title:"联保标志",templet: function(d){return renderColumnDictComwartySign(d, 'wartySign', staticDict.wartySign,'arlpType')}},
					{align:"center",field:"maxGuarMcc",title:"保证合同编号"},
					{align:"center",title:"操作",width:150,toolbar:toolCol}
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
					$("#cancelResponsibleModelBtn").data("id",dataObj.pdaGuarAcctBsSgmtId);
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
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(responsibleDataTable)', function(obj){
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
							form.render('select');
						}
					});
                    $("#maxGuarMcc").val(data.maxGuarMcc);
                    form.render('select');
                    $("#saveResponsibleModelBtn").data("id",data.pdcRltRepymtInfSgmtId);
	                verify.dataValidation('responsible','I_GUAR_RLT_REPYMT_INF',$("#saveResponsibleModelBtn").data("id"),'form',false,false); //数据校验

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
					para.pdaGuarAcctBsSgmtId = dataObj.pdaGuarAcctBsSgmtId;
					para.pdcRltRepymtInfSgmtId = data.pdcRltRepymtInfSgmtId;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'indvGuarAcctInfo/rltRepymtInfDel.do', 
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
					url  : "indvGuarAcctInfo/saveRltRepymtInf.do",
					data : {rltData  :  JSON.stringify(data.field),
					        pdaGuarAcctBsSgmtId : dataObj.pdaGuarAcctBsSgmtId,
							pdcRltRepymtInfSgmtId : $("#saveResponsibleModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							var newrltInfoUrl = 'indvGuarAcctInfo/getRltInfList.do?pdaGuarAcctBsSgmtId='+ dataObj.pdaGuarAcctBsSgmtId + '&pageType=edit';
							table.reload('responsibleDataTable', {url:newrltInfoUrl});
							//基本信息中反担保方式为1保证时上报相关还款责任人段
        	                verify.dataValidation('responsible','I_GUAR_RLT_REPYMT_INF',$("#saveResponsibleModelBtn").data("id"),'form',true,false); //数据校验
        	                verify.dataValidation('basic','I_GUAR_ACCT_INF', acctInfSgmt.PDB_GUAR_ACCT_INF_SGMT_ID,'form',true,false);
							verify.dataValidation('base','I_GUAR_ACCT_BS',dataObj.pdaGuarAcctBsSgmtId,'form',true,false);
							layer.msg('操作成功', {time:3000});
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
            /****************************************相关还款责任人段结束****************************************/

            /****************************************抵质押物信息段开始****************************************/
            var mccInfoUrl;
			if(pageType === 'edit'){
				mccInfoUrl = 'indvGuarAcctInfo/getMccInfList.do?pdaGuarAcctBsSgmtId='+ dataObj.pdaGuarAcctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#mortgageAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				mccInfoUrl = 'indvGuarAcctInfo/getMccInfList.do?pageType='+ pageType;
			}
				
			//渲染表格
			table.render({
				id   : 'mortgageDataTable',
				elem : '#mortgageDataTable',
				url  : mccInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"PDD_GUAR_MCC_INF_SGMT_ID",title:"主键"},
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
                if (dataObj || baseExistFlag === 'Y'){
                    $("#ccc").val("");
                    $("#saveMortgageModelBtn").data("id","");
                    $.ajax({
    					type : "POST",  //请求方式
    					url  : "generateUUID/id.do",
    					success : function(data) {
    						if(data.success == true){
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
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(mortgageDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                    $("#ccc").val(data.CCC);
                    $("#saveMortgageModelBtn").data("id",data.PDD_GUAR_MCC_INF_SGMT_ID);
	                verify.dataValidation('mortgage','I_GUAR_MCC_INF',$("#saveMortgageModelBtn").data("id"),'form',false,false); //数据校验

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
					para.pdaGuarAcctBsSgmtId = dataObj.pdaGuarAcctBsSgmtId;
					para.pddGuarMccInfSgmtId = data.PDD_GUAR_MCC_INF_SGMT_ID;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'indvGuarAcctInfo/mccInfDel.do', 
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
					url  : "indvGuarAcctInfo/saveMccInf.do",
					data : {mccData  :  JSON.stringify(data.field),
					        pdaGuarAcctBsSgmtId : dataObj.pdaGuarAcctBsSgmtId,
							pddGuarMccInfSgmtId : $("#saveMortgageModelBtn").data("id")
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							var newmccInfoUrl = 'indvGuarAcctInfo/getMccInfList.do?pdaGuarAcctBsSgmtId='+ dataObj.pdaGuarAcctBsSgmtId + '&pageType=edit';
							table.reload('mortgageDataTable', {url:newmccInfoUrl});
			                verify.dataValidation('mortgage','I_GUAR_MCC_INF',$("#saveMortgageModelBtn").data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','I_GUAR_ACCT_BS',dataObj.pdaGuarAcctBsSgmtId,'form',true,false);
							layer.msg('操作成功', {time:3000});
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
				$("#insuranceSaveBtn").show().data("id",repymtInfSgmt.PDE_GR_REPYMT_INF_SGMT_ID).data("type","edit");
				$("#insuranceDelBtn").show().data("id",repymtInfSgmt.PDE_GR_REPYMT_INF_SGMT_ID);
				$("#insuranceSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
                verify.dataValidation('insurance','I_GR_REPYMT_INF',repymtInfSgmt.PDE_GR_REPYMT_INF_SGMT_ID,'form',false,false); //数据校验

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
				para.pdaGuarAcctBsSgmtId = dataObj.pdaGuarAcctBsSgmtId;
				para.pdeGrRepymtInfSgmtId = $this.data("id");
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
					url      : 'indvGuarAcctInfo/saveRepymtInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
			                verify.dataValidation('insurance','I_GR_REPYMT_INF',$this.data("id"),'form',true,false); //数据校验
			                verify.dataValidation('base','I_GUAR_ACCT_BS',dataObj.pdaGuarAcctBsSgmtId,'form',true,false);

							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#insuranceDelBtn").show();
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
            $("#insuranceDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.pdaGuarAcctBsSgmtId = dataObj.pdaGuarAcctBsSgmtId;
                    para.pdeGrRepymtInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'indvGuarAcctInfo/delRepymtInfSgmt.do',
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
