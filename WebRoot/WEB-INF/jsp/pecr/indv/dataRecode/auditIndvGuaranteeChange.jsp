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
	<!--数据维护-->
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
	                <label class="layui-form-label" >信息报告日期</label>
	                <div class="layui-input-inline">
	                    <input type="text" placeholder="" class="layui-input datefield" id="rptDate" name="rptDate">
	                </div>
	            </div>
	            
	            <div class="layui-inline">
				  <label class="layui-form-label">身份标识类型</label>
				  <div class="layui-input-inline">
					<select lay-search="" id="idType" name="idType">
						<option value="">请选择</option>
					</select>							  								
				  </div>
				</div>
				
				<div class="layui-inline">
	                <label class="layui-form-label">身份标识号码</label>
	                <div class="layui-input-inline">
	                    <input type="text" placeholder="" class="layui-input" id="idCode" name="idCode">
	                </div>
          	 	</div>
				
				 <div class="layui-inline">
				  <label class="layui-form-label">数据状态</label>
				  <div class="layui-input-inline">
					<select lay-search="" id="businessStates" name="businessStates">
						<option value="">请选择</option>
					</select>							  								
				  </div>
				</div>		

			</div>
		  </div>						  
		</div>	
	</div>
	 <!-- 数据渲染 -->
	<table class="layui-hide" id="dataTable" lay-filter="dataTable"></table>
</div>

<!-- 审核页面 -->
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
<!-- 所属机构模板 -->
<script type="text/html" id="orgTpl">
	 <option value="" data-id="">请选择</option>
	{{# layui.each(d.list, function(index, item){ }}
		<option value="{{item.orgCode}}">{{item.orgCode}}-{{item.orgName}}</option>
	{{#  }); }}
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
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>

<script type="text/javascript">
var addOrUpdate;
/**
 * 
 * 模块化加载
 * Layui中的模块
 */
layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage','laytpl'], function(){
	var form = layui.form,
	element = layui.element,
	table = layui.table,
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate
	laytpl = layui.laytpl;
	require(['static/js/pecr/module/base'],function(base){
	/**
     * 初始化常量枚举值
     */
    var initEnumerationValue = function () {
		var array = ['DATA_STATUS_ZHCX','ID_TYPE','PER_GUAR_UPD_INF_REC_TYPE','PER_GUAR_ACCT_TYPE'];
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
					if (data.result[i].ID_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].ID_TYPE},
							containerId : "idType"
						});
						continue;
					}else if (data.result[i].DATA_STATUS_ZHCX){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].DATA_STATUS_ZHCX},
							containerId : "businessStates"
						});
						continue;
					}else if (data.result[i].PER_GUAR_UPD_INF_REC_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].PER_GUAR_UPD_INF_REC_TYPE},
							containerId : "mdfcSgmtCode"
						});
						continue;
					}else if (data.result[i].PER_GUAR_ACCT_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].PER_GUAR_ACCT_TYPE},
							containerId : "acctType"
						});
						continue;
					}
				}
                form.render('select');
                //d1.resolve("渲染完成");
			}	     
	    });
    };
    //初始化常量枚举值
    initEnumerationValue();
	});
	
	/**
	 * element组件渲染
	 * form组件渲染
	 */
	element.init();//每个页面都有
	form.render();//每个页面都有
	
    laydate.render({
        elem: '#rptDate'
        ,theme: '#588fd0'
        ,format: 'yyyy-MM-dd'
    });
	
	
    table.render({
		elem: '#dataTable', //表格所固定的div
		toolbar: '#toolbarHead',  //表格顶部工具栏
		url:'auditing/dataIndvGuaranteeChange.do',
    	cols: [[
			{type:'numbers'},	//列每行序号
			{type:'checkbox'},  //列复选框
			{field: 'pdaGuarAcctBsSgmtId', title: '主键', hide: true},
             {align : "center",field : "name",title : "姓名"},
             {align : "center",field : "idType",title : "身份标识类型",templet: function(d){return renderColumnDict(d, 'idType',staticDict.idType)}},
             {align : "center",field : "idNum",title : "身份标识号码"},
             {align : "center",field : "rptDate",title : "信息报告日期"},
             {align : "center",field : "mdfcSgmtCode",title : "待更正段段标", templet:function(d){return renderColumnDict(d,'mdfcSgmtCode',staticDict.perGuarUpdInfRecType)}},
			 {fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow'} //行上的工具栏
		]],
		even: true,  //行斑马线
		page: true, //是否分页
		limit: 10, //初始每页显示条数
		height: $(document).height() - $('#dataTable').offset().top - $('#queryPanel').height() - 25,
		limits: [10, 20, 50],
		done: function (res, curr, count) {
			$('th').css({'background-color':'#0997F7',
				 'color':'#FFFFFF',
				 'font-family':'Microsoft Yahei',
				 'font-weight':'500',   //设置字体是否加粗
				 'font-size':'13px'});
		}
	});

	  
	//查询按钮点击事件
	$("#queryBtn").on('click', function(){
		table.reload('dataTable', {
			method : 'post',
			where: {
				idType   :   $('#idType').val(), 
				idCode      :   $('#idCode').val(), 
			    rptDate  :  $('#rptDate').val(),
				businessStates:$('#businessStates').val()
				}
		}); 
		return false;
	});
	
	
	table.on('tool(dataTable)', function(obj){
		var data = obj.data;
		var layEvent = obj.event;
		if (layEvent === 'more'){
			$("body").data("dataObj",data);
			addOrUpdate = 'detail';
			layer.open({
				type: 2,
				title: '详情',
				shadeClose: false,
				shade: [0.3, '#000'],
				area: ['100%', '100%'],
				anim: 2,
				resize: false,
				content: 'indvProtocol/indvGuaranteeChangeEdit.do?addOrUpdate=' + addOrUpdate
				         + '&pdaGuarAcctBsSgmtId=' + data.pdaGuarAcctBsSgmtId,
				end: function(){
					table.reload('dataTable', {
						method : 'post',
						where: {
							idType   :   $('#idType').val(), 
							idCode      :   $('#idCode').val(), 
						    rptDate  :  $('#rptDate').val(),
							businessStates:$('#businessStates').val()
							}
					});
				}
			});
		}
	});
	
	table.on('toolbar(dataTable)', function (obj) {
		switch (obj.event) {
			case 'auditingBtn':
				 //获取选中的行信息
				 var checkStatus = table.checkStatus('dataTable');
				 //获取选中行的数据
				 data=checkStatus.data;
				 if(data.length==0){
					layer.msg("请选择需要审核的数据");
					return ;
				  }
				 var strIds = "";
				 for(var i = 0; i < data.length; i++){
					 strIds+=checkStatus.data[i].pdaGuarAcctBsSgmtId+",";
				 }
				 strIds = strIds.substr(0, strIds.length - 1);
				 //判断后台对应的表和主键
				 var tableName = "I_GUAR_ACCT_BS";
				 var tablePk = "PDA_GUAR_ACCT_BS_SGMT_ID";
			  	layer.open({
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
								table.reload('dataTable', {
									method : 'post',
									where:{
										idType   :   $('#idType').val(), 
										idCode      :   $('#idCode').val(), 
									    rptDate  :  $('#rptDate').val(),
										businessStates:$('#businessStates').val()
										}
								});
								layer.msg(result.msg, {time:1000});
							 },
							//请求失败，包含具体的错误信息
							error : function(e){
								layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
							}					 
						});
						 layer.close(index); 
						 return false;
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
								table.reload('dataTable', {
									method : 'post',
									where:{
										idType   :   $('#idType').val(), 
										idCode      :   $('#idCode').val(), 
									    rptDate  :  $('#rptDate').val(),
										businessStates:$('#businessStates').val()
										}
								});
								 
								layer.msg(result.msg, {time:1000});
							 },
							//请求失败，包含具体的错误信息
							error : function(e){
								layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
							}					 
						});
						 layer.close(index); 
				  	}
				});
			  	form.render('select');
				 break;
				  	
		};
	});
	
});

</script>
</body>
</html>
