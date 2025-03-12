/**
 * 验证规则
 * 基于layui自定义验证规则
 */
define(['./base','./config'],function (base,config) {
    /**
     * verify
     * 自定义验证规则
     */
    form.verify({
        /**
         * equalPassword
         * 确认两次输入的密码是否相同
         * 该条验证规则属于多表校验，在常规的写法基础上，还需要在被比较的密码表上增加一个与验证规则同名的id属性
         */
        equalPassword : function(value,item){
            var $equalPassword = $("#equalPassword").val();
            if (value !== $equalPassword){
                return "两次输入的新密码不一致";
            }
        },
        /**
         * minPasswordLength
         * 最小长度
         */
        minPasswordLength : function (value,item) {
            if (value.length < 6){
                return "密码长度不能小于6位";
            }
        },
        /**
         * maxPasswordLength
         * 最大长度
         */
        maxPasswordLength : function (value,item) {
            if (value.length > 20){
                return "密码长度不能大于20位";
            }
        },
        /**
         * creditIdLength
         * 长度必须为4位限制
         */
        creditIdLength : function (value,item) {
            if (value){
                if (value.length !== 4){
                    return "长度必须为4位";
                }
                var re = /^[^\u4e00-\u9fa5]+$/;
                if (!(re.test(value))){
                    return "不能包含中文";
                }
            }
        },
        /**
         * zipCodeLength
         * 长度必须为6位限制
         */
        zipCodeLength : function (value,item) {
            if (value){
                if (value.length !== 6){
                    return "长度必须为6位";
                }
                var re = /^[^\u4e00-\u9fa5]+$/;
                if (!(re.test(value))){
                    return "不能包含中文";
                }
            }
        },
        /**
         * orgCodeLength
         * 长度必须为14位限制
         */
        orgCodeLength : function (value,item) {
            if (value){
                if (value.length !== 14){
                    return "长度必须为14位";
                }
                var re = /^[^\u4e00-\u9fa5]+$/;
                if (!(re.test(value))){
                    return "不能包含中文";
                }
            }
        },
        /**
         * orgCodeCardLength
         * 身份证号限制
         */
        orgCodeCardLength : function (value,item) {
        	var re = /(^\d{15}$)|(^\d{17}(\d|X|x)$)/;
            if(re.test(value) === false){
                return "身份证号不规范";
            }
        },
        /**
         * cedOrgCodeLength
         * 长度必须为18位限制
         */
        cedOrgCodeLength : function (value,item) {
            if (value){
                if (value.length !== 18){
                    return "长度必须为18位";
                }
                var re = /^[^\u4e00-\u9fa5]+$/;
                if (!(re.test(value))){
                    return "不能包含中文";
                }
            }
        },
        /**
         * threeValue
         * 数值限制
         */
        threeValue : function (value,item) {
            if (value){
                var re = /^(\d|[1-9]\d)+$/ ;
                if (!(re.test(value))){
                    return "请输入整数";
                }
                if (value.length > 3){
                    return "值不能大于3位";
                }
            }
        },
        /**
         * regCapValue
         * 数值限制
         */
        regCapValue : function (value,item) {
            if (value){
                var re = /^(\d|[1-9]\d)+$/ ;
                if (!(re.test(value))){
                    return "请输入整数";
                }
                if (value.length > 15){
                    return "值不能大于15位";
                }
            }
        },
        /**
         * moneyValue
         * 数值限制
         */
        moneyValue : function (value,item) {
            if (value){
                var re = /^(\d|[1-9]\d)+$/ ;
                if (!(re.test(value))){
                    return "请输入整数";
                }
                if (value.length > 16){
                    return "值不能大于16位";
                }
            }
        },
        /**
         * invRatioValue
         * 数值限制
         */
        invRatioValue : function (value,item) {
            var re = /^(((\d|[1-9]\d)(\.\d{1,2})?)|100|100.0|100.00)$/ ;
            if (!(re.test(value))){
                return "请输入0-100以内的最多2位小数的百分占比";
            }
        },
        /**
         * assetsValue
         * 数值限制
         */
        assetsValue : function (value,item) {
            if (value){
                // var re = /^(((\d|[1-9]\d{1,16})(\.\d{1,2})?))$/ ;
                const re = /^-?(0|([1-9]\d{0,16}))(\.\d{1,2})?$/;
                if (!(re.test(value))){
                    return "请输入17位以内的最多2位小数的数字";
                }
            }
        },
        /**
         * secDepValue
         * 数值限制
         */
        secDepValue : function (value,item) {
            if (value){
                if (value > 100 || value < 0){
                    return "请输入0-100以内的数";
                }
            }
        },
        /**
         * integer
         * 整数
         */
        integer : function (value,item) {
            var re = /^(\d|[1-9]\d)+$/ ;
            if (!(re.test(value))){
                return "请输入整数";
            }
        },
        /**
         * noChinese
         * 不能包含中文
         */
        noChinese : function (value,item) {
            var re = /^[^\u4e00-\u9fa5]+$/;
            if (!(re.test(value))){
                return "不能包含中文";
            }
        },
        /**
         * pageSize
         * 表格每页条数
         */
        integerPageSize : function (value,item) {
            var re = /^(\d|[1-9]\d)+$/ ;
            if (!(re.test(value) && value >= 5 && value <= 50)){
                return "请输入5~50以内的整数";
            }
        },
        /**
         * integerOrNull
         * 数字
         */
        integerOrNull : function (value,item) {
            var re = /^\d+$/ ;
            if (value && !(re.test(value))){
                return "请输入数字";
            }
        },
        /**
         * charAndInteger
         * 字母加数字
         */
        charAndInteger : function (value,item) {
            var re = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{0,999}$/ ;
            if (!(re.test(value))){
                return "请包含字母和数字";
            }
        },
        /**
         * containProtocol
         * url中必须包含请求协议
         */
        containProtocol : function(value,item){
            if (!(value.substr(0,7).toLowerCase() === "http://" || value.substr(0,8).toLowerCase() === "https://")){
                return "请包含请求协议(http://或者https://)";
            }
        },
        /**
         * validIdCard
         * 身份证校验规则
         */
        validIdCard : function(idcard){
            var socialNo = idcard;
            if (socialNo != "") {
                if (socialNo.length != 15 && socialNo.length != 18) {
                    return "身份证格式不正确";
                }
                var area = {
                    11 : "北京",
                    12 : "天津",
                    13 : "河北",
                    14 : "山西",
                    15 : "内蒙古",
                    21 : "辽宁",
                    22 : "吉林",
                    23 : "黑龙江",
                    31 : "上海",
                    32 : "江苏",
                    33 : "浙江",
                    34 : "安徽",
                    35 : "福建",
                    36 : "江西",
                    37 : "山东",
                    41 : "河南",
                    42 : "湖北",
                    43 : "湖南",
                    44 : "广东",
                    45 : "广西",
                    46 : "海南",
                    50 : "重庆",
                    51 : "四川",
                    52 : "贵州",
                    53 : "云南",
                    54 : "西藏",
                    61 : "陕西",
                    62 : "甘肃",
                    63 : "青海",
                    64 : "宁夏",
                    65 : "新疆",
                    71 : "台湾",
                    81 : "香港",
                    82 : "澳门",
                    91 : "国外"
                };
                if (area[parseInt(socialNo.substr(0, 2))] == null) {
                    return "身份证格式不正确";
                }
                if (socialNo.length == 15) {
                    var pattern = /^\d{15}$/;
                    if (pattern.exec(socialNo) == null) {
                        return "身份证格式不正确";
                    }
                    var birth = parseInt("19" + socialNo.substr(6, 2));
                    var month = socialNo.substr(8, 2);
                    var day = parseInt(socialNo.substr(10, 2));
                    switch (month) {
                        case '01':
                        case '03':
                        case '05':
                        case '07':
                        case '08':
                        case '10':
                        case '12':
                            if (day > 31) {
                                return "身份证格式不正确";
                            }
                            break;
                        case '04':
                        case '06':
                        case '09':
                        case '11':
                            if (day > 30) {
                                return "身份证格式不正确";
                            }
                            break;
                        case '02':
                            if ((birth % 4 == 0 && birth % 100 != 0)
                                || birth % 400 == 0) {
                                if (day > 29) {
                                    return "身份证格式不正确";
                                }
                            } else {
                                if (day > 28) {
                                    return "身份证格式不正确";
                                }
                            }
                            break;
                        default:
                            return "身份证格式不正确";
                    }
                    var nowYear = new Date().getYear();
                    if (nowYear - parseInt(birth) < 15
                        || nowYear - parseInt(birth) > 100) {
                        return "身份证格式不正确";
                    }
                }
                var Wi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10,5, 8, 4, 2, 1);
                var lSum = 0;
                var nNum = 0;
                var nCheckSum = 0;
                for (var i = 0; i < 17; ++i) {
                    if (socialNo.charAt(i) < '0' || socialNo.charAt(i) > '9') {
                        return "身份证格式不正确";
                    } else {
                        nNum = socialNo.charAt(i) - '0';
                    }
                    lSum += nNum * Wi[i];
                }
                if (socialNo.charAt(17) == 'X' || socialNo.charAt(17) == 'x') {
                    lSum += 10 * Wi[17];
                } else if (socialNo.charAt(17) < '0' || socialNo.charAt(17) > '9') {
                    return "身份证格式不正确";
                } else {
                    lSum += (socialNo.charAt(17) - '0') * Wi[17];
                }
                if ((lSum % 11) == 1) {

                } else {
                    return "身份证格式不正确";
                }
            }
        },
        /**
         * validPhoneNum
         * 手机号码规则校验
         */
        validPhoneNum : function (value,item) {
            if (value){
                var re = /^1[345678]\d{9}$/ ;
                if (!(re.test(value))){
                    return "手机号码格式不正确";
                }
            }
        }
    });

    /**
     * dataValidation
     * 数据校验
     */
    var dataValidation = function (module,tableName,pk,type,isCheck,isSingle,isNoBackShow) {
        var businessStates = null; //记录校验结果产生的数据状态值
        var para = {};
        para.tableName = tableName;
        para.pk = pk;
        if(isSingle){
        	$.ajax({
	        	url      : (isCheck ? "validate/data.do" : "validate/getErrorMessage.do"), 
				data     : para,
				type     : 'post',  
				cache    : false,  
				dataType : 'json', 
	            success:function (data) {
	            	layer.alert('校验成功');
	            	businessStates = 'VS'; //校验失败
	            },
	            error:function (e){
	            	layer.alert('校验出错,错误信息如下:<br>'+e.responseText);
	            	businessStates = 'VF'; //校验失败
	            }
        	});
        }else{
	        $.ajax({
	        	url      : (isCheck ? "validate/singleCheck.do" : "validate/getErrorMessage.do"), 
				data     : para,
				type     : 'post',  
				cache    : false,  
				dataType : 'json', 
	            success:function (data) {
	                // layer.msg("校验成功");
	                if (module){ //module有值的情况下根据module的值匹配指定的DOM范围
	                    $("#" + module + "AddBtn").parents(".layui-form").find(".errorFormBox").html("");
	                    //类似于基础表和相关还款责任人的一对多，弹出框场景。
	                    $("#"+module).find(".layui-form").find(".errorFormBox").html("");
	                }else{ //module没值的情况下检索当前页面
	                    $(".errorFormBox").html("");
	                }
	                //当为true的时候页面不回显校验错误数据，什么都不做。
	                if(isNoBackShow){
	                	
	                }else{
	                	if (data.result && data.result.length){
		                    for (var i = 0;i < data.result.length;i++){
		                        var id = base.changeHump(data.result[i].TABLE_FIELD);
		                        var errorMsg = data.result[i].ERROR_MSG;
		                        if (type === 'form'){
		                            var suffix = ((module === 'old') || (module === 'new')) ? ('_' + module) : ''; //如果是2002/2007相关页面对ID进行后缀的特殊处理
		                            var control = $("#" + id + suffix);
		                            var errorFormBox = control.parent().parent().find('.errorFormBox');
		                            if (errorFormBox.length){
		                                errorFormBox.html(errorMsg);
		                            //	$(".errorFormBox").css("display","block");
		                            }else{
		                                errorFormBox = $('<div class="errorFormBox" style="display: block;"> ' + errorMsg + '</div>');
		                                control.parent().after(errorFormBox);
		                            }
		                            errorFormBox.hover(function () {
		                                layer.tips($(this).text(), this,{
		                                    tips: [1, '#f00'],
		                                    time : 0
		                                });
		                            },function () {
		                                layer.closeAll('tips');
		                            });
		                        }else{
		                            var control = $("th[data-field='" + id + "']");
		                            if (!control.length){
		                                control = $("th[data-field='" + id + "Name" + "']");
		                            }
		                            var errorTableBox = control.find('.errorTableBox');
		                            if (errorTableBox.length){
		                                errorTableBox.html(errorMsg);
		                              //  $(".errorFormBox").css("display","block");
		                            }else{
//		                                errorTableBox = $('<div class="errorTableBox" style="display: block;>' + errorMsg + '</div>');
		                            	errorTableBox = $('<div class="errorTableBox">' + errorMsg + '</div>');
		                                control.append(errorTableBox);
		                            }
		                            errorTableBox.hover(function () {
		                                layer.tips($(this).text(), this,{
		                                    tips: [1, '#f00'],
		                                    time : 0
		                                });
		                            },function () {
		                                layer.closeAll('tips');
		                            });
		                        }
		                    }
		                    businessStates = 'VF'; //校验失败
		                }else {
//		                	$(".errorFormBox").css("display","none");//隐藏提示信息
//		                	$(".errorTableBox").css("display","none");
		                    businessStates = 'VS'; //校验成功
		                }
	                }
	            }
	        });
        }
        return businessStates;
    };

    return{
        dataValidation : dataValidation
    }

});
