initDict('orgCode', staticDict.orgCodeYillion);
initDict('infoType', staticDict.indvInfoCode);
/**
 * 模块化加载
 * Layui中的模块
 */
layui.use(['element', 'form','layer','laydate','table','laypage','laytpl'], function(){
    var element = layui.element //获取element模块
		form = layui.form, //获取form模块
		layer = layui.layer, //获取layer模块
		laydate = layui.laydate, //获取laydate模块
		table = layui.table //获取table模块
		laypage = layui.laypage, //获取laypage模块
		laytpl = layui.laytpl;  //获取laytpl模块  模板引擎

	require(['static/js/pecr/module/base'],function(base){
		/**
		 * element组件渲染
		 * form组件渲染
		 */
		element.init();//每个页面都有
		form.render();//每个页面都有
		var hisUrl = 'objectionHanding/getHisList.do';
		
		//日期输入框  按css将所有的date组件渲染
		$(".datefield").each(function(){
			laydate.render({
				elem: this,
				trigger:'click',
				theme: '#588fd0',
				format: 'yyyy-MM-dd'
			});
		});
	    
		//渲染表格
		table.render({
			id   : 'objectHandingTable',
			elem: '#objectHandingTable' ,//表格所固定的div
			toolbar: '#toolbarHead',  //表格顶部工具栏
			url  : 'objectionHanding/List.do',
			cols : [[
				{checkbox : true},
				{hide: true, field:"object_id",title:"主键"},
				{align:"center",field:"OBJCHECKID",title:"异议事项号"},
				{align:"center",field:"CHECKBEGINDATE", title:"核查开始日期"},
				{align:"center",field:"NAME",title:"名称"},
				{align:"center",field:"IDTYPE",title:"证件类型"},
				{align:"center",field:"IDNUM",title:"证件号"},
				{fixed: 'right',align:'center',  title:'操作', toolbar: '#opraBarRow', width:200} //行上的工具栏
			]],
			limit : 5,
			even  : true, //开启隔行背景
			page  : true,
			size: 'sm',  //小尺寸的表格
			limits: [5,10],
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
        	var initEnumerationValue = function () {
    			var array = ['ID_TYPE'];
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
    						}
    					}		     
    				}
    		    });
    			 form.render('select');
    	    };
    	    //初始化常量枚举值
    	    initEnumerationValue();

        	//查询按钮点击事件
        	$("#queryBtn").on('click', function(){
        		table.reload('objectHandingTable', {
        			method : 'post',
        			where: {
        				OBJCHECKID   :   $('#OBJCHECKID').val()
        				}
        		}); 
        		return false;
        	});
        	$('#addBtn').on('click', function(){
        		popIndex= layer.open({
        			type :'1',
        			title :'新增异议处理',
        			content :$('#objectionDiv'),
        			area: ['100%', '100%']			
        		});
        		
        		form.render('select');
        	});
        /**
        * element组件渲染
        * form组件渲染
        */
        element.init();//每个页面都有
      form.render();//每个页面都有
       //渲染表格
      table.render({
       	id   : 'historyTable',
       	elem : '#historyTable',
      	url  : hisUrl,
       	cols : [[
       	{checkbox : true},
        {hide: true, field:"object_id",title:"主键"},
        {align:"center",field:"CHECKTIME",title:"核查时间"},
       	{align:"center",field:"CHECKRESULT", title:"核查结果"},
      	{align:"center",field:"CHECKRESULTDESC",title:"核查结果描述"},
      	{align:"center",field:"CHECKORGCODE",title:"核查机构代码"},
        {align:"center",field:"CHECKUSERCODE",title:"核查用户代码"}
        	]],
        limit : 5,
        even  : true, //开启隔行背景
        page  : true,
        size: 'sm',  //小尺寸的表格
        limits: [5,10],
        done: function (res, curr, count) {
			$('th').css({'background-color':'#0997F7',
				 'color':'#FFFFFF',
				 'font-family':'Microsoft Yahei',
				 'font-weight':'500',   //设置字体是否加粗
				 'font-size':'13px'});
		}
        			});
        	 
      $("#generateUploadView").click(function(){
          var diag = new Dialog();
          diag.Width = 400;
          diag.Height = 170;
          diag.Title = "上传并解析反馈报文";
          diag.URL = '<%=basePath%>indvMessageDownLoad/generateUploadView.do';
          diag.OKEvent = function() { //点击确定后调用的方法
        	  if(diag.innerFrame.contentWindow.document.getElementById("tishi").style.display=="block"){
        		  return;
        	  }
              var fileInput = diag.innerFrame.contentWindow.document.getElementById('files').files;
              if(fileInput.length ==0 ){
            	  diag.innerFrame.contentWindow.document.getElementById("tishi").style.display="block";
            	  return;
              }
    		  var formData = new FormData();
    		  formData.append("file", fileInput);
              $.ajax({
            	  url: '<%=basePath%>reportFeedBack/importFeedBackReport.do',
                  type : "post",
                  data : formData,
                  cache:false,
    			  Async:false,
    			  processData : false,
    			  contentType : false,
    			  success : function(data) {
    					if (data == "true") {
    						diag.close();
    						layer.msg("文件上传失败");
    					} else {
    						diag.close();
    						layer.msg("文件上传成功");
    					}
    				},
    				error:function(){
    					diag.close();
    					layer.msg("文件上传失败");
    				}
              });
          };
          diag.show();
          diag.okButton.value=" 上传 ";
          diag.cancelButton.value=" 取消 ";
      });
       //新增或更新的实际数据库操作
       form.on('submit(baseSaveBtn)', function(data){
        	  var para = {};
        	   para.pk= $("#baseSaveBtn").data("id");
        	   para.userCode  = $("#userCode").val();
        	   para.name = $("#name").val();
        	   para.idType = $("#idType").val();
        	   para.idNum = $("#idNum").val();
        	   para.acctNum = $("#acctNum").val();
        	   para.infoType = $("#infoType").val();
        	   para.explain = $("#explain").val(); 
        	   para.orgCode = $("#orgCode").val();  
        	   para.rptDate = $("#rptDate").val();  
        	   $.ajax({
        	    //请求方式
        		   type : "POST",
        	       //请求地址
        		   url : 'objectionHanding/addObjection.do?',
        	    	//数据，json字符串
        		   data : para,
        	       //请求成功
        		   success : function(result) {
        			   if(result.success == true){
        				   dataObj = para;
        				   layer.msg('操作成功');
        				   table.reload('objectHandingTable', 
        						   {'where':{
        							   'OBJCHECKID':$('#OBJCHECKID').val()
        						   }
        						   });
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
	});
});