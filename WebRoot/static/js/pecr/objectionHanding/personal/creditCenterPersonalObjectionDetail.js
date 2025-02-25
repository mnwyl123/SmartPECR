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
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage', 'laytpl', 'util'], function () {
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
            arr: {"list": staticDict.idTypes},
            containerId: "idType"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.businessTypes},
            containerId: "businessType"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.existAnnexs},
            containerId: "enclosureFlag"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.universalCodes},
            containerId: "airmfResultCode"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.universalCodes},
            containerId: "afIvrResultCode"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.universalCodes},
            containerId: "fopoacrResultCode"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.universalCodes},
            containerId: "pocrasrResultCode"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.universalCodes},
            containerId: "aparResultCode"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.universalCodes},
            containerId: "darResultCode"
        });
        base.renderTpl({
            tplId: "enumerationValueTpl",
            arr: {"list": staticDict.existAnnexs},
            containerId: "airmfEnclosureFlag"
        });
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
            arr: {"list": staticDict.existAnnexs},
            containerId: "pocrasrCorrectAcceptFlag"
        });
        form.render('select');

        var ToCheckObjection = JSON.parse(document.getElementById("ToCheckObjection").value);

        //日期输入框  按css将所有的date组件渲染
        $(".datefield").each(function () {
            laydate.render({
                elem: this,
                trigger: 'click'
            });
        });
        //展示异议事项单
        $("#objCheckId").val(ToCheckObjection.OBJ_CHECK_ID);
        $("#objCheckNum").val(ToCheckObjection.OBJ_CHECK_NUM);
        $("#checkBeginDate").val(ToCheckObjection.CHECK_BEGIN_DATE);
        $("#name").val(ToCheckObjection.NAME);
        $("#idType").val(ToCheckObjection.ID_TYPE);
        $("#idNum").val(ToCheckObjection.ID_NUM);
        $("#phoneNum1").val(ToCheckObjection.PHONE_NUM);
        $("#objItemInf").val(ToCheckObjection.OBJ_ITEM_INF);
        $("#objItemDesc").val(ToCheckObjection.OBJ_ITEM_DESC);
        $("#dataProviderOrgCode").val(ToCheckObjection.DATA_PROVIDER_ORG_CODE);
        $("#dataOccurOrgCode").val(ToCheckObjection.DATA_OCCUR_ORG_CODE);
        $("#businessCode").val(ToCheckObjection.BUSINESS_CODE);
        $("#businessType").val(ToCheckObjection.BUSINESS_TYPE);
        $("#checkFinalDate").val(ToCheckObjection.CHECK_FINAL_DATE);
        $("#dataOccurDate").val(ToCheckObjection.DATA_OCCUR_DATE);
        $("#dataOccurAmount").val(ToCheckObjection.DATA_OCCUR_AMOUNT);
        $("#enclosureFlag").val(ToCheckObjection.ENCLOSURE_FLAG);
        $("#airmfResultCode").val(ToCheckObjection.AIRMF_RESULT_CODE);
        $("#airmfResultDesc").val(ToCheckObjection.AIRMF_RESULT_DESC);
        $("#airmfEnclosureFlag").val(ToCheckObjection.AIRMF_ENCLOSURE_FLAG);
        $("#airmfEnclosureInf").val(ToCheckObjection.AIRMF_ENCLOSURE_INF);
        $("#rfIvrCheckResult").val(ToCheckObjection.RFIVR_CHECK_RESULT);
        $("#rfIvrCheckResultDesc").val(ToCheckObjection.RFIVR_CHECK_RESULT_DESC);
        $("#afIvrResultCode").val(ToCheckObjection.AFIVR_RESULT_CODE);
        $("#afIvrResultDesc").val(ToCheckObjection.AFIVR_RESULT_DESC);
        $("#fopoacrrCorrectResult").val(ToCheckObjection.AFIVR_RESULT_DESC);
        $("#fopoacrrEnclosureInf").val(ToCheckObjection.FOPOACRR_ENCLOSURE_INF);
        $("#fopoacrrCorrectDesc").val(ToCheckObjection.FOPOACRR_CORRECT_DESC);
        $("#fopoacrResultCode").val(ToCheckObjection.FOPOACR_RESULT_CODE);
        $("#fopoacrResultDesc").val(ToCheckObjection.FOPOACR_RESULT_DESC);
        $("#pocrasrResultCode").val(ToCheckObjection.POCRASR_RESULT_CODE);
        $("#pocrasrResultDesc").val(ToCheckObjection.POCRASR_RESULT_DESC);
        $("#pocrasrCorrectAcceptFlag").val(ToCheckObjection.POCRASR_CORRECT_ACCEPT_FLAG);
        $("#pocrasrCorrectOpinion").val(ToCheckObjection.POCRASR_CORRECT_OPINION);
        $("#aplrLocateInfNm").val(ToCheckObjection.APLR_LOCATE_INF_NM);
        $("#aplrObjDesc").val(ToCheckObjection.APLR_OBJ_DESC);
        $("#aparResultCode").val(ToCheckObjection.APAR_RESULT_CODE);
        $("#aparResultDesc").val(ToCheckObjection.APAR_RESULT_DESC);
        $("#aparServiceReturnCode").val(ToCheckObjection.APAR_SERVICE_RETURN_CODE);
        $("#darResultCode").val(ToCheckObjection.DAR_RESULT_CODE);
        $("#darResultDesc").val(ToCheckObjection.DAR_RESULT_DESC);
        form.render('select');
        debugger
//展示历史核查信息
        table.render({
            elem: '#historicalCheckInfList' //表格所固定的div
            , url: 'indvObjWebService/getHistoricalCheckInfList.do?creditCenterObjHandingId=' + ToCheckObjection.CREDIT_CENTER_OBJ_HANDING_ID
            , cols: [[
                {type: 'numbers'}	//列每行序号
                , {field: 'historicalCheckInfId', hide: true, title: '主键ID', sort: true}
                , {align: "center", field: 'creditCenterObjHandingId', title: '关联主表ID'}
                , {align: "center", field: 'checkTime', hide: true, title: '处理核查时间'}
                , {align: "center", field: 'checkResult', title: '核查结果'}
                , {align: "center", field: 'checkResultDesc', title: '核查结果描述'}
                , {align: "center", field: 'checkOrgCode', title: '核查机构代码'}
                , {align: "center", field: 'checkUserCode', title: '核查用户代码'}
                , {align: "center", field: 'phoneNum', title: '有效联系电话'}
                , {align: "center", field: 'checkAcceptFlag', title: '是否接受核查结果'}
                , {align: "center", field: 'checkOpinion', hide: true, title: '核查处理意见'}
            ]]
            , even: true  //行斑马线
            , page: true //是否分页
            , limit: 10 //初始每页显示条数
            // , height: 'full-20'
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

        //展示个人标注定位信息
        table.render({
            elem: '#locateInfList' //表格所固定的div
            , url: 'indvObjWebService/getLocateInfList.do?creditCenterObjHandingId=' + ToCheckObjection.CREDIT_CENTER_OBJ_HANDING_ID
            , cols: [[
                {type: 'numbers'}	//列每行序号
                , {field: 'locateInfId', hide: true, title: '主键ID', sort: true}
                , {align: "center", hide: true, field: 'creditCenterObjHandingId', title: '关联主表ID'}
                , {align: "center", field: 'locateInfType', title: '定位信息类别'}
            ]]
            , even: true  //行斑马线
            , page: true //是否分页
            , limit: 10 //初始每页显示条数
            // , height: 'full-20'
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

        //禁用页面中的按钮和表单控件
        $(".layui-input").prop("disabled", true);
        $("select").not("#pushPullSelect").prop("disabled", true);
        form.render();
    });
});