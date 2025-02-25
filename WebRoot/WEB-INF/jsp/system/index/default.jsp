<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="plugins/layui/css/admin.css" media="all">
</head>
<body>
<div class="layui-carousel" id="test1" style="width:100%;height:50%;">
    <div class="layui-row">
        <div class="layui-col-md12">
            <div carousel-item="">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-row layui-col-space5">
                            <div class="layui-col-md12">
                                <ul class="layui-row layui-this ">
                                    <li class="layui-col-md2" style="width:420px;border:3px solid #C2C2C2;text-align:center;" onclick="normalToGen()">
                                        <a lay-href="#" class="layadmin-backlog-body">
                                            <h3>个人报文待生成条数</h3>
                                            <p><cite id="normalToGen" style="color: #FF5722;"></cite></p>
                                        </a>
                                    </li>
                                    <%-- <li class="layui-col-md2" style="width:420px;border:3px solid #C2C2C2;border-left:none;border-right:none;text-align:center;" onclick="specialToGen()">
                                        <a lay-href="#" class="layadmin-backlog-body">
                                            <h3>企业报文待生成条数</h3>
                                            <p><cite id="abnormalToGen"></cite></p>
                                        </a>
                                    </li> --%>
                                    <li class="layui-col-md2" style="width:420px;border:3px solid #C2C2C2;border-left:none;text-align:center;" onclick="normalToRep()">
                                        <a lay-href="#" class="layadmin-backlog-body">
                                            <h3>个人报文待报送条数</h3>
                                            <p><cite id="normalToRep" style="color: #FF5722;"></cite></p>
                                        </a>
                                    </li>
                                    <%-- <li class="layui-col-md2" style="width:420px;border:3px solid #C2C2C2;border-left:none;text-align:center;" onclick="specialToRep()">
                                        <a href="#" class="layadmin-backlog-body">
                                            <h3>企业报文待报送条数</h3>
                                            <p><cite id="abnormalToRep"></cite></p>
                                        </a>
                                    </li> --%>
                                   <%--  <li class="layui-col-md2" style="border:2px solid #C2C2C2;text-align:center;" onclick="normalToFeed()">
                                        <a href="#" class="layadmin-backlog-body">
                                            <h3>正常报文待反馈条数</h3>
                                            <p><cite id="normalToFeed" style="color: #FF5722;"></cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-md2" style="border:2px solid #C2C2C2;text-align:center" onclick="specialToFeed()">
                                        <a href="#" class="layadmin-backlog-body">
                                            <h3>特殊报文待反馈条数</h3>
                                            <p><cite id="abnormalToFeed"></cite></p>
                                        </a>
                                    </li> --%>
                                </ul>
                            </div>
                            <div class="layui-col-md6" style="background-color: #C2C2C2">
                                <div class="layui-card">
                                    <div class="layui-card-header">今日各接口数据报送情况</div>
                                    <div class="layui-card-body">
                                        <div id="bar" style="width:600px;height:300px;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md6" style="background-color: #C2C2C2">
                                <div class="layui-card">
                                    <div class="layui-card-header">最近一周入库率情况</div>
                                    <div class="layui-card-body">
                                        <div id="chart" style="width:600px;height:300px;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md12" style="background-color: #C2C2C2">
                                <div class="layui-card">
                                    <div class="layui-card-header">报送数据统计</div>
                                    <div class="layui-card-body">
                                        <table class="layui-hide" id="demo"></table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="static/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script src="plugins/layui/layui.js" charset="utf-8"></script>
<script src="plugins/echarts/echarts.min.js" charset="utf-8"></script>
<script src="static/js/pecr/default_char.js" charset="utf-8"></script>
</body>
</html>
