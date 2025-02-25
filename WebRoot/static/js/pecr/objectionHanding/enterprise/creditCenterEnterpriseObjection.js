//弹出层id
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;
/**
 * 和表单、日期控件、数据表格等相关操作均在下面方法中编写
 * 公共的方法或变量可以提到下面方法以外定义
 *
 * 界面要用layui的form，则要进入form
 * 要用日期控件，要引入laydate
 * 要用折叠面板，要引入element
 * 要用数据表格，要引入table
 */
layui.use(['layer', 'form', 'laydate', 'element', 'layer', 'table', 'laypage', 'laytpl', 'util'], function () {
    var element = layui.element
    form = layui.form,
        util = layui.util,
        table = layui.table,
        layer = layui.layer,
        laypage = layui.laypage,
        laydate = layui.laydate
    laytpl = layui.laytpl;

    require(['static/js/pecr/module/base', 'static/js/pecr/module/verify'], function (base, verify) {
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.checkResults},
            containerId: "rfIvrCheckResult"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.correctResults},
            containerId: "fopoacrrCorrectResult"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.locateInfTypes},
            containerId: "locateInfType"
        });
        form.render('select');

        //日期输入框  按css将所有的date组件渲染
        $(".datefield").each(function () {
            laydate.render({
                elem: this,
                trigger: 'click'
            });
        });

        //展示已知数据
        table.render({
            id: 'idTableRender'
            , elem: '#tableDemo' //表格所固定的div
            , toolbar: '#toolbarDemo'  //表格顶部工具栏
            , url: 'entObjWebService/objectionDataList.do' //url
            , cols: [[
                {type: 'numbers'}	//列每行序号
                , {type: 'radio'} //列复选框
                , {field: 'creditCenterObjHandingId', hide: true, title: '主键ID', sort: true}
                , {align: "center", field: 'objCheckId', title: '异议事项号'}
                , {align: "center", field: 'objCheckNum', hide: true, title: '异议事项流水号'}
                , {align: "center", field: 'checkBeginDate', title: '核查开始日期'}
                , {align: "center", field: 'entName', title: '企业名称'}
                , {
                    align: "center", field: 'entIDType', title: '企业身份标识类型 ', template: function (d) {
                        return renderColumnDict(d, 'entIDType', staticDict.idType)
                    }
                }
                , {align: "center", field: 'entIDNum', title: '企业身份标识号码'}
                , {align: "center", field: 'phoneNum', title: '有效联系电话'}
                , {align: "center", field: 'objItemInf', title: '异议事项信息'}
                , {align: "center", field: 'objItemDesc', hide: true, title: '异议说明'}
                , {align: "center", field: 'dataProviderOrgCode', hide: true, title: '数据提供机构代码'}
                , {align: "center", field: 'dataOccurOrgCode', hide: true, title: '数据发生机构代码'}
                , {align: "center", field: 'businessCode', hide: true, title: '业务标识号'}
                , {align: "center", field: 'businessType', hide: true, title: '业务种类'}
                , {align: "center", field: 'checkFinalDate', title: '核查到期日期'}
                , {align: "center", field: 'dataOccurDate', hide: true, title: '数据发生日期'}
                , {align: "center", field: 'dataOccurAmount', hide: true, title: '数据发生金额'}
                , {align: "center", field: 'enclosureFlag', hide: true, title: '是否存在附件'}
                , {
                    align: "center",
                    field: 'airmfResultCode',
                    hide: true,
                    title: '获取附件-处理结果代码',
                    template: function (d) {
                        return renderColumnDict(d, 'airmfResultCode', staticDict.universalCode)
                    }
                }
                , {
                    align: "center",
                    field: 'afIvrResultCode',
                    hide: true,
                    title: '反馈核查结果-处理结果代码',
                    template: function (d) {
                        return renderColumnDict(d, 'airmfResultCode', staticDict.universalCode)
                    }
                }
                , {
                    align: "center",
                    field: 'fopoacrResultCode',
                    hide: true,
                    title: '反馈更正结果-处理结果代码',
                    template: function (d) {
                        return renderColumnDict(d, 'airmfResultCode', staticDict.universalCode)
                    }
                }
                , {
                    align: "center",
                    field: 'pocrasrCorrectAcceptFlag',
                    hide: true,
                    title: '更正接受情况-是否接受更正结果',
                    template: function (d) {
                        return renderColumnDict(d, 'airmfResultCode', staticDict.universalCode)
                    }
                }
                , {
                    align: "center",
                    field: 'aparResultCode',
                    hide: true,
                    title: '添加个人标注应答报文-处理结果代码',
                    template: function (d) {
                        return renderColumnDict(d, 'airmfResultCode', staticDict.universalCode)
                    }
                }
                , {
                    align: "center",
                    field: 'darResultCode',
                    hide: true,
                    title: '删除标注应答报文-处理结果代码',
                    template: function (d) {
                        return renderColumnDict(d, 'airmfResultCode', staticDict.universalCode)
                    }
                }
                , {align: "center", fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150} //行上的工具栏
            ]]
            , even: true  //行斑马线
            , page: true //是否分页
            , limit: 10 //初始每页显示条数
            , height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
            , limits: [10, 20, 50],
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

        //查询按钮点击事件
        $("#queryBtn").on('click', function () {
            table.reload('idTableRender', {
                'where': {
                    'objCheckId': $('#objCheckId').val(),
                    'entIDNum': $('#entIDNum').val(),
                    'phoneNum': $('#phoneNum').val()
                }
            });
            return false;
        });
        //新增定位信息类型按钮点击事件
        $("#addInputFun").on('click', function () {
            var length = $("#addLocateInfType").children().length;
            var divElement = document.createElement("div");
            divElement.className = "layui-inline";
            divElement.id = "locateInfType" + length;
            divElement.innerHTML = "<div class='layui-inline'><label class='layui-form-label'>定位信息类别" + length + "</label><div class='layui-input-inline'><input type='text' name='locateInfType" + length + "' id='locateInfType" + length + "' autocomplete='off'class='layui-input'maxlength='60'></div></div>";
            $("#addLocateInfType").append(divElement);
            return false;
        });
        //删除定位信息类型按钮点击事件
        $("#deleteInputFun").on('click', function () {
            var length = $("#addLocateInfType").children().length;
            if (length === 1) {
                alert("至少需要一个定位信息类别")
                return;
            }
            var id = "locateInfType" + (length - 1).toString();
            var elementById = document.getElementById(id);
            document.getElementById("addLocateInfType").removeChild(elementById);
            return false;
        });

        //处理属性为 lay-active 的所有元素事件
        util.event('lay-active', {
            //获取异议
            getObj: function () {
                popIndex = layer.open({
                    type: '1',
                    title: '获取个人待核查异议',
                    content: $('#getObjPanel'),
                    area: ['40%', '40%']
                });
            }
            //获取异议附件
            , getAnnex: function () {
                var checkStatus = table.checkStatus('idTableRender');
                if (checkStatus.data.length === 0) {
                    alert('请选择需要发送获取附件请求的异议数据');
                } else {
                    $.ajax({
                        //请求方式
                        type: "POST",
                        //请求地址
                        url: "entObjWebService/getObjAnnex.do?messageType=G103",
                        //数据，json字符串
                        data: checkStatus.data[0],
                        //请求成功
                        success: function (result) {
                            if (result.success == true) {
                                layer.msg('请求成功', {time: 3000});
                                table.reload('idTableRender', {
                                    'where': {
                                        'objCheckId': $('#objCheckId').val(),
                                        'entIDNum': $('#entIDNum').val(),
                                        'phoneNum': $('#phoneNum').val()
                                    }
                                });
                            } else {
                                layer.alert(result.resultDesc);
                            }
                        },
                        //请求失败，包含具体的错误信息
                        error: function (e) {
                            layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                        }
                    });
                }
            }
            //反馈核查结果
            , feedbackCheck: function () {
                var checkStatus = table.checkStatus('idTableRender');
                if (checkStatus.data.length === 0) {
                    alert('请选择需要发送反馈核查结果请求的异议数据');
                } else {
                    popIndex = layer.open({
                        type: '1',
                        title: '反馈异议核查结果',
                        content: $('#feedbackCheckPanel'),
                        area: ['40%', '40%']
                    });
                }
            }
            //反馈更正结果
            , feedbackCorrect: function () {
                var checkStatus = table.checkStatus('idTableRender');
                if (checkStatus.data.length === 0) {
                    alert('请选择需要发送反馈更正结果请求的异议数据');
                } else {
                    popIndex = layer.open({
                        type: '1',
                        title: '反馈异议更正结果',
                        content: $('#feedbackCorrectPanel'),
                        area: ['45%', '40%']
                    });
                }
            }
            //查询接受情况
            , queryAccept: function () {
                var checkStatus = table.checkStatus('idTableRender');
                if (checkStatus.data.length === 0) {
                    alert('请选择需要发送更正接受情况查询请求的异议数据');
                } else {
                    $.ajax({
                        //请求方式
                        type: "POST",
                        //请求地址
                        url: "entObjWebService/findReceiveResult.do?messageType=G107",
                        //数据，json字符串
                        data: checkStatus.data[0],
                        //请求成功
                        success: function (result) {
                            if (result.success == true) {
                                layer.msg('请求成功', {time: 3000});
                                table.reload('idTableRender', {
                                    'where': {
                                        'objCheckId': $('#objCheckId').val(),
                                        'entIDNum': $('#entIDNum').val(),
                                        'phoneNum': $('#phoneNum').val()
                                    }
                                });
                            } else {
                                layer.alert(result.resultDesc);
                            }
                        },
                        //请求失败，包含具体的错误信息
                        error: function (e) {
                            layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                        }
                    });
                }
            }
            //添加标注
            , addLabel: function () {
                var checkStatus = table.checkStatus('idTableRender');
                if (checkStatus.data.length === 0) {
                    alert('请选择需要添加标注的异议数据');
                } else {
                    popIndex = layer.open({
                        type: '1',
                        title: '添加个人标注',
                        content: $('#addLabelPanel'),
                        area: ['40%', '80%']
                    });
                }
            }
            //删除标注
            , deleteLabel: function () {
                var checkStatus = table.checkStatus('idTableRender');
                if (checkStatus.data.length === 0) {
                    alert('请选择需要删除标注的异议数据');
                } else {
                    $.ajax({
                        //请求方式
                        type: "POST",
                        //请求地址
                        url: "entObjWebService/deleteObjLabel.do?messageType=G111",
                        //数据，json字符串
                        data: checkStatus.data[0],
                        //请求成功
                        success: function (result) {
                            if (result.success == true) {
                                layer.msg('请求成功', {time: 3000});
                                table.reload('idTableRender', {
                                    'where': {
                                        'objCheckId': $('#objCheckId').val(),
                                        'entIDNum': $('#entIDNum').val(),
                                        'phoneNum': $('#phoneNum').val()
                                    }
                                });
                            } else {
                                layer.alert(result.resultDesc);
                            }
                        },
                        //请求失败，包含具体的错误信息
                        error: function (e) {
                            layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                        }
                    });
                }
            }
        });

//监听submit提交-获取待核查异议输入
        form.on('submit(submitObjPanel)', function (data) {
            //点击提交后关闭弹出层
            layer.close(popIndex);
            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            $.ajax({
                //请求方式
                type: "POST",
                //请求地址
                url: "entObjWebService/getToCheckObjection.do?messageType=G101",
                //数据，json字符串
                data: data.field,
                //请求成功
                success: function (result) {
                    if (result.success == true) {
                        layer.msg('请求成功', {time: 3000});
                        table.reload('idTableRender', {
                            'where': {
                                'objCheckId': $('#objCheckId').val(),
                                'entIDNum': $('#entIDNum').val(),
                                'phoneNum': $('#phoneNum').val()
                            }
                        });
                    } else {
                        layer.alert(result.resultDesc);
                    }
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                }
            });
            return false;//防止页面跳转。如果需要表单跳转，去掉这段即可。
        });
        //监听submit提交-反馈核查结果输入
        form.on('submit(submitFeedbackCheck)', function (data) {
            //点击提交后关闭弹出层
            layer.close(popIndex);
            $.ajax({
                //请求方式
                type: "POST",
                //请求地址
                url: "entObjWebService/feedbackCheckResult.do?messageType=G105",
                //数据，json字符串
                data: data.field,
                //请求成功
                success: function (result) {
                    if (result.success == true) {
                        layer.msg('请求成功', {time: 3000});
                        table.reload('idTableRender', {
                            'where': {
                                'objCheckId': $('#objCheckId').val(),
                                'entIDNum': $('#entIDNum').val(),
                                'phoneNum': $('#phoneNum').val()
                            }
                        });
                    } else {
                        layer.alert(result.resultDesc);
                    }
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                }
            });
            return false;//防止页面跳转。如果需要表单跳转，去掉这段即可。
        });
        //监听submit提交-反馈更正结果输入
        form.on('submit(submitFeedbackCorrect)', function (data) {
            //把弹出层用户的输入赋值到单选框选中的对象中传递过去
            var checkStatus = table.checkStatus('idTableRender');
            checkStatus.data[0]['fopoacrrCorrectResult'] = data.field['fopoacrrCorrectResult']
            checkStatus.data[0]['fopoacrrEnclosureInf'] = data.field['fopoacrrEnclosureInf']
            checkStatus.data[0]['fopoacrrCorrectDesc'] = data.field['fopoacrrCorrectDesc']
            //点击提交后关闭弹出层
            layer.close(popIndex);
            $.ajax({
                //请求方式
                type: "POST",
                //请求地址
                url: "entObjWebService/feedbackCorrectResult.do?messageType=G106",
                //数据，json字符串
                data: checkStatus.data[0],
                //请求成功
                success: function (result) {
                    if (result.success == true) {
                        layer.msg('请求成功', {time: 3000});
                        table.reload('idTableRender', {
                            'where': {
                                'objCheckId': $('#objCheckId').val(),
                                'entIDNum': $('#entIDNum').val(),
                                'phoneNum': $('#phoneNum').val()
                            }
                        });
                    } else {
                        layer.alert(result.resultDesc);
                    }
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                }
            });
            return false;//防止页面跳转。如果需要表单跳转，去掉这段即可。
        });
        //监听submit提交-添加个人标注输入
        form.on('submit(submitAddLabel)', function (data) {
            //把弹出层用户的输入赋值到单选框选中的对象中传递过去
            var checkStatus = table.checkStatus('idTableRender');
            checkStatus.data[0]['aplrLocateInfNm'] = data.field['aplrLocateInfNm']
            checkStatus.data[0]['aplrObjDesc'] = data.field['aplrObjDesc']
            //把data中所有的locateInfType放入到locateInfList中
            var length = $("#addLocateInfType").children().length;
            for (var key in data.field) {
                if (key.startsWith("locateInfType")) {
                    checkStatus.data[0]['locateInfList'].push(data.field[key]);
                }
            }
            
            //点击提交后关闭弹出层
            layer.close(popIndex);
            $.ajax({
                //请求方式
                type: "POST",
                //请求地址
                url: "entObjWebService/addObjLabel.do?messageType=G109",
                //数据，json字符串
                data: checkStatus.data[0],
                //请求成功
                success: function (result) {
                    if (result.success == true) {
                        layer.msg('请求成功', {time: 3000});
                        table.reload('idTableRender', {
                            'where': {
                                'objCheckId': $('#objCheckId').val(),
                                'entIDNum': $('#entIDNum').val(),
                                'phoneNum': $('#phoneNum').val()
                            }
                        });
                    } else {
                        layer.alert(result.resultDesc);
                    }
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                }
            });
            return false;//防止页面跳转。如果需要表单跳转，去掉这段即可。
        });

        //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
        table.on('tool(tableDemo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layer.open({
                    type: 2,
                    title: '详情',
                    shadeClose: false,
                    shade: [0.3, '#000'],
                    area: ['100%', '100%'],
                    anim: 2,
                    resize: false,
                    content: 'entObjWebService/objectionDetail.do?creditCenterObjHandingId=' + data.creditCenterObjHandingId,
                    end: function () {
                        table.reload('idTableRender', {
                            'where': {
                                'objCheckId': $('#objCheckId').val(),
                                'entIDNum': $('#entIDNum').val(),
                                'phoneNum': $('#phoneNum').val()
                            }
                        });
                    }
                });
            } else if (obj.event === 'delete') {
                layer.confirm('确定删除该条数据?', function (index) {
                    $.ajax({
                        //请求方式
                        type: "POST",
                        //请求地址
                        url: "entObjWebService/deleteToCheckObjection.do",
                        //数据，json字符串
                        data: data,
                        //请求成功
                        success: function (result) {
                            if (result.success == true) {
                                layer.msg('删除成功', {time: 3000});
                                table.reload('idTableRender', {
                                    'where': {
                                        'objCheckId': $('#objCheckId').val(),
                                        'entIDNum': $('#entIDNum').val(),
                                        'phoneNum': $('#phoneNum').val()
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
                });
                return false;//防止页面跳转
            }
        });
    });
});