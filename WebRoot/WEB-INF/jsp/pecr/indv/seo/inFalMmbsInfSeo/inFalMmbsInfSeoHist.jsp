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
		  <div class="layui-colla-content layui-show">
			<div class="layui-form-item">
				
				<div class="layui-inline">
				  <label class="layui-form-label">信息报告日期</label>
				  <div class="layui-input-inline">
					<input type="text" name="RPT_DATE" id="RPT_DATE"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield">
				  </div>
				</div>
			</div>
		  </div>						  
		</div>	
	</div>	
	<table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
	 </div>

<!-- 新增或修改界面 -->
<div class="layui-col-md12" style="display:none;margin:30px auto;text-align: center" id="dialog">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item">
			<div class="layui-inline">
			  <label class="layui-form-label">A姓名</label>
			  <div class="layui-input-inline">
				<input type="text" name="name" autocomplete="off" readonly class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">A证件类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" readonly name="idType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">A证件号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="idNum" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">B姓名</label>
			  <div class="layui-input-inline">
				<input type="text" name="famMemName" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">B证件类型</label>
			   <div class="layui-input-inline">
				<select  lay-search="" readonly name="famMemCertType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">B证件号码</label>
			  <div class="layui-input-inline">
			  	<input type="text" name="famMemCertNum" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">家族关系</label>
			  <div class="layui-input-inline">
				<select lay-search="" readonly name="famRel" id="famRel">
                        <option value="">请选择</option>
                    </select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">家族关系有效标志</label>
			  <div class="layui-input-inline">
				<select lay-search="" readonly name="famRelaAssFlag" id="famRelaAssFlag">
                    <option value="">请选择</option>
                </select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">信息来源编码</label>
			  <div class="layui-input-inline">
				<input type="text" name="infSurcCode" readonly autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">信息报告日期</label>
			  <div class="layui-input-inline">
				<input type="text" name="rptDate" disabled="true"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield">
			  </div>
			</div>
		</div>
	</form>	
</div>
<div class="layui-col-md12" style="display:none;margin:30px auto;text-align: center" id="edit">
	<form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">	
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input type="hidden" name="pajInFalMmbsInfId" autocomplete="off" class="layui-input" id="pajInFalMmbsInfId"/>
			 </div>
			<div class="layui-inline">
			  <label class="layui-form-label">A姓名</label>
			  <div class="layui-input-inline">
				<input type="text" name="name" id="name" autocomplete="off" class="layui-input"/>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">A证件类型</label>
			  <div class="layui-input-inline">
				<select  lay-search="" id="idType" readonly name="idType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">A证件号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="idNum" id="idNum" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">B姓名</label>
			  <div class="layui-input-inline">
				<input type="text" name="famMemName" id="famMemName" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">B证件类型</label>
			  <div class="layui-input-inline">
			  	<select  lay-search="" readonly name="famMemCertType" id="famMemCertType">
				  <option value="">请选择</option>										 
				</select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">B证件号码</label>
			  <div class="layui-input-inline">
				<input type="text" name="famMemCertNum" id="famMemCertNum" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">家族关系</label>
			  <div class="layui-input-inline">
				<select lay-search="" readonly name="famRel" id="famRel">
                        <option value="">请选择</option>
                    </select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">家族关系有效标志</label>
			  <div class="layui-input-inline">
				<select lay-search="" readonly name="famRelaAssFlag" id="famRelaAssFlag">
                    <option value="">请选择</option>
                </select>
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">信息来源编码</label>
			  <div class="layui-input-inline">
				<input type="text" name="infSurcCode" id="infSurcCode" autocomplete="off" class="layui-input">
			  </div>
			</div>
			<div class="layui-inline">
			  <label class="layui-form-label">信息报告日期</label>
			  <div class="layui-input-inline">
				<input type="text" name="rptDate" id="rptDate" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datefield">
			  </div>
			</div>
		</div>
		<div class="layui-form-item" style="margin-top:40px;">
			<div class="layui-input-block" style="margin-left: 0px;">
				<button type="submit"  class="layui-btn" lay-submit lay-filter="close">取消</button>
				<button type="submit"  class="layui-btn" lay-submit id= "save" lay-filter="save">保存</button>
				<button type="submit"  class="layui-btn" lay-submit id= "update" lay-filter="update">确认修改</button>
			</div>
		</div>
	</form>	
</div>
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情 </a>
  <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">发起补录</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="back">报文回退 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
<div class="layui-input-inline">
</div>
   <!-- 
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i class="layui-icon layui-icon-addition"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius" lay-event="isAll">驳回 <i class="layui-icon layui-icon-return"></i></button>-->
</script>

<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script type="text/javascript">

//初始化性别下拉字典
initDict('idType', staticDict.idType);
initDict('famMemCertType', staticDict.idType);
initDict('famRel', staticDict.famRel);
initDict('famRelaAssFlag', staticDict.famRelaAssFlag);
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
 layui.use(['form', 'laydate', 'element', 'layer', 'table', 'laypage', 'laytpl'], function () {
     var element = layui.element
     	form = layui.form,
         table = layui.table,
         layer = layui.layer,
         laypage = layui.laypage,
         laydate = layui.laydate
     laytpl = layui.laytpl;
     
  require(['static/js/pecr/module/base','static/js/pecr/module/verify'], function (base,verify) {
	  
	var dataObj = window.parent.$("body").data("dataObj");
//展示已知数据
  table.render({
    elem: '#tableDemo' //表格所固定的div
	,toolbar: '#toolbarDemo'  //表格顶部工具栏
	,url:'inFalMmbsInfSeo/dataHistList.do?ID_TYPE='+ dataObj.ID_TYPE + "&ID_NUM=" + dataObj.ID_NUM //url
    ,cols: [[ 
      {type:'numbers'}	//列每行序号
      ,{type:'checkbox'} //列复选框
      ,{align : "center",field: 'pajInFalMmbsInfId', hide: true,title: 'ID', sort: true}
      ,{align : "center",field: 'name', title: '姓名'}
      ,{align : "center",field: 'idType', title: '证件类型', templet: function (d) {return renderColumnDict(d, 'idType',staticDict.idType )}} //列上要显示字典描述，renderColumnDict中第2个参数为当前列的field值，第3个参数为具体哪个字典变量
      ,{align : "center",field: 'idNum', title: '证件号码'}
      ,{align : "center",field: 'rptDate', title: '信息报告日期'}
      ,{align : "center",field: 'businessStates', title: '数据状态', templet:function(d){return renderColumnDict(d,'businessStates',staticDict.businessStates)}}
	  ,{align : "center",fixed: 'right', title:'操作', toolbar: '#barDemo', width:200} //行上的工具栏
    ]]
    ,even: true  //行斑马线
	,page: true //是否分页
	,limit: 10 //初始每页显示条数
	,height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
	,limits: [10, 20, 50],
	done: function (res, curr, count) {
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
  
  function tableReload(){
	  table.reload('tableDemo',{
		  method : 'post',
			where: { 
				RPT_DATE    :   $('#RPT_DATE').val()
				}
	  }); 
  }
  
  //查询按钮点击事件
  $("#queryBtn").on('click', function(){
	  tableReload(); 
	  return false;
  });
  form.on('submit(close)', function(data){
	  layer.close(popIndex);
	  tableReload(); 
	  });
  form.on('submit(save)', function(data){
	  addOrUpdate = "save";
	  $("#save").show();
  	  $("#update").hide();
	  if($("#name").val()==""){
		  layer.msg('A姓名');
			return false;
		}
	  if($("#idType").val()==""){
		  layer.msg('A证件类型');
			return false;
		}
	  if($("#idNum").val()==""){
		  layer.msg('A证件号码');
			return false;
		}
	  if($("#famMemName").val()==""){
		  layer.msg('B姓名');
			return false;
		}
	  if($("#famMemCertType").val()==""){
		  layer.msg('B证件类型');
			return false;
		}
	  if($("#famMemCertNum").val()==""){
		  layer.msg('B证件号码');
			return false;
		}
	  if($("#famRel").val()==""){
		  layer.msg('家族关系');
			return false;
		}
	  if($("#famRelaAssFlag").val()==""){
		  layer.msg('家族关系有效标志');
			return false;
		}
	  if($("#infSurcCode").val()==""){
		  layer.msg('信息来源编码');
			return false;
		}
	  if($("#rptDate").val()==""){
		  layer.msg('信息报告日期不能为空');
			return false;
		}
		if($("#idNum").val()!=""&&($("#idNum").val()=="0"&&$("#idType").val()=="10")){
			var CREDENTIALS_NUM=$("#idNum").val();
		  	if(IDCard1('','',CREDENTIALS_NUM)){
		  		layer.msg('身份证号码格式错误！');
				return false;
		  	}
		}
		if($("#idType").val()==$("#famMemCertType").val() && $("#famMemCertNum").val() == $("#idNum").val()){
			layer.msg('两人的“证件类型”和“证件号码”不能完全相同');
				return false;
		}
	     $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : "inFalMmbsInf/updatedate.do?addOrUpdate="+addOrUpdate,
	       //数据，json字符串
	       data : data.field,
	       //请求成功
	       success : function(result) {
	    	   if(result.success == true){
	     	   	  layer.msg('操作成功', {time:3000});
	     	   	  tableReload(); 
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
	   return false;//防止页面跳转
	  });
  form.on('submit(update)', function(data){
	  addOrUpdate = "update";
	     $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : "inFalMmbsInf/updatedate.do?addOrUpdate="+addOrUpdate,
	       //数据，json字符串
	       data : data.field,
	       //请求成功
	       success : function(result) {
	    	   if(result.success == true){
	     	   	  layer.msg('操作成功', {time:3000});
	     	   	  verify.dataValidation('save','I_IN_FAL_MMBS_INF',$("#pajInFalMmbsInfId").val(),'form',true,false,true); //数据校验
	     	   	  tableReload(); 
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
	   return false;//防止页面跳转
	  });
  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
  table.on('tool(tableDemo)', function(obj){
	  form.val('exampleForm', {'pajInFalMmbsInfId':'','name':'', 'idType':'', 'idNum':'', 'famMemName':'', 'famMemCertType':'', 'famMemCertNum':'', 
			'famRel':'', 'famRelaAssFlag':'', 'infSurcCode':'', 'rptDate':''});
    var data = obj.data;
    var businessStates = data.businessStates;
    var flag = data.flag;
    if(obj.event === 'more'){
    	addOrUpdate = "update";
    	popIndex = layer.open({
			type :'1',
			title :'修改信息',
			content :$('#dialog'),
			area: ['40%', '80%']			
		});
    	//将该行数据在form中回显
    	form.val('exampleForm', data);
    	$("#userid_input").attr('readonly', true);
    	$("#userid_input").addClass('readonly-backgroud');
    }
    else if(obj.event === 'edit'){
        if(flag === 'new' && (businessStates == '20' || businessStates == '11' || businessStates == '10' || businessStates == '40' || businessStates == '80' || businessStates == '110')){
	   	    	$("#update").show();
	   	    	$("#save").hide();
	   	    	popIndex = layer.open({
	   				type :'1',
	   				title :'信息补录',
	   				content :$('#edit'),
	   				area: ['40%', '90%']			
	   			});
	   	    	//将该行数据在form中回显
	   	    	form.val('exampleForm', data);
	   	    	$("#userid_input").attr('readonly', true);
	   	    	$("#userid_input").addClass('readonly-backgroud');
        }else{
      	  layer.confirm('该数据信息不支持发起补录!', {anim: 6});
        }
      }else if(obj.event === 'back'){
        	if(flag === 'new' && businessStates == '50'){
        		layer.confirm('是否确认回退报文(该数据所在报文的全部数据状态为审核成功)？', function(index){
		   	   	     $.ajax({
		   	   	       //请求方式
		   	   	       type : "POST",
		   	   	       //请求地址
		   	   	       url : "inFalMmbsInfSeo/backdate.do?addOrUpdate="+addOrUpdate,
		   	   	       //数据，json字符串
		   	   	       data : data,
		   	   	       //请求成功
		   	   	       success : function(result) {
		   	   	    	   if(result.success == true){
		   	   	     	   	  layer.msg('操作成功', {time:3000});
		   	   	     		  tableReload(); 
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
		   	  		layer.close(index);
        		});
	   	   	   	return false;//防止页面跳转
            }else{
          	  layer.confirm('该数据信息不支持报文回退!', {anim: 6});
            }
      	
     }
  });
  });
});

</script>
</body>
</html>
