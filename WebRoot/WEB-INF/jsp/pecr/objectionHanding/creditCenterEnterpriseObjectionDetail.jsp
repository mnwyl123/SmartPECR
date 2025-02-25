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
<input type="hidden" id="ToCheckObjection" value='${ToCheckObjection}'>
<!-- 详情展示 -->
<div class="layui-collapse">
    <div class="layui-colla-item">
        <form class="layui-form" id="xx">
            <h2 class="layui-colla-title">异议事项单</h2>
            <div class="layui-colla-content layui-show">
                <div class="layui-form-item layui-layer-padding">
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            异议事项号:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="objCheckId" lay-verify="required"
                                   maxlength="30">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            异议事项流水号:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="objCheckNum" lay-verify="required"
                                   maxlength="30">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            核查开始日期:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="checkBeginDate"
                                   lay-verify="required"
                                   maxlength="30">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业名称:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" name="entName" id="entName" lay-verify="required"
                                   maxlength="20">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业身份标识类型:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="entIDType" name="entIDType">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                           企业身份标识号码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="entIDNum"
                                   lay-verify="required|noChinese"
                                   maxlength="20">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            有效联系电话:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="phoneNum1"
                                   lay-verify="required|noChinese" maxlength="20">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            异议事项信息:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="objItemInf"
                                   lay-verify="required|noChinese" maxlength="20">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            异议说明:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="objItemDesc"
                                   lay-verify="required|orgCodeLength">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            数据提供机构代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="dataProviderOrgCode"
                                   lay-verify="required|orgCodeLength">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            数据发生机构代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="dataOccurOrgCode"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            业务标识号:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="businessCode"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            业务种类:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="businessType">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            核查到期日期:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="checkFinalDate"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            数据发生日期:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="dataOccurDate"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            数据发生金额:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="dataOccurAmount"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            是否存在附件:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="enclosureFlag" name="enclosureFlag">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>

                    <%--企业待核查异议事项附件信息-应答报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业待核查异议事项附件信息应答报文-处理结果代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="airmfResultCode">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业待核查异议事项附件信息应答报文-处理结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="airmfResultDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业待核查异议事项附件信息应答报文-是否存在附件:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="airmfEnclosureFlag">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业待核查异议事项附件信息应答报文-附件信息存储路径:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="airmfEnclosureInf"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--反馈企业异议事项核查结果-请求报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项核查结果请求报文-核查结果:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="rfIvrCheckResult">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项核查结果请求报文-异议核查结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="rfIvrCheckResultDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--反馈企业异议事项核查结果-应答报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项核查结果应答报文-处理结果代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="afIvrResultCode">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项核查结果应答报文-处理结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="afIvrResultDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--反馈企业异议事项更正结果-请求报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项更正结果请求报文-异议更正结果:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="fopoacrrCorrectResult">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项更正结果请求报文-附件信息存储路径:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="fopoacrrEnclosureInf"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项更正结果请求报文-异议更正结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="fopoacrrCorrectDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--反馈企业异议事项更正结果-应答报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项更正结果应答报文-处理结果代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="fopoacrResultCode">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            反馈企业异议事项更正结果应答报文-处理结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="fopoacrResultDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--企业异议事项更正结果接受情况-应答报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业异议事项更正结果接受情况应答报文-处理结果代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="pocrasrResultCode">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业异议事项更正结果接受情况应答报文-处理结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="pocrasrResultDesc"
                                   lay-verify="required|orgCodeLength">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业异议事项更正结果接受情况应答报文-是否接受更正结果:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="pocrasrCorrectAcceptFlag">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            企业异议事项更正结果接受情况应答报文-更正处理意见:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="pocrasrCorrectOpinion"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--添加企业标注-请求报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            添加企业标注请求报文--定位信息个数:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="aplrLocateInfNm"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            添加企业标注请求报文-异议说明:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="aplrObjDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--添加企业标注-应答报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            添加企业标注应答报文-处理结果代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="aparResultCode">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            添加企业标注应答报文-处理结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="aparResultDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            添加企业标注应答报文-业务回执代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="aparServiceReturnCode"
                                   lay-verify="required" readonly>
                        </div>
                    </div>

                    <%--删除企业标注-应答报文--%>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            删除标注应答报文-处理结果代码:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <select id="darResultCode">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-xs2" style="margin-bottom: 40px;">
                        <label class="layui-form-label" style="float:none;text-align: left;width: 100%;">
                            删除标注应答报文-处理结果描述:
                        </label>
                        <div class="layui-input-inline" style="width: 100%;">
                            <input type="text" placeholder="" class="layui-input" id="darResultDesc"
                                   lay-verify="required" readonly>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">历史核查信息</h2>
        <div class="layui-colla-content layui-show">
            <table id="historicalCheckInfList" lay-filter="historicalCheckInfList"></table>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">定位信息</h2>
        <div class="layui-colla-content layui-show">
            <table id="locateInfList" lay-filter="locateInfList"></table>
        </div>
    </div>
</div>


<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<%--下拉模板--%>
<script type="text/html" id="enumerationValueTpl">
    <option value="" data-id="">请选择</option>
    {{# layui.each(d.list, function(index, item){ }}
    <option value="{{item.value}}">{{item.name}}</option>
    {{#  }); }}
</script>
<script src="static/js/pecr/objectionHanding/enterprise/creditCenterEnterpriseObjectionDetail.js"></script>
</body>
</html>
