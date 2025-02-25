package com.dcits.supervise.pecr.dataLoading.mapper.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.dataLoading.mapper.DataLoadMapper;
@Repository
public class DataLoadMapperImpl implements DataLoadMapper {
	
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;


	@Override
	public void deleteIndvBasicInfo(Map<String, Object> dataLoadMap) throws Exception {
		//删除个人基本信息基础段
		dao.delete("DataLoadMapper.deleteIndvBasicInfo", dataLoadMap);
		//删除个人基本信息基本概况段
		dao.delete("DataLoadMapper.deleteIndvFcsInf", dataLoadMap);
		//删除个人基本信息教育信息段
		dao.delete("DataLoadMapper.deleteIndvEduInf", dataLoadMap);
		//删除个人基本信息职业信息段
		dao.delete("DataLoadMapper.deleteIndvOctpnInf", dataLoadMap);
		//删除个人基本信息其他标识段
		dao.delete("DataLoadMapper.deleteIndvId", dataLoadMap);
		//删除个人基本信息收入信息段
		dao.delete("DataLoadMapper.deleteIndvIncInf", dataLoadMap);
		//删除个人基本信息通讯地址段
		dao.delete("DataLoadMapper.deleteIndvMlgInf", dataLoadMap);
		//删除个人基本信息居住地址段
		dao.delete("DataLoadMapper.deleteIndvRedncInf", dataLoadMap);
		//删除个人基本信息婚姻信息段
		dao.delete("DataLoadMapper.deleteIndvSpsInf", dataLoadMap);
	}

	@Override
	public void deleteLoanAcctInfo(Map<String, Object> dataLoadMap) throws Exception {
		//删除个人借贷账户基础段
		dao.delete("DataLoadMapper.deleteIndvAcctBs", dataLoadMap);
		//删除个人借贷账户基本信息段
		dao.delete("DataLoadMapper.deleteIndvAcctBsInf", dataLoadMap);
		//删除个人借贷账户授信额度信息段
		dao.delete("DataLoadMapper.deleteIndvAcctCred", dataLoadMap);
		//删除个人借贷账户非月度表现信息段
		dao.delete("DataLoadMapper.deleteIndvAcctDbtInf", dataLoadMap);
		//删除个人借贷账户月度表现信息段
		dao.delete("DataLoadMapper.deleteIndvAmblgInf", dataLoadMap);
		//删除个人借贷账户特殊交易说明段
		dao.delete("DataLoadMapper.deleteIndvAsTrstDspn", dataLoadMap);
		//删除个人借贷账户相关还款责任人段
		dao.delete("DataLoadMapper.deleteIndvLoanRltRepymtInf", dataLoadMap);
		//删除个人借贷账户抵质押物信息段
		dao.delete("DataLoadMapper.deleteIndvMccInf", dataLoadMap);
		//删除个人借贷账户初始债权说明段
		dao.delete("DataLoadMapper.deleteIndvOcInf", dataLoadMap);
		//删除个人借贷账户大额专项分期信息段
		dao.delete("DataLoadMapper.deleteIndvSpecPrd", dataLoadMap);
		
	}

	@Override
	public void deleteGuarAcctInfo(Map<String, Object> dataLoadMap) throws Exception {
		//删除个人担保账户基础段
		dao.delete("DataLoadMapper.deleteIndvGuarAcctBs", dataLoadMap);
		//删除个人担保账户基本信息段
		dao.delete("DataLoadMapper.deleteIndvGuarAcctInf", dataLoadMap);
		//删除个人担保账户在保责任信息段
		dao.delete("DataLoadMapper.deleteIndvGrRepymtInf", dataLoadMap);
		//删除个人担保账户抵质押物信息段
		dao.delete("DataLoadMapper.deleteIndvGuarMccInf", dataLoadMap);
		//删除个人担保账户相关还款责任人段
		dao.delete("DataLoadMapper.deleteIndvGuarRltRepymtInf", dataLoadMap);
	}

	@Override
	public void updateMasterKey(Map<String, Object> dataLoadMap) throws Exception {
		dao.update("DataLoadMapper.updateMasterKey", dataLoadMap);
	}

	@Override
	public void insetMiddleData(Map<String, Object> dataLoadMap) throws Exception {
		dao.insert("DataLoadMapper.insetMiddleData",dataLoadMap);
	}

}
