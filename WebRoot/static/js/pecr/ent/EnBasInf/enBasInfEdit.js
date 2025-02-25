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
		table = layui.table, //获取table模块
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
			toolCol = "#dataTabToolBarTplDetail";
		}else{
			toolCol = "#dataTabToolBarTpl";
		}
		
		var entBsSgmt, entFcsInfSgmt, entSpvsgAthrtyInfSgmt,entCotaInfSgmt;
		if(pageType === 'edit'){
			//基础段
			entBsSgmt = JSON.parse(document.getElementById("entBsSgmt").value);
			//基本概况信息段
			entFcsInfSgmt = JSON.parse(document.getElementById("entFcsInfSgmt").value);
			//上级机构段
			entSpvsgAthrtyInfSgmt = JSON.parse(document.getElementById("entSpvsgAthrtyInfSgmt").value);
			//联系方式段
			entCotaInfSgmt = JSON.parse(document.getElementById("entCotaInfSgmt").value);
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
			var array = ['ENT_CERT_MAIN_TYPE','EAA_RPT_DATE_CODE','ENT_CUSTOMER_TYPE','ETP_STS','ORG_TYPE','W_C_A_R_N_CODES','A_DIVISION'
				,'ECO_TYPE','TRADE_CLASSIFY','ENT_SCALE','SUP_ORG_TYPE','ENT_CERT_TYPE','ID_TYPE','MMB_PSTN','CERT_TYPE','CURRENCY'
				,'SHAR_HOD_TYPE'];
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
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_CERT_MAIN_TYPE},
								containerId : "supOrgCertType"
							});
							continue;
						}else if  (data.result[i].EAA_RPT_DATE_CODE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].EAA_RPT_DATE_CODE},
								containerId : "rptDateCode"
							});
							continue;
						}
						else if  (data.result[i].ENT_CUSTOMER_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_CUSTOMER_TYPE},
								containerId : "customerType"
							});
							continue;
						}
						else if  (data.result[i].ETP_STS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ETP_STS},
								containerId : "etpSts"
							});
							continue;
						}
						else if  (data.result[i].ETP_STS){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ETP_STS},
								containerId : "etpSts"
							});
							continue;
						}
						else if  (data.result[i].ORG_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ORG_TYPE},
								containerId : "orgType"
							});
							continue;
						}
						else if  (data.result[i].W_C_A_R_N_CODES){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].W_C_A_R_N_CODES},
								containerId : "nationality"
							});
							continue;
						}
						else if  (data.result[i].A_DIVISION){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].A_DIVISION},
								containerId : "admDivOfReg"
							});
							
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].A_DIVISION},
								containerId : "conAddDistrictCcode"
							});
							
							continue;
						}
						else if  (data.result[i].ECO_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ECO_TYPE},
								containerId : "ecoType"
							});
							var ecoType = $("#ecoType_").val();
							$("#ecoType").val(ecoType);
							continue;
						}
						else if  (data.result[i].TRADE_CLASSIFY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].TRADE_CLASSIFY},
								containerId : "ecoIndusCate"
							});
							continue;
						}
						else if  (data.result[i].ENT_SCALE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_SCALE},
								containerId : "entScale"
							});
							continue;
						}
						else if  (data.result[i].SUP_ORG_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].SUP_ORG_TYPE},
								containerId : "supOrgType"
							});
							continue;
						}
						else if  (data.result[i].ENT_CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ENT_CERT_TYPE},
								containerId : "othEntCertType"
							});
							
							continue;
						}
						else if  (data.result[i].ID_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ID_TYPE},
								containerId : "mmbIdType"
							});
							/*base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].ID_TYPE},
								containerId : "actuCotrlIdType"
							});*/
							continue;
						}
						else if  (data.result[i].MMB_PSTN){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].MMB_PSTN},
								containerId : "mmbPstn"
							});
							continue;
						}
						else if  (data.result[i].CERT_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "actuCotrlCertType"
							});
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CERT_TYPE},
								containerId : "sharHodCertType"
							});
							continue;
						}
						else if  (data.result[i].CURRENCY){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].CURRENCY},
								containerId : "regCapCurrency"
							});
							continue;
						}
						else if  (data.result[i].SHAR_HOD_TYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].SHAR_HOD_TYPE},
								containerId : "sharHodType"
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
            if (dataObj && entBsSgmt){
                $("#dcentBsSgmtSub").show().data("id",dataObj.eaaBsSgmtId).data("type","edit");
                $("#dcentBsSgmtDel").show().data("id",dataObj.eaaBsSgmtId);
                /*$("#delAllModelBtn,#pushAllModelBtn").show().data("id",dataObj.eaaBsSgmtId);*/
                $("#entName").val(entBsSgmt.ENT_NAME);
              $("#entCertType").val(entBsSgmt.ENT_CERT_TYPE);
              $("#entCertNum").val(entBsSgmt.ENT_CERT_NUM);
              $("#infSurcCode").val(entBsSgmt.INF_SURC_CODE);
              $("#rptDateCode").val(entBsSgmt.RPT_DATE_CODE);
              $("#orgCode").val(entBsSgmt.ORG_CODE);
              $("#customerType").val(entBsSgmt.CUSTOMER_TYPE);
              $("#cimoc").val(entBsSgmt.CIMOC);
              $("#etpSts").val(entBsSgmt.ETP_STS);
              $("#orgType").val(entBsSgmt.ORG_TYPE);
              $("#isFilter").val(entBsSgmt.IS_FILTER);
              $("#rptDate").val(entBsSgmt.RPT_DATE);
                form.render('select');
                verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',false,false); //数据校验
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
							$("#dcentBsSgmtSub").show().data("id",data.result).data("type","add");
							$("#dcentBsSgmtDel").data("id",data.result);
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
            form.on('submit(dcentBsSgmtSub)', function(data){
                var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = $this.data("id");
				para.entName = $("#entName").val();
				para.entCertType = $("#entCertType").val();
				para.entCertNum = $("#entCertNum").val();
				para.infSurcCode = $("#infSurcCode").val();
				para.rptDateCode = $("#rptDateCode").val();
				para.orgCode = $("#orgCode").val();
				para.customerType = $("#customerType").val();
				para.cimoc = $("#cimoc").val();
				para.etpSts = $("#etpSts").val();
				para.orgType = $("#orgType").val();
				para.isFilter = $("#isFilter").val();
				para.rptDate = $("#rptDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'eccustbasis/saveEntBsSgmt.do', 
					data     : {str : JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#dcentBsSgmtDel").show();
								/*$("#delAllModelBtn,#pushAllModelBtn").show();*/
							}
							$this.data("type","edit");
							baseExistFlag = 'Y';
							dataObj = para; //存储新数据
							verify.dataValidation('base','E_BS',$this.data("id"),'form',true,false); //数据校验
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
            $("#dcentBsSgmtDel").on("click",function () {
                var $this = $(this);
                layer.confirm('删除基础段相当于删除该页面所有段信息，是否确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eaaBsSgmtId = $this.data("id");
					//提交
					$.ajax({ 
						url      : 'eccustbasis/deleteEntBsSgmt.do', 
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

            /****************************************其他标识信息段开始****************************************/
            var rltInfoUrl;
			if(pageType === 'edit'){
				rltInfoUrl = 'eccustbasis/getentIdSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId 
						+ "&pageType=" + pageType;
				$("#responsibleAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'eccustbasis/getentIdSgmtList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'entIdSgmtTable',
				elem : '#entIdSgmtTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"eabIdSgmtId",title:"主键"},
					{align:"center",field:"othEntCertType",title:"企业身份标识类型",templet: function(d){return renderColumnDict(d, 'othEntCertType', enterDict.arlpCertType)}},
					{align:"center",field:"othEntCertNum",title:"企业身份标识号码"},
					{align:"center",field:"idInfoUpDate",title:"信息更新日期"},
					{align:"center",title:"操作",width:200,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});
		
            //点击新增按钮
            $("#dcentIdSgmtAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    $("#othEntCertNum").val("");
                    $("#idInfoUpDate").val("");
                    $("#othEntCertType").val("");
                    form.render('select');
                    $("#saveentIdSgmtModelBtn").data("id","");
					$("#cancelentIdSgmtModelBtn").data("id",dataObj.eaaBsSgmtId);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
							    $("#saveentIdSgmtModelBtn").data("id",data.result);
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
                        content: $('#entIdSgmtEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(entIdSgmtTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                	$("#othEntCertType").val(data.othEntCertType);
                    $("#othEntCertNum").val(data.othEntCertNum);
                    $("#idInfoUpDate").val(data.idInfoUpDate);
					
                    form.render('select');
                    $("#saveentIdSgmtModelBtn").data("id",data.eabIdSgmtId);
                    verify.dataValidation('dcentIdSgmt','E_ID',data.eabIdSgmtId,'form',false,false);
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#entIdSgmtEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
					para.eabIdSgmtId = data.eabIdSgmtId;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'eccustbasis/deleteEntIdSgmt.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('entIdSgmtTable',{});
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
            form.on('submit(saveentIdSgmtModelBtn)', function(data){
            	var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
				para.eabIdSgmtId = $("#saveentIdSgmtModelBtn").data("id");
				para.othEntCertType = $("#othEntCertType").val();
				para.othEntCertNum = $("#othEntCertNum").val();
				para.idInfoUpDate = $("#idInfoUpDate").val();
				
				$.ajax({
					type : "POST",  //请求方式
					url  : "eccustbasis/saveEntIdSgmt.do",
					data:{str : JSON.stringify(para), pageType : $this.data("type")},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
							var newrltInfoUrl = 'eccustbasis/getentIdSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId + '&pageType=edit';
                            verify.dataValidation('dcentIdSgmt','E_ID',para.eabIdSgmtId,'form',true,false);
                            verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',true,false);
                            table.reload('entIdSgmtTable', {url:newrltInfoUrl});
                            layer.close(modelIndex);
                            $("#dcentIdSgmtAddBtn").show();
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
            /****************************************其他标识信息段结束****************************************/
            
            /****************************************基本概况信息段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && entFcsInfSgmt){
				$("#nationality").val(entFcsInfSgmt.NATIONALITY);
				$("#regAdd").val(entFcsInfSgmt.REG_ADD);
				$("#admDivOfReg").val(entFcsInfSgmt.ADM_DIV_OF_REG);
				$("#establishDate").val(entFcsInfSgmt.ESTABLISH_DATE);
				$("#bizEndDate").val(entFcsInfSgmt.BIZ_END_DATE);
				$("#ecoIndusCate").val(entFcsInfSgmt.ECO_INDUS_CATE);
				$("#ecoType").val(entFcsInfSgmt.ECO_TYPE);
				$("#entScale").val(entFcsInfSgmt.ENT_SCALE);
				$("#bizRange").val(entFcsInfSgmt.BIZ_RANGE);
				$("#fcsInfoUpDate").val(entFcsInfSgmt.FCS_INFO_UP_DATE);
				$("#dcentFcsInfSgmtSub").show().data("id",entFcsInfSgmt.EAC_FCS_INF_SGMT_ID).data("type","edit");
				$("#dcentFcsInfSgmtDel").show().data("id",entFcsInfSgmt.EAC_FCS_INF_SGMT_ID);
				$("#dcentFcsInfSgmtSub").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('dcentIdSgmt','E_FCS_INF',entFcsInfSgmt.EAC_FCS_INF_SGMT_ID,'form',false,false); //数据校验
            }else{
                $("#dcentFcsInfSgmtAddBtn").show();
            }
			
			//点击新增按钮
			$("#dcentFcsInfSgmtAddBtn").on("click",function () {
				if (dataObj || baseExistFlag === 'Y'){
					var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#dcentFcsInfSgmtSub").show().data("id",data.result).data("type","add");
							    $("#dcentFcsInfSgmtDel").data("id",data.result);
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
            form.on('submit(dcentFcsInfSgmtSub)', function(data){
                var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
				para.eacFcsInfSgmtId = $this.data("id");
				para.nationality = $("#nationality").val();
				para.regAdd = $("#regAdd").val();
				para.admDivOfReg = $("#admDivOfReg").val();
				para.establishDate = $("#establishDate").val();
				para.bizEndDate = $("#bizEndDate").val();
				para.ecoIndusCate = $("#ecoIndusCate").val();
				para.ecoType = $("#ecoType").val();
				para.entScale = $("#entScale").val();
				para.bizRange = $("#bizRange").val();
				para.fcsInfoUpDate = $("#fcsInfoUpDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'eccustbasis/saveEntFcsInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#dcentFcsInfSgmtDel").show();
							}
							$this.data("type","edit");
							verify.dataValidation('dcentIdSgmt','E_FCS_INF',$this.data("id"),'form',true,false); //数据校验
							verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',true,false);
							
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
            $("#dcentFcsInfSgmtDel").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
                    para.eacFcsInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'eccustbasis/delAcctBsInfSgmt.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#dcentFcsInfSgmtAddBtn").show();
								$("#dcentFcsInfSgmtSub").hide();
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
            /****************************************基本概况信息段结束****************************************/

            /****************************************联系方式段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && entCotaInfSgmt){
				$("#conAddDistrictCcode").val(entCotaInfSgmt.CON_ADD_DISTRICT_CODE);
				$("#conAdd").val(entCotaInfSgmt.CON_ADD);
				$("#conPhone").val(entCotaInfSgmt.CON_PHONE);
				$("#finConPhone").val(entCotaInfSgmt.FIN_CON_PHONE);
				$("#cotaInfoUpDate").val(entCotaInfSgmt.COTA_INFO_UP_DATE);
				
				$("#deentCotaInfSgmtSaveBtn").show().data("id",entCotaInfSgmt.EAH_COTA_INF_SGMT_ID).data("type","edit");
				$("#deentCotaInfSgmtDelBtn").show().data("id",entCotaInfSgmt.EAH_COTA_INF_SGMT_ID);
				$("#deentCotaInfSgmtSaveBtn").parent().children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('deentCotaInfSgmt','E_COTA_INF',entCotaInfSgmt.EAH_COTA_INF_SGMT_ID,'form',false,false); //数据校验
            }else{
                $("#deentCotaInfSgmtAddBtn").show();
            }
			
			//点击新增按钮
			$("#deentCotaInfSgmtAddBtn").on("click",function () {
				if (dataObj || baseExistFlag === 'Y'){
					var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#deentCotaInfSgmtSaveBtn").show().data("id",data.result).data("type","add");
							    $("#deentCotaInfSgmtDelBtn").data("id",data.result);
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
            form.on('submit(deentCotaInfSgmtSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
				para.eahCotaInfSgmtId = $this.data("id");

				para.conAddDistrictCcode = $("#conAddDistrictCcode").val();
				para.conAdd = $("#conAdd").val();
				para.conPhone = $("#conPhone").val();
				para.finConPhone = $("#finConPhone").val();
				para.cotaInfoUpDate = $("#cotaInfoUpDate").val();
				
				//数据校验缺失，后期添加
				
				//提交
				$.ajax({  
					url      : 'eccustbasis/saveEntCotaInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							verify.dataValidation('deentCotaInfSgmt','E_COTA_INF',$this.data("id"),'form',true,false); //数据校验
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#deentCotaInfSgmtDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('deentCotaInfSgmt','E_COTA_INF',para.eahCotaInfSgmtId,'form',true,false); //数据校验
							verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',true,false);
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
            $("#deentCotaInfSgmtDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
                    para.eahCotaInfSgmtId = $this.data("id");
					$.ajax({ 
						url      : 'eccustbasis/deleteEntCotaInfSgmt.do', 
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#deentCotaInfSgmtAddBtn").show();
								$("#deentCotaInfSgmtSaveBtn").hide();
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
            /****************************************联系方式段结束****************************************/
            
            /****************************************主要组成人员段开始****************************************/
            var rltInfoUrl;
			if(pageType === 'edit'){
				rltInfoUrl = 'eccustbasis/getentMnMmbInfSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId 
						+ "&pageType=" + pageType;
				$("#EntMnMmbInfSgmtAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				rltInfoUrl = 'eccustbasis/getentMnMmbInfSgmtList.do?pageType='+ pageType;
			}
			
			//渲染表格
			table.render({
				id   : 'EntMnMmbInfSgmtTable',
				elem : '#EntMnMmbInfSgmtTable',
				url  : rltInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"eadMnMmbInfSgmtId",title:"主键"},
					{align:"center",field:"mmbAlias",title:"主要组成人员姓名"},
					{align:"center",field:"mmbIdType",title:"主要组成人员证件类型",templet: function(d){return renderColumnDict(d, 'mmbIdType', enterDict.idType)}},
					{align:"center",field:"mmbIdNum",title:"主要成员证件号码"},
					{align:"center",field:"mmbPstn",title:"主要组成人员职位",templet: function(d){return renderColumnDict(d, 'mmbPstn', enterDict.mmbPstn)}},
					{align:"center",field:"mnMmbInfoUpdate",title:"信息更新日期"},
					{align:"center",title:"操作",width:150,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});
		
            //点击新增按钮
            $("#EntMnMmbInfSgmtAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                	$("#mmbAlias").val("");
                    $("#mmbIdType").val("");
                    $("#mmbIdNum").val("");
                    $("#mmbPstn").val("");
                    $("#mnMmbInfoUpdate").val("");
                    form.render('select');
                    $("#saveentMnMmbInfSgmtModelBtn").data("id","");
					$("#cancelentMnMmbInfSgmtModelBtn").data("id",dataObj.eaaBsSgmtId);
					
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$("#saveentMnMmbInfSgmtModelBtn").data("id",data.result);
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
                        content: $('#entMnMmbInfSgmtEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(EntMnMmbInfSgmtTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                	 $("#mmbAlias").val(data.mmbAlias);
                     $("#mmbIdType").val(data.mmbIdType);
                     $("#mmbIdNum").val(data.mmbIdNum);
                     $("#mmbPstn").val(data.mmbPstn);
                     $("#mnMmbInfoUpdate").val(data.mnMmbInfoUpdate);
                    form.render('select');
                    $("#saveentMnMmbInfSgmtModelBtn").data("id",data.eadMnMmbInfSgmtId);
                    verify.dataValidation('EntMnMmbInfSgmt','E_MN_MMB_INF',data.eadMnMmbInfSgmtId,'form',false,false); //数据校验
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['80%', '85%'],
                        anim: 0,
                        resize: false,
                        content: $('#entMnMmbInfSgmtEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
					para.eadMnMmbInfSgmtId = data.eadMnMmbInfSgmtId;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'eccustbasis/deleteEntMnMmbInfSgmt.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('EntMnMmbInfSgmtTable',{});
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
            form.on('submit(saveentMnMmbInfSgmtModelBtn)', function(data){
               	var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
				para.eadMnMmbInfSgmtId = $("#saveentMnMmbInfSgmtModelBtn").data("id");
				para.mmbAlias = $("#mmbAlias").val();
				para.mmbIdType = $("#mmbIdType").val();
				para.mmbIdNum = $("#mmbIdNum").val();
				para.mmbPstn = $("#mmbPstn").val();
				para.mnMmbInfoUpdate = $("#mnMmbInfoUpdate").val();
				console.log(para.eadMnMmbInfSgmtId);
				$.ajax({
					type : "POST",  //请求方式
					url  : "eccustbasis/saveEntMnMmbInfSgmt.do",
					data:{str : JSON.stringify(para), pageType : $this.data("type")},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
							var newrltInfoUrl = 'eccustbasis/getentMnMmbInfSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId + '&pageType=edit';
                            verify.dataValidation('EntMnMmbInfSgmt','E_MN_MMB_INF',para.eadMnMmbInfSgmtId,'form',true,false); //数据校验
                            verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',true,false);
                            table.reload('EntMnMmbInfSgmtTable', {url:newrltInfoUrl});
                            layer.close(modelIndex);
                            $("#EntMnMmbInfSgmtAddBtn").show();
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
            /****************************************主要组成人员段结束****************************************/

            /****************************************注册资本及主要出资人段开始****************************************/
            var mccInfoUrl;
			if(pageType === 'edit'){
				mccInfoUrl = 'eccustbasis/getentMnShaHodInfSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId 
						+ "&pageType=" + pageType;
				$("#entMnShaHodInfSgmtAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				mccInfoUrl = 'eccustbasis/getentMnShaHodInfSgmtList.do?pageType='+ pageType;
			}
				
			//渲染表格
			table.render({
				id   : 'entMnShaHodInfSgmtTable',
				elem : '#entMnShaHodInfSgmtTable',
				url  : mccInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"eaeMnShaHodInfSgmtId",title:"主键"},
					{align:"center",field:"regCapCurrency",title:"注册资本币种",templet: function(d){return renderColumnDict(d, 'regCapCurrency', enterDict.ccy)}},
					{align:"center",field:"regCap",title:"注册资本"},
					{align:"center",field:"sharHodType",title:"出资人类型",templet: function(d){return renderColumnDict(d, 'sharHodType', enterDict.sharHodType)}},
					{align:"center",field:"sharHodCertType",title:"出资人身份类别",templet: function(d){return renderColumnDict(d, 'sharHodCertType', enterDict.infoIdType)}},
					{align:"center",field:"sharHodName",title:"出资人名称"},
					{align:"center",field:"sharHodIdType",title:"出资人身份标识类型",templet: function(d){return renderColumnDictComsharHodIdType(d, 'sharHodIdType', enterDict.idType,enterDict.entCertMainType,'sharHodCertType')}},
					{align:"center",field:"sharHodIdNum",title:"出资人身份标识号码"},
					{align:"center",field:"invRatio",title:"出资比例（%）"},
					{align:"center",field:"mnShaHodInfoUpDate",title:"信息更新日期"},
					{align:"center",title:"操作",width:150,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#entMnShaHodInfSgmtAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                	$("#regCapCurrency").val("");
                    $("#regCap").val("");
                    $("#sharHodType").val("");
                    $("#sharHodCertType").val("");
                    $("#sharHodName").val("");
                    $("#sharHodIdType").val("");
                    $("#sharHodIdNum").val("");
                    $("#invRatio").val("");
                    $("#mnShaHodInfoUpDate").val("");
                    form.render('select');
                    $("#saveentMnShaHodInfSgmtModelBtn").data("id","");
					$("#cancelentMnShaHodInfSgmtModelBtn").data("id",dataObj.eaaBsSgmtId);
					
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$("#saveentMnShaHodInfSgmtModelBtn").data("id",data.result);
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
                        content: $('#entMnShaHodInfSgmtEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(entMnShaHodInfSgmtTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                console.log(data);
                if (layEvent === 'edit'){ //编辑
                	$("#saveentMnShaHodInfSgmtModelBtn").data("id",data.eaeMnShaHodInfSgmtId);
                	$("#regCapCurrency").val(data.regCapCurrency);
                    $("#regCap").val(data.regCap);
                    $("#sharHodType").val(data.sharHodType);
                    $("#sharHodCertType").val(data.sharHodCertType);
                    var sharHodIdType =data.sharHodIdType;
                    var options = $("#sharHodCertType option:selected");
	                var uperId = $("#sharHodCertType").find("option:selected").attr("data-id");
	                console.log(uperId);
                    $.ajax({
            			url:'dataDictCode/selectCodeListByUperId.do', 
            			data:{uperId: uperId},
            			type:'post',  
            			cache:false,  
            			dataType:'json',  
            			success:function(data){
            				if (data.result.length){
            					base.renderTpl({
            						tplId : "enumerationValueTpl",
            						arr : {"list" : data.result},
            						containerId : "sharHodIdType"
            					});
            				}
            				$("#sharHodIdType").val(sharHodIdType);
            				form.render('select');
            			}
            		});
                    $("#sharHodName").val(data.sharHodName);
                    /*$("#sharHodIdType").val(data.sharHodIdType);*/
                    $("#sharHodIdNum").val(data.sharHodIdNum);
                    $("#invRatio").val(data.invRatio);
                    $("#mnShaHodInfoUpDate").val(data.mnShaHodInfoUpDate);
                    form.render('select');
                    verify.dataValidation('entMnShaHodInfSgmt','E_MN_SHA_HOD_INF',data.eaeMnShaHodInfSgmtId,'form',false,false); //数据校验
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['60%', '60%'],
                        anim: 0,
                        resize: false,
                        content: $('#entMnShaHodInfSgmtEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
					para.eaeMnShaHodInfSgmtId = data.eaeMnShaHodInfSgmtId;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'eccustbasis/deleteEntMnShaHodInfSgmt.do', 
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
            form.on('submit(saveentMnShaHodInfSgmtModelBtn)', function(data){
            	var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
				para.eaeMnShaHodInfSgmtId = $("#saveentMnShaHodInfSgmtModelBtn").data("id");
				para.regCapCurrency = $("#regCapCurrency").val();
				para.regCap = $("#regCap").val();
				para.sharHodType = $("#sharHodType").val();
				para.sharHodCertType = $("#sharHodCertType").val();
				para.sharHodName = $("#sharHodName").val();
				para.sharHodIdType = $("#sharHodIdType").val();
				para.sharHodIdNum = $("#sharHodIdNum").val();
				para.invRatio = $("#invRatio").val();
				para.mnShaHodInfoUpDate = $("#mnShaHodInfoUpDate").val();
				$.ajax({
					type : "post",  //请求方式
					url  : "eccustbasis/saveEntMnShaHodInfSgmt.do",
					data:{str : JSON.stringify(para), pageType : $this.data("type")},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
							var newmccInfoUrl = 'eccustbasis/getentMnShaHodInfSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId + '&pageType=edit';
                            verify.dataValidation('entMnShaHodInfSgmt','E_MN_SHA_HOD_INF',para.eaeMnShaHodInfSgmtId,'form',true,false); //数据校验
                            verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',true,false);
                            table.reload('entMnShaHodInfSgmtTable', {url:newmccInfoUrl});
                            layer.close(modelIndex);
                            $("#entMnShaHodInfSgmtAddBtn").show();
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

            /****************************************注册资本及主要出资人段结束****************************************/

            /****************************************实际控制人段开始****************************************/
            var mccInfoUrl;
			if(pageType === 'edit'){
				mccInfoUrl = 'eccustbasis/getEntActuCotrlInfSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId 
						+ "&pageType=" + pageType;
				$("#entActuCotrlInfSgmtAddBtn").parent().children('div.layui-colla-content').addClass('layui-show');
			} else {
				mccInfoUrl = 'eccustbasis/getEntActuCotrlInfSgmtList.do?pageType='+ pageType;
			}
				
			//渲染表格
			table.render({
				id   : 'entActuCotrlInfSgmtTable',
				elem : '#entActuCotrlInfSgmtTable',
				url  : mccInfoUrl,
				cols : [[
					{checkbox : true},
					{hide: true, field:"eafActuCotrlInfSgmtId",title:"主键"},
					{align:"center",field:"actuCotrlCertType",title:"实际控制人身份类别",templet: function(d){return renderColumnDict(d, 'actuCotrlCertType', enterDict.infoIdType)}},
					{align:"center",field:"actuCotrlName",title:"实际控制人名称"},
					{align:"center",field:"actuCotrlIdType",title:"实际控制人身份标识类型",templet: function(d){return renderColumnDictComsharHodIdType(d, 'actuCotrlIdType', enterDict.idType,enterDict.entCertMainType,'actuCotrlCertType')}},
					{align:"center",field:"actuCotrlIdNum",title:"实际控制人身份标识号码"},
					{align:"center",field:"actuCotrlInfoUpdate",title:"信息更新日期"},
					{align:"center",title:"操作",width:150,toolbar:toolCol}
				]],
				limit : 5,
				even  : true, //开启隔行背景
				page  : true,
				size: 'sm',  //小尺寸的表格
				limits: [5,10]
			});

            //点击新增按钮
            $("#entActuCotrlInfSgmtAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    $("#actuCotrlCertType").val("");
                    $("#actuCotrlName").val("");
                    $("#actuCotrlIdType").val("");
                    $("#actuCotrlIdNum").val("");
                    $("#actuCotrlInfoUpdate").val("");
                    form.render('select');
                    $("#saveentActuCotrlInfSgmtModelBtn").data("id","");
					$("#cancelentActuCotrlInfSgmtModelBtn").data("id",dataObj.eaaBsSgmtId);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$("#saveentActuCotrlInfSgmtModelBtn").data("id",data.result);
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
                        content: $('#entActuCotrlInfSgmtEditModel')
                    });
                }else{
                    layer.msg("请先添加基础段信息");
                }
            });
			
            //工具栏操作
            table.on('tool(entActuCotrlInfSgmtTable)', function(obj){
                var data = obj.data;
                var layEvent = obj.event;
                if (layEvent === 'edit'){ //编辑
                    $("#saveentActuCotrlInfSgmtModelBtn").data("id",data.eafActuCotrlInfSgmtId);
                    $("#actuCotrlCertType").val(data.actuCotrlCertType);
                    var actuCotrlIdType =data.actuCotrlIdType;
                    var options = $("#actuCotrlCertType option:selected");
	                var uperId = $("#actuCotrlCertType").find("option:selected").attr("data-id");
	                console.log(uperId);
                    $.ajax({
            			url:'dataDictCode/selectCodeListByUperId.do', 
            			data:{uperId: uperId},
            			type:'post',  
            			cache:false,  
            			dataType:'json',  
            			success:function(data){
            				if (data.result.length){
            					base.renderTpl({
            						tplId : "enumerationValueTpl",
            						arr : {"list" : data.result},
            						containerId : "actuCotrlIdType"
            					});
            				}
            				$("#actuCotrlIdType").val(actuCotrlIdType);
            				form.render('select');
            			}
            		});
                    $("#actuCotrlName").val(data.actuCotrlName);
                    $("#actuCotrlIdNum").val(data.actuCotrlIdNum);
                    $("#actuCotrlInfoUpdate").val(data.actuCotrlInfoUpdate);
                    form.render('select');
                    verify.dataValidation('entActuCotrlInfSgmt','E_ACTU_COTRL_INF',data.eafActuCotrlInfSgmtId,'form',false,false); //数据校验
					modelIndex = layer.open({
                        type: 1,
                        title: "编辑",
                        shade: [0.3, '#000'],
                        area: ['60%', '60%'],
                        anim: 0,
                        resize: false,
                        content: $('#entActuCotrlInfSgmtEditModel')
                    });
                } else if(layEvent === 'delete'){//删除
					var para = {};
					para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
					para.eafActuCotrlInfSgmtId = data.eafActuCotrlInfSgmtId;
					layer.confirm('确认删除该数据信息?', {anim: 6}, function(index){
						$.ajax({ 
							url      : 'eccustbasis/deleteEntActuCotrlInfSgmt.do', 
							data     : {str : JSON.stringify(para)},
							type     : 'post',  
							cache    : false,  
							dataType : 'json',  
							success:function(data){ 
								if (data.success == true){
									layer.msg("操作成功");
									table.reload('entActuCotrlInfSgmtTable',{});
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
            form.on('submit(saveentActuCotrlInfSgmtModelBtn)', function(data){
            	var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
				para.eafActuCotrlInfSgmtId = $("#saveentActuCotrlInfSgmtModelBtn").data("id");
				para.actuCotrlCertType = $("#actuCotrlCertType").val();
				para.actuCotrlName = $("#actuCotrlName").val();
				para.actuCotrlIdType = $("#actuCotrlIdType").val();
				para.actuCotrlIdNum = $("#actuCotrlIdNum").val();
				para.actuCotrlInfoUpdate = $("#actuCotrlInfoUpdate").val();
				$.ajax({
					type : "post",  //请求方式
					url  : "eccustbasis/saveEntActuCotrlInfSgmt.do",
					data:{str : JSON.stringify(para), pageType : $this.data("type")},
					dataType : 'json',
					success : function(result) {
						if(result.success == true){
							layer.msg('操作成功', {time:3000});
							var newmccInfoUrl = 'eccustbasis/getEntActuCotrlInfSgmtList.do?eaaBsSgmtId='+ dataObj.eaaBsSgmtId + '&pageType=edit';
                            verify.dataValidation('entActuCotrlInfSgmt','E_ACTU_COTRL_INF',para.eafActuCotrlInfSgmtId,'form',true,false); //数据校验
                            verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',true,false); //数据校验
                            table.reload('entActuCotrlInfSgmtTable', {url:newmccInfoUrl});
                            layer.close(modelIndex);
                            $("#entActuCotrlInfSgmtAddBtn").show();
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

            /****************************************实际控制人段结束****************************************/
            
            /****************************************上级机构段开始****************************************/
            //判断是新增还是编辑
            if (dataObj && entSpvsgAthrtyInfSgmt){
				$("#supOrgType").val(entSpvsgAthrtyInfSgmt.SUP_ORG_TYPE);
				$("#supOrgName").val(entSpvsgAthrtyInfSgmt.SUP_ORG_NAME);
				$("#supOrgCertType").val(entSpvsgAthrtyInfSgmt.SUP_ORG_CERT_TYPE);
				$("#supOrgCertNum").val(entSpvsgAthrtyInfSgmt.SUP_ORG_CERT_NUM);
				$("#supOrgInfoUpDate").val(entSpvsgAthrtyInfSgmt.SUP_ORG_INFO_UP_DATE);
				
				$("#dcentSpvsgAthrtyInfSgmtSaveBtn").show().data("id",entSpvsgAthrtyInfSgmt.EAG_SPVSG_ATHRTY_INF_SGMT_ID).data("type","edit");
				$("#dcentSpvsgAthrtyInfSgmtDelBtn").show().data("id",entSpvsgAthrtyInfSgmt.EAG_SPVSG_ATHRTY_INF_SGMT_ID);
				$("#dcentSpvsgAthrtyInfSgmtSaveBtn").children('div.layui-colla-content').addClass('layui-show');
				form.render('select');
				verify.dataValidation('dcentSpvsgAthrtyInfSgmt','E_SPVSG_ATHRTY_INF',entSpvsgAthrtyInfSgmt.EAG_SPVSG_ATHRTY_INF_SGMT_ID,'form',false,false); //数据校验
            }else{
                $("#dcentSpvsgAthrtyInfSgmtAddBtn").show();
            }
            //点击新增按钮
            $("#dcentSpvsgAthrtyInfSgmtAddBtn").on("click",function () {
                if (dataObj || baseExistFlag === 'Y'){
                    var $this = $(this);
					$.ajax({
						type : "POST",  //请求方式
						url  : "generateUUID/id.do",
						success : function(data) {
							if(data.success == true){
								$this.hide();
								$("#dcentSpvsgAthrtyInfSgmtSaveBtn").show().data("id",data.result).data("type","add");
							    $("#dcentSpvsgAthrtyInfSgmtDelBtn").data("id",data.result);
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
            form.on('submit(dcentSpvsgAthrtyInfSgmtSaveBtn)', function(data){
                var $this = $(this);
				var para = {};
				para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
				para.eagSpvsgAthrtyInfSgmtId = $this.data("id");
				para.supOrgType = $("#supOrgType").val();
				para.supOrgName = $("#supOrgName").val();
				para.supOrgCertType = $("#supOrgCertType").val();
				para.supOrgCertNum = $("#supOrgCertNum").val();
				para.supOrgInfoUpDate = $("#supOrgInfoUpDate").val();
				//数据校验缺失，后期添加
				//提交
				$.ajax({  
					url      : 'eccustbasis/saveEntSpvsgAthrtyInfSgmt.do', 
					data     : {str:JSON.stringify(para), pageType : $this.data("type")},
					type     : 'post',  
					cache    : false,  
					dataType : 'json',  
					success:function(data){ 
						if (data.success == true){
							layer.msg("操作成功");
							if($this.data("type") === "add"){
								$("#dcentSpvsgAthrtyInfSgmtDelBtn").show();
							}
							$this.data("type","edit");
							verify.dataValidation('dcentSpvsgAthrtyInfSgmt','E_SPVSG_ATHRTY_INF',para.eagSpvsgAthrtyInfSgmtId,'form',true,false); //数据校验
							verify.dataValidation('base','E_BS',dataObj.eaaBsSgmtId,'form',true,false); //数据校验
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
            $("#dcentSpvsgAthrtyInfSgmtDelBtn").on("click",function () {
                var $this = $(this);
                layer.confirm('确认删除', {anim: 6}, function(index){
                    var para = {};
                    para.eaaBsSgmtId = dataObj.eaaBsSgmtId;
                    para.eagSpvsgAthrtyInfSgmtId = $this.data("id");
                    $.ajax({ 
						url      : 'eccustbasis/deleteEntSpvsgAthrtyInfSgmt.do',
						data     : {str : JSON.stringify(para)},
						type     : 'post',  
						cache    : false,  
						dataType : 'json',  
						success:function(data){ 
							if (data.success == true){
								layer.msg("操作成功");
								layer.close(index);
								$("#dcentSpvsgAthrtyInfSgmtAddBtn").show();
								$("#dcentSpvsgAthrtyInfSgmtSaveBtn").hide();
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
            /****************************************上级机构段结束****************************************/

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
        $("#cancelentActuCotrlInfSgmtModelBtn,#cancelentIdSgmtModelBtn,#cancelentMnShaHodInfSgmtModelBtn,#cancelentMnMmbInfSgmtModelBtn").on("click",function () {
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
        /**
         * 监听企业实际控制人身份类别
         */
        form.on('select(actuCotrlCertType)', function(data){
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
    						containerId : "actuCotrlIdType"
    					});
    				}
    				form.render('select');
    			}
    		});
    	});

        
        
        
        
        
        /**
    	 * 监听出资人身份类别切换
    	 */
    	form.on('select(sharHodCertType)', function(data){
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
    						containerId : "sharHodIdType"
    					});
    				}
    				form.render('select');
    			}
    		});
    	});
    	
    	

    });
    
    
  
});
