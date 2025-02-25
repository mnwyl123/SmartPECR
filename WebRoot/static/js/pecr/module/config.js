/**
 * 系统配置
 * 项目中用到的公共配置信息
 */
define(['./base','./cookie'],function (base,cookie) {

    /**
     * api_project
     * 项目名称
     */
    // var pathName = window.location.pathname;
    var pathName = '/cirs/ghjkl';
    var api_project = pathName.substring(1,pathName.substr(1).indexOf('/') + 1);
    /**
     * api_host
     * 项目基础路径
     */
    var api_host = window.location.protocol + "//" + window.location.host + "/" + api_project + "/api/";
    /**
     * 获取用户信息
     */
    var userName = cookie.get_userName();
    if (!userName && window.location.href.indexOf("/login.html") === -1){
        // window.location.href = window.location.protocol + "//" + window.location.host + "/" + api_project + "/login.html";
        $("#loading").remove();
        $("#layui-layout-admin").show();
    }else{

        $("#loading").remove();
        $("#layui-layout-admin").show();
        //针对layui框架中laypage模块bug统一处理
        $(document).on("change",".layui-laypage-skip .layui-input",function () {
            var $this = $(this),
                $count = parseInt($this.parent().prev().prev().text()),
                $curr = $this.val();
            if ($curr > $count){
                $this.val($count);
                return false;
            }
        });
        //针对layui框架中form模块统一限制input长度
        $(document).on("input",".layui-input",function () {
            var $this = $(this);
            if ($this.val().length > 120){
                $this.val($this.val().slice(0,120));
                return false;
            }
        });
        //针对layui框架中table模块点击单元td弹出详细信息，重新渲染表格时不关闭弹窗的bug
        $(document).on("click",".layui-table-view tr",function (e) {
            var event = e || window.event;
            event.stopPropagation();
        });
        $(document).on("click",function () {
            $(".layui-table-tips-c").click();
        });
        //自动给页面中所有input输入框增加autocomplete属性为了实现不缓存用户历史输入
        $("input[type='text'],input[type='number']").attr("autocomplete","off");
    }
    /**
     * pageSize
     * 系统统一数据表格每页显示条数
     */
    var pageSize = cookie.get_pageSize();
    /**
     * 系统统一查询分页接口默认传递一个最大值查询所有数据时的默认值
     */
    var maxPageSize = 999;
    /**
     * 树节点默认第一个选中延迟加载时间
     */
    var treeDefaultSelectTimeOut = 600;
    /**
     * 自动加载异步树延迟时间
     */
    var treeAutoLoadTimeOut = 800;
    /**
     * 查询默认页面延迟时间，为了确保多法人逻辑中加载的iframe页面加载完成
     */
    var queryDefaultOpenPageTimeOut = 600;

    /**
     * 登陆方式配置
     * account: 账号密码登陆方式[true:开启,false:关闭]
     * phone: 短信验证码登陆方式[true:开启,false:关闭]
     * concatenation: 账号密码短信验证码级联登陆方式[true:开启,false:关闭]
     */
    var loginType = {
        account : true,
        phone : false,
        concatenation : false
    };

    /**
     * 系统统一数据表格排序字段配置
     * 1-将排序页面js逻辑中查询列表的方法暴露给window对象
     * 2-将排序页面js逻辑中查询列表的方法中添加orderByClause参数
     * 3-将排序页面js逻辑中查询列表的方法中请求参数para对象添加属性(para.orderByClause = orderByClause;)
     */
    var sortTableField = [
        { //demo
            page : '/view/demo/demo.html', //页面路径
            sort : [
                {
                    name : '系统编号', //点击排序按钮弹出层中展示的名称
                    field : 'SYSTEM_CODE' //点击弹出层中查询按钮发送给后台的字段名称
                },
                {
                    name : '系统英文名称',
                    field : 'SYSTEM_EN'
                },
                {
                    name : '系统中文名称',
                    field : 'SYSTEM_CN'
                }
            ],
            method : function (orderByClause) { //排序页面查询列表的方法
                initList($("#dataPage").find(".layui-input").val(),orderByClause);
            }
        }
    ];

    /**
     * 客户归集映射关系
     */
    var customerCollectionMapRelation = [
        {
            name : "个人基本信息记录",
            infRecType : "110",
            interface : "paaBsSgmt",
            tableName : "paaBsSgmt",
            url : "view/personBaseInfo/personBaseInfoEdit.html"
        },
        {
            name : "个人基本信息整笔删除请求记录",
            infRecType : "114",
            interface : "payInBsInfDlt",
            tableName : "payInBsInfDlt",
            url : "view/personBaseInfo/personBaseInfoEntireDelEdit.html"
        },
        {
            name : "个人证件有效期信息记录",
            infRecType : "130",
            interface : "pakInIDEfctInf",
            tableName : "pakInIdEfctInf",
            url : "view/personPeriodInfo/personPeriodInfoEdit.html"
        },
        {
            name : "个人证件有效期信息整笔删除请求记录",
            infRecType : "134",
            interface : "pazInIdEfctInfDlt",
            tableName : "pazInIdEfctInfDlt",
            url : "view/personPeriodInfo/personPeriodInfoEntireDelEdit.html"
        },
        {
            name : "家族关系信息记录",
            infRecType : "120",
            interface : "pajInFalMmbsInf",
            tableName : "pajInFalMmbsInf",
            url : "view/personFamilyInfo/personFamilyInfoEdit.html"
        },
        {
            name : "个人授信协议信息记录",
            infRecType : "220",
            interface : "pcaCtrctBsSgmt",
            tableName : "pcaCtrctBsSgmt",
            url : "view/personProtocolInfo/personProtocolInfoEdit.html"
        },
        {
            name : "个人授信协议整笔删除请求记录",
            infRecType : "224",
            interface : "pczInCtrctEntDel",
            tableName : "pczInCtrctEntDel",
            url : "view/personProtocolInfo/personProtocolInfoEntireDelEdit.html"
        },
        {
            name : "个人授信协议标识变更请求记录",
            infRecType : "221",
            interface : "pcwInCtrctidCagsInf",
            tableName : "pcwInCtrctidCagsInf",
            url : "view/personProtocolInfo/personProtocolInfoIdChangeEdit.html"
        },
        {
            name : "个人授信协议按段删除请求记录",
            infRecType : "223",
            interface : "pcyInCtrctDel",
            tableName : "pcyInCtrctDel",
            url : "view/personProtocolInfo/personProtocolInfoSegmentDelEdit.html"
        },
        {
            name : "个人授信协议按段更正请求记录",
            infRecType : "222",
            interface : "pcaCtrctBsSgmt",
            tableName : "pcaCtrctBsSgmt",
            url : "view/personProtocolInfo/personProtocolInfoSegmentChangeEdit.html"
        },
        {
            name : "个人担保账户信息记录",
            infRecType : "230",
            interface : "pdaGuarAcctBsSgmt",
            tableName : "pdaGuarAcctBsSgmt",
            url : "view/personGuaranteeInfo/personGuaranteeInfoEdit.html"
        },
        {
            name : "个人担保账户整笔删除请求记录",
            infRecType : "234",
            interface : "pdzInSecAcctEntDel",
            tableName : "pdzInSecAcctEntDel",
            url : "view/personGuaranteeInfo/personGuaranteeInfoEntireDelEdit.html"
        },
        {
            name : "个人担保账户标识变更请求记录",
            infRecType : "231",
            interface : "pdwInsecacctidCagsinf",
            tableName : "pdwInsecacctidCagsinf",
            url : "view/personGuaranteeInfo/personGuaranteeInfoIdChangeEdit.html"
        },
        {
            name : "个人担保账户按段删除请求记录",
            infRecType : "233",
            interface : "pdyInSecAcctDel",
            tableName : "pdyInSecAcctDel",
            url : "view/personGuaranteeInfo/personGuaranteeInfoSegmentDelEdit.html"
        },
        {
            name : "个人担保账户按段更正请求记录",
            infRecType : "232",
            interface : "pdaGuarAcctBsSgmt",
            tableName : "pdaGuarAcctBsSgmt",
            url : "view/personGuaranteeInfo/personGuaranteeInfoSegmentChangeEdit.html"
        },
        {
            name : "个人借贷账户信息记录",
            infRecType : "210",
            interface : "pbaAcctBsSgmt",
            tableName : "pbaAcctBsSgmt",
            url : "view/personLoanInfo/personLoanInfoEdit.html"
        },
        {
            name : "个人借贷账户整笔删除请求记录",
            infRecType : "214",
            interface : "pbzInAcctEntDel",
            tableName : "pbzInAcctEntDel",
            url : "view/personLoanInfo/personLoanInfoEntireDelEdit.html"
        },
        {
            name : "个人借贷账户标识变更请求记录",
            infRecType : "211",
            interface : "pbwInAcctIdCagsInf",
            tableName : "pbwInAcctIdCagsInf",
            url : "view/personLoanInfo/personLoanInfoIdChangeEdit.html"
        },
        {
            name : "个人借贷账户按段删除请求记录",
            infRecType : "213",
            interface : "pbyInAcctDel",
            tableName : "pbyInAcctDel",
            url : "view/personLoanInfo/personLoanInfoSegmentDelEdit.html"
        },
        {
            name : "个人借贷账户按段更正请求记录",
            infRecType : "212",
            interface : "pbaAcctBsSgmt",
            tableName : "pbaAcctBsSgmt",
            url : "view/personLoanInfo/personLoanInfoSegmentChangeEdit.html"
        },
        {
            name : "个人借贷账户特殊事件说明记录",
            infRecType : "215",
            interface : "pbkInSpcEvtDscInf",
            tableName : "pbkInSpcEvtDscInf",
            url : "view/personLoanInfo/personLoanInfoSpecialEventEdit.html"
        },
        {
            name : "企业基本信息记录",
            infRecType : "310",
            interface : "eaaBsSgmt",
            tableName : "eaaBsSgmt",
            url : "view/enterpriseBaseInfo/enterpriseBaseInfoEdit.html"
        },
        {
            name : "企业基本信息整笔删除请求记录",
            infRecType : "314",
            interface : "eazEnBsInfDlt",
            tableName : "eazEnBsInfDlt",
            url : "view/enterpriseBaseInfo/enterpriseBaseInfoEntireDelEdit.html"
        },
        {
            name : "企业借贷账户信息记录",
            infRecType : "410",
            interface : "edaAcctBsSgmt",
            tableName : "edaAcctBsSgmt",
            url : "view/enterpriseLoanInfo/enterpriseLoanInfoEdit.html"
        },
        {
            name : "企业借贷账户整笔删除请求记录",
            infRecType : "414",
            interface : "edzEnAcctInfEntDel",
            tableName : "edzEnAcctInfEntDel",
            url : "view/enterpriseLoanInfo/enterpriseLoanInfoEntireDelEdit.html"
        },
        {
            name : "企业借贷账户标识变更请求记录",
            infRecType : "411",
            interface : "edwEnAcctInfIdCagsInf",
            tableName : "edwEnAcctInfIdCagsInf",
            url : "view/enterpriseLoanInfo/enterpriseLoanInfoIdChangeEdit.html"
        },
        {
            name : "企业借贷账户按段删除请求记录",
            infRecType : "413",
            interface : "edyEnAcctInfDel",
            tableName : "edyEnAcctInfDel",
            url : "view/enterpriseLoanInfo/enterpriseLoanInfoSegmentDelEdit.html"
        },
        {
            name : "企业借贷账户按段更正请求记录",
            infRecType : "412",
            interface : "edaAcctBsSgmt",
            tableName : "edaAcctBsSgmt",
            url : "view/enterpriseLoanInfo/enterpriseLoanInfoSegmentChangeEdit.html"
        },
        {
            name : "企业担保账户信息记录",
            infRecType : "440",
            interface : "eeaGuarAcctBsSgmt",
            tableName : "eeaGuarAcctBsSgmt",
            url : "view/enterpriseGuaranteeInfo/enterpriseGuaranteeInfoEdit.html"
        },
        {
            name : "企业担保账户整笔删除请求记录",
            infRecType : "444",
            interface : "eezEnSecAcctEntDelSgmt",
            tableName : "eezEnSecAcctEntDelSg",
            url : "view/enterpriseGuaranteeInfo/enterpriseGuaranteeInfoEntireDelEdit.html"
        },
        {
            name : "企业担保账户标识变更请求记录",
            infRecType : "441",
            interface : "eewEnSecAcctIdCagsInf",
            tableName : "eewEnSecAcctIdCagsInf",
            url : "view/enterpriseGuaranteeInfo/enterpriseGuaranteeInfoIdChangeEdit.html"
        },
        {
            name : "企业担保账户按段删除请求记录",
            infRecType : "443",
            interface : "eeyEnSecAcctDel",
            tableName : "eeyEnSecAcctDel",
            url : "view/enterpriseGuaranteeInfo/enterpriseGuaranteeInfoSegmentDelEdit.html"
        },
        {
            name : "企业担保账户按段更正请求记录",
            infRecType : "442",
            interface : "eeaGuarAcctBsSgmt",
            tableName : "eeaGuarAcctBsSgmt",
            url : "view/enterpriseGuaranteeInfo/enterpriseGuaranteeInfoSegmentChangeEdit.html"
        },
        {
            name : "企业授信协议信息记录",
            infRecType : "420",
            interface : "egaCtrctBsSgmt",
            tableName : "egaCtrctBsSgmt",
            url : "view/enterpriseProtocolInfo/enterpriseProtocolInfoEdit.html"
        },
        {
            name : "企业授信协议整笔删除请求记录",
            infRecType : "424",
            interface : "egzEnCtrctInfEntDel",
            tableName : "egzEnCtrctInfEntDel",
            url : "view/enterpriseProtocolInfo/enterpriseProtocolInfoEntireDelEdit.html"
        },
        {
            name : "企业授信协议标识变更请求记录",
            infRecType : "421",
            interface : "egwEnAcctInfIdCagsInf",
            tableName : "egwEnAcctInfIdCagsInf",
            url : "view/enterpriseProtocolInfo/enterpriseProtocolInfoIdChangeEdit.html"
        },
        {
            name : "企业授信协议按段删除请求记录",
            infRecType : "423",
            interface : "egyEnCtrctInfDel",
            tableName : "egyEnCtrctInfDel",
            url : "view/enterpriseProtocolInfo/enterpriseProtocolInfoSegmentDelEdit.html"
        },
        {
            name : "企业授信协议按段更正请求记录",
            infRecType : "422",
            interface : "egaCtrctBsSgmt",
            tableName : "egaCtrctBsSgmt",
            url : "view/enterpriseProtocolInfo/enterpriseProtocolInfoSegmentChangeEdit.html"
        },
        {
            name : "抵(质)押合同信息记录",
            infRecType : "510",
            interface : "efaMotgaCltalCtrctBsSgmt",
            tableName : "efaMotgaCltalCtrctBs",
            url : "view/enterprisePledgeInfo/enterprisePledgeInfoEdit.html"
        },
        {
            name : "抵(质)押合同整笔删除请求记录",
            infRecType : "514",
            interface : "efzMocEntDel",
            tableName : "efzMocEntDel",
            url : "view/enterprisePledgeInfo/enterprisePledgeInfoEntireDelEdit.html"
        },
        {
            name : "抵(质)押合同标识变更请求记录",
            infRecType : "511",
            interface : "efwMocIdCagsInf",
            tableName : "efwMocIdCagsInf",
            url : "view/enterprisePledgeInfo/enterprisePledgeInfoIdChangeEdit.html"
        },
        {
            name : "企业资产负债表信息记录",
            infRecType : "610",
            interface : "ehaBalanceSheetBsSgmt",
            tableName : "ehaBalanceSheetBsSgmt",
            url : "view/enterpriseAssetsInfo/enterpriseAssetsInfoEdit.html"
        },
        {
            name : "企业资产负债表整笔删除请求记录",
            infRecType : "614",
            interface : "emzBalanceSheetDlt",
            tableName : "emzBalanceSheetDlt",
            url : "view/enterpriseAssetsInfo/enterpriseAssetsInfoEntireDelEdit.html"
        },
        {
            name : "企业现金流量表信息记录",
            infRecType : "630",
            interface : "ejaCashFlowsBsSgmt",
            tableName : "ejaCashFlowsBsSgmt",
            url : "view/enterpriseCashInfo/enterpriseCashInfoEdit.html"
        },
        {
            name : "企业现金流量表整笔删除请求记录",
            infRecType : "634",
            interface : "emzBalanceSheetDlt",
            tableName : "emzBalanceSheetDlt",
            url : "view/enterpriseCashInfo/enterpriseCashInfoEntireDelEdit.html"
        },
        {
            name : "企业利润及利润分配表信息记录",
            infRecType : "620",
            interface : "eiaIncomeStatementProfitAp",
            tableName : "eiaIncomeStatementProfit",
            url : "view/enterpriseProfitInfo/enterpriseProfitInfoEdit.html"
        },
        {
            name : "企业利润及利润分配表整笔删除请求记录",
            infRecType : "624",
            interface : "emzBalanceSheetDlt",
            tableName : "emzBalanceSheetDlt",
            url : "view/enterpriseProfitInfo/enterpriseProfitInfoEntireDelEdit.html"
        },
        {
            name : "事业单位资产负债表信息记录",
            infRecType : "640",
            interface : "ekaInstitutionBalanceSheet",
            tableName : "ekaInstitutionBalanceSht",
            url : "view/enterpriseDebtInfo/enterpriseDebtInfoEdit.html"
        },
        {
            name : "事业单位资产负债表整笔删除请求记录",
            infRecType : "644",
            interface : "emzBalanceSheetDlt",
            tableName : "emzBalanceSheetDlt",
            url : "view/enterpriseDebtInfo/enterpriseDebtInfoEntireDelEdit.html"
        },
        {
            name : "事业单位收入支出表信息记录",
            infRecType : "650",
            interface : "elaIncomeAndExpenseStateme",
            tableName : "elaIncomeAndExpenseStat",
            url : "view/enterpriseIncomeInfo/enterpriseIncomeInfoEdit.html"
        },
        {
            name : "事业单位收入支出表整笔删除请求记录",
            infRecType : "654",
            interface : "emzBalanceSheetDlt",
            tableName : "emzBalanceSheetDlt",
            url : "view/enterpriseIncomeInfo/enterpriseIncomeInfoEntireDelEdit.html"
        },
        {
            name : "企业间关联关系信息记录",
            infRecType : "350",
            interface : "ecaEnIcdnRltpInf",
            tableName : "ecaEnIcdnRltpInf",
            url : "view/enterpriseAssociationInfo/enterpriseAssociationInfoEdit.html"
        }
    ];

    /**
     * 页面访问权限控制
     */
    var queryPageLimit = function () {
        if ($("#loadModel").html()){ //阻止加载的排序页面调用此接口
            return false;
        }
        if (window.location.pathname.indexOf(".html") !== -1 && window.location.pathname.indexOf("/index.html") === -1 && window.location.pathname.indexOf("/login.html") === -1){
            var url = window.location.href;
            if (url.indexOf('limit=no') === -1){ //需要校验该页面是否有权限访问

                if (url.indexOf('sysFunctionId') !== -1){
                    var urlStr = url.split('sysFunctionId')[0];
                    url = urlStr.substr(0,urlStr.length-1)
                }

                // var para = {};
                // para.page = url;
                // EasyAjax.get_json({
                //         url: api_host + "system/pagePermissionCheck",
                //         data: para,
                //         async: false
                //     },
                //     function (data) {
                        $(".wrap").show().append('<div id="loadModel"></div>');
                        $("#loadModel").load('../tableSort/tableSort.html');
                    // });
            }else{
                $(".wrap").show(); //不需要校验该页面是否有权限访问
            }
        }
    };

    /**
     * 查询系统配置信息
     */
    var querySystemConfig = function () {
        if ($("#loadModel").html()){ //阻止加载的排序页面调用此接口
            return false;
        }
        var para = {};
        EasyAjax.post_json({
                url: api_host + "sysConfig/selectSysConfigs",
                data: para
            },
            function (data) {
                for (var i = 0; i < data.result.length; i++){
                    if (data.result[i].configName === 'SYSTEM_TITLE'){ //系统名称
                        document.title = data.result[i].dataValue;
                        $("#systemTitle").html(data.result[i].dataValue);
                    }
                    if (data.result[i].configName === 'PASSWORD_COMPLEXITY'){ //密码格式校验
                        $("#equalPassword").data("passwordComplexity",data.result[i].dataValue);
                    }
                }
            });
    };

    /**
     * 查询页面功能按钮权限
     */
    var queryFunctionBtnLimit = function () {
        if ($("#loadModel").html()){ //阻止加载的排序页面调用此接口
            return false;
        }
        var sysFunctionId = base.getrequest('sysFunctionId');
        if (sysFunctionId){
            var para = {};
            para.sysFunctionId = sysFunctionId;
            EasyAjax.get_json({
                    url: api_host + "system/pageButtonPermissionCheck",
                    data: para
                },
                function (data) {
                    var limitStr = JSON.stringify(data.result);
                    $("[data-limit]").each(function (index,ele) {
                        var $this = $(this);
                        if (limitStr.indexOf('"buttonFlag":' + '"' + $this.data("limit") + '"') !== -1){
                            $this.css({
                                "visibility" : "visible"
                            });
                        }else{
                            $this.remove();
                        }
                    });
                });
        }
    };

    /**
     * 系统填报页面客户归集功能
     */
    var customerCollection = function () {
        if ($("#loadModel").html()){ //阻止加载的排序页面调用此接口
            return false;
        }
        var pathname = window.location.pathname;
        if (pathname.indexOf("Edit") !== -1 && pathname.indexOf("LoanInfoEdit.html") === -1 && pathname.indexOf("LoanInfoSegmentChangeEdit.html") === -1){
            var dataObj = null;
            if (pathname.indexOf("LoanInfoEdit") !== -1 || pathname.indexOf("LoanInfoSegmentChangeEdit") !== -1){
                dataObj = window.parent.parent.$("body").data("dataObj");
            }else{
                dataObj = window.parent.$("body").data("dataObj");
            }
            if (dataObj){
                var url = "";
                var para = {};
                para.rptDate = dataObj.rptDate;
                var name = dataObj.name || dataObj.entName;
                var type = dataObj.idType || dataObj.entCertType || dataObj.certType;
                var num = dataObj.idNum || dataObj.entCertNum || dataObj.certNum;
                if (pathname.indexOf("person") !== -1){
                    url = "pernotionalpooling";
                    para.perName = name;
                    para.perCertType = type;
                    para.perCertNum = num;
                }else if (pathname.indexOf("enterprise") !== -1){
                    url = "entnotionalpooling";
                    para.entName = name;
                    para.entCertType = type;
                    para.entCertNum = num;
                }else{
                    return false;
                }
                EasyAjax.post_json({
                        url: api_host + url + "/info",
                        data: para
                    },
                    function (data) {
                        var render = function (data) {
                            var s = "";
                            s += "<div class='customer-collection-list' style='width: 20%;position: fixed;right: 0;bottom: 20px;overflow: auto;'>";
                            for (var i in data.result){
                                if (data.result[i] && data.result[i].length){
                                    var customerCollectionArr = data.result[i];
                                    var id = "";
                                    var name = "";
                                    var url = "";
                                    for (var k in customerCollectionMapRelation){
                                        if (customerCollectionMapRelation[k].infRecType === customerCollectionArr[0].infRecType){
                                            id = customerCollectionMapRelation[k].tableName + "Id";
                                            name = customerCollectionMapRelation[k].name;
                                            url = customerCollectionMapRelation[k].url;
                                        }
                                    }
                                    s += "<div class='customer-collection-item'><p style='padding: 5px;color: #333;'>" + name + "</p>";
                                    for (var j = 0;j < customerCollectionArr.length;j++){
                                        if (dataObj[id] === customerCollectionArr[j][id]){
                                            s += "<a href='javascript:void(0);' class='customer-collection-seq' style='display: inline-block;width: 20px;height: 20px;text-align: center;line-height: 20px;background-color: #588fd0;color: #fff;margin: 5px;border-radius: 50%;'>" + parseInt(j + 1) + "</a>";
                                        }else{
                                            s += "<a href='javascript:void(0);' data-url='" + url +  "' data-key='" + i + "' data-seq='" + j + "' class='customer-collection-seq' style='display: inline-block;width: 20px;height: 20px;text-align: center;line-height: 20px;background-color: #ccc;color: #fff;margin: 5px;border-radius: 50%;'>" + parseInt(j + 1) + "</a>";
                                        }
                                    }
                                    s += "</div>";
                                }
                            }
                            s += "</div>";
                            $(".wrap").prepend(s);
                            $(".customer-collection-list").css("top",$(".posit_fixed").outerHeight() + 20);
                            $(".customer-collection-list").find(".customer-collection-seq").on("click",function () {
                                var $this = $(this);
                                var url = $this.data("url");
                                var key = $this.data("key");
                                var seq = $this.data("seq");
                                if (url){
                                    if (window.parent.$("body").data("dataObj")){
                                        window.parent.$("body").data("dataObj",data.result[key][seq]);
                                        window.location.href = "../../" + url + ((data.result[key][seq].businessStates === 'VN' || data.result[key][seq].businessStates === 'VS' || data.result[key][seq].businessStates === 'VF' || data.result[key][seq].businessStates === 'AR' || data.result[key][seq].businessStates === 'RKSB') ? "" : "?type=detail");
                                    }else if (window.parent.parent.$("body").data("dataObj")){
                                        window.parent.parent.$("body").data("dataObj",data.result[key][seq]);
                                        window.parent.location.href = "../../" + url + ((data.result[key][seq].businessStates === 'VN' || data.result[key][seq].businessStates === 'VS' || data.result[key][seq].businessStates === 'VF' || data.result[key][seq].businessStates === 'AR' || data.result[key][seq].businessStates === 'RKSB') ? "" : "?type=detail");
                                    }else{
                                        return false;
                                    }
                                }
                            });
                        };
                        if (pathname.indexOf("enterprisePledgeInfo") !== -1){
                            var para = {};
                            para.rptDate = dataObj.rptDate;
                            para.perName = dataObj.name || dataObj.entName;
                            para.perCertType = dataObj.idType || dataObj.entCertType || dataObj.certType;
                            para.perCertNum = dataObj.idNum || dataObj.entCertNum || dataObj.certNum;
                            EasyAjax.post_json({
                                    url: api_host + "pernotionalpooling/info",
                                    data: para
                                },
                                function (data2) {
                                    $.extend(true,data,data2);
                                    render(data);
                                });
                        }else{
                            render(data);
                        }
                    });
            }
        }
    };

    /**
     * 系统填报页面展示反馈报文错误信息功能
     */
    var feedbackMessageErrorShow = function () {
        if ($("#loadModel").html()){ //阻止加载的排序页面调用此接口
            return false;
        }
        var pathname = window.location.pathname;
        if (pathname.indexOf("Edit") !== -1 && pathname.indexOf("LoanInfoEdit.html") === -1 && pathname.indexOf("LoanInfoSegmentChangeEdit.html") === -1){
            var dataObj = null;
            if (pathname.indexOf("LoanInfoEdit") !== -1 || pathname.indexOf("LoanInfoSegmentChangeEdit") !== -1){
                dataObj = window.parent.parent.$("body").data("dataObj");
            }else{
                dataObj = window.parent.$("body").data("dataObj");
            }
            if (dataObj){
                for (var k in customerCollectionMapRelation){
                    if (customerCollectionMapRelation[k].infRecType === dataObj.infRecType){
                        /*var para = {};
                        para.reportMessageType = dataObj.infRecType;
                        para.recordId = dataObj[customerCollectionMapRelation[k].tableName + "Id"];
                        EasyAjax.post_json({
                                url: api_host + "feedBackReportErrorMessage/select",
                                data: para
                            },
                            function (data) {
                                var s = "";
                                s += "<div class='feedback-message-error-box' style='width: 80%;padding: 5px;line-height: 20px;'>";
                                for (var i = 0;i < data.result.length;i++){
                                    s += "<span style='color: #f00;'>" + parseInt(i + 1) + "." + data.result[i].errorMessage + "</span>";
                                }
                                s += "</div>";
                                $(".wrap").prepend(s);
                            });*/
                        return false;
                    }
                }
            }
        }
    };

    /**
     * 系统填报页面推拉展示功能
     */
    var pushPullShow = function () {
        if ($("#loadModel").html()){ //阻止加载的排序页面调用此接口
            return false;
        }
        var pathname = window.location.pathname;
        if (pathname.indexOf("Edit") !== -1 && pathname.indexOf("LoanInfoEdit.html") === -1 && pathname.indexOf("LoanInfoSegmentChangeEdit.html") === -1){
            var dataObj = null;
            if (pathname.indexOf("LoanInfoEdit") !== -1 || pathname.indexOf("LoanInfoSegmentChangeEdit") !== -1){
                dataObj = window.parent.parent.$("body").data("dataObj");
            }else{
                dataObj = window.parent.$("body").data("dataObj");
            }
            if (dataObj){
                var url = "";
                var para = {};
                para.reportType = dataObj.infRecType;
                var name = dataObj.name || dataObj.entName;
                var type = dataObj.idType || dataObj.entCertType || dataObj.certType;
                var num = dataObj.idNum || dataObj.entCertNum || dataObj.certNum;
                if (pathname.indexOf("person") !== -1){
                    url = "personalDataView";
                    para.personName = name;
                    para.personIdType = type;
                    para.personIdNum = num;
                }else if (pathname.indexOf("enterprise") !== -1){
                    url = "enterpriseDataView";
                    para.entName = name;
                    para.entCertType = type;
                    para.entCertNum = num;
                }else{
                    return false;
                }
                EasyAjax.post_json({
                        url: api_host + url + "/selectList",
                        data: para
                    },
                    function (data) {
                        if (data.result && data.result.length){
                            var id = "";
                            var interface = "";
                            var url = "";
                            var s = "";
                            s += "<div class='push-pull-select layui-form'><div class='layui-inline' style='padding: 5px;'><div class='layui-input-inline'>";
                            s += "<select lay-filter='pushPullSelect' id='pushPullSelect'>";
                            for (var k in customerCollectionMapRelation){
                                if (customerCollectionMapRelation[k].infRecType === dataObj.infRecType){
                                    id = customerCollectionMapRelation[k].tableName + "Id";
                                    interface = customerCollectionMapRelation[k].interface;
                                    url = customerCollectionMapRelation[k].url;
                                }
                            }
                            for (var i = 0;i < data.result.length;i++){
                                if (dataObj[id] === data.result[i].primaryKey){
                                    s += "<option value='" + data.result[i].primaryKey + "' selected>" + data.result[i].rptDate + " [" + parseInt(i + 1) + "]" + "</option>";
                                }else{
                                    s += "<option value='" + data.result[i].primaryKey + "'>" + data.result[i].rptDate + " [" + parseInt(i + 1) + "]" + "</option>";
                                }
                            }
                            s += "</select>";
                            s += "</div></div></div>";
                            $(".wrap").prepend(s);
                            form.render('select');
                            form.on('select(pushPullSelect)', function(data){
                                var para = {};
                                para.infRecType = dataObj.infRecType;
                                para[id] = data.value;
                                EasyAjax.post_json({
                                        url: api_host + interface + "/select",
                                        data: para
                                    },
                                    function (data) {
                                        if (window.parent.$("body").data("dataObj")){
                                            window.parent.$("body").data("dataObj",data.result);
                                            window.location.href = "../../" + url + ((data.result.businessStates === 'VN' || data.result.businessStates === 'VS' || data.result.businessStates === 'VF' || data.result.businessStates === 'AR' || data.result.businessStates === 'RKSB') ? "" : "?type=detail");
                                        }else if (window.parent.parent.$("body").data("dataObj")){
                                            window.parent.parent.$("body").data("dataObj",data.result);
                                            window.parent.location.href = "../../" + url + ((data.result.businessStates === 'VN' || data.result.businessStates === 'VS' || data.result.businessStates === 'VF' || data.result.businessStates === 'AR' || data.result.businessStates === 'RKSB') ? "" : "?type=detail");
                                        }else{
                                            return false;
                                        }
                                    });
                            });
                        }
                    });
            }
        }
    };

    /**
     * 页面初始化
     */

    $.cookie("callbackLock",false,{path:"/"}); //页面加载时先进性给登陆超时锁解锁操作

    queryPageLimit(); //页面访问权限控制

    if (window.location.pathname.indexOf(".html") !== -1 && window.location.href.indexOf("/login.html") === -1 && window.location.href.indexOf("/index.html") === -1 && window.location.href.indexOf("/personCenter.html") === -1){
        // queryFunctionBtnLimit(); //查询页面功能按钮权限
    }else{
        // querySystemConfig(); //查询系统配置信息
    }

    customerCollection(); //客户归集

    feedbackMessageErrorShow(); //反馈报文错误信息展示

    pushPullShow(); //推拉展示

    return{
        api_project : api_project,
        api_host : api_host,
        pageSize : pageSize,
        maxPageSize : maxPageSize,
        treeDefaultSelectTimeOut : treeDefaultSelectTimeOut,
        treeAutoLoadTimeOut : treeAutoLoadTimeOut,
        queryDefaultOpenPageTimeOut : queryDefaultOpenPageTimeOut,
        loginType : loginType,
        sortTableField : sortTableField,
        customerCollectionMapRelation : customerCollectionMapRelation
    }
});