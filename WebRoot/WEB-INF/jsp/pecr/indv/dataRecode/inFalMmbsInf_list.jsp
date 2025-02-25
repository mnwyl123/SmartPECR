<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    查询 <i class="layui-icon layui-icon-search"></i>
                </button>
            </h3>
            <div class="layui-colla-content layui-show">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label" >信息报告日期:</label>
                        <div class="layui-input-inline">
                            <input type="text" placeholder="" class="layui-input datefield" id="rptDate">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">证件类型</label>
                        <div class="layui-input-inline">
                            <select lay-search="" id="id_Type" name="id_Type">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="id_Num" id="id_Num" autocomplete="off" class="layui-input"/>
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
    <table class="layui-hide" id="tableDemo" lay-filter="tableDemo"></table>
</div>

<!-- 新增或修改界面 -->
<div class="layui-col-md12" style="display:none;margin:30px auto;text-align: center" id="edit">
    <form class="layui-form layui-form-pane" lay-filter="exampleForm" id="exampleForm">
        <div class="layui-form-item" id = "saveAddBtn">
        	<div class="layui-inline" id="errorMessage">
				<textarea name="feedBackError" id="feedBackError" placeholder="反馈错误信息展示" class="layui-textarea" style="width:317px;height:110px;overflow-y:scroll;overflow-x:scroll;" rows="4" readonly="readonly"></textarea>
			 </div>
            <div class="layui-input-inline">
                <input type="hidden" name="pajInFalMmbsInfId" autocomplete="off" class="layui-input"
                       id="pajInFalMmbsInfId"/>
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
                    <select lay-search="" id="idType" readonly name="idType">
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
                    <select lay-search="" readonly name="famMemCertType" id="famMemCertType">
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
                    <input type="text" name="rptDate" id="rptDate" placeholder="yyyy-MM-dd" autocomplete="off"
                           class="layui-input datefield">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top:40px;">
            <div class="layui-input-block" style="margin-left: 0px;">
                <button type="submit" class="layui-btn" lay-submit id="close" lay-filter="close">取消</button>
                <button type="submit" class="layui-btn" lay-submit id="save" lay-filter="save">保存</button>
            </div>
        </div>
    </form>
</div>
<!-- 表格具体行上的工具栏 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs-column-toolbar" lay-event="more">详情 </a>
    <a class="layui-btn layui-btn-normal layui-btn-xs-column-toolbar" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs-column-toolbar" lay-event="del">删除 </a>
</script>
<!-- 表格顶部工具栏 -->
<script type="text/html" id="toolbarDemo">
    <button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="addBtn" id="addBtn">新增 <i
            class="layui-icon layui-icon-addition"></i></button>
    <button class="layui-btn layui-btn-xs layui-btn-normal layui-btn-radius" id="submitBtn" lay-event="submitBtn">强制提交
        <i class="layui-icon layui-icon-ok"></i></button>
    <!--  <button class="layui-btn layui-btn-xs layui-btn-danger layui-btn-radius" lay-event="isAll">驳回 <i class="layui-icon layui-icon-return"></i></button>-->
</script>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<!-- 字典都写在js中 -->
<script src="static/dict/staticDict.js" charset="utf-8"></script>
<!-- 一些公共的js方法 -->
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script src="static/utils/util.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="js/validateFun.js" charset="utf-8"></script>
<script src="static/js/pecr/require.js" charset="utf-8"></script>
<script type="text/html" id="enumerationValueTpl">
    <option value="" data-id="">请选择</option>
    {{# layui.each(d.list, function(index, item){ }}
    <option value="{{item.systemCode}}" data-id="{{item.systemCodeValueId}}">{{item.systemCodeName}}</option>
    {{#  }); }}
</script>
<script type="text/javascript">

    //初始化性别下拉字典
    initDict('idType', staticDict.idType);
    initDict('famMemCertType', staticDict.idType);
    initDict('orgCode', staticDict.orgCodeYillion);
    initDict('famRel', staticDict.famRel);
    initDict('famRel1', staticDict.famRel);
    initDict('famRelaAssFlag', staticDict.famRelaAssFlag);
    initDict('famRelaAssFlag1', staticDict.famRelaAssFlag);
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
            /**
             * 初始化常量枚举值
             */
            var initEnumerationValue = function () {
                var array = ['ID_TYPE', 'DATA_STATUS_BLXS'];
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
                            if (data.result[i].ID_TYPE) {
                                base.renderTpl({
                                    tplId: "enumerationValueTpl",
                                    arr: {"list": data.result[i].ID_TYPE},
                                    containerId: "id_Type"
                                });
                                base.renderTpl({
                                    tplId: "enumerationValueTpl",
                                    arr: {"list": data.result[i].ID_TYPE},
                                    containerId: "idType1"
                                });
                                continue;
                            } else if (data.result[i].DATA_STATUS_BLXS) {
                                base.renderTpl({
                                    tplId: "enumerationValueTpl",
                                    arr: {"list": data.result[i].DATA_STATUS_BLXS},
                                    containerId: "businessStates"
                                });
                                continue;
                            }
                        }
                        form.render('select');
 //                       d1.resolve("渲染完成");
                    }
                });
            };
            //初始化常量枚举值
            initEnumerationValue();
            // form.render('select');

          //展示已知数据
                  table.render({
                      elem: '#tableDemo' //表格所固定的div
                      , toolbar: '#toolbarDemo'  //表格顶部工具栏
                      , url: 'inFalMmbsInf/List.do' //url
                      , cols: [[
                          {type: 'numbers'}	//列每行序号
                          , {type: 'checkbox'} //列复选框
                          , {align: "center", field: 'pajInFalMmbsInfId', hide: true, title: 'ID', sort: true}
                          , {align: "center", field: 'name', title: '姓名'}
                          , {align: "center", field: 'idType', title: '证件类型', templet: function (d) {return renderColumnDict(d, 'idType',staticDict.idType )}} //列上要显示字典描述，renderColumnDict中第2个参数为当前列的field值，第3个参数为具体哪个字典变量
                          , {align: "center", field: 'idNum', title: '证件号码'}
                          , {align: "center", field: 'rptDate', title: '信息报告日期'}
                           ,{align : "center",field: 'businessStates', title: '数据状态', templet: function (d) {return renderColumnDict(d, 'businessStates',staticDict.businessStates )}}
                          , {align: "center", fixed: 'right', title: '操作', toolbar: '#barDemo', width: 200} //行上的工具栏
                      ]]
                      , even: true  //行斑马线
                      , page: true //是否分页
                      , limit: 10 //初始每页显示条数
                      , height: $(document).height() - $('#tableDemo').offset().top - $('#queryPanel').height() - 25
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

                  //日期输入框  按css将所有的date组件渲染
                  $(".datefield").each(function () {
                      laydate.render({
                          elem: this,
                          trigger: 'click'
                      });
                  });

                  //查询按钮点击事件
                  $("#queryBtn").on('click', function () {
                      table.reload('tableDemo', {
                          method: 'post',
                          where: {
                              'idType': $('#id_Type').val(),
                              'idNum': $('#id_Num').val(),
                              'rptDate': $('#rptDate').val(),
                              'businessStates': $('#businessStates').val()
                          }
                      });
                      return false;
                  });


                  form.on('submit(close)', function (data) {
                      layer.close(popIndex);
                      table.reload('tableDemo', {
                    	  where: {
                              'idType': $('#id_Type').val(),
                              'idNum': $('#id_Num').val(),
                              'rptDate': $('#rptDate').val(),
                              'businessStates': $('#businessStates').val()
                          }
                      });
                      return false;
                  });
                  form.on('submit(save)', function (data) {
                      
                      $.ajax({
                          //请求方式
                          type: "POST",
                          //请求地址
                          url: "inFalMmbsInf/updatedate.do?addOrUpdate=" + addOrUpdate,
                          //数据，json字符串
                          data: data.field,
                          //请求成功
                          success: function (result) {
                              if (result.success == true) {
                                  layer.msg('操作成功', {time: 3000});
                                  verify.dataValidation('save','I_IN_FAL_MMBS_INF',$("#pajInFalMmbsInfId").val(),'form',true,false,true); //数据校验
                                  table.reload('tableDemo', {
                                	  where: {
                                          'idType': $('#id_Type').val(),
                                          'idNum': $('#id_Num').val(),
                                          'rptDate': $('#rptDate').val(),
                                          'businessStates': $('#businessStates').val()
                                      }
                                  });
                                  layer.close(popIndex);
                              } else {
                                  layer.alert(result.msg);
                              }
                          },
                          //请求失败，包含具体的错误信息
                          error: function (e) {
                              layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                          }
                      });
                      return false;//防止页面跳转
                  });
                  
                  //新增按钮点击事件
                  table.on('toolbar(tableDemo)', function (obj) {
          			switch (obj.event) {
          				case 'addBtn':
          					 form.val('exampleForm', {
          			                'pajInFalMmbsInfId': '',
          			                'name': '',
          			                'idType': '',
          			                'idNum': '',
          			                'famMemName': '',
          			                'famMemCertType': '',
          			                'famMemCertNum': '',
          			                'famRel': '',
          			                'famRelaAssFlag': '',
          			                'infSurcCode': '',
          			                'rptDate': '',
          			                'feedBackError':''
          			            });
          			            addOrUpdate = "save";
          			            $.ajax({
          			                type: "POST",  //请求方式
          			                url: "generateUUID/id.do",
          			                success: function (data) {
          			                    if (data.success == true) {
          			                        $("#pajInFalMmbsInfId").val(data.result);
          			                    } else {
          			                        layer.alert(data.msg);
          			                    }
          			                },
          			                //请求失败，包含具体的错误信息
          			                error: function (e) {
          			                    layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
          			                }
          			            });
          			            popIndex = layer.open({
          			                type: '1',
          			                title: '新增',
          			                content: $('#edit'),
          			                area: ['40%', '90%']
          			            });
          			            //将该行数据在form中回显
          			            $("#errorMessage").hide();
          			             $("#close").show();
                          		 $("#save").show();
          			            /* $("#update").attr("type", hidden); */
          			            $("#update").attr("hidden",true);
          			            form.render('select');
          						break;
          				case 'submitBtn':
          					 //获取选中的行信息
          		            var checkStatus = table.checkStatus('tableDemo');
          		            //获取选中行的数据
          		            data = checkStatus.data;
          		            var infRecType = "120";
          		            var rptDate = $('#rptDate').val();
          		            if (data.length == 0 && rptDate.length == 0) {
          		                layer.msg("请选择需要强制提交的数据或选择需要强制提交的信息报告日期");
          		                return;
          		            }
          		            var str = "";
          		            for (var i = 0; i < data.length; i++) {
          		                str += checkStatus.data[i].pajInFalMmbsInfId + ","
          		            }
          		            str = str.substr(0, str.length - 1);
          		            layer.confirm('确定要强制提交选中的数据吗？', {icon: 3, title: '提示信息'}, function (index) {
          		                $.ajax({
          		                    type: "GET",  //请求方式
          		                    url: 'changeDataState/changeDataStateByConditon.do?infRecType=' + infRecType + '&rptDate=' + rptDate + '&type=submit', //请求地址
          		                    data: {str: str},           //数据，json字符串
          		                    success: function (result) { //请求成功
          		                    	if(result.success){
          									layer.msg('强制提交成功', {time:3000});
          								}else{
          									layer.msg('强制提交失败', {time:3000});
          								}
          		                        table.reload('tableDemo', {
          		                        	 where: {
          		                               'idType': $('#id_Type').val(),
          		                               'idNum': $('#id_Num').val(),
          		                               'rptDate': $('#rptDate').val(),
          		                               'businessStates': $('#businessStates').val()
          		                           }
          		                        });
          		                    },
          		                    error: function (e) { //请求失败，包含具体的错误信息
          		                        layer.alert('强制提交出错,错误信息如下:<br>' + e.responseText);
          		                    }
          		                });
          		            });
          		            form.render('select');
          					break;
          			};
                  });
                  //表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
                  table.on('tool(tableDemo)', function (obj) {
                      form.val('exampleForm', {
                          'pajInFalMmbsInfId': '',
                          'name': '',
                          'idType': '',
                          'idNum': '',
                          'famMemName': '',
                          'famMemCertType': '',
                          'famMemCertNum': '',
                          'famRel': '',
                          'famRelaAssFlag': '',
                          'infSurcCode': '',
                          'rptDate': '',
                          'feedBackError':''
                      });
                      var data = obj.data;
                      var PK = data.pajInFalMmbsInfId;
                      var tableName = 'I_IN_FAL_MMBS_INF';
                      if (obj.event === 'more') {
                          addOrUpdate = "update";
                          $.ajax({
           		  	       //请求方式
           		  	       type : "POST",
           		  	       //请求地址
           		  	       url : "validate/getErrorMessage.do",
           		  	       //数据，json字符串
           		  	       data :{pk:PK,tableName:tableName}, 
           		  	       //请求成功
           		  	       success : function(result) {
           		  	    	   if(result.success == true){
           		  	    		 var errorMessage="";
           		  	    		 var data = result.result;
           		  	    		 for(var i=0;i<data.length;i++){
           		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
           		  	    		 }
           		  	    		$("#feedBackError").val(errorMessage);
           		  	     	   }else{
           		  	     		   layer.alert(result.msg);
           		  	     	   }
           		  	       },
           		  	       //请求失败，包含具体的错误信息
           		  	       error : function(e){
           		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
           		  	       }
           		  	   });
                          popIndex = layer.open({
                              type: '1',
                              title: '详情',
                              content: $('#edit'),
                              area: ['40%', '80%']
                          });
                          //将该行数据在form中回显
                          $("#errorMessage").show();
                          $("#close").hide();
                          $("#save").hide();
                          $("#idType").attr("disabled", true);
                          $("#famMemCertType").attr("disabled", true);
                          form.val('exampleForm', data);

                      } else if (obj.event === 'edit') {
                          addOrUpdate = "update";
                          $.ajax({
              		  	       //请求方式
              		  	       type : "POST",
              		  	       //请求地址
              		  	       url : "validate/getErrorMessage.do",
              		  	       //数据，json字符串
              		  	       data :{pk:PK,tableName:tableName}, 
              		  	       //请求成功
              		  	       success : function(result) {
              		  	    	   if(result.success == true){
              		  	    		 var errorMessage="";
              		  	    		 var data = result.result;
              		  	    		 for(var i=0;i<data.length;i++){
              		  	    			 errorMessage+=(i+1)+"："+data[i].ERROR_MSG+" ";
              		  	    		 }
              		  	    		$("#feedBackError").val(errorMessage);
              		  	     	   }else{
              		  	     		   layer.alert(result.msg);
              		  	     	   }
              		  	       },
              		  	       //请求失败，包含具体的错误信息
              		  	       error : function(e){
              		  	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
              		  	       }
              		  	   });
                          popIndex = layer.open({
                              type: '1',
                              title: '修改',
                              content: $('#edit'),
                              area: ['40%', '90%']
                          });
                          //将该行数据在form中回显
                          $("#errorMessage").show();
                          $("#close").show();
                          $("#save").show();
                          $("#idType").attr("disabled", false);
                          $("#famMemCertType").attr("disabled", false);
                          form.val('exampleForm', data);
                          //verify.dataValidation('save','I_IN_FAL_MMBS_INF',$("#pajInFalMmbsInfId").val(),'form',false,false); //数据校验
                      } else if (obj.event === 'del') {
                    	  layer.confirm('确认要删除该条信息？', function(index){
                    		  addOrUpdate = "delete";
                              $.ajax({
                                  //请求方式
                                  type: "POST",
                                  //请求地址
                                  url: "inFalMmbsInf/updatedate.do?addOrUpdate=" + addOrUpdate,
                                  //数据，json字符串
                                  data: data,
                                  //请求成功
                                  success: function (result) {
                                      if (result.success == true) {
                                          layer.msg('操作成功', {time: 3000});
                                          table.reload('tableDemo', {
                                              'where': {
                                            	  'idType': $('#id_Type').val(),
                                                  'idNum': $('#id_Num').val(),
                                                  'rptDate': $('#rptDate').val(),
                                                  'businessStates': $('#businessStates').val()
                                              }
                                          });
                                          layer.close(popIndex);
                                      } else {
                                          layer.alert(result.msg);
                                      }
                                  },
                                  //请求失败，包含具体的错误信息
                                  error: function (e) {
                                      layer.alert('操作出错,错误信息如下:<br>' + e.responseText);
                                  }
                              });  
                    	  });
                          return false;//防止页面跳转
                      }
                  });
        });
});

</script>
</body>
</html>
