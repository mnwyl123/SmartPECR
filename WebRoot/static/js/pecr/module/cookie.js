/**
 * cookie
 * 用于处理数据缓存
 */
define([],function () {
    return{
        /**
         * 存储登陆信息
         */
        set_loginMsg : function(data){
            $.cookie("loginMsg",JSON.stringify(data),{expires:7,path:"/"});
        },
        /**
         * 删除登陆信息
         */
        del_loginMsg : function(){
            $.cookie("loginMsg","",{expires:-1,path:"/"});
        },
        /**
         * 获取登陆信息
         */
        get_loginMsg : function(){
            var loginMsg=$.cookie("loginMsg");
            if (loginMsg) {
                return JSON.parse(loginMsg);
            }else{
                return null;
            }
        },
        /**
         * 存储用户信息
         */
        set_user : function(data){
            $.cookie("user",JSON.stringify(data),{path:"/"});
        },
        /**
         * 删除用户信息
         */
        del_user : function(){
            $.cookie("user","",{path:"/"});
        },
        /**
         * 获取用户昵称
         */
        get_userName : function(){
            var user=$.cookie("user");
            if (user) {
                return JSON.parse(user).userName;
            }else{
                return null;
            }
        },
        /**
         * 存储表格显示条数
         */
        set_pageSize : function(data){
            $.cookie("pageSize",JSON.stringify(data),{path:"/"});
        },
        /**
         * 获取表格显示条数
         */
        get_pageSize : function(){
            var pageSize = $.cookie("pageSize");
            return (pageSize !== 'null' && pageSize !== undefined && pageSize !== '') ? pageSize : 10;
        },
        /**
         * 存储用户token
         */
        set_token : function (data) {
            $.cookie("token",JSON.stringify(data),{path:"/"});
        },
        /**
         * 获取用户token
         */
        get_token : function () {
            var token = $.cookie("token");
            return token;
        }
    }
});