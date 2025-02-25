function check8BitDate(name, id, value)
{
	var exp='^(?:(?:(?:(?=\\d{2}(?:(?:[02468][048])|(?:[13579][26])))\\d{4}02(?!00)[0-2]\\d))|(?:\\d{4}(?:(?:(?:(?:0[469])|(?:11))(?!00)(?:(?:[0-2]\\d)|(?:30)))|(?:(?:(?:0[13578])|(?:1[02]))(?!00)(?:(?:[0-2]\\d)|(?:3[01])))|(?:02(?!(?:00)|(?:29))[0-2]\\d))))$';
	var regex = new RegExp(exp,'g');
	var result = regex.test(value);
	if(!result)
	{
		$("#"+id).tips({
			side: 3,
			 msg: name+'格式不正确，正确格式如19990101',
			  bg: '#AE81FF',
			time: 5
		});
		$("#"+id).focus();
		return true;	 
	}
	return false;
}

/**交易要素特殊字符校验**/
function specialCharTrade(name,id,value){
	var regex = /[&+#?!$%^*！？]/;
    if( value.match( regex )){
		$("#"+id).tips({
			side: 3,
			 msg: name + '不得出现&、+、#、?、!、$、%、^、*字符和全角的？、！',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}

/**客户名称特殊字符校验**/
function specialCharCustName(name,id,value){
	 var regex = /[+#?!$%^*！？]/;
     if( value.match( regex ))  {
		$("#"+id).tips({
			side: 3,
			 msg: name + '不得出现+、#、?、!、$、%、^、*字符和全角的？、！',
			  bg: '#AE81FF',
			time: 5
		});
		$("#"+id).focus();
		return true;
	 }
	 return false;
}

/**必填字段校验**/
function filled(name,id,value){
	if( value == null || value == '' || value.length == 0){
		$("#"+id).tips({
			side: 3,
			 msg: name + '不能为空',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}

/**替代符校验**/
function replaceChar(name,id,value){
	if(value=="@N"||value=="@E"||value=="@I"){
		$("#"+id).tips({
			side: 3,
			 msg: name + '不能填写替代符号',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}

/**连续相同的数字校验**/
function sameNumber(name,id,value){
	 var length = value.length;
	 var regex = '/^['+value.substring(0,1)+']{'+length+',}/';
	 if(value.match(eval(regex)) && numberCheck(name,id,value)){
		$("#"+id).tips({
			side: 3,
			 msg: name + '不得全部为连续相同的数字',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	 }
	 return false;
}

/**不能仅由数字组成校验**/
function numberCheck(name,id,value){
	 var regex = /^[0-9]*$/;
     if(value.match(regex)){
		$("#"+id).tips({
			side: 3,
			 msg: name + '不能仅由数字组成',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	 }
	 return false;
}

/**仅由数字组成校验**/
function numberValueCheck(name,id,value){
	 var regex = /^[0-9]*$/;
     if(!value.match(regex)){
		$("#"+id).tips({
			side: 3,
			 msg: name + '只能由数字组成',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	 }
	 return false;
}

/**字母数字及全角**/
function  letterAndNumberCheck(name,id,value){
     var regex =/^[A-Za-z0-9-]*$/;
	 if( !value.match(regex) || SBCCaseCheck(name,id,value)) {
		$("#"+id).tips({
			side: 3,
			 msg: name + '不得含有除数字、字母、“-”之外的字符，且不得使用全角字符！',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	 }
}

/**空格校验**/
function allBlankChar(name,id,value){
	var regex = /[\s]/;
	if( value.match( regex )){
		$("#"+id).tips({
			side: 3,
			 msg: name + '不能输入空格',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}

/**前后空格校验**/
function blankChar(name,id,value){
	/*******************FIX BUG BY zhaoheng,email zhaohengb@dcits.com*************************/
	//前后空格检验,应该为以一个或者多个空格开头|以一个或者多个空格结尾
    if(/^[\s]+|[\s]+$/gm.test(value)){
		$("#"+id).tips({
			side: 3,
			 msg: name + '前后不能有空格',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus(); 
		return true;
	}
	return false;
}

/**长度校验**/
function checkLength(name,id,value,length){
	var w = 0; 
	for (var i=0; i < value.length; i++) { 
	   var c = value.charCodeAt(i); 
	   if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
	    w++; 
	   } 
	   else { 
	    w+=2; 
	   } 
	} 
	if (w < length) {
		$("#"+id).tips({
			side: 3,
			 msg: name + '的长度不得少于' + length + '个字节',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus(); 
		return true;
	} 
	return false; 
}

/**长度校验**/
function checkMaxLength(name,id,value,length){
	var w = 0; 
	for (var i=0; i < value.length; i++) { 
	   var c = value.charCodeAt(i); 
	   if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
	    w++; 
	   } 
	   else { 
	    w+=2; 
	   } 
	} 
	if (w > length) {
		$("#"+id).tips({
			side: 3,
			 msg: name + '的长度不得大于' + length + '个字节',
			  bg: '#AE81FF',
		    time: 5
		});
		$("#"+id).focus(); 
		return true;
	} 
	return false; 
}

/**全角校验 空格全角为12288**/
function SBCCaseCheck(name,id,value){
	for (var i=0; i < value.length; i++) { 
	    var c = value.charCodeAt(i); 
	    if ((c >= 65280 && c <= 65375) || (c == 12288)) {
		   $("#"+id).tips({
				side: 3,
				 msg: name + '不得使用全角字符',
				  bg: '#AE81FF',
				time: 5
			});
			$("#"+id).focus(); 
		    return true;
  	    }
	} 
	return false;
}

/**证件号码中如出现“(”（或“[”、“{”），则其后必须相应出现 “}”（或“）”、“]”)**/
function IDCard2(name,id,value){
   if((value.indexOf('(')!=-1 && value.indexOf(')')==-1) ||
	  (value.indexOf('（')!=-1 && value.indexOf('）')==-1) ||
	  (value.indexOf('[')!=-1 && value.indexOf(']')==-1) ||
	  (value.indexOf('{')!=-1 && value.indexOf('}')==-1)
   ){
	    $("#"+id).tips({
				side: 3,
				 msg: name + '如出现“(”（或“[”、“{”），则其后必须相应出现 “}”（或“）”、“]”',
				  bg: '#AE81FF',
				time: 5
			});
		$("#"+id).focus();
		return true;   
   }
   return false;
}

/**身份证件号码校验**/
function IDCard1(name,id,value){
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
   var Y, JYM;
   var S, M;
   var idcard_array = new Array();
   idcard_array = value.split("");
    // 地区检验
   if (area[parseInt(value.substr(0, 2))] == null) {
       return true;
   }
   // 身份号码位数及格式检验
   switch (value.length) {
	case 15 :
     if ((parseInt(value.substr(6, 2)) + 1900) % 4 == 0
       || ((parseInt(value.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(value
         .substr(6, 2)) + 1900)
         % 4 == 0)) {
      ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;// 测试出生日期的合法性
     } else {
      ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// 测试出生日期的合法性
     }
     if (ereg.test(value)){
		return false;
	 } else {
		return true;
     }
     break;
    case 18 :
     // 18位身份号码检测
     // 出生日期的合法性检查
     // 闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
     // 平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
     if (parseInt(value.substr(6, 4)) % 4 == 0
       || (parseInt(value.substr(6, 4)) % 100 == 0 && parseInt(value.substr(6, 4)) % 4 == 0)) {
      ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式
     } else {
      ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式
     }
     if (ereg.test(value)) {// 测试出生日期的合法性
      // 计算校验位
      S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10]))
        * 7
        + (parseInt(idcard_array[1]) + parseInt(idcard_array[11]))
        * 9
        + (parseInt(idcard_array[2]) + parseInt(idcard_array[12]))
        * 10
        + (parseInt(idcard_array[3]) + parseInt(idcard_array[13]))
        * 5
        + (parseInt(idcard_array[4]) + parseInt(idcard_array[14]))
        * 8
        + (parseInt(idcard_array[5]) + parseInt(idcard_array[15]))
        * 4
        + (parseInt(idcard_array[6]) + parseInt(idcard_array[16]))
        * 2
        + parseInt(idcard_array[7])
        * 1
        + parseInt(idcard_array[8])
        * 6
        + parseInt(idcard_array[9]) * 3;
      Y = S % 11;
      M = "F";
      JYM = "10X98765432";
      M = JYM.substr(Y, 1);// 判断校验位
      if (M == idcard_array[17]) {
        return false; // 检测ID的校验位
      } else {
		return true;
      }
     } else {
		return true;
     }
     break;
    default :
		return true;
    break;
   }
}

//金额校验
function floatCheck(name,id,value){
	var regex = /^\d*(\.?\d{1,3})?$/;
	if( !value.match(regex)){
		$("#"+id).tips({
			side: 3,
			 msg: name + '只能为整数或浮点数',
			  bg: '#AE81FF',
			time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}

//时间格式校验
function timeFormatCheck1(name,id,value){
	var regex = /^[0-9]*$/;
	if( !value.match(regex)){
		$("#"+id).tips({
			side: 3,
			 msg: name + '只能输入数字',
			  bg: '#AE81FF',
			time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}
//时间格式校验(时分秒格式校验)
function timeFormatCheck3(name,id,value){
	var hour = value.substring(8,10);
	var min = value.substring(10,12);
	var sec = value.substring(12,14);
	if((hour!='tt' && hour>=24) ||(min!='tt' && min >=60) || ( sec!='tt' && sec>=60) ){
		$("#"+id).tips({
			side: 3,
			 msg: name + '时分秒的格式不正确如：0≤时<24，0≤分<60，0≤秒<60',
			  bg: '#AE81FF',
			time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}
//时间格式校验（小时格式校验）
/*
function timeFormatCheck4(name,id,value){
	var hour = value.substring(8,10);
	if(hour!='tt' && hour>=24){
		$("#"+id).tips({
			side: 3,
			 msg: name + '小时的格式不正确如：0≤时<24 或者用‘tt’表示小时',
			  bg: '#AE81FF',
			time: 5
		});
		$("#"+id).focus();
		return true;
	}
	return false;
}*/

function renderMoney(v)
{
	v = (Math.round((v-0)*100))/100;
	v = (v == Math.floor(v)) ? v + ".00" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
	v = String(v);
	var ps = v.split('.');
	var whole = ps[0];
	var sub = ps[1] ? '.'+ ps[1] : '.00';
	var r = /(\d+)(\d{3})/;
	while (r.test(whole)) 
	{
		whole = whole.replace(r, '$1' + ',' + '$2');
	}
	v = whole + sub;
	if(v.charAt(0) == '-')
	{
		return '-' + v.substr(1);
	}
	return v;
}

//非现场AN格式校验
function fxcANCheck(name,id,value){
	for (var i=0; i < value.length; i++) { 
	   var c = value.charCodeAt(i); 
	   if ((c >= 0X7E || c <= 0X20)) { 
			$("#"+id).tips({
				side: 3,
				 msg: name + '只能包含0-9的数字或除汉字之外的其他半角字符',
				  bg: '#AE81FF',
				time: 5
			});
			$("#"+id).focus();
		   return true;
	   } 
	} 
	 return false;
}

function generateTime() {
    var date = new Date();
    return date.getFullYear().toString() + pad2(date.getMonth() + 1) + 
		   pad2(date.getDate()) + pad2(date.getHours()) + pad2(date.getMinutes()) 
		   + pad2(date.getSeconds());
}

function pad2(n) { 
	return n < 10 ? '0' + n : n 
}

function isChina(s)
{
	if(s != null && (s.substr(0, 3) == 'CHN' || s.substr(0, 3) == 'Z01' || s.substr(0, 3) == 'Z02' || s.substr(0, 3) == 'Z03'))
	{
		return true;
	}
	return false;
}

function isEmpty(val)
{
	if(val == null || val == undefined || val.length == 0 || val == '')
	{
		return 0;
	}
	return 1;
}

/**
 * 组合特殊字符和空格校验
 * @param value
 * @param name
 * @param id
 * @returns {Boolean}
 */
function combineSpecialAndBlank(value, name, id)
{
	if(isEmpty(value) > 0 && (specialCharTrade(name, id, value) || allBlankChar(name, id, value)))
	{
		return true;
	}
	return false;
}

function tipById(id,msg) {
	$("#"+id).tips({
		side: 3,
		msg: msg,
		bg: '#AE81FF',
		time: 3
	});
	$("#"+id).focus();
}

/**
 * 第一个参数在后续参数中包含返回true，类似于sql中的in关键字用法
 * @returns
 */
function fun_in()
{
	for(var i = 1; i < arguments.length; i++)
	{
		if(arguments[0] == arguments[i]) return true;
	}
	return false;
}

/**
 * 判断UTF-8格式下的字符长度 一个汉字占3个字节
*/
function lengthOfUTF8(str)
{
	var length = 0;
	for(var i= 0; i < str.length; i++)
	{
		var value = str.charCodeAt(i);
		if(value < 0x080)
		{
			length += 1;
		}
		else if(value < 0x0800)
		{
			length += 2;
		}
		else
		{
			length += 3;
		}
	}				
	return length;	
}