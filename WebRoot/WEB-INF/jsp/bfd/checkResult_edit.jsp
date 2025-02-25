<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp"%>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="">
                        <form action="bfd/check/updateCheckResultById.do" name="form1" id="form1"  method="post">
                            <input type="hidden" name="ID" id="ID" value="${resultOne.ID}"/>
                            <div id="zhongxin" class="paddingt-13">
                                <table style="width:auto;" class="table table-striped ">
                                    <tr >
                                        <td class="align-right paddingt-13 width-30">数据日期:<span class="red ">*</span></td>
                                        <td><input type="text" name="DATA_DATE" id="DATA_DATE" readonly="readonly" value="${resultOne.DATA_DATE}" class="width-90"/></td>
                                    </tr>
                                    <tr >
                                        <td class="align-right ">表名:<span class="red ">*</span></td>
                                        <td><input readonly="readonly" type="text" name="TAB_NAME" id="TAB_NAME" value="${resultOne.TAB_NAME}" class="width-90"/></td>
                                    </tr>
                                    <tr >
                                        <td class="align-right">主键值</td>
                                        <td><input readonly="readonly"  type="text" cols="46" name="PK_VALUE" id="PK_VALUE" value="${resultOne.PK_VALUE}" class="width-90"></input></td>
                                    </tr>
                                    <tr >
                                        <td class="align-right">异常字段名</td>
                                        <td><input readonly="readonly"  type="text" cols="46" name="COL_NAME" id="COL_NAME" value="${resultOne.COL_NAME}" class="width-90"></input></td>
                                    </tr>
                                    <tr >
                                        <td class="align-right">异常描述</td>
                                        <td><textarea readonly="readonly"  rows="3" cols="46" name="EXCEPT_DESC" id="EXCEPT_DESC" value="${resultOne.EXCEPT_DESC}" class="width-90"></textarea></td>
                                    </tr>
                                    <tr >
                                        <td class="align-right">修改备注</td>
                                        <td><textarea  rows="5" cols="46" name="REMARKS" id="REMARKS" value="${resultOne.REMARKS}" class="width-90">${resultOne.REMARKS}</textarea></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="footfix">
                                <a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
                                <a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a>
                            </div>
                        </form>

                        <div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" class="width50" /><br/><h4 class="lighter block green"></h4></div>

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->
</div>
<!-- /.main-container -->


<!-- 页面底部js¨ -->
<%@ include file="../system/index/foot.jsp"%>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    top.hangge();
    //保存
    function save(){
        if($("#REMARKS").val()==""){
            $("#REMARKS").tips({
                side:3,
                msg:'请输入',
                bg:'#AE81FF',
                time:2
            });
            $("#REMARKS").focus();
            return false;
        }
        $("#form1").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }
</script>
</body>
</html>

