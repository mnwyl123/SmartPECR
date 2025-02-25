/**
 * 基础服务
 * 项目中用到的公共方法
 */
define([],function () {
    /**
     * renderTpl
     * 模板渲染
     */
    var renderTpl = function (config) {
		var getTpl = document.getElementById(''+config.tplId).innerHTML,
		    containerId = document.getElementById('' + config.containerId);
		if(containerId != null){
			laytpl(getTpl).render(config.arr, function(html){
				containerId.innerHTML = html;
			});
		}
		
    };
	
	/**
     * renderTpl append方式
     * 模板渲染
     */
    var renderAppendTpl = function (config) {
        var $tpl = $("#" + config.tplId).render(config.arr);
        if (config.type == "html"){
            $("#" + config.containerId).html($tpl);
        }else if (config.type == "append"){
            $("#" + config.containerId).append($tpl);
        }else{
            return false;
        }
    };
	
    /**
     * tableSelected
     * 单元行选中
     * 单选
     */
    var tableSelected = function (ele) {
        $(document).on("click",ele + "+.layui-table-view tr",function () {
            $(ele + "+.layui-table-view tr").removeAttr("style");
            $(this).css({
                "background-color" : "#f2f2f2",
                "color" : "#588fd0"
            });
        });
    };
    /**
     * tableSelected
     * 单元行选中
     * 多选
     */
    var tableSelectedDouble = function (ele) {
        $(document).on("click",ele + "+.layui-table-view tr",function () {
            var $this = $(this);
            if ($this.hasClass("active")){
                $this.removeAttr("style").removeClass("active");
            }else{
                $this.css({
                    "background-color" : "#f2f2f2",
                    "color" : "#588fd0"
                }).addClass("active");
            }
        });
    };
    /**
     * formatDate
     * 格式化日期
     */
    var formatDate = function(date){
        if (date.getTime() === 0){ //为了解决接口返回null值字段格式化成1970年的BUG
            return{
                year : null,
                month : null,
                day : null,
                ymd : null,
                completeDate : null
            };
        }
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();
        var second = date.getSeconds();
        if(month < 10){
            month = "0" + month;
        }
        if(day < 10){
            day = "0" + day;
        }
        if(hour < 10){
            hour = "0" + hour;
        }
        if(minute < 10){
            minute = "0" + minute;
        }
        if(second < 10){
            second = "0" + second;
        }
        return{
            year : year,
            month : month,
            day : day,
            ym : year + "-" + month,
            ymd : year + "-" + month + "-" + day,
            completeDate : year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second
        }
    };
    /**
     * formatMoney
     * 格式化数字
     */
    var formatMoney = function(s, type){
        if (/[^0-9\.]/.test(s))
            return "0.00";
        if (s === null || s === "null" || s === "")
            return "0.00";
        s = s.toString().replace(/^(\d*)$/, "$1.");
        s = (s + "00").replace(/(\d*\.\d\d)\d*/, "$1");
        s = s.replace(".", ",");
        var re = /(\d)(\d{3},)/;
        while (re.test(s))
            s = s.replace(re, "$1,$2");
        s = s.replace(/,(\d\d)$/, ".$1");
        if (type === 0) {
            var a = s.split(".");
            if (a[1] === "00") {
                s = a[0];
            }
        }
        return s;
    };
    /**
     * getrequest
     * 地址栏参数解析
     */
    var getrequest = function (name,isParent) {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = isParent ? window.parent.location.search.substr(1).match(reg) : window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    };
    /**
     * changeHump
     * 表字段字符串转驼峰
     */
    var changeHump = function(str){
        var arr = str.split("_");
        for(var i = 0;i < arr.length;i++){
            arr[i] = arr[i].toLowerCase();
            if (i !== 0 && arr[i].length > 1){
                var s = arr[i];
                arr[i] = s.charAt(0).toUpperCase() + s.substring(1);
            }
        }
        return arr.join("");
    };

    /**
     * waitTime
     * 倒计时效果(60s)
     */
    var waitTime = function (ele) {
        var speed = 59;
        ele.prop("disabled",true);
        var timer = setInterval(function(){
            if (speed > -1) {
                ele.html(speed + "秒");
                speed--;
            }else{
                clearInterval(timer);
                ele.html("获取验证码");
                ele.removeProp("disabled",false);
            }
        },1000);
    };
    /**
     * isNumber
     * 校验是否是数字
     */
    var isNumber = function (val){
        var regPos = /^\d+(\.\d+)?$/; //非负浮点数
        var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
        if(regPos.test(val) || regNeg.test(val)){
            return true;
        }else{
            return false;
        }
    };
    /**
     * getMacInfo
     * 获取mac地址
     */
    var getMacInfo = function () {
        try{
            var locator = new ActiveXObject ("WbemScripting.SWbemLocator");
            var service = locator.ConnectServer(".");
            var properties = service.ExecQuery("Select * from Win32_NetworkAdapterConfiguration Where IPEnabled =True");
            var e = new Enumerator (properties);
            var p = e.item();
            var mac = p.MACAddress;
            if (mac){
                return mac.replace(/:/g, '-');
            }else{
                return '00-00-00-00-00-00';
            }
        }
        catch(err){
            return '00-00-00-00-00-00';
        }
    };
    /**
     * getIeVersion
     * 获取IE浏览器版本
     */
    var getIeVersion = function() {
        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
        var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器
        var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
        var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
        if(isIE) {
            var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
            reIE.test(userAgent);
            var fIEVersion = parseFloat(RegExp["$1"]);
            if(fIEVersion == 7) {
                return 7;
            } else if(fIEVersion == 8) {
                return 8;
            } else if(fIEVersion == 9) {
                return 9;
            } else if(fIEVersion == 10) {
                return 10;
            } else {
                return 6;//IE版本<=7
            }
        } else if(isEdge) {
            return 'edge';//edge
        } else if(isIE11) {
            return 11; //IE11
        }else{
            return -1;//不是ie浏览器
        }
    };
    /**
     * clearAllCookie
     * 清空所有cookie
     */
    var clearAllCookie = function () {

        $.cookie("SESSION","",{path:"/"});
        $.cookie("LP_ID","",{path:"/"});

        //方法一
        // var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
        // if(keys) {
        //     for(var i = keys.length; i--;){
        //         document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
        //     }
        // }

        //方法二
        // var date = new Date();
        // date.setTime(date.getTime()-10000);
        // var keys=document.cookie.match(/[^ =;]+(?=\=)/g);
        // if (keys) {
        //     for (var i = keys.length; i--;){
        //         document.cookie = keys[i] + "=0;expire=" + date.toGMTString()+";path=/";
        //     }
        // }

        //方法三
        // function foreach(){
        //     var strCookie=document.cookie;
        //     var arrCookie=strCookie.split(";"); // 将多cookie切割为多个名/值对
        //     for(var i=0;i<arrCookie.length;i++)
        //     { // 遍历cookie数组，处理每个cookie对
        //         var arr=arrCookie[i].split("=");
        //         if(arr.length>0)
        //             DelCookie(arr[0]);
        //     }
        // }
        // function GetCookieVal(offset){
        //     var endstr = document.cookie.indexOf (";", offset);
        //     if (endstr == -1)
        //         endstr = document.cookie.length;
        //     return decodeURIComponent(document.cookie.substring(offset, endstr));
        // }
        // function DelCookie(name){
        //     var exp = new Date();
        //     exp.setTime (exp.getTime() - 1);
        //     var cval = GetCookie (name);
        //     document.cookie = name + "=" + cval + "; expires="+ exp.toGMTString();
        // }
        // function GetCookie(name){
        //     var arg = name + "=";
        //     var alen = arg.length;
        //     var clen = document.cookie.length;
        //     var i = 0;
        //     while (i < clen)
        //     {
        //         var j = i + alen;
        //         if (document.cookie.substring(i, j) == arg)
        //             return GetCookieVal (j);
        //         i = document.cookie.indexOf(" ", i) + 1;
        //         if (i == 0) break;
        //     }
        //     return null;
        // }
        // foreach();
    };
    /**
     * 处理因ie造成的无法上传同名文件
     */
    var resetUploadForm = function (){
        if(navigator.appName == "Microsoft Internet Explorer"){
            if (navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE8.0") {
                //针对ie8进行表单重置处理
                var dataUpload = $(".layui-upload-form");
                for (var i = 0;i < dataUpload.length;i++ ){
                    dataUpload[i].reset();
                }
            }else{
                //除IE8外重置上传input
                $(".layui-upload-file").attr("type","hidden");
                $(".layui-upload-file").attr("type","file");
            }
        }
    };
    /**
     * 树删除节点后的处理
     */
    var treeDeleteNode = function (treeObj,id,pid) {
        var selectNode = treeObj.getSelectedNodes()[0];
        var parentNode = selectNode.getParentNode();
        if (parentNode){
            var parentsNode = parentNode.getParentNode();
            treeObj.reAsyncChildNodes(parentsNode, "refresh", false,function () {
                treeObj.reAsyncChildNodes(parentNode, "refresh", false);
            });
        }else{
            treeObj.reAsyncChildNodes(parentNode, "refresh", false);
        }
    };
    /**
     * 树更新节点后的处理
     */
    var treeUpdateNode = function (treeObj,id,pid) {
        var selectNode = treeObj.getSelectedNodes()[0];
        var parentNode = selectNode.getParentNode();
        treeObj.reAsyncChildNodes(parentNode, "refresh", false,function () {
            var sNode = treeObj.getNodeByParam(id, selectNode[id], null);
            treeObj.selectNode(sNode);
            treeObj.setting.callback.onClick(null, treeObj.setting.treeId, sNode);
        });
    };
    /**
     * 树新增节点后的处理
     */
    var treeAddNode = function (treeObj,id,pid) {
        var selectNode = treeObj.getSelectedNodes()[0];
        if (selectNode){
            var parentNode = selectNode.getParentNode();
            treeObj.reAsyncChildNodes(parentNode, "refresh", false,function () {
                treeObj.reAsyncChildNodes(selectNode, "refresh", false,function () {
                    var sNode = treeObj.getNodeByParam(id, selectNode[id], null);
                    treeObj.selectNode(sNode);
                    treeObj.setting.callback.onClick(null, treeObj.setting.treeId, sNode);
                });
            });
        }else{
            treeObj.reAsyncChildNodes(selectNode, "refresh", false);
        }
    };
    /**
     * 获取树路径
     */
    var treePath = function (treeObj,type) {
        var selectNode = treeObj.getSelectedNodes()[0];
        var parentNode = selectNode.getParentNode();
        var treePathList = null;
        if (type === 'add'){
            treePathList = selectNode.getPath();
        }else if(type === 'edit'){
            if (parentNode){
                treePathList = parentNode.getPath();
            }else{
                treePathList = "";
            }
        }
        var treePathString = "";
        for (var i = 0; i < treePathList.length; i++){
            treePathString += treePathList[i].orgName + ">";
        }
        return treePathString;
    };
    /**
     * 树加载成功后的处理
     */
    var treeAsyncSuccessCallback = function (event, treeId, treeNode, msg) {
        if (msg.success){
            if (msg.result.length === 0){
                if (treeNode){ //存在当前节点的情况下
                    var $li = $(event.target).find("li#" + treeNode.tId);
                    $li.find("span#" + treeNode.tId + "_switch").css({
                        "visibility" : "hidden"
                    });
                    $li.find("span#" + treeNode.tId + "_ico").css({
                        "background-position" : "-147px -42px"
                    });
                }
            }
        }else{
            if(msg.code === 401){ //登陆超时
                var callbackLock = $.cookie("callbackLock"); //获取登陆超时锁
                if (callbackLock === undefined || callbackLock === 'false') { //如果未设置或者锁关闭则进入条件

                    $.cookie("callbackLock",true,{path:"/"}); //给登陆超时锁加锁

                    window.top.layer.alert('登陆超时，请重新登陆', {
                        skin: 'layui-layer-lan'
                        , closeBtn: 0
                        , anim: 2
                    }, function () {

                        $.cookie("callbackLock",false,{path:"/"}); //给登陆超时锁解锁

                        var pathName = window.location.pathname;
                        var api_project = pathName.substring(1, pathName.substr(1).indexOf('/') + 1);
                        window.top.location.href = window.location.protocol + "//" + window.location.host + "/" + api_project + "/login.html";
                    });
                }
            }else if (msg.message){
                layer.msg(msg.message);
            }
        }
    };
    /**
     * 树加载失败错误信息状态码
     */
    var treeHandleStatus = function (status) {
        switch (status) {
            case 404:
                layer.msg('请求资源不存在：#' + status);
                break;
            case 400:
                layer.msg('请求参数有误：#' + status);
                break;
            case 500:
                layer.msg('服务器异常：#' + status);
                break;
            case 504:
                layer.msg('请求超时：#' + status);
                break;
            default:
                layer.msg('未知故障：#' + status);
                break;
        }
    };

    return{
        renderTpl : renderTpl,
        tableSelected : tableSelected,
        tableSelectedDouble : tableSelectedDouble,
        formatDate : formatDate,
        formatMoney : formatMoney,
        getrequest : getrequest,
        changeHump : changeHump,
        waitTime : waitTime,
        isNumber : isNumber,
        getMacInfo : getMacInfo,
        getIeVersion : getIeVersion,
        clearAllCookie : clearAllCookie,
        resetUploadForm : resetUploadForm,
        treeDeleteNode : treeDeleteNode,
        treeUpdateNode : treeUpdateNode,
        treeAddNode : treeAddNode,
        treePath : treePath,
        treeHandleStatus : treeHandleStatus,
        treeAsyncSuccessCallback : treeAsyncSuccessCallback
    }
});
