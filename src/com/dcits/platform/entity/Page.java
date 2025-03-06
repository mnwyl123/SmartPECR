package com.dcits.platform.entity;

import com.dcits.platform.util.PageData;

/**
 * 分页类
 * @author pengyj pengyj
 * 创建时间：2014年6月28日
 */
public class Page implements Cloneable{
	private org.apache.log4j.Logger logger;
	//每页显示记录数
	private int showCount;      
	
	//总页数
	private int totalPage;		
	
	//总记录数
	private int totalResult;	
	
	//当前页
	private int currentPage;	
	
	//当前记录起始索引
	private int currentResult;	
	
	//true:需要分页的地方，传入的参数就是Page实体；false:需要分页的地方，传入的参数所代表的实体拥有Page属性
	private boolean entityOrField;	
	
	//最终页面显示的底部翻页导航，详细见：getPageStr();
	private String pageStr;		
	
	private PageData pd = new PageData();
	
	public Page(){
		this.showCount = 10;
	}
	
	public Object clone(){
		Page o = null ;
		try {
			o = (Page)super.clone();
		} catch (CloneNotSupportedException e) {
			//e.printStackTrace();
			logger.error(e);
		}
		return o ;	
	}
	
	public int getTotalPage() {
		if(totalResult%showCount==0)
			totalPage = totalResult/showCount;
		else
			totalPage = totalResult/showCount+1;
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getTotalResult() {
		return totalResult;
	}
	
	public void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
	}
	
	public int getCurrentPage() {
		if(currentPage<=0)
			currentPage = 1;
		if(currentPage>getTotalPage())
			currentPage = getTotalPage();
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	//拼接分页 页面及JS函数
	public String getPageStr() {
		StringBuffer sb = new StringBuffer();
		sb.append(" <link rel=\"stylesheet\" type=\"text/css\" href=\"css/fenye/iconfont.css\">\n");
		sb.append("	<div style=\"float:left;color:#333333;\"><span>每页显示 <select name=\"showCount\" id=\"showCount\" style=\"width:40px;height:28px;text-align:center;padding: 0;\" onchange=\"changeCount(this.value);\">");
		sb.append(" <option value=\"5\">5</option>");
		sb.append(" <option value=\"10\">10</option>");
		sb.append(" <option value=\"15\">15</option></select>条数据</span>\n");
		sb.append(" <span style=\"margin-right:10px;margin-left:10px;\">  共 "+ this.totalResult +" 条</span>\n");
		sb.append(" <span style=\"margin-right:10px;margin-left:10px;\">"+this.currentPage+"/"+totalPage+"</span>\n");
		sb.append("	</div>\n");
		if(totalResult>0){
			sb.append("	<ul class=\"pagination no-margin\">\n");
			if(currentPage==1){
				sb.append("	<li><a class=\"iconfont-14 icon-shangyiye1 pageOption\" style=\"font-weight:600\"></a></li>\n");
				sb.append("	<li><a class=\"iconfont icon-shangyiye pageOption\"></a></li>\n");
			}else{
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage(1)\" class=\"iconfont-14 icon-shangyiye1 pageOption\" style=\"font-weight:600\"></a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(currentPage-1)+")\" class=\"iconfont icon-shangyiye pageOption\"></a></li>\n");
			}
			if(currentPage==totalPage){
				sb.append("	<li><a class=\"iconfont icon-shangyiye-copy-copy pageOption\"></a></li>\n");
				sb.append("	<li><a class=\"iconfont icon-caozuoxiayiye pageOption\"></a></li>\n");
			}else{
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(this.currentPage+1)+")\" class=\"iconfont icon-shangyiye-copy-copy pageOption\"></a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+this.totalPage+")\" class=\"iconfont icon-caozuoxiayiye pageOption\"></a></li>\n");
			}
			sb.append("</ul>\n");
			
			sb.append("	<div style=\"float:right;color:#333333;\">\n");
			sb.append("	<span style=\"margin-right:5px;margin-left:5px;\">跳转到 <input onchange=\"checkPageNumber("+totalPage+")\" type=\"text\" value=\"\" id=\"toGoPage\" style=\"width:28px;height:28px;text-align:center;padding: 0;\"/> 页</span>\n");
			sb.append("	<span style=\"cursor:pointer;margin-left:5px;\"><a onclick=\"toTZ();\" style=\"width:28px;height:28px;background-color:#2291e4 !important;border-color:#2291e4 !important;padding-left: 2px;\" class=\"btn btn-mini\">GO</a></span></div>\n");
			sb.append("<script type=\"text/javascript\">\n");
			
			//换页函数
			sb.append("function nextPage(page,showCount){");
			sb.append(" top.jzts();");
			sb.append("	if(true && document.forms[0]){\n");
			sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		else{url += \"?"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(this.entityOrField?"showCount":"page.showCount")+"="+ this.showCount +"\";\n");
			sb.append("		document.forms[0].action = url;\n");
			sb.append("		document.forms[0].submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('currentPage')>-1){\n");
			sb.append("				var reg = /currentPage=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'currentPage=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"&"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(this.entityOrField?"showCount":"page.showCount")+"="+ this.showCount +"\";\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			
			//调整每页显示条数
			sb.append("document.getElementById('showCount').value = "+ this.showCount +";\n");
			sb.append("function changeCount(value){");
			sb.append(" top.jzts();");
			sb.append("	if(true && document.forms[0]){\n");
			sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		else{url += \"?"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + \"1&" +(this.entityOrField?"showCount":"page.showCount")+"=\"+value;\n");
			sb.append("		document.forms[0].action = url;\n");
			sb.append("		document.forms[0].submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('currentPage')>-1){\n");
			sb.append("				var reg = /currentPage=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'currentPage=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"1&"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(this.entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + \"&" +(this.entityOrField?"showCount":"page.showCount")+"=\"+value;\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			
			//跳转函数 
			sb.append("function toTZ(){");
			sb.append("var toPaggeVlue = document.getElementById(\"toGoPage\").value;");
			sb.append("var showCount = document.getElementById(\"showCount\").value;");
			sb.append("if(toPaggeVlue == ''){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("if(isNaN(Number(toPaggeVlue))){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("if(isNaN(Number(showCount))){document.getElementById(\"showCount\").value=1;return;}");
			sb.append("nextPage(toPaggeVlue,showCount);");
			sb.append("}\n");
			
			//校验跳转页数字 
//			sb.append("function checkPageNumber(totlePage){");
//			sb.append("var toGoPage = document.getElementById(\"toGoPage\").value;");
//			sb.append("if(isNaN(toGoPage)){$(\"#toGoPage\").tips({side:2,msg:\"只能输入<=\"+totlePage+\"的数字\",bg:\"#AE81FF\",time:0.5});document.getElementById(\"toGoPage\").value=\"\"; $(\"#toGoPage\").focus();return;}");
//			sb.append("if(toGoPage>totlePage){");
//			sb.append("$(\"#toGoPage\").tips({side:2,msg:\"只能输入<=\"+totlePage+\"的数字\",bg:\"#AE81FF\",time:0.5});");
//			sb.append("document.getElementById(\"toGoPage\").value=\"\";return;}");
//			sb.append("if(toGoPage<1){$(\"#toGoPage\").tips({side:2,msg:\"只能输入<=\"+totlePage+\"的数字\",bg:\"#AE81FF\",time:0.5});document.getElementById(\"toGoPage\").value=\"\";return;}");
//			sb.append("}\n");
			
			sb.append("</script>\n");

			//按钮颜色样式
			sb.append("<style>\n");
			sb.append(".pagination > li > a:hover, .pager > li > a:hover {");
			sb.append(" background-color: #459eec !important;");
			sb.append(" border-color: #EEEEEE !important;color: black;}\n");
			sb.append(".pagination > li > a, .pagination > li > span {");
			sb.append(" background-color: #ffffff !important;}\n");
			sb.append("</style>\n");
		}else{
			sb.append("<script type=\"text/javascript\">\n");
			sb.append("document.getElementById('showCount').value = "+showCount+";\n");
			sb.append("</script>\n");
		}
		pageStr = sb.toString();
		return pageStr;
	}
	
	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}
	
	public int getShowCount() {
		return showCount;
	}
	
	public void setShowCount(int showCount) {
		
		this.showCount = showCount;
	}
	
	public int getCurrentResult() {
		currentResult = (getCurrentPage()-1)*getShowCount();
		if(currentResult<0)
			currentResult = 0;
		return currentResult;
	}
	
	public void setCurrentResult(int currentResult) {
		this.currentResult = currentResult;
	}
	
	public boolean isEntityOrField() {
		return entityOrField;
	}
	
	public void setEntityOrField(boolean entityOrField) {
		this.entityOrField = entityOrField;
	}
	
	public PageData getPd() {
		return pd;
	}

	public void setPd(PageData pd) {
		this.pd = pd;
	}
	
}
