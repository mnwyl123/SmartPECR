<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">

//给具体的下拉框初始化值
initDict('idType', staticDict.idType);
initDict('customerType', staticDict.customerType);
initDict('rptDateCode', staticDict.rptDateCode);
initDict('othIdType', staticDict.idType);
initDict('sex', staticDict.sex);
initDict('nation', staticDict.country);
initDict('mariStatus', staticDict.mariStatus);
initDict('spoIdType', staticDict.idType);
initDict('eduLevel', staticDict.eduLevel);
initDict('acaDegree', staticDict.acaDegree);
initDict('occupation', staticDict.occupation);
initDict('title', staticDict.title);
initDict('techTitle', staticDict.techTitle);
initDict('industry', staticDict.industry);
initDict('cpnType', staticDict.cpnType);
initDict('empStatus', staticDict.empStatus);
initDict('resiStatus', staticDict.resiStatus);
initDict('infRecType', staticDict.infRecType);
initDict('othAssFlg', staticDict.assFlg);
initDict('famMemCertType', staticDict.idType);
initDict('famRel', staticDict.famRel);
initDict('famRelaAssFlag', staticDict.assFlg);
initDict('acctType', staticDict.acctType);
initDict('busiLines', staticDict.busiLines);
initDict('busiDtlLines', staticDict.busiDtlLines);
initDict('cy', staticDict.ccy);
initDict('flag', staticDict.loanFlag);
initDict('repayMode', staticDict.repayMode);
initDict('repayFreqcy', staticDict.repayFreqcy);
initDict('guarMode', staticDict.guarMode);
initDict('othRepayGuarWay', staticDict.othRepayGuarWay);
initDict('assetTrandFlag', staticDict.assetTrandFlag);
initDict('fundSou', staticDict.fundSou);
initDict('loanForm', staticDict.loanForm);
initDict('infoIdType', staticDict.infoIdType);
initDict('arlpCertType', staticDict.arlpCertType);
initDict('arlpType', staticDict.arlpType);
initDict('wartySign', staticDict.wartySign);


//弹出
var popIndex;
var addOrUpdate;
layui.use(['form', 'laydate', 'element', 'table'], function(){
	
	var form = layui.form,
	  element = layui.element,
	  table = layui.table,
	  laydate = layui.laydate;
	
    form.verify({
    	name: function (value,baseSgmtForm) {
    		if(value.length > 30 || value.length < 1) {
    			return '姓名长度为(1-30)';
    		}
    	},
    	idNum: function (value, baseSgmtForm) {
             if (value.length > 20|| value.length < 1) {
                 return '证件号码长度为(1-20)';
             }
         },
         infSurcCode: [/^[a-zA-Z0-9]{1,20}$/, '信息来源编码格式为数字和英文字符,长度(1-20)'],
         cimoc: [/^[a-zA-Z0-9]{1,12}$/,'客户资料维护机构代码格式为数字和英文字符,长度(1-12)'],
         alias: function (value,idSgmtDialogForm) {
     		if(value.length > 30 || value.length < 1) {
     			return '姓名长度为(1-30)';
     		}
     	 },
     	 othIdNum: function (value, idSgmtDialogForm) {
              if (value.length > 20|| value.length < 1) {
                  return '证件号码长度为(1-20)';
              }
          },
          hhDist: [/^([0-9]{6}){0,1}$/,'请填写正确户籍区域代码'],
          cellPhone: [/^(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7}|177[0-9]{8}){0,1}$/,'请输入正确电话号码'],
          fcsemail: [/^((\w+([-+.]\w+)*@\w+[-.]\w+)*\.\w+([-.]\w+)*){0,1}$/,'请输入正确email'],
          spoIdType: function (value, basSpsInfoSgmt) {
        	  var spoIdNum = document.getElementById("spoIdNum").value;
        	  if(spoIdNum!=""){
        		  if(value.length == 0 ){
        			  return '配偶证件类型不能为空';
        		  }
        	  }
          },
          spoIdNum: function (value, basSpsInfoSgmt) {
        	  var spoIdType = document.getElementById("spoIdType").value;
        	  
        	  if(spoIdType!=""){
        		  if(value.length == 0 ){
        			  return '配偶证件号码不能为空';
        		  }
        	  }
          },
          cpnName: function (value,cpnName) {
        	  if(value.length == 0){
        		  return '单位名称不能为空，未知请填写“暂缺”';
        	  }
          },
          mailAddr: function (value,basMlgInfoSgmt) {
        	  if(value.length > 100){
        		  return '通讯地址长度不超过100';
        	  }
          },
          mailPc: [/^[0-9]{6}$/,'请填写正确邮编'],
          annlInc: [/^[0-9]+(\.[0-9]+)?$/,'请填写正确格式的收入信息']
    });
  //日期输入框
  $(".datefield").each(function(){
	  laydate.render({
	    elem: this,
	    trigger:'click'
	  });
  });
  
  $(".layui-colla-content").each(function(){
	  var isadd = document.getElementById("isadd").value;
	  var editOrMore = document.getElementById("editOrMore").value;
	  if(editOrMore=="more"){
		  $('.layui-colla-content').addClass('layui-show');
		  $('#errorMessageDivCont').removeClass('layui-show');
		  $('.layui-btn').addClass('layui-btn-disabled');
	  }
	  if(isadd=="add"){
		  $('#errorMessageDivCont').removeClass('layui-show');
		  $('.layui-btn').addClass('layui-btn-disabled');
		  $('#baseSgmtBtn').removeClass('layui-btn-disabled');
	  }
  });

  //初始化个人基本信息其他标识段表格
  table.render({
	   elem: '#idSgmtTable'
	   ,url:'indvBasicsInfo/getIdSmgtList.do?paaBsSmgtId='+$('#paaBsSmgtId').val()
	   ,cols: [[ //标题栏
	     {fixed: 'left', title:'序号', type:'numbers'}
	     ,{field: 'pabIdSgmtId', title: '主键', hide: true}
	     ,{field: 'alias', title: '姓名'}
	     ,{field: 'othIdType', title: '证件类型',templet: function(d){return renderColumnDict(d, 'othIdType', staticDict.idType)}}
	     ,{field: 'othIdNum', title: '证件号码'}
	     ,{field: 'idInfoUpDate', title: '信息更新日期'}
	  	 ,{fixed: 'right', title:'操作',toolbar: '#bartoolhead'}
	   ]]
	   //,skin: 'line' //表格风格
	   ,even: true
	   ,page: true
	   ,limits: [5, 10]
	   ,limit: 3 //每页默认显示的数量
	 });
  
  //其他标识段表格每行的编辑和删除按钮事件
  table.on('tool(idSgmtTable)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
   	  $.ajax({
   	       //请求方式
   	       type : "POST",
   	       //请求地址
   	       url : "indvBasicsInfo/deletePcBasIdSgmt",
   	       //数据，json字符串
   	       data : data,
   	       //请求成功
   	       success : function(result) {
   	    	  layer.msg('删除成功', {time:3000});
   	    	  table.reload('idSgmtTable', {});
   	       },
   	       //请求失败，包含具体的错误信息
   	       error : function(e){
   	    	   layer.alert('删除出错,错误信息如下:<br>'+e.responseText);
   	       }
   	   });
   		layer.close(index);
      });
    } else if(obj.event === 'edit'){
    	addOrUpdate = "update";
    	popIndex = layer.open({
			type :'1',
			title :'修改其他标识',
			content :$('#idSgmtDialog'),
			area: ['50%', '70%']			
		});
    	form.val('idSgmtDialogForm', data);
    }
  });
  
 $('#idSgmtAddBtn').on('click', function(){
	addOrUpdate = "add";
	form.val('idSgmtDialogForm', {"priKey":"", "alias":"", "othIdType":"", "othIdNum":"", "idInfoUpDate":""});
    popIndex = layer.open({
		type :'1',
		title :'新增其他标识',
		content :$('#idSgmtDialog'),
		area: ['45%', '80%']			
	});
  });
 
  //其他标识段新增或更新信息
  form.on('submit(idSgmtSubmit)', function(data){
	 data.field.paaBsSmgtId = $('#paaBsSmgtId').val();
     $.ajax({
       //请求方式
       type : "POST",
       //请求地址
       url : "indvBasicsInfo/addOrUpdatePcBasBsSgmt?addOrUpdate="+addOrUpdate,
       //数据，json字符串
       data : data.field,
       //请求成功
       success : function(result) {
    	   if(result.success == true){
     	   	  layer.msg('操作成功', {time:3000});
     	   	  table.reload('dcRltRepymtInfSgmtTable', {});
     	      layer.close(popIndex);
     	   }else{
     		   layer.alert(result.msg);
     	   }
       },
       //请求失败，包含具体的错误信息
       error : function(e){
    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
       }
   });
   return false;
  });
	//额外需要参数参数
  var custInfo = {'paaBsSmgtId': '${paaBsSmgtId}'};
  //基础段更新
  
  
  form.on('submit(baseSgmtSubmit)',function(data){
	  var isadd = document.getElementById("isadd").value;
	  addOrUpdate=isadd;
	  
	  $.ajax({
		  type : "POST",
		  url: "indvBasicsInfo/updatePcBasBsSgmt.do?addOrUpdate="+addOrUpdate,
		  data: data.field,
		  success:function(result){
			  if(result.success == true){
	     	   	  layer.msg('操作成功', {time:3000});
	     	   	if(isadd=="add"){
	     	   	  document.getElementById('paaBsSmgtId').value=result.paaBsSmgtId;
	     	   	  $('.layui-btn').removeClass('layui-btn-disabled');
	     	   	}
	     	   }else{
	     		   layer.alert(result.msg);
	     	   }
		  },
		  error:function(e){
			  layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
		  }
	  });
	  if(isadd=="add"){
		  $('#errorMessageDivCont').removeClass('layui-show');
		  $('.layui-btn').addClass('layui-btn-disabled');
		  $('#baseSgmtBtn').removeClass('layui-btn-disabled');
	  }
  });
  //基本概况段更新
  registerFormSubmit('fcsInfSgmtSubmit', 'indvBasicsInfo/updatePcBasFcsInfSgmt.do', form, custInfo);
  //婚姻信息段更新
  registerFormSubmit('spsInfSgmtSubmit', 'indvBasicsInfo/updatePcBasSpsInfSgmt.do', form, custInfo);
  //教育信息段更新
  registerFormSubmit('eduInfSgmtSubmit', 'indvBasicsInfo/updatePcBasEduInfSgmt.do', form, custInfo);
  //职业信息段更新
  registerFormSubmit('octpnInfSgmtSubmit', 'indvBasicsInfo/updatePcBasOctpnInfSgmt.do', form, custInfo);
  //居住信息段更新
  registerFormSubmit('redncInfSgmtSubmit', 'indvBasicsInfo/updatePcBasRedncInfSgmt.do', form, custInfo);  
  //通信信息段更新
  registerFormSubmit('mlgInfSgmtSubmit', 'indvBasicsInfo/updatePcBasMlgInfSgmt.do', form, custInfo);  
  //收入信息段更新
  registerFormSubmit('incInfSgmtSubmit', 'indvBasicsInfo/updatePcBasIncInfSgmt.do', form, custInfo);  
  //个人证件有效性记录更新
  //registerFormSubmit('inIDEfctInfSubmit', 'pc/cases/updatePcInIDEfctInf.do', form);
  //个人证件整合信息记录更新
  //registerFormSubmit('inCtfItgInfSubmit', 'pc/cases/updatePcInCtfItgInf.do', form);
  //家族关系信息记录更新
  //registerFormSubmit('inFalMmbsInfSubmit', 'pc/cases/updatePcInFalMmbsInf.do', form);
  
  
  
  //个人借贷-基础段
  //registerFormSubmit('dcAcctBsSgmtSubmit', 'pc/cases/updatePcDcAcctBsSgmt.do', form, custInfo);
  //个人借贷-基本信息段
  //registerFormSubmit('dcAcctBsInfSgmtSubmit', 'pc/cases/updatePcDcAcctBsInfSgmt.do', form, custInfo);
  
//回显基础段下拉框中的值
  form.val('baseSgmtForm', {
     "idType": "${basBsSgmt.idType}"
     ,"customerType": "${basBsSgmt.customerType}"
     ,"rptDateCode":"${basBsSgmt.rptDateCode}"
   });
  
  //回显基本概况段下拉框中的值
  form.val('fcsInfSgmtForm', {
     "nation": "${basFcsInfoSgmt.nation}"
     ,"sex": "${basFcsInfoSgmt.sex}"
   });
  
  //回显婚姻信息段下拉框中的值	
  form.val('spsInfSgmtForm', {
	 "mariStatus" : "${basSpsInfoSgmt.mariStatus}",
	 "spoIdType" : "${basSpsInfoSgmt.spoIdType}"
  });
  
  //回显教育信息段下拉框中的值	
  form.val('eduInfSgmtForm', {
	 "eduLevel" : "${basEduInfoSgmt.eduLevel}",
	 "acaDegree" : "${basEduInfoSgmt.acaDegree}"
  });

  //回显职业信息段下拉框中的值	
  form.val('octpnInfSgmtForm', {
	 "occupation" : "${basOctpnInfoSgmt.occupation}",
	 "title" : "${basOctpnInfoSgmt.title}",
	 "techTitle" : "${basOctpnInfoSgmt.techTitle}",
	 "industry" : "${basOctpnInfoSgmt.industry}",
	 "cpnType" : "${basOctpnInfoSgmt.cpnType}",
	 "empStatus" : "${basOctpnInfoSgmt.empStatus}"
  });
  
  //回显居住信息段下拉框中的值	
  form.val('redncInfSgmtForm', {
	 "resiStatus" : "${basRedncInfoSgmt.resiStatus}"
  });
  
  
  
});

</script>
