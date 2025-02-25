<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
    <!-- 一些额外的css -->
    <link rel="stylesheet" href="plugins/layui/css/admin.css" media="all">
    <!-- 客户化后的css，调整了字体和宽度等 -->
    <link rel="stylesheet" href="plugins/layui/css/layui.custom.css" media="all">
</head>
<body>
<div class="wrap">
    <div class="layui-form layui-form-pane" id="queryPanel">
        <div class="layui-colla-item">
            <h3 class="layui-colla-title">数据检索
                <button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius pane-title-btn" id="queryBtn">
                    查询 <i class="layui-icon layui-icon-search"></i>
                </button>
            </h3>
            <div class="layui-colla-content layui-show">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label" >登记日期:</label>
                        <div class="layui-input-inline">
                            <input type="text" placeholder="" class="layui-input datefield" name="registDate"
                                   id="registDate1">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">证件类型</label>
                        <div class="layui-input-inline">
                            <select lay-search="" name="idType" id="idType1">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="idNum" id="idNum1" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div>
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="edit">
    <form class="layui-form layui-form-pane" lay-filter="editForm" id="editForm">
        <div class="layui-form-item" style="margin-left:30px;">
            <div class="layui-inline" style="display: none;">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-inline">
                    <input type="text" name="objectionId" id="objectionId" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="custName" id="custName" autocomplete="off" class="layui-input"/>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">证件类型</label>
                <div class="layui-input-inline">
                    <select lay-search="" name="idType" id="idType">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">证件号码</label>
                <div class="layui-input-inline">
                    <input type="text" name="idNum" id="idNum" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">异议信息类型</label>
                <div class="layui-input-inline">
                    <select lay-search="" name="objectionType" id="objectionType">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">异议信息段</label>
                <div class="layui-input-inline">
                    <select lay-search="" name="objectionSegment" id="objectionSegment">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否标注</label>
                <div class="layui-input-inline">
                    <select lay-search="" name="isLabel" id="isLabel">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">异议登记备注</label>
                <div class="layui-input-inline">
                    <textarea name="objectionRegistRemark" placeholder="请输入备注" id="objectionRegistRemark"
                              class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">资料核查备注</label>
                <div class="layui-input-inline">
                    <textarea name="materialCheckRemark" placeholder="请输入备注" id="materialCheckRemark"
                              class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">审核备注</label>
                <div class="layui-input-inline">
                    <textarea name="reviewRemark" placeholder="请输入备注" id="reviewRemark"
                              class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">异议状态</label>
                <div class="layui-input-inline">
                    <select lay-search="" name="objectionStatus" id="objectionStatus" >
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top:40px;">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="close" id="close">取消</button>
                <button type="submit" class="layui-btn" lay-submit lay-filter="save" id="save">保存</button>
            </div>
        </div>
    </form>
</div>
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情 </a>
    <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">编辑</a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="stopBtn" id="stopBtn">终止异议<i
            class="layui-icon layui-icon-addition"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" id="submitBtn" lay-event="submitBtn">提交审批
        <i class="layui-icon layui-icon-ok"></i></button>
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/html" id="enumerationValueTpl">
    <option value="" data-id="">请选择</option>
    {{# layui.each(d.list, function(index, item){ }}
    <option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
    {{#  }); }}
</script>
<script type="text/javascript">

    //初始化性别下拉字典
    initDict('idType', staticDict.idType);
    initDict('isLabel', staticDict.isLabel);
    initDict('objectionStatus', staticDict.objectionStatus);
    initDict('objectionType', staticDict.objectionType);
    initDict('objectionSegment', staticDict.objectionSegment);

    //监听异议信息类型选项，联动加载异议信息段下拉列表
    $("#objectionType").change(function () {
        var obTValue = $('#objectionType').val();
        if (obTValue === '1') {
            initDict('objectionSegment', staticDict.objectionSegment.slice(0, 8));
        } else if (obTValue === '2') {
            initDict('objectionSegment', staticDict.objectionSegment.slice(9, -1));
        } else {
            //出错
            alert('操作出错,该异议类型对应的信息段暂不存在！');
        }
    });

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
    layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage', 'laytpl'], function () {
        var form = layui.form,
            element = layui.element,
            table = layui.table,
            layer = layui.layer,
            laypage = layui.laypage,
            laydate = layui.laydate,
            laytpl = layui.laytpl;

        var loadDataOS = "30";//用来判断加载处于那个状态的异议列表-待审核
        var objType = "CHECK";

        //展示已知数据
        table.render({
            elem: '#tableDemo' //表格所固定的div
            , toolbar: '#toolbarDemo'  //表格顶部工具栏
            , url: 'IndvObjection/getDataList.do?loadDataOS=' + loadDataOS +'&objType=' +objType //url
            , cols: [[
                {type: 'numbers'}	//列每行序号
                , {type: 'checkbox'} //列复选框
                , {align: "center", field: 'objectionId', hide: true, title: 'ID', sort: true}
                , {align: "center", field: 'custName', title: '姓名'}
                , {
                    align: "center", field: 'idType', title: '证件类型', templet: function (d) {
                        return renderColDict(d, 'ID_TYPE', 'idType')
                    }
                } //列上要显示字典描述，renderColumnDict中第2个参数为当前列的field值，第3个参数为具体哪个字典变量
                , {align: "center", field: 'idNum', title: '证件号码'}
                , {
                    align: "center", field: 'objectionType', title: '异议信息类型', templet: function (d) {
                        return renderColumnDict(d, 'objectionType',staticDict.objectionType)
                    }
                }
                , {
                    align: "center", field: 'objectionSegment', title: '异议信息段', templet: function (d) {
                        return renderColumnDict(d, 'objectionSegment',staticDict.objectionSegment)
                    }
                }
                , {
                    align: "center", field: 'isLabel', title: '是否标注', templet: function (d) {
                        return renderColumnDict(d, 'isLabel',staticDict.isLabel)
                    }
                }
                , {align: "center", field: 'objectionRegistRemark', title: '异议登记备注'}
                , {align: "center", field: 'materialCheckRemark', title: '资料核查备注'}
                , {align: "center", field: 'reviewRemark', title: '审核备注'}
                , {
                    align: "center", field: 'objectionStatus', title: '异议状态', templet: function (d) {
                        return renderColumnDict(d, 'objectionStatus',staticDict.objectionStatus)
                    }
                }
                , {align: "center", fixed: 'right', title: '操作', toolbar: '#barDemo', width: 200} //行上的工具栏
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

        //日期输入框  按css将所有的date组件渲染
        $(".datefield").each(function () {
            laydate.render({
                elem: this,
                trigger: 'click'
            });
        });

        //查询按钮点击事件
        $("#queryBtn").on('click', function () {
            table.reload('tableDemo', {
                method: 'post',
                where: {
                    idType: $('#idType1').val(),
                    idNum: $('#idNum1').val(),
                    registDate: $('#registDate1').val(),
                }
            });
            return false;
        });

        form.on('submit(close)', function (data) {
            layer.close(popIndex);
            table.reload('tableDemo', {
                'where': {
                    idType: $('#idType1').val(),
                    idNum: $('#idNum1').val(),
                    registDate: $('#registDate1').val(),
                    objectionStatus: $('#objectionStatus1').val()
                }
            });
        });
        form.on('submit(save)', function (data) {
            $.ajax({
                //请求方式
                type: "POST",
                //请求地址
                url: "IndvObjection/addAndUpdate.do?addOrUpdate=" + addOrUpdate,
                //数据，json字符串
                data: data.field,
                dataType: 'json',
                //请求成功
                success: function (result) {
                    if (result.code === 0) {
                        layer.msg('操作成功', {time: 3000});
                        table.reload('tableDemo', {
                            'where': {
                                idType: $('#idType1').val(),
                                idNum: $('#idNum1').val(),
                                registDate: $('#registDate1').val(),
                                objectionStatus: $('#objectionStatus1').val()
                            }
                        });
                        layer.close(popIndex);
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
        //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
        table.on('tool(tableDemo)', function (obj) {
            form.val('editForm', {
                'custName': '',
                'idType': '',
                'idNum': '',
                'objectionType': '',
                'objectionSegment': '',
                'isLabel': '',
                'objectionRegistRemark': '',
                'materialCheckRemark': '',
                'reviewRemark': '',
                'objectionStatus': ''
            });
            var data = obj.data;
            if (obj.event === 'more') {
                popIndex = layer.open({
                    type: '1',
                    title: '详情',
                    content: $('#edit'),
                    area: ['40%', '60%']
                });
                //将该行数据在form中回显
                form.val('editForm', data);
                //隐藏取消和保存按钮
                $("#save").attr("style", "display:none;");
                $("#close").attr("style", "display:none;");
            } else if (obj.event === 'edit') {
                addOrUpdate = "update";
                popIndex = layer.open({
                    type: '1',
                    title: '修改',
                    content: $('#edit'),
                    area: ['40%', '60%']
                });
                //将该行数据在form中回显
                form.val('editForm', data);
                //显示取消和保存按钮
                $("#save").attr("style", "display:inline;");
                $("#close").attr("style", "display:inline;");
            }
        });

        //监听事件表格顶部工具栏事件
        table.on('toolbar(tableDemo)', function (obj) {
            switch (obj.event) {
                case 'stopBtn'://终止异议
                    //获取选中的行信息
                    var checkStatus = table.checkStatus('tableDemo');
                    //获取选中行的数据
                    data = checkStatus.data;
                    var objectionStatus = "70";//70-异议拒绝/终止
                    if (data.length == 0) {
                        layer.msg("请选择需要提交的数据!");
                        return;
                    }
                    layer.confirm('确定要提交选中的数据吗？', {icon: 3, title: '提示信息'}, function (index) {
                        $.ajax({
                            type: "POST",  //请求方式
                            dataType: "json",
                            contentType: "application/json",
                            url: "IndvObjection/changeObjectionStatus.do?objectionStatus=" + objectionStatus,
                            data: JSON.stringify(data),           //数据，json字符串
                            success: function (result) { //请求成功
                                layer.msg('提交成功', {time: 3000});
                                table.reload('tableDemo', {
                                    where: {
                                        idType: $('#idType1').val(),
                                        idNum: $('#idNum1').val(),
                                        registDate: $('#registDate1').val(),
                                        objectionStatus: $('#objectionStatus1').val()
                                    }
                                });
                            },
                            error: function (e) { //请求失败，包含具体的错误信息
                                layer.alert('提交出错,错误信息如下:<br>' + e.responseText);
                            }
                        });
                    });
                    break;
                case 'submitBtn'://提交下一环节处理
                    //获取选中的行信息
                    var checkStatus = table.checkStatus('tableDemo');
                    //获取选中行的数据
                    data = checkStatus.data;
                    var objectionStatus = "40";//40-待审批状态
                    if (data.length == 0) {
                        layer.msg("请选择需要提交的数据!");
                        return;
                    }
                    layer.confirm('确定要提交选中的数据吗？', {icon: 3, title: '提示信息'}, function (index) {
                        $.ajax({
                            type: "POST",  //请求方式
                            dataType: "json",
                            contentType: "application/json",
                            url: "IndvObjection/changeObjectionStatus.do?objectionStatus=" + objectionStatus,
                            data: JSON.stringify(data),           //数据，json字符串
                            success: function (result) { //请求成功
                                layer.msg('提交成功', {time: 3000});
                                table.reload('tableDemo', {
                                    where: {
                                        idType: $('#idType1').val(),
                                        idNum: $('#idNum1').val(),
                                        registDate: $('#registDate1').val(),
                                        objectionStatus: $('#objectionStatus1').val()
                                    }
                                });
                            },
                            error: function (e) { //请求失败，包含具体的错误信息
                                layer.alert('提交出错,错误信息如下:<br>' + e.responseText);
                            }
                        });
                    });
                    break;
            }
            ;
        });
    });

</script>
</body>
</html>
