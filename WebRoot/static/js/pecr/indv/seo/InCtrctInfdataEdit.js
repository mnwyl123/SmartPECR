/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laypage','laytpl'], function(){
	window.element = layui.element; //获取element模块
	window.form = layui.form; //获取form模块
	window.layer = layui.layer; //获取layer模块
	window.laydate = layui.laydate; //获取laydate模块
	window.table = layui.table; //获取table模块
	window.laypage = layui.laypage; //获取laypage模块
	window.laytpl = layui.laytpl;  //获取laytpl模块  模板引擎
	/**
	 * 表格全局默认参数设置
	 */
	table.set({
		page : false, //是否开启分页
		even : true, //是否开启隔行换色
		cellMinWidth : 80 //单元格的最小宽度
	});
	/**
	 * 模块化加载
	 * 自定义模块
	 */
	require(["static/js/pecr/module/base",'static/js/pecr/module/config'],function (base,config){
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
		
		var CtrctBsSgmt,CreditLimSgmt;
		if(pageType === 'edit'){
			//基础段
			CtrctBsSgmt = JSON.parse(document.getElementById("CtrctBsSgmt").value);
			//额度信息段
			CreditLimSgmt = JSON.parse(document.getElementById("CreditLimSgmt").value);
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
			var array = ['PER_CREDIT_RPT_DATE_CODE','ID_TYPE','CERT_TYPE','PER_CREDIT_LIM_TYPE',
						 'CREDIT_LIM_TYPE','CREDIT_CON_STATUS','CURRENCY'];
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
						if (data.result[i].PER_CREDIT_RPT_DATE_CODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_CREDIT_RPT_DATE_CODE},
								containerId : "rptDateCode"
							});
							continue;
						} else if (data.result[i].ID_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ID_TYPE},
								containerId : "idType"
							});
							continue;
						} else if (data.result[i].CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "brerType"
							});
							continue;
						} else if (data.result[i].PER_CREDIT_LIM_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].PER_CREDIT_LIM_TYPE},
								containerId : "creditLimType"
							});
							continue;
						} else  if (data.result[i].CREDIT_LIM_TYPE){
                            base.renderTpl({
                               	tplId : "enumerationValueTpl",
                               	arr : {"list" : data.result[i].CREDIT_LIM_TYPE},
                               	containerId : "limLoopFlg"
                            });
                            continue;
                        } else if (data.result[i].CURRENCY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CURRENCY},
								containerId : "cy"
							});
							continue;
						} else if (data.result[i].CREDIT_CON_STATUS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CREDIT_CON_STATUS},
								containerId : "conStatus"
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
					if (data.result.length){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result},
							containerId : "certRelIdType"
						});
					}
					form.render('select');
				}
			});
        });

		$.when(d0,d1).done(function (d0,d1) {
			/****************************************基础段开始****************************************/
			//判断是新增还是编辑
			if (dataObj && CtrctBsSgmt){
				$("#baseSaveBtn").show().data("id",dataObj.pcaCtrctBsSgmtId).data("type","edit");
                $("#baseDelBtn").show().data("id",dataObj.pcaCtrctBsSgmtId);
                $("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.pcaCtrctBsSgmtId);
                $("#infRecType").val(CtrctBsSgmt.INF_REC_TYPE);
                $("#contractCode").val(CtrctBsSgmt.CONTRACT_CODE);
                $("#rptDateCode").val(CtrctBsSgmt.RPT_DATE_CODE);
                $("#name").val(CtrctBsSgmt.NAME);
                $("#idType").val(CtrctBsSgmt.ID_TYPE);
                $("#idNum").val(CtrctBsSgmt.ID_NUM);
                $("#orgCode").val(CtrctBsSgmt.ORG_CODE);
                $("#mngmtOrgCode").val(CtrctBsSgmt.MNGMT_ORG_CODE);
                $("#isFilter").val(CtrctBsSgmt.IS_FILTER);
                $("#rptDate").val(CtrctBsSgmt.RPT_DATE);
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
			
			 //点击保存按钮
            form.on('submit(baseSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.pcaCtrctBsSgmtId = $this.data("id");
				para.infRecType = $("#infRecType").val();
				para.contractCode = $("#contractCode").val();
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
					url      : 'inCtrctInfSeo/saveCtrctBsSgmt.do', 
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
					para.pcaCtrctBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'inCtrctInfSeo/delCtrctBsSgmt.do', 
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

			/****************************************共同授信人信息段开始******************************/
			//渲染表格
			var commInfoUrl;
			if(pageType === 'edit'){
				commInfoUrl = 'inCtrctInfSeo/getCtrctCertRelSgmtList.do?pcaCtrctBsSgmtId='+ dataObj.pcaCtrctBsSgmtId 
						+ "&pageType=" + pageType;
				$("#commonAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				commInfoUrl = 'inCtrctInfSeo/getCtrctCertRelSgmtList.do?pageType='+ pageType;
			}
			
            //渲染表格
			table.render({
				id   : 'commonDataTable',
				elem : '#commonDataTable',
				url  : commInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"PCB_CTRCT_CERT_REL_SGMT_ID",title:"主键"},
					{align:"center",field:"BRER_TYPE",title : "共同受信人身份类别"},
					{align:"center",field:"CERT_REL_NAME",title : "共同受信人名称"},
					{align:"center",field:"CERT_REL_ID_TYPE",title : "共同受信人身份标识类型"},
					{align:"center",field:"CERT_REL_ID_NUM",title : "共同受信人身份标识号码"},
					{align:"center",title:"操作",width:200, toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#commonAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
					$("#brerType").val("");
                    $("#certRelName").val("");
                    $("#certRelIdType").val("");
                    $("#certRelIdNum").val("");
                    form.render('select');
                    $("#saveCommonModelBtn").data("id","");
                    modelIndex = layer.open({
                        type: 1,
                        title: "新增",
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#commonEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(commonDataTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
					$("#brerType").val(data.brer_type);
                    $("#certRelName").val(data.cert_rel_name);
					$.ajax({
						url:'dataDictCode/selectCodeListByUperId.do', 
						data:{uperId:$("#brerType").find("option[value='" + data.brer_type+"']").data("id")},
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
							$("#certRelIdType").val(data.cert_rel_id_type);
							form.render('select');
						}
					});
					$("#certRelIdNum").val(data.cert_rel_id_num);
                    form.render('select');
                    $("#saveCommonModelBtn").data("id",data.pcb_ctrct_cert_rel_sgmt_id);
					 modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#commonEditModel')
                    });
                }else if(layEvent === 'delete'){//删除
					var para = {};
					para.pcaCtrctBsSgmtId = dataObj.pcaCtrctBsSgmtId;
					para.pcbCtrctCertRelSgmtId = data.pcb_ctrct_cert_rel_sgmt_id;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'inCtrctInfSeo/delCtrctCertRelSgmt.do',
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
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
                var pcbCtrctCertRelSgmtId = $("#saveCommonModelBtn").data("id");
				$.ajax({
					type : "POST",  //请求方式
					url  : "inCtrctInfSeo/saveCertRelSgmt.do",
					data : {commData  :  JSON.stringify(data.field),
					        pcaCtrctBsSgmtId : dataObj.pcaCtrctBsSgmtId,
							pcbCtrctCertRelSgmtId : pcbCtrctCertRelSgmtId
							},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
                            table.reload('commonDataTable', {});
                            
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
			/****************************************共同授信人信息段结束****************************************/

			/****************************************额度信息段开始****************************************/
			//判断是新增还是编辑
            if (dataObj && CreditLimSgmt){
				$("#creditLimType").val(CreditLimSgmt.CREDIT_LIM_TYPE);
				$("#limLoopFlg").val(CreditLimSgmt.LIM_LOOP_FLG);
				$("#creditLim").val(CreditLimSgmt.CREDIT_LIM);
				$("#cy").val(CreditLimSgmt.CY);
				$("#conEffDate").val(CreditLimSgmt.CON_EFF_DATE);
				$("#conExpDate").val(CreditLimSgmt.CON_EXP_DATE);
				$("#conStatus").val(CreditLimSgmt.CON_STATUS);
				$("#creditRestCode").val(CreditLimSgmt.CREDIT_REST_CODE);
				$("#creditRest").val(CreditLimSgmt.CREDIT_REST);
				$("#amountSaveBtn").show().data("id",CreditLimSgmt.PCC_CREDIT_LIM_SGMT_ID).data("type","edit");
				$("#amountDelBtn").show().data("id",CreditLimSgmt.PCC_CREDIT_LIM_SGMT_ID);
				$("#amountSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
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
				para.pcaCtrctBsSgmtId = dataObj.pcaCtrctBsSgmtId;
				para.pccCreditLimSgmtId = $this.data("id");
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
					url      : 'inCtrctInfSeo/saveCreditLimSgmt.do', 
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
                    para.pcaCtrctBsSgmtId = dataObj.pcaCtrctBsSgmtId;
                    para.pccCreditLimSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'inCtrctInfSeo/delCreditLimSgmt.do',
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
			/****************************************额度信息段结束****************************************/
			
			//判断是否是详情页面，如果是则禁用页面中的按钮和表单控件
            if (base.getrequest('addOrUpdate') === 'detail'){
                $(".layui-btn").not("#cancelAllModelBtn").hide().css("visibility","hidden").addClass("hide");
                $(".layui-input").prop("disabled",true);
                $("select").not("#pushPullSelect").prop("disabled",true);
                form.render();
                if (dataObj.businessStates === 'RKCG'){ //入库成功状态
                    $("#entireDelAllModelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#idChangeAllModelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#amountSegmentDelBtn").show().css("visibility","visible").removeClass("hide");
                    $("#baseSegmentChangeBtn,#commonSegmentChangeBtn,#amountSegmentChangeBtn").show().css("visibility","visible").removeClass("hide");
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
         * 点击取消按钮
         * 关闭iframe层
         */
        $("#cancelAllModelBtn").on("click",function () {
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
                        url: config.api_host + "pcaCtrctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                        url: config.api_host + "pcaCtrctBsSgmt/" + ($this.html().indexOf('删除') !== -1 ? "delete" : ($this.html().indexOf('提交') !== -1 ? "commit" : ($this.html().indexOf('审批') !== -1 ? "examine" : "reject"))),
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
                content: 'personProtocolInfoEntireDelEdit.html?type=special'
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
                content: 'personProtocolInfoIdChangeEdit.html?type=special'
            });
        });

        /**
         * 点击按段删除按钮
         */
        $("#amountSegmentDelBtn").on("click",function () {
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
                content: 'personProtocolInfoSegmentDelEdit.html?type=special'
            });
        });

        /**
         * 点击按段更正按钮
         */
        $("#baseSegmentChangeBtn,#commonSegmentChangeBtn,#amountSegmentChangeBtn").on("click",function () {
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
                content: 'personProtocolInfoSegmentChangeEdit.html?type=special'
            });
        });

	});
});
