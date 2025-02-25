package com.dcits.supervise.pecr.whiteList.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.supervise.pecr.whiteList.service.WhiteUsingManager;



@Controller
@RequestMapping("/whiteUsing")
public class WhiteUsingController extends BaseController{

	@Autowired
	private WhiteUsingManager whiteUsingManager; 
	
	
	
	
}
