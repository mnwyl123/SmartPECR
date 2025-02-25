<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">

    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp" %>
    <!-- 图标 -->
    <link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
    <link rel="stylesheet" type="text/css" href="css/smartsense/styleScroll.css">
    <link rel="stylesheet" type="text/css" href="css/smartsense/main.css"/>
</head>

<body class="no-skin" onkeydown="KeyDown()">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <form action="bfd/check/dataQualityCheck.do" method="post" name="Form" id="Form">
                            <fieldset class="hidden-xs " id="fieldset1">
                                <div class="row style_m">
                                    <div class="col-xs-1 text-right">
                                        <label>数据日期:</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input type="date" name="DATA_DATE" id="DATA_DATE"/>
                                    </div>
                                    <div class="col-xs-1 text-right">
                                        <label>表名:</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <select name="TAB_NAME" id="TAB_NAME">
                                            <option value="">请选择</option>
                                            <option value="BFD_CLDKXX">存量单位贷款基础数据</option>
                                            <option value="BFD_DBHTXX">单位贷款担保合同信息</option>
                                            <option value="BFD_DBWXX">单位贷款担保物信息</option>
                                            <option value="BFD_FRLRZBTJB">法人利润及资本统计表</option>
                                            <option value="BFD_FRZCFZFXTJB">法人资产负债及风险统计表</option>
                                            <option value="BFD_FSEXX">贷款发放信息</option>
                                        </select>
                                    </div>
                                </div>
                                <div>
                                    <input type="button" value="数据校验" class="button btn-orange" onclick="gcheck();"/>
                                </div>
                            </fieldset>
                        </form>
                        <!-- end检索 -->
                        <form action="bfd/check/getCheckResult.do" method="post" name="Form2" id="Form2">
                            <input type="hidden" name="DATA_DATE2" id="DATA_DATE2" value=""/>
                            <input type="hidden" name="TAB_NAME2" id="TAB_NAME2" value=""/>
                            <div class="tab">
                                <!-- end操作 -->
                                <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center width50">序号</th>
                                        <th class='center'>数据日期</th>
                                        <th class='center' style="display: none;">机构号</th>
                                        <th class='center'>表名</th>
                                        <th class='center' style="display: none;">表描述</th>
                                        <th class='center' style="display: none;">主键名</th>
                                        <th class='center'>主键值</th>
                                        <th class='center'>异常字段名</th>
                                        <th class='center' style="display: none;">异常字段值</th>
                                        <th class='center'>规则编号</th>
                                        <th class='center'>异常描述</th>
                                    </tr>
                                    </thead>
                                    <c:choose>
                                        <c:when test="${not empty roleList_z}">
                                            <c:forEach items="${roleList_z}" var="var" varStatus="vs">
                                                <tr>
                                                    <td class='center'>${vs.index+1}</td>
                                                    <td id="ROLE_NAMETd${var.DATA_DATE}">${var.DATA_DATE}</td>
                                                    <td id="ROLE_DESCTd${var.ORG_CODE}"
                                                        style="display: none;">${var.ORG_CODE}</td>
                                                    <td id="ROLE_DESCTd${var.TAB_NAME}">${var.TAB_NAME}</td>
                                                    <td id="ROLE_DESCTd${var.TAB_DESC}"
                                                        style="display: none;">${var.TAB_DESC}</td>
                                                    <td id="ROLE_DESCTd${var.PK_NAME}"
                                                        style="display: none;">${var.PK_NAME}</td>
                                                    <td id="ROLE_DESCTd${var.PK_VALUE}">${var.PK_VALUE}</td>
                                                    <td id="ROLE_DESCTd${var.COL_NAME}">${var.COL_NAME}</td>
                                                    <td id="ROLE_DESCTd${var.COL_VALUE}"
                                                        style="display: none;">${var.COL_VALUE}</td>
                                                    <td id="ROLE_DESCTd${var.RULE_ID}">${var.RULE_ID}</td>
                                                    <td id="ROLE_DESCTd${var.EXCEPT_DESC}">${var.EXCEPT_DESC}</td>
                                                </tr>
                                            </c:forEach>

                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="center">没有相关数据</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </table>
                            </div>
                            <div class="page-header fenye">
                                <table class="width-100">
                                    <tr>
                                        <td class="align-top center">
                                            <div class="pagination">${page.pageStr}</div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->


    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>

</div>
<!-- /.main-container -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../system/index/foot.jsp" %>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- inline scripts related to this page --><!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());
    //动态获取fieldSet的高度，改变tab高度
    $(document).ready(function () {
        var sum = window.innerHeight;
        $(".tab").height(sum - 95);
        xianshi();
    });


    //显示按钮
    function xianshi() {
        $("#fieldset").show();
        $("#xiangxia").hide();
        $("#xiangshang").show();
        var sum = window.innerHeight;
        var sum1 = $('#fieldset1').height() - 30;
        $(".tab").height(sum - 95 - sum1);
    }

    //隐藏按钮
    function yincang() {
        $("#fieldset").hide();
        $("#xiangshang").hide();
        $("#xiangxia").show();
        var sum = window.innerHeight;
        $(".tab").height(sum - 95);
    }

    function KeyDown() {
        if (event.keyCode == 13) {
            event.returnValue = false;
            event.cancel = true;
            gsearch();
        }
    }

    //校验
    function gcheck() {
        if ($("#DATA_DATE").val() == "") {
            $("#DATA_DATE").tips({
                side: 3,
                msg: '请输入',
                bg: '#AE81FF',
                time: 2
            });
            $("#DATA_DATE").focus();
            return false;
        }
        if ($("#TAB_NAME").val() == "") {
            $("#TAB_NAME").tips({
                side: 3,
                msg: '请输入',
                bg: '#AE81FF',
                time: 2
            });
            $("#TAB_NAME").focus();
            return false;
        }
        var DATA_DATE = $("#DATA_DATE").val();
        var TAB_NAME = $("#TAB_NAME").val();
        //给form2赋值
        $("#DATA_DATE2").val(DATA_DATE);
        $("#TAB_NAME2").val(TAB_NAME);
        var url = '<%=basePath%>bfd/check/dataQualityCheck.do?DATA_DATE=' + DATA_DATE + '&TAB_NAME' + TAB_NAME;
        top.jzts();
        $.get(url, function (data) {
            debugger
            if (data.success) {
                //校验成功后提交form2表单获取数据
                bootbox.confirm("校验成功，是否在当前列表加载数据？", function (result) {
                    $("#Form2").submit();
                });
            } else {
                top.hangge();
                bootbox.dialog({
                    title: "校验失败",
                    message: "<span class='bigger-110'>" + data.message + "</span>",
                    buttons:
                        {
                            "button":
                                {
                                    "label": "确定",
                                    "className": "btn-sm btn-success"
                                }
                        }
                });
            }
        });
    }
</script>


</body>
</html>