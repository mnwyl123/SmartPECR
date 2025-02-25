//弹出层id
initDict('orgCode', staticDict.orgCodeYillion);
var popIndex;
//新增还是更新，由于调用后台同一个方法，使用该参数判断
var addOrUpdate;
var dataObj;
/**
 * 和表单、日期控件、数据表格等相关操作均在下面方法中编写 
 * 公共的方法或变量可以提到下面方法以外定义
 *
 * 界面要用layui的form，则要进入form
 * 要用日期控件，要引入laydate
 * 要用折叠面板，要引入element
 * 要用数据表格，要引入table
 */
layui.use(['form', 'laydate', 'element', 'layer'], function(){
	var 
	element = layui.element
	form = layui.form,
	
	table = layui.table,
	layer = layui.layer,
	laypage = layui.laypage,
	laydate = layui.laydate
	laytpl = layui.laytpl;
	require(['static/js/pecr/module/base'],function(base){
	
		
		var dataObj = window.parent.$("body").data("dataObj"); //获取单条数据信息，判断是新增还是修改
		/**
     * 初始化常量枚举值
     */
		
   
  });
