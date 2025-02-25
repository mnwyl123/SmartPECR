<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				查询  <i class="layui-icon layui-icon-search"></i>  
			</button> 
		  </h3>			  
		  <div class="layui-colla-content layui-show" style="margin:1px 1px 0px 0px">
			<div class="layui-form-item">
				<div class="layui-inline">
				  <label class="layui-form-label">信息记录类型</label>
				  <div class="layui-input-inline">
				  	<select  lay-search="" id="infRecType" name="infRecType">
					  <option value="">请选择</option>										 
					</select>
				  </div>
				</div>
				<div class="layui-inline">
				  <label class="layui-form-label">日期</label>
				  <div class="layui-input-inline">
					<input type="text" name="curDate" class="layui-input datefield" id="curDate" value="${pd.curDate }">				
				  </div>
				</div>
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div> 

<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
	<a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="editInfo">编辑</a>
</script>

<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">
	<div class="layui-inline"> </div>
</script>

<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>

<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/javascript">

//初始化下拉字典
//initDict('idType', staticDict.sex);
//弹出层id
var popIndex;
//获取checkbox选中的数据
var date;


/**
 * 和表单、日期控件、数据表格等相关操作均在下面方法中编写 
 * 公共的方法或变量可以提到下面方法以外定义
 *
 * 界面要用layui的form，则要进入form
 * 要用日期控件，要引入laydate
 * 要用折叠面板，要引入element
 * 要用数据表格，要引入table
 */
layui.use(['element', 'form','layer','laydate','table','laytpl'], function()
{
	  var element = layui.element //获取element模块
		form = layui.form, //获取form模块
		layer = layui.layer, //获取layer模块
		laydate = layui.laydate, //获取laydate模块
		table = layui.table //获取table模块
		laytpl = layui.laytpl;  //获取laytpl模块  模板引擎

  require(['static/js/pecr/module/base'],function(base){
		
	  element.init();//每个页面都有
	  form.render(); //每个页面都有
	  /**
	     * 初始化常量枚举值
	     */
	  var initEnumerationValue = function(){
			var array = ['INFRECTYPE'];
			var selectData = [];
			for(var i=0; i<array.length; i++ ){
				var node = {};
				node.systemCodeType = array[i];
				selectData.push(node);
			}
			$.ajax({  
			    url:'dataDictCode/selectCodeTypeList.do', 
				data:{DATA_IDS : JSON.stringify(selectData)},  
				type:'post',  
				cache:false,  
				dataType:'json',  
				success:function(data){
					for(var i=0;i<data.result.length;i++){
						if (data.result[i].INFRECTYPE){
							base.renderTpl({
								tplId : "enumerationValueTpl",
								arr : {"list" : data.result[i].INFRECTYPE},
								containerId : "infRecType"
							});
							continue;
						}
					}
	                form.render('select');
				}	     
		    });
	    };
	    //初始化常量枚举值
	    initEnumerationValue();
	    
	 });
  
	  
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarHead'  //表格顶部工具栏
	,url:'dataCheckInfo/dataList.do' //url
	,where:{'infRecType':$('#infRecType').val(), 'curDate':$('#curDate').val()}
    ,cols: [[ 
      {type:'numbers', fixed: 'left', width:50}	//列每行序号
      ,{type:'checkbox', width:50} //列复选框
      ,{field: 'INF_REC_TYPE', align:'center', title: '信息记录类型',templet:function(d){return renderColumnDict(d, 'INF_REC_TYPE', staticDict.infRecTypePOE)}}
      ,{field: 'TABLE_NAME_CN', align:'center', title: '业务中文名'}
      ,{field: 'TABLE_NAME', align:'center', title: '表名'}
      ,{field: 'BUSINESS_PK', align:'center' , title: '业务主键'}
      ,{field: 'ERROR_MSG', align:'center', title: '错误信息'} 
      ,{field: 'CUR_DATE', align:'center', title: '时间',width:150}
      ,{align : "center",fixed: 'right', title:'操作', toolbar: '#opraBarRow',width:100} //行上的工具栏
    ]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 15 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [15, 30, 50]
	,done: function (res, curr, count) {
        $('th').css({'background-color':'#0997F7',
			 'color':'#FFFFFF',
			 'font-family':'Microsoft Yahei',
			 'font-weight':'500',   //设置字体是否加粗
			 'font-size':'13px'});
	}
  });
  
	//日期输入框  按css将所有的date组件渲染
	$(".datefield").each(function(){
	  laydate.render({
		elem: this,
		trigger:'click'
	  });
	});
  
  
  //查询按钮点击事件
	$("#queryBtn").on('click', function(){
	  table.reload('tableDemo', {
		  method : 'post',
		  where: {'infRecType':$('#infRecType').val(), 'curDate':$('#curDate').val()}
	  }); 
	  return false;
	});
  
	  table.on('tool(tableDemo)', function(obj){
			var data = obj.data;
			var layEvent = obj.event;
			if (layEvent === 'editInfo'){
				var url = getUrlByRecInfoType(data);
				$("body").data("dataObj",data);
				if(url != ''){
					layer.open({
						type: 2,
						title: '编辑',
						shadeClose: false,
						shade: [0.3, '#000'],
						area: ['100%', '100%'],
						anim: 2,
						resize: false,
						content: url,
						end: function(){
							 table.reload('tableDemo', {
								  method : 'post',
								  where: {'infRecType':$('#infRecType').val(), 'curDate':$('#curDate').val()}
							 }); 
						}
					});
				}else{
					layer.msg("此处暂不支持此类信息记录类型的修改，请去对应的修改页面进行修改！", {time:3000});
				}
	      }
		});
	  
	  function getUrlByRecInfoType(data){
		  var type = data.INF_REC_TYPE;
		  var addOrUpdate = 'edit';
		  var pk = data.MASTER_TABLE_ID;
		  var BUSINESS_PK = data.BUSINESS_PK;
		  var acctType = BUSINESS_PK.substr(0,2);
		  if(type === '110'){
			  data['paaBsSmgtId'] = data.MASTER_TABLE_ID;
			  return 'indvBasicsInfo/indvBasicsInfoDetail.do?addOrUpdate=' + addOrUpdate + '&paaBsSmgtId=' + pk;
		  }else if(type === '114'){
			  return '';
		  }else if(type === '120'){
			  return '';
		  }else if(type === '130'){
			  return '';
		  }else if(type === '134'){
			  return '';
		  }else if(type === '140'){//暂时没有 
			  return '';
		  }else if(type === '210'){
			  data['pbaAcctBsSgmtId'] = data.MASTER_TABLE_ID;
			  data['acctType'] = acctType;
			  return 'indvLoanAcctInfo/loanAcctInfoEdit.do?addOrUpdate=' + addOrUpdate + '&pbaAcctBsSgmtId=' + pk;
		  }else if(type === '211'){
			  return '';
		  }else if(type === '212'){//个人借贷按段更正
			  data['pbaAcctBsSgmtId'] = data.MASTER_TABLE_ID;
			  data['acctType'] = acctType;
			  return 'indvProtocol/indvLoanChangeEdit.do?addOrUpdate=' + addOrUpdate + '&pbaAcctBsSgmtId=' + pk;
		  }else if(type === '213'){
			  return '';
		  }else if(type === '214'){
			  return '';
		  }else if(type === '215'){
			  return '';
		  }else if(type === '220'){
			  data['pcaCtrctBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'inCtrctInf/inCtrctInfEdit.do?addOrUpdate=' + addOrUpdate + '&pcaCtrctBsSgmtId=' + pk;
		  }else if(type === '221'){
			  return '';
		  }else if(type === '222'){//个人授信协议按段更正 
			  data['pcaCtrctBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'indvProtocol/indvProtocolChangeEdit.do?addOrUpdate=' + addOrUpdate + '&pcaCtrctBsSgmtId=' + pk;
		  }else if(type === '223'){
			  return '';
		  }else if(type === '224'){
			  return '';
		  }else if(type === '230'){
			  data['pdaGuarAcctBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'indvGuarAcctInfo/guarAcctInfoEdit.do?addOrUpdate=' + addOrUpdate + '&pdaGuarAcctBsSgmtId=' + pk;
		  }else if(type === '231'){
			  return '';
		  }else if(type === '232'){//个人担保按段更正
			  data['pdaGuarAcctBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'indvProtocol/indvGuaranteeChangeEdit.do?addOrUpdate=' + addOrUpdate + '&pdaGuarAcctBsSgmtId=' + pk;
		  }else if(type === '233'){
			  return '';
		  }else if(type === '234'){
			  return '';
		  }else if(type === '310'){
			  data['eaaBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'eccustbasis/enBasInfEdit.do?addOrUpdate=' + addOrUpdate + '&eaaBsSgmtId=' + pk;
		  }else if(type === '340'){//暂时没有 
			  return '';
		  }else if(type === '314'){
			  return '';
		  }else if(type === '350'){
			  data['ecaEnIcdnRltpInfId'] = data.MASTER_TABLE_ID;
			  return 'enIcdnRltpInf/enIcdnRltpInfEdit.do?addOrUpdate=' + addOrUpdate + '&ecaEnIcdnRltpInfId=' + pk;
		  }else if(type === '410'){
			  data['edaAcctBsSgmtId'] = data.MASTER_TABLE_ID;
			  data['acctType'] = acctType;
			  return 'entLoanAcctInfo/loanAcctInfoEdit.do?addOrUpdate=' + addOrUpdate + '&edaAcctBsSgmtId=' + pk;
		  }else if(type === '411'){
			  return '';
		  }else if(type === '412'){//企业借贷按段更正,待修改了按段更正之后新增。
			  data['edaAcctBsSgmtId'] = data.RECORD_ID;
			  data['acctType'] = acctType;
			  return 'entUpDaccountData/entLoanChangeEdit.do?addOrUpdate=' + addOrUpdate + '&edaAcctBsSgmtId=' + pk;
		  }else if(type === '413'){
			  return '';
		  }else if(type === '414'){
			  return '';
		  }else if(type === '420'){
			  data['egaCtrctBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'enCtrctInfo/enCtrctInfoEdit.do?addOrUpdate=' + addOrUpdate + '&egaCtrctBsSgmtId=' + pk;
		  }else if(type === '421'){
			  data['egaCtrctBsSgmtId'] = data.RECORD_ID;
			  return 'entUpDaccountData/entProtocolChangeEdit.do?addOrUpdate=' + addOrUpdate + '&egaCtrctBsSgmtId=' + pk;
		  }else if(type === '422'){//企业授信协议按段更正 ,待修改了按段更正之后新增。
			  return '';
		  }else if(type === '423'){
			  return '';
		  }else if(type === '424'){
			  return '';
		  }else if(type === '440'){
			  data['eeaGuarAcctBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'enSecAcctInf/enSecAcctInfEdit.do?addOrUpdate=' + addOrUpdate + '&eeaGuarAcctBsSgmtId=' + pk;
		  }else if(type === '441'){
			  return '';
		  }else if(type === '442'){//企业担保按段更正 ,待修改了按段更正之后新增。
			  data['eeaGuarAcctBsSgmtId'] = data.RECORD_ID;
			  return 'entUpDaccountData/entGuaranteeChangeEdit.do?addOrUpdate=' + addOrUpdate + '&eeaGuarAcctBsSgmtId=' + pk;
		  }else if(type === '443'){
			  return '';
		  }else if(type === '444'){
			  return '';
		  }else if(type === '510'){
			  data['efaMotgaCltalCtrctBsId'] = data.MASTER_TABLE_ID;
			  return 'motgaInfo/motgaContractInfoEdit.do?addOrUpdate=' + addOrUpdate + '&efaMotgaCltalCtrctBsId=' + pk;
		  }else if(type === '511'){
			  return '';
		  }else if(type === '514'){
			  return '';
		  }else if(type === '610'){//企业资产负债表信息记录 
			  data['ehaBalanceSheetBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'entBalanceInfo/assetsInfoEdit.do?addOrUpdate=' + addOrUpdate + '&ehaBalanceSheetBsSgmtId=' + pk;
		  }else if(type === '614'){//企业财报整笔删除 
			  return '';
		  }else if(type === '620'){//企业利润及利润分配表信息记录 
			  data['eiaIncomeStatementProfitId'] = data.MASTER_TABLE_ID;
			  return 'entIncomeInfo/incomeInfoEdit.do?addOrUpdate=' + addOrUpdate + '&eiaIncomeStatementProfitId=' + pk;
		  }else if(type === '624'){
			  return '';
		  }else if(type === '630'){//企业现金流量表信息记录
			  data['ejaCashFlowsBsSgmtId'] = data.MASTER_TABLE_ID;
			  return 'cashFlows/enSecAcctInfEdit.do?addOrUpdate=' + addOrUpdate + '&ejaCashFlowsBsSgmtId=' + pk;
		  }else if(type === '634'){
			  return '';
		  }else if(type === '640'){//事业单位资产负债表信息记录
			  data['ekaInstitutionBalanceShtId'] = data.MASTER_TABLE_ID;
			  return 'entInstitutionInfo/institutionEdit.do?addOrUpdate=' + addOrUpdate + '&ekaInstitutionBalanceShtId=' + pk;
		  }else if(type === '644'){
			  return '';
		  }else if(type === '650'){//事业单位收入支出表信息记录
			  data['elaIncomeAndExpenseStatId'] = data.MASTER_TABLE_ID;
			  return 'ecdtreportinstie/entIncomeAndExpenseStatemeBsEdit.do?addOrUpdate=' + addOrUpdate + '&elaIncomeAndExpenseStatId=' + pk;
		  }else if(type === '654'){
			  return '';
		  }else{
			  return '';
		  }
		  
	  }
  
 }); 
 
</script>
</body>
</html>
