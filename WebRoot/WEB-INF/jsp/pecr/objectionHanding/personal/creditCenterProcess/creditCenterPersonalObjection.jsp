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
            <div class="layui-colla-content layui-show" style="margin:1px 1px 0px 0px">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">异议事项号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="objCheckId" id="objCheckId" autocomplete="off"
                                   class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="idNum" id="idNum" autocomplete="off"
                                   class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">联系电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phoneNum" id="phoneNum" autocomplete="off"
                                   class="layui-input"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div>

<%--获取待核查异议需要用户输入的信息--%>
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="getObjPanel">
    <form class="layui-form layui-form-pane" lay-filter="exampleForm">
        <div class="layui-form-item" style="margin-left:30px;">
            <div class="layui-inline">
                <label class="layui-form-label">开始日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="beginDate" id="beginDate" autocomplete="off" class="layui-input datefield"
                           maxlength="60">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">结束日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="endDate" id="endDate" autocomplete="off" class="layui-input datefield"
                           maxlength="60">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top:40px;">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="submitObjPanel">提交</button>
                <button type="submit" class="layui-btn" lay-submit lay-filter="close">取消</button>
            </div>
        </div>
    </form>
</div>
<%--反馈核查结果需要用户输入的信息--%>
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="feedbackCheckPanel">
    <form class="layui-form layui-form-pane" lay-filter="exampleForm">
        <div class="layui-form-item" style="margin-left:30px;">
            <div class="layui-inline">
                <label class="layui-form-label">核查结果</label>
                <div class="layui-input-inline">
                    <select id="rfIvrCheckResult">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">核查描述</label>
                <div class="layui-input-inline">
                    <input type="text" name="rfIvrCheckResultDesc" id="rfIvrCheckResultDesc" autocomplete="off"
                           class="layui-input"
                           maxlength="60">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top:40px;">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="submitFeedbackCheck">提交</button>
                <button type="submit" class="layui-btn" lay-submit lay-filter="closeFeedbackCheck">取消</button>
            </div>
        </div>
    </form>
</div>
<%--反馈更正结果需要用户输入的信息--%>
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="feedbackCorrectPanel">
    <form class="layui-form layui-form-pane" lay-filter="exampleForm">
        <div class="layui-form-item" style="margin-left:30px;">
            <div class="layui-inline">
                <label class="layui-form-label">异议更正结果</label>
                <div class="layui-input-inline">
                    <select id="fopoacrrCorrectResult">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">附件信息</label>
                <div class="layui-input-inline">
                    <input type="text" name="fopoacrrEnclosureInf" id="fopoacrrEnclosureInf" autocomplete="off"
                           class="layui-input"
                           maxlength="60">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">异议更正结果描述</label>
                <div class="layui-input-inline">
                    <input type="text" name="fopoacrrCorrectDesc" id="fopoacrrCorrectDesc" autocomplete="off"
                           class="layui-input"
                           maxlength="60">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top:40px;">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="submitFeedbackCorrect">提交</button>
                <button type="submit" class="layui-btn" lay-submit lay-filter="closeFeedbackCorrect">取消</button>
            </div>
        </div>
    </form>
</div>
<%--添加异议标注需要用户输入的信息--%>
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="addLabelPanel">
    <div class="layui-form-item" style="margin-top:40px;">
        <label class="layui-form-label">定位信息类别</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="addInputFun">+</button>
            <button type="button" class="layui-btn" id="deleteInputFun">-</button>
        </div>
    </div>
    <form class="layui-form layui-form-pane" lay-filter="exampleForm">
        <div class="layui-form-item" style="margin-left:30px;">
            <div class="layui-inline">
                <label class="layui-form-label">定位信息个数</label>
                <div class="layui-input-inline">
                    <input type="text" name="aplrLocateInfNm" id="aplrLocateInfNm" autocomplete="off"
                           class="layui-input"
                           maxlength="60">
                </div>
            </div>
            <div class="layui-inline" id="addLocateInfType">
                <div class="layui-inline" id="locateInfTypeExample">
                    <label class="layui-form-label">定位信息类别</label>
                    <div class="layui-input-inline">
                        <select id="locateInfType">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">异议说明</label>
                <div class="layui-input-inline">
                    <input type="text" name="aplrObjDesc" id="aplrObjDesc" autocomplete="off" class="layui-input"
                           maxlength="60">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top:40px;">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="submitAddLabel">提交</button>
                <button type="submit" class="layui-btn" lay-submit lay-filter="closeAddLabel">取消</button>
            </div>
        </div>
    </form>
</div>

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="detail">详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="delete">删除</a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
    <button class="layui-btn layui-btn-sm layui-btn-radius" style="width: 116px" lay-active="getObj" id="getObj">
        获取待核查异议
    </button>
    <button class="layui-btn layui-btn-sm layui-btn-radius" style="width: 116px" lay-active="getAnnex" id="getAnnex">
        获取异议附件
    </button>
    <button class="layui-btn layui-btn-sm layui-btn-radius" style="width: 116px" lay-active="feedbackCheck"
            id="feedbackCheck">反馈核查结果
    </button>
    <button class="layui-btn layui-btn-sm layui-btn-radius" style="width: 116px" lay-active="feedbackCorrect"
            id="feedbackCorrect">反馈更正结果
    </button>
    <button class="layui-btn layui-btn-sm layui-btn-radius" style="width: 116px" lay-active="queryAccept"
            id="queryAccept">更正接受情况查询
    </button>
    <button class="layui-btn layui-btn-sm layui-btn-radius" style="width: 116px" lay-active="addLabel" id="addLabel">
        添加标注
    </button>
    <button class="layui-btn layui-btn-sm layui-btn-radius" style="width: 116px" lay-active="deleteLabel"
            id="deleteLabel">删除标注
    </button>

</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<%--下拉选模板--%>
<script type="text/html" id="enumerationValueTpl">
    <option value="" data-id="">请选择</option>
    {{# layui.each(d.list, function(index, item){ }}
    <option value="{{item.value}}">{{item.name}}</option>
    {{#  }); }}
</script>
<script src="static/js/pecr/objectionHanding/personal/creditCenterPersonalObjection.js"></script>
</body>
</html>
