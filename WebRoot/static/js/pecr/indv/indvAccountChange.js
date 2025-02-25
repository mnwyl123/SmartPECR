//弹出层id
initDict('orgCode', staticDict.orgCodeYillion);
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;
var dataObj;
/**
 * 和表单、日期控件、数据表格等相关操作均在下面方法中编写
 * 公共的方法或变量可以提到下面方法以外定义
 *
 * 界面要用layui的form，则要进入form
 * 要用日期控件，要引入laydate
 * 要用折叠面板，要引入element
 * 要用数据表格，要引入table
 */
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage', 'laytpl'], function () {
    var
        element = layui.element
        form = layui.form,
        table = layui.table,
        layer = layui.layer,
        laypage = layui.laypage,
        laydate = layui.laydate
        laytpl = layui.laytpl;
    require(['static/js/pecr/module/base', 'static/js/pecr/module/verify'], function (base, verify) {
        /**
         * 初始化常量枚举值
         */
        var initEnumerationValue = function () {
            var array = ['INDV_INFRECTYPE_ACCOUNT', 'ID_TYPE', 'DATA_STATUS_ZHCX'];
            var selectData = [];
            for (var i = 0; i < array.length; i++) {
                var node = {};
                node.systemCodeType = array[i];
                selectData.push(node);
            }
            $.ajax({
                url: 'dataDictCode/selectCodeTypeList.do',
                data: {DATA_IDS: JSON.stringify(selectData)},
                type: 'post',
                cache: false,
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.result.length; i++) {
                        if (data.result[i].INDV_INFRECTYPE_ACCOUNT) {
                            base.renderTpl({
                                tplId: "enumerationValueTpl",
                                arr: {"list": data.result[i].INDV_INFRECTYPE_ACCOUNT},
                                containerId: "infrectype"
                            });
                            base.renderTpl({
                                tplId: "enumerationValueTpl",
                                arr: {"list": data.result[i].INDV_INFRECTYPE_ACCOUNT},
                                containerId: "infrectype1"
                            });
                            continue;
                        } else if (data.result[i].INDV_INFRECTYPE_ACCOUNT) {
                            selectAdd(data.result[i].INDV_INFRECTYPE_ACCOUNT, 'infRecType');
                            selectAdd(data.result[i].INDV_INFRECTYPE_ACCOUNT, 'infRecType1');
                        } else if (data.result[i].DATA_STATUS_ZHCX) {
                            base.renderTpl({
                                tplId: "enumerationValueTpl",
                                arr: {"list": data.result[i].DATA_STATUS_ZHCX},
                                containerId: "businessStates"
                            });
                            continue;
                        } else if (data.result[i].ID_TYPE) {
                            base.renderTpl({
                                tplId: "enumerationValueTpl",
                                arr: {"list": data.result[i].ID_TYPE},
                                containerId: "idType"
                            });
                            continue;
                        }
                    }
                    form.render('select');
//                    d1.resolve("渲染完成");
                }
            });
        };
        //初始化常量枚举值
        initEnumerationValue();


        /**
         * element组件渲染
         * form组件渲染
         */
        element.init();//每个页面都有
        form.render();//每个页面都有
        /**
         * 下拉选赋值方法
         */
        var selectAdd = function (data, selectId) {
            var getTpl = document.getElementById("enumerationValueTpl").innerHTML;
            var containerId = document.getElementById(selectId);
            laytpl(getTpl).render({list: data}, function (html) {
                containerId.innerHTML = html;
            });
        }


        table.render({
            elem: '#acc' //表格所固定的div
            , toolbar: '#toolbarDemo'  //表格顶部工具栏
            , url: 'accountchange/dataList.do' //url
            , cols: [[
                {type: 'numbers'}	//列每行序号
                , {type: 'checkbox'} //列复选框
                , {align: "center", hide: true, field: "pk", title: "主键"}
                , {align: "center", field: 'infRecType', title: '信息记录类型', templet: function (d) {return renderColumnDict(d, 'infRecType', staticDict.INFOTYPE)}}
                , {align: "center", field: 'lastUpdateTime', title: '变更日期'}
                , {align: "center", field: 'name', title: '姓名'}
                //,{align : "center",field: 'idType', title: '证件类型',templet: function(d){return renderColDict(d, 'ID_TYPE','idType')}}
                , {align: "center", field: 'idNum', title: '证件号'}
                , {align: "center", field: 'odBnesCode', title: '原业务标识码'}
                , {align: "center", field: 'nwBnesCode', title: '新业务标识码'}
                //, {align: "center", field: 'operatorUser', title: '操作员'}
                , {align: "center", field: 'businessStates', title: '状态', templet: function (d) { return renderColumnDict(d, 'businessStates', staticDict.businessStates)}}
                , {align: "center", fixed: 'right', title: '操作', toolbar: '#barDemo'} //行上的工具栏
                
            ]],
            even: true,  //行斑马线
            page: true, //是否分页
            limit: 5, //初始每页显示条数
            height: $(document).height() - $('#acc').offset().top - $('#queryPanel').height() - 25,
            limits: [5, 10, 15],
            //回调函数
            done: function (res, curr, count) {
                $('th').css({
                    'background-color': '#0997F7',
                    'color': '#FFFFFF',
                    'font-family': 'Microsoft Yahei',
                    'font-weight': '500',   //设置字体是否加粗
                    'font-size': '13px'
                });
            }
        });

        //日期输入框  按css将所有的date组件渲染
        $(".datefield").each(function () {
            laydate.render({
                elem: this,
                trigger: 'click'
            });
        });

        //检索
        $("#queryBtn").on('click', function () {
            table.reload('acc', {
                method: 'post',
                where: {
                    rptDate: $('#rptDate').val(),
                    infrectype: $('#infrectype').val(),
                    businessStates: $('#businessStates').val()
                }
            });
            return false;
        });
        //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
        table.on('tool(acc)', function (obj) {
            var data = obj.data;
            var PK = data.pk;
            var tableName = "";
            if(data.infRecType == '231'){
            	tableName = "I_INSECACCTID_CAGSINF";
            }else if (data.infRecType == '221'){
            	tableName = "I_IN_CTRCTID_CAGS_INF";
            }else{
            	tableName = "I_IN_ACCT_ID_CAGS_INF";
            }
            
            if (obj.event === 'del') {
                layer.confirm('是否确定删除该条数据？', function (index) {
                    $.ajax({
                        //请求方式
                        type: "POST",
                        //请求地址
                        url: "accountchange/delete.do",
                        //数据，json字符串
                        data: data,
                        //请求成功
                        success: function (result) {
                            layer.msg('删除成功');
                            table.reload('acc', {
                                method: 'post',
                                where: {
                                    rptDate: $('#rptDate').val(),
                                    infrectype: $('#infrectype').val(),
                                    businessStates: $('#businessStates').val()
                                }
                            });
                            layer.close(popIndex);
                        },
                        //请求失败，包含具体的错误信息
                        error: function (e) {
                            layer.alert('删除出错,错误信息如下:<br>' + e.responseText);
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                addOrUpdate = "update";
                $.ajax({
 		  	       //请求方式
 		  	       type : "POST",
 		  	       //请求地址
 		  	       url : "validate/getErrorMessage.do",
 		  	       //数据，json字符串
 		  	       data :{pk:PK,tableName:tableName}, 
 		  	       //请求成功
 		  	       success : function(result) {
 		  	    	   if(result.success == true){
 		  	    		 var errorMessage="";
 		  	    		 var data = result.result;
 		  	    		 for(var i=0;i<data.length;i++){
 		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
 		  	    		 }
 		  	    		$("#feedBackError").val(errorMessage);
 		  	     	   }else{
 		  	     		   layer.alert(result.msg);
 		  	     	   }
 		  	       },
 		  	       //请求失败，包含具体的错误信息
 		  	       error : function(e){
 		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
 		  	       }
 		  	   });
                popIndex = layer.open({
                    type: '1',
                    title: '修改信息',
                    content: $('#dialog'),
                    area: ['70%', '70%']
                });
                //将该行数据在form中回显
                $("#exampleSubmit").show().css("visibility", "visible").removeClass("hide");
                $(".layui-input").prop("disabled", false);
                $("select").prop("disabled", false);
                $("#infrectype1").val(data.infRecType);
                $("#exampleSubmit").data("id", data.pk);
                form.val('exampleForm', data);
                $("#infrectype1").attr("disabled", false);
                $("#lastUpdateTime").attr("disabled", false);
                $("#idType").attr("disabled", false);
                if (data.infRecType === '231') {//担保
                    verify.dataValidation('base', 'I_INSECACCTID_CAGSINF', data.pk, 'form', false, false); //数据校验

                } else if (data.infRecType === '221') {//授信
                    verify.dataValidation('base', 'I_IN_CTRCTID_CAGS_INF', data.pk, 'form', false, false); //数据校验

                } else {//借贷
                    verify.dataValidation('base', 'I_IN_ACCT_ID_CAGS_INF', data.pk, 'form', false, false); //数据校验
                }
                form.render('select');
            } else if (obj.event === 'more') {
            	$.ajax({
  		  	       //请求方式
  		  	       type : "POST",
  		  	       //请求地址
  		  	       url : "validate/getErrorMessage.do",
  		  	       //数据，json字符串
  		  	       data :{pk:PK,tableName:tableName}, 
  		  	       //请求成功
  		  	       success : function(result) {
  		  	    	   if(result.success == true){
  		  	    		 var errorMessage="";
  		  	    		 var data = result.result;
  		  	    		 for(var i=0;i<data.length;i++){
  		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
  		  	    		 }
  		  	    		$("#feedBackError").val(errorMessage);
  		  	     	   }else{
  		  	     		   layer.alert(result.msg);
  		  	     	   }
  		  	       },
  		  	       //请求失败，包含具体的错误信息
  		  	       error : function(e){
  		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
  		  	       }
  		  	   });
                layer.open({
                    title: '详情',
                    type: '1',
                    content: $('#dialog'),
                    area: ['70%', '70%']
                });
                $("#exampleSubmit").hide().css("visibility", "hidden").addClass("hide");
                $("#infrectype1").val(data.infRecType);
                $("#name").val(data.name);
                $("#idType").val(data.idType);
                $("#idNum").val(data.idNum);
                form.val('exampleForm', data);
                $("#infrectype1").attr("disabled", true);
                $("#lastUpdateTime").attr("disabled", true);
                $("#idType").attr("disabled", true);
                form.render('select');
            } else {
                layer.alert(result.msg);
            }
                
        });
        table.on('toolbar(acc)', function (obj) {
			switch (obj.event) {
				case 'addBtn':
					 addOrUpdate = "add";
			            //新增时对弹出框中的form数据清空
			            $("#exampleSubmit").show().css("visibility", "visible").removeClass("hide");
			            $(".layui-input").prop("disabled", false);
			            $("select").prop("disabled", false);
			            $("#infRecType1").val('');
			            form.val('exampleForm', {
			                'infrectype1': '',
			                'lastUpdateTime': '',
			                'odBnesCode': '',
			                'nwBnesCode': '',
			                 'name': '',
			                 'idType': '',
			                 'idNum': ''
			            });
			            $.ajax({

			                type: "POST",  //请求方式
			                url: "generateUUID/id.do",
			                success: function (data) {
			                    if (data.success == true) {
			                        $("#exampleSubmit").data("id", data.result);

			                    } else {
			                        layer.alert(data.msg);
			                    }
			                },
			                //请求失败，包含具体的错误信息
			                error: function (e) {
			                    layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
			                }
			            });
			            popIndex = layer.open({
			                type: '1',
			                title: '新增',
			                content: $('#dialog'),
			                area: ['70%', '70%']
			            });
			            form.render('select');
			            break;
				case 'submitBtn':
					var infRecType = $('#infrectype').val();
					if(infRecType === ""){
						layer.msg("请按照信息记录类型进行强制提交！", {time:3000});
						return ;
					}
					//获取选中的行信息
					 var checkStatus = table.checkStatus('acc');
					 //获取选中行的数据
					 data=checkStatus.data;
					 var rptDate = $('#rptDate').val();
					 if(data.length==0 && rptDate.length==0){
						layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期",{time:3000});
						return ;
					}
				 	var str = "";
					for(var i = 0; i < data.length; i++){
						str+=checkStatus.data[i].pk+",";
					}
					str = str.substr(0, str.length - 1);
					layer.confirm('确定要强制提交选中的数据吗？', {icon: 3, title: '提示信息'}, function (index){
						$.ajax({
							type : "GET",  //请求方式
							url : 'changeDataState/changeDataStateByConditon.do?infRecType='+infRecType+'&rptDate='+rptDate+'&type=submit', //请求地址
							data : {str:str},           //数据，json字符串
							success : function(result) { //请求成功
								if(result.success){
									layer.msg('强制提交成功', {time:3000});
								}else{
									layer.msg('强制提交失败', {time:3000});
								}
								table.reload('acc', {
					                method: 'post',
					                where: {
					                    rptDate: $('#rptDate').val(),
					                    infrectype: $('#infrectype').val(),
					                    businessStates: $('#businessStates').val()
					                }
					            });
							},
							error : function(e){ //请求失败，包含具体的错误信息
								layer.alert('强制提交出错,错误信息如下:<br>' + e.responseText);
							}
						});
					});
					break;
			}
        });

        //新增或更新的实际数据库操作
        form.on('submit(exampleSubmit)', function (data) {
            var para = {};
            para.pk = $("#exampleSubmit").data("id");
            para.infRecType = $("#infrectype1").val();
            para.lastUpdateTime = $("#lastUpdateTime").val();
            para.odBnesCode = $("#odBnesCode").val();
            para.nwBnesCode = $("#nwBnesCode").val();
            para.name = $("#name").val();
            para.idNum = $("#idNum").val();
            para.idType = $("#idType").val();
            //20210223,将信用报告日期与变更日期保持一致
            para.rptDate = $("#lastUpdateTime").val();
            $.ajax({
                //请求方式
                type: "POST",
                //请求地址
                url: "accountchange/addOrUpdateUser.do?addOrUpdate=" + addOrUpdate,
                //数据，json字符串
                data: para,
                //请求成功
                success: function (result) {
                    if (result.success == true) {
                        dataObj = para;
                        layer.msg('操作成功');
                        layer.close(popIndex);
                        if (dataObj.infRecType === '231') {//担保
                            verify.dataValidation('base', 'I_INSECACCTID_CAGSINF', dataObj.pk, 'form', true, false,true); //数据校验

                        } else if (dataObj.infRecType === '221') {//授信
                            verify.dataValidation('base', 'I_IN_CTRCTID_CAGS_INF', dataObj.pk, 'form', true, false,true); //数据校验

                        } else {//借贷
                            verify.dataValidation('base', 'I_IN_ACCT_ID_CAGS_INF', dataObj.pk, 'form', true, false,true); //数据校验
                        }
                        table.reload('acc', {
                            method: 'post',
                            where: {
                                rptDate: $('#rptDate').val(),
                                infrectype: $('#infrectype').val(),
                                businessStates: $('#businessStates').val()
                            }
                        });
                    } else {
                        layer.alert(result.msg);
                    }
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                }
            });
            return false;//防止页面跳转
        });
        
    });
});
