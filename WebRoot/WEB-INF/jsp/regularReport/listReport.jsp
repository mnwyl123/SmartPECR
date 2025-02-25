<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./bicenterCommon.jsp" %>

<%
    StringBuffer topLink = new StringBuffer("");
    Map<String,String[]> topParames = request.getParameterMap();
    String[] topLinkVals = null;
    for (String topLinkKey : topParames.keySet()) {
        if("op".equals(topLinkKey) || "_op".equals(topLinkKey)){
            continue; 
        }
    	topLinkVals = topParames.get(topLinkKey);
        for(String val : topLinkVals){
        	topLink.append("&").append(topLinkKey).append("=").append(val);
        }
    }
    String reqParams = topLink.toString();
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
    <meta http-equiv="description" content="This is my page" />
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1"/> 
    <base href="<%=path%>/">
    <title>list</title>

	<link rel="stylesheet" href="<%=basePath %>css/zTreeStyle.3.5/zTreeStyle.css" type="text/css">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.ztree.all-3.5.js"></script>
	
	<script type="text/javascript">
	var fileStru = ${reports};
	var reqParams = "<%=reqParams%>";
	$( function() {
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		
		$.fn.zTree.init($("#tree"), setting, addTopParam(fileStru));
		
	});
	
	function layout() {
		$("#treeContainer").css("height",$("body").height() + "px");
	}
	
	/**
	 * 加入顶层链接传入参数
	 */
	function addTopParam(nodes){
		if(null != nodes && nodes.length > 0){
			$.each(nodes, function(i, e){
				if(e.children){
                   addTopParam(e.children);
				}
				else if(e.url){
                   e.url= e.url + reqParams;
				}
			});
		}
		return nodes;
	}
	</script>

  </head>
  	  
  <body style="position:relative;padding:20px 0 0 0;margin:0;overflow:auto;">
  	 <div class="titleBar" style="float:left;position:relative;top:-20px;left:0;height:20px;width:100%;line-height:20px;font-size:9pt;font-weight:600;text-align:center;background-color:white;background-image:url(images/sprite_repeat_x_png.png);overflow:hidden;">表样文件</div>
  	<div id="treeContainer" style="float:left;position:relative;top:-20px;height:100%;width:100%;margin:0;padding:0;overflow:auto;">
	  	<ul id="tree" class="ztree" >
		 </ul>
  	</div>
  </body>
</html>
