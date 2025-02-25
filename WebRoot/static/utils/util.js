//初始化下拉框字典
function initDict(elemId, array){
	$.each(array, function (index, item)
	{
		$("select[name='"+elemId+"']").append(new Option(item[0]+'-'+item[1], item[0]));
	});
}

//table中的字典描述替换  前端静态js文件中配置数据字典
function renderColumnDict(data, columnName, array){
	var desc = '';
	$.each(array, function (index, item) 
	{
		if(item[0] === data[columnName])
		{
			desc = item[1];
			return false;
		}
	});
	return desc;
}
/*
 * columnName 表示转码字段
 * relatedColName 转码关联字段
 * array 为再担保时对应的联保标志
 * 
 */
function renderColumnDictComwartySign(data, columnName, array,relatedColName){
	var desc = '';
	if(data[relatedColName]==2){
		$.each(array, function (index, item) 
				{
					if(item[0] === data[columnName])
					{
						desc = item[1];
						return false;
					}
				});
	}
	return desc;
}
/*
 * columnName 表示转码字段
 * relatedColName 转码关联字段
 * array1 为自然人对应的身份标识信息
 * array2 为组织机构对应的身份标识信息
 */
function renderColumnDictComsharHodIdType(data, columnName, array1,array2,relatedColName){
	var desc = '';
	if (data[relatedColName]==1){
		$.each(array1, function (index, item) 
				{
					if(item[0] === data[columnName])
					{
						desc = item[1];
						return false;
					}
				});
	}
	if(data[relatedColName]==2){
		$.each(array2, function (index, item) 
				{
					if(item[0] === data[columnName])
					{
						desc = item[1];
						return false;
					}
				});
	}
	return desc;
}


//table中的字典描述替换  后台数据字典表中查询
function renderColDict(data, dictName, columnName){
	var node = {systemCodeType:dictName};
	var desc = '';
	//ajax 默认是异步操作，回调函数中的赋值不一定会给全局变量正常赋值，需要设置为同步
	$.ajax({
		url:'dataDictCode/sysCodeTypeList.do', 
		data:JSON.stringify(node),
		contentType : "application/json;charsetset=UTF-8",
		type:'post',  
		cache:false,  
		dataType:'json',
		async:false,
		success:function(dict){
			if (dict.result){
				for(var i = 0;i < dict.result.length; i++){
					if(dict.result[i].systemCode === data[columnName]){
						desc = dict.result[i].systemCode + '-' + dict.result[i].systemCodeName;
						break;
					}
				}
			}
		}
	});
	return desc;
}

/**
 * 注册form表单提交事件
 * @params submitFilter 表单提交按钮定位
 * @params base 相当于url中的模块划分
 * @params url 具体的更新链接
 * @params form layui的form对象
 */
function registerFormSubmit(submitFilter, url, form, obj){
	form.on('submit('+submitFilter+')', function(data)
	{
		//额外参数
		if(undefined != obj && null != obj){
			$.each(obj, function(key, val){
				data.field[key] = val;
			});
		}
	    $.ajax({
	       //请求方式
	       type : "POST",
	       //请求地址
	       url : url,
	       //数据，json字符串
	       data : data.field,
	       //请求成功
	       success : function(result) {
	    	   if(result.success == true){
	    	   	  layer.msg('操作成功', {time:3000});
	    	   }else{
	    		   layer.alert(result.msg);
	    	   }
	       },
	       //请求失败，包含具体的错误信息
	       error : function(e){
	    	   layer.alert('操作出错,错误信息如下:<br>'+e.responseText);
	       }
	   });
	   return false;
  });
}
