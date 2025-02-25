package com.dcits.supervise.pecr.log.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.log.service.CurdOperationMapper;


@Service("curdOperationService")
public class CurdOperationService implements CurdOperationMapper{

	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 保存日志信息至数据库
	 */
	@Override
	public void addLog(PageData pd) {
		try {
			Object RESULT =  pd.get("RESULT");
			String resultJson = JSON.toJSONString(RESULT);
			pd.put("RESULT",resultJson);
			dao.save("CurdOperationMapper.insertLogInfo",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



}
