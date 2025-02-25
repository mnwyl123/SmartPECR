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
	                <label class="layui-form-label">变更日期</label>
	                <div class="layui-input-inline">
	                    <input type="text" placeholder="" class="layui-input datefield" id="rptDate" name="rptDate">
	                </div>
	            </div>
				
				<div class="layui-inline">
				  <label class="layui-form-label">信息记录类型</label>
				  <div class="layui-input-inline">
					<select lay-search="" id="infrectype" name="infrectype">
						<option value="">请选择</option>
					</select>							  								
				  </div>
				</div>
			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div> 
	<div class="layui-colla-item" id="accountMsg" style="display:none">
		<form class="layui-form" lay-filter="exampleForm" id="exampleForm">   
			<h3 class="layui-colla-title">企业标识变更管理</h3>	
			<div class="layui-colla-content layui-show" id="baseAddBtn">
				<div class="layui-form-item layui-layer-padding">
					<input name ="pk" id="pk" type="hidden"/>
					<div class="layui-inline layui-col-xs3" >
						<label class="layui-form-label" style="float:none;text-align: left;">
							<b style="color: #f00;">*</b>
							信息记录类型
						</label>
						<div class="layui-input-inline" style="width: 100%;">
							<select lay-search="" id="infrectype1" name="infrectype1">
									<option value="">请选择</option>
							</select>	
						</div>
					</div>
					
					<div class="layui-inline layui-col-xs3">
					  <label class="layui-form-label" style="float:none;text-align: left;">
					 	<b style="color: #f00;">*</b> 
							  变更日期:</label>
					  <div class="layui-input-inline" style="width: 100%;">
						<input type="text" name="lastUpdateTime" id="lastUpdateTime"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield" >
					  </div>
					</div>
				
					<div class="layui-inline layui-col-xs3" >
						  <label class="layui-form-label" style="float:none;text-align: left;">
						 <b style="color: #f00;">*</b> 
						  原业务标识码:</label>
					  <div class="layui-input-inline" style="width: 100%;">
						<input type="text" name="odBnesCode" id="odBnesCode" class="layui-input" lay-verify="required" maxlength="60">
					  </div>
					</div>
					
					<div class="layui-inline layui-col-xs3" >
					  <label class="layui-form-label" style="float:none;text-align: left;">
					 <b style="color: #f00;">*</b> 
					  新业务标识码:</label>
					  <div class="layui-input-inline" style="width: 100%;">
						<input type="text" name="nwBnesCode" id="nwBnesCode"class="layui-input"  lay-verify="required" maxlength="60">
					  </div>
					</div>
				</div>
			</div>
			<!-- <div class="layui-form-item" style="margin-top:40px;margin-left:290px">
				<div class="layui-input-block">
					<button type="submit"  class="layui-btn"  lay-filter="close">取消</button>
					<button type="submit"  class="layui-btn" lay-submit lay-filter="exampleSubmit" id="exampleSubmit">保存</button>
				</div>
			</div> -->
		</form>
	</div>

<!-- 新增或修改界面 -->
<div class="layui-col-md10" style="display:none;margin:30px auto;" id="dialog">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item" style="margin-left:30px;">
			<div class="layui-inline">
			  <label>审核意见:</label>
			  <div class="layui-input-block">
				<textarea  placeholder="请填写您的审核意见" style="margin: 0px; width: 352px; height: 146px;" id="auditOpinion">同意</textarea>
			  </div>
			</div>
		</div>
	</form>	
</div>
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="opraBarRow">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarHead">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="auditingBtn" id="auditingBtn">审核 <i class="layui-icon layui-icon-addition"></i></button>
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="static/js/jquery.cookie.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/enterDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<!-- 枚举值模板模板  加载select选择框 数据字典 -->
<script type="text/html" id="enumerationValueTpl">
	<option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
	{{#  }); }}
</script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>

<script type="text/javascript">

layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage', 'laytpl'], function () {
    var
        element = layui.element
        form = layui.form,
        table = layui.table,
        layer = layui.layer,
        laypage = layui.laypage,
        laydate = layui.laydate
        laytpl = layui.laytpl;
  require(['static/js/pecr/module/base'], function (base) {
  /**
   * 初始化常量枚举值
   */
  var initEnumerationValue = function () {
      var array = ['ENT_INFRECTYPE_ACCOUNT', 'DATA_STATUS_ZHCX'];
      var selectData = [];
      for (var i = 0; i < array.length; i++) {
          var node = {};
          node.systemCodeType = array[i];
          selectData.push(node);
      }
      $.ajax({
          url: 'dataDictCode/selectCodeTypeList.do',
          data: {DATA_IDS: JSON.stringify(selectData)},
          type: 'post',
          cache: false,
          dataType: 'json',
          success: function (data) {
              for (var i = 0; i < data.result.length; i++) {
                  if (data.result[i].ENT_INFRECTYPE_ACCOUNT) {
                      base.renderTpl({
                          tplId: "enumerationValueTpl",
                          arr: {"list": data.result[i].ENT_INFRECTYPE_ACCOUNT},
                          containerId: "infrectype"
                      });
                      base.renderTpl({
                          tplId: "enumerationValueTpl",
                          arr: {"list": data.result[i].ENT_INFRECTYPE_ACCOUNT},
                          containerId: "infrectype1"
                      });
                      continue;
                  } else if (data.result[i].DATA_STATUS_ZHCX) {
                      base.renderTpl({
                          tplId: "enumerationValueTpl",
                          arr: {"list": data.result[i].DATA_STATUS_ZHCX},
                          containerId: "businessStates"
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
  
  
  
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarHead'  //表格顶部工具栏
	,url:'auditing/dataEntAccounChangePage.do' //url
    ,cols: [[
			{type:'numbers'}	//列每行序号
			, {type:'checkbox'}  //列复选框
			, {align: "center", hide: true, field: "pk", title: "主键"}
            , {align: "center", field: 'infRecType', title: '信息记录类型', templet: function (d) {return renderColumnDict(d, 'infRecType', enterDict.entInfrectypeAccount)}}
            , {align: "center", field: 'lastUpdateTime', title: '变更日期'}
            , {align: "center", field: 'odBnesCode', title: '原业务标识码'}
            , {align: "center", field: 'nwBnesCode', title: '新业务标识码'}
			, {fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow'} //行上的工具栏
		]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 10 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [10, 20, 50]
	,done: function (res, curr, count) {
		$('th').css({'background-color':'#0997F7',
			 'color':'#FFFFFF',
			 'font-family':'Microsoft Yahei',
			 'font-weight':'500',   //设置字体是否加粗
			 'font-size':'13px'});
	}
  }); 
  
  table.on('tool(tableDemo)', function(obj){
		  form.val('exampleForm', {
	          'infrectype1': '',
	          'lastUpdateTime': '',
	          'odBnesCode': '',
	          'nwBnesCode': '',
	           'name': '',
	           'idType': '',
	           'idNum': ''
	      });
		var data = obj.data;
		layer.open({
            title: '详情',
            type: '1',
            content: $('#accountMsg'),
            area: ['70%', '70%']
        });
		//回填数据 
        form.val('exampleForm', data);
        $("#infrectype1").val(data.infRecType);
        $("#infrectype1").attr("disabled", true);
        $("#lastUpdateTime").attr("disabled", true);
        form.render('select');
	});
  //查询事件
  $("#queryBtn").on('click', function () {
      table.reload('tableDemo', {
          method: 'post',
          where: {
              rptDate: $('#rptDate').val(),
              infrectype: $('#infrectype').val()
          }
      });
      return false;
  });
  
  //日期输入框  按css将所有的date组件渲染
  $(".datefield").each(function(){
	  laydate.render({
	    elem: this,
	    trigger:'click'
	  });
  });
  
  table.on('toolbar(tableDemo)', function (obj) {
		switch (obj.event) {
			case 'auditingBtn':
				 //查询框先选择信息记录类型
				 var infrectype = $('#infrectype').val();
				 if(infrectype === null || infrectype === ""){
					 layer.msg("请先选择需要审核的信息记录类型");
					 return ;
				 }
				 //获取选中的行信息
				 var checkStatus = table.checkStatus('tableDemo');
				 //获取选中行的数据
				 data=checkStatus.data;
				 if(data.length==0){
					layer.msg("请选择需要审核的数据");
					return ;
				  }
				 var strIds = "";
				 for(var i = 0; i < data.length; i++){
					 strIds+=checkStatus.data[i].pk+",";
				 }
				 strIds = strIds.substr(0, strIds.length - 1);
				 //判断后台对应的表和主键
				 var tableName = "";
				 var tablePk = "";
				 if(infrectype == '411'){
	            	 tableName = "E_ACCT_INF_ID_CAGS_INF";
	            	 tablePk = "EDW_EN_ACCT_INF_ID_CAGS_INF_ID";
	             }
				if(infrectype == '421'){
	            	 tableName = "E_CR_ACCT_ID_CAGS_INF";
	            	 tablePk = "EGW_EN_ACCT_INF_ID_CAGS_INF_ID";
	             }
				if(infrectype == '441'){
	            	 tableName = "E_SEC_ACCT_ID_CAGS_INF";
	            	 tablePk = "EEW_EN_SEC_ACCT_ID_CAGS_INF_ID";
	             }
				 
				var popIndex  = layer.open({
						type :'1',
						title :'审核',
						content :$('#dialog'),
						btn:['审核通过','审核驳回'],
						area: ['40%', '50%'],
						yes: function (index,layero){
							var auditOpinion = $("#auditOpinion").val();
							$.ajax({ 
								url      : 'auditing/isAuditing.do', 
								data     : {state:'30',strIds:strIds,auditOpinion:auditOpinion,tableName: tableName ,tablePk: tablePk},
								type     : 'post',  
								cache    : false,  
								dataType : 'json',  
								success:function(result){ 
									table.reload('tableDemo', {
										method : 'post',
										where:{
											  rptDate: $('#rptDate').val(),
								              infrectype: $('#infrectype').val()
											}
									});
									layer.msg(result.msg, {time:1000});
								 },
								//请求失败，包含具体的错误信息
								error : function(e){
									layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
								}					 
							});
							 layer.close(popIndex); 
							 return ;
					  	},
					  	btn2: function (index,layero){
							var auditOpinion = $("#auditOpinion").val();
							$.ajax({ 
								url      : 'auditing/isAuditing.do', 
								data     : {state:'40',strIds:strIds,auditOpinion:auditOpinion,tableName: tableName,tablePk: tablePk},
								type     : 'post',  
								cache    : false,  
								dataType : 'json',  
								success:function(result){ 
									table.reload('tableDemo', {
										method : 'post',
										where:{
											  rptDate: $('#rptDate').val(),
								              infrectype: $('#infrectype').val()
											}
									});
									 
									layer.msg(result.msg, {time:1000});
								 },
								//请求失败，包含具体的错误信息
								error : function(e){
									layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
								}					 
							});
							 layer.close(popIndex); 
					  	}
					});
				  	form.render('select');
					 break;
				  	
		};
  });
 });
});
</script>

</body>
</html>
