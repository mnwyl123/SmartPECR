/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table'], function(){
    var element = layui.element, //获取element模块
        form = layui.form, //获取form模块
        layer = layui.layer, //获取layer模块
        laydate = layui.laydate, //获取laydate模块
        table = layui.table; //获取table模块

	/**
	 * 全局变量
	 */
	var dataObj = window.parent.$("body").data("dataObj"); //获取单条数据信息，根据账户类型确定展示那个账户

	/**
	 * 监听选项卡切换
	 * 加载相应子页面
	 */
	element.on('tab(loanAcctInfotab)', function(data){
		var currIframe = $("iframe").eq(data.index);
		if (!currIframe.attr("src")){
			currIframe.attr("src",currIframe.data("src"));
		}
	});

	/**
	 * 页面初始化
	 */
	if (dataObj){
		var type = dataObj.acctType;
		$(".layui-tab li").not("[data-type='" + type + "']").remove();
		$(".layui-tab-item").not("[data-type='" + type + "']").remove();
	}
	$(".layui-tab li:first").click();

	/**
	* element组件渲染
	* form组件渲染
	*/
	element.init();//每个页面都有
	form.render();//每个页面都有

});