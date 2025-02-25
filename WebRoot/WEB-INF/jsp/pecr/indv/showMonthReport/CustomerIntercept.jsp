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
                        <label class="layui-form-label" >报表日期:</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input datefield" id="reportDate">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">渠道名称</label>
                        <div class="layui-input-inline">
                            <select lay-search="" id="channel_Name" name="channel_Name">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">产品名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="product_Name" id="product_Name" autocomplete="off"
                                   class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">报文类型</label>
                        <div class="layui-input-inline">
                            <select lay-search="" id="message_Type" name="message_Type">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div>
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="del">删除 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
    <div style="height: 35px"></div>
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
    initDict('famMemCertType', staticDict.idType);
    initDict('orgCode', staticDict.orgCodeYillion);
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
            laydate = layui.laydate
        laytpl = layui.laytpl;
        require(['static/js/pecr/module/base'], function (base) {
            /**
             * 初始化常量枚举值
             */
            var initEnumerationValue = function () {
                var array = ['CHANNEL_NAME', 'PRODUCT_NAME', 'MESSAGE_TYPE'];
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
                            if (data.result[i].ID_TYPE) {
                                base.renderTpl({
                                    tplId: "enumerationValueTpl",
                                    arr: {"list": data.result[i].ID_TYPE},
                                    containerId: "channel_Name"
                                });
                                continue;
                            } else if (data.result[i].DATA_STATUS_BLXS) {
                                base.renderTpl({
                                    tplId: "enumerationValueTpl",
                                    arr: {"list": data.result[i].DATA_STATUS_BLXS},
                                    containerId: "product_Name"
                                });
                                continue;
                            } else if (data.result[i].DATA_STATUS_BLXS) {
                                base.renderTpl({
                                    tplId: "enumerationValueTpl",
                                    arr: {"list": data.result[i].DATA_STATUS_BLXS},
                                    containerId: "message_Type"
                                });
                                continue;
                            }
                        }
                        form.render('select');
                        // d1.resolve("渲染完成");
                    }
                });
            };
            //初始化常量枚举值
            initEnumerationValue();
        });

        // form.render('select');

//展示已知数据
        table.render({
            elem: '#tableDemo' //表格所固定的div
            , toolbar: '#toolbarDemo'  //表格顶部工具栏
            , url: 'indv/dataIntercept/getDataList.do?tabName=CUST_INTERCEPT_DETAIL' //url
            , cols: [[
                {type: 'numbers'}	//列每行序号
                // , {type: 'checkbox'} //列复选框
                , {align: "center", field: 'id', hide: true, title: 'ID'}
                , {align: "center", field: 'reportDate', title: '报表日期', sort: true}
                , {align: "center", field: 'channelName', title: '渠道名称'}
                , {align: "center", field: 'productName', title: '产品名称'}
                , {align: "center", field: 'messageType', title: '报文类型'}
                , {align: "center", field: 'lastMonOutstandingCustNum', title: '上月未结清客户数'}
                , {align: "center", field: 'currMonAddCustNum', title: '当月新增客户数'}
                , {align: "center", field: 'currMonInterceptCustNum', title: '当月拦截客户数'}
                , {align: "center", field: 'currMonClosedCustNum', title: '当月报结清客户数'}
                , {align: "center", field: 'currMonNormalRepNum', title: '当月正常上报客户数'}
                , {align: "center", field: 'notReportCustNum', title: '未上报客户数'}
                , {align: "center", fixed: 'right', title: '操作', toolbar: '#barDemo', width: 100} //行上的工具栏
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
                    'REPORT_DATE': $('#reportDate').val(),
                    'CHANNEL_NAME': $('#channel_Name').val(),
                    'PRODUCT_NAME': $('#product_Name').val(),
                    'MESSAGE_TYPE': $('#message_Type').val()
                }
            });
            return false;
        });

        //监听工具条
        table.on('tool(tableDemo)', function (obj) { //注：tool 是工具条事件名，tableDemo 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

            if (layEvent === 'del') { //查看
                layer.confirm('确认是否删除该行？', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //待完成：向服务端发送删除指令
                });
            }
        });
    });

</script>
</body>
</html>
