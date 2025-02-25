/**
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
		var array = ['DATA_STATUS_ZHCX','ID_TYPE','PER_LOAN_ACCT_TYPE','PER_LOAN_UPD_INF_REC_TYPE'];
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
					}else if (data.result[i].PER_LOAN_ACCT_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].PER_LOAN_ACCT_TYPE},
							containerId : "acctType"
						});
						continue;
					}else if (data.result[i].PER_LOAN_UPD_INF_REC_TYPE){
						base.renderTpl({
							tplId : "enumerationValueTpl",
							arr : {"list" : data.result[i].PER_LOAN_UPD_INF_REC_TYPE},
							containerId : "mdfcSgmtCode"
						});
						continue;
					}
				}
                form.render('select');
                //d1.resolve("渲染完成");
			}	     
	    });
	    
/*	    $('#mdfcSgmtCode').hover(function () {
	        layer.tips("基础段、相关还款责任人段、授信额度信息段、抵质押物信息段、初始债权说明段，仅需更正已经报送过的最新的信息", '#mdfcSgmtCode',{
	            tips: [1, '#f00'],
	            time : 0
	        });
	    },function () {
	        layer.closeAll('tips');
	    });*/
    };
    //初始化常量枚举值
    initEnumerationValue();

});
 /**
  * 表格全局默认参数设置
  */
	require(['static/js/pecr/module/base'],function (base){
        /**
         * element组件渲染
         * form组件渲染
         */
        element.init();//每个页面都有
        form.render();//每个页面都有

    	//日期输入框  按css将所有的date组件渲染
    	$(".datefield").each(function(){
    	  laydate.render({
    		elem: this,
    		type: 'month',
    		format:'yyyy-MM',
    		trigger:'click'
    	  });
    	});
       
        
      //初始化列表
    	table.render({
    		elem: '#dataTable', //表格所固定的div
    		//toolbar: '#toolbarHead',  //表格顶部工具栏
    		url:'indvProtocol/getHistIndivAcctLists.do',
    		where:{mdfcSgmtCode : $("#mdfcSgmtCode").val()},
        	cols: [[
    			 {type:'numbers'},	//列每行序号
    			 {field: 'PBA_ACCT_BS_SGMT_ID', title: '主键', hide: true},
    			 //{align : "center",field : "ACCT_TYPE",title : "账户类型", templet:function(d){return renderColumnDict(d,'ACCT_TYPE',staticDict.acctType)}},
    			 //{align : "center",field : "ACCT_CODE",title : "账户标识码"},
    			 {align : "center",field : "INF_REC_TYPE",title : "信息记录类型", templet:function(d){return renderColumnDict(d,'INF_REC_TYPE',staticDict.infRecTypePOE)}},
	             {align : "center",field : "NAME",title : "姓名"},
	             //{align : "center",field : "ID_TYPE",title : "身份标识类型", templet:function(d){return renderColumnDict(d,'ID_TYPE',staticDict.idType)}},
	             {align : "center",field : "ID_NUM",title : "身份标识号码"},
	             {align : "center",field : "BUSINESS_STATES",title : "数据状态", templet:function(d){return renderColumnDict(d,'BUSINESS_STATES',staticDict.businessStates)}},
	             {align : "center",field : "RPT_DATE",title : "信息报告日期"},
	             {align : "center",field : "LAST_UPDATE_TIME",title : "更新日期"},
	             {align : "center",field : "RPT_DATE_CODE",title : "报告时点说明代码", templet:function(d){return renderColumnDict(d,'RPT_DATE_CODE',staticDict.perLoanRptDateCode)}},
	             {align : "center",field : "MONTH",title : "月度表现月份"},
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
			var mdfcSgmtCode = $("#mdfcSgmtCode").val();
			if(mdfcSgmtCode == ""){
				layer.alert("请选择更正段段标！");
				return false;
			}
    		table.reload('dataTable', {
    			method : 'post',
    			where: {
    					name : $("#name").val(),
    					//idType   :   $('#idType').val(), 
    					idNum      :   $('#idNum').val(), 
    					acctCode : $("#acctCode").val(),
    					mdfcSgmtCode : $("#mdfcSgmtCode").val(),
    					rptDate : $("#rptDate").val()
    				}
    		}); 
    		return false;
    	});
    	
      
    	//表格中某行上的编辑或删除事件，注意：这里的删除事件是会调数据库删除，而编辑只是弹出编辑框回显数据，具体的新增或修改实际操作数据库操作请看提交按钮的事件监听
    	table.on('tool(dataTable)', function(obj){
    		var data = obj.data;
    		var layEvent = obj.event;
    		if (layEvent === 'checked'){
    			$("body").data("dataObj",data);
    			$.ajax({
					type : "POST",
					url : 'indvProtocol/selectIndvLoanChangeEdit.do',
					data : {pbaAcctBsSgmtId:data.PBA_ACCT_BS_SGMT_ID,mdfcSgmtCode:data.MDFC_SGMT_CODE},
					success : function(result) {
						if(result.code == 0){
							layer.msg('插入成功', {time:3000});
						}
						var index = parent.layer.getFrameIndex(window.name);//先得到当前iframe层的索引
						parent.layer.close(index); //再执行关闭
					},
					//请求失败，包含具体的错误信息
					error : function(e){
						layer.alert('插入出错,错误信息如下:<br>'+e.responseText);
					}
				});
            }
    	});
    	
    });
});
