package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvIdSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.IndvBasicsInfoManager;

@Service
public class IndvBasicsInfoService implements IndvBasicsInfoManager {
    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

    //查询个人基本信息记录 基础段列表
    @SuppressWarnings("unchecked")
	@Override
    public List<PecrIndvBsSgmt> dataBsSgmtList(Page page) throws Exception {
        return (List<PecrIndvBsSgmt>) dao.findForList("IndvBasicsInfoMapper.dataBsSgmtlistPage", page);
    }

	@Override
	public PageData getPcBasBsSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasBsSgmtById", pd);
	}

	@Override
	public PecrIndvIdSgmt getPecrIndvIdSgmtById(PageData pd) throws Exception {
		return (PecrIndvIdSgmt) dao.findForObject("IndvBasicsInfoMapper.getPecrIndvIdSgmtById", pd);
	}
	
	@Override
	public PageData getPcBasFcsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasFcsInfSgmtById", pd);
	}

	@Override
	public PageData getPcBasSpsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasSpsInfSgmtById", pd);
	}

	@Override
	public PageData getPcBasEduInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasEduInfSgmtById", pd);
	}

	@Override
	public PageData getPcBasOctpnInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasOctpnInfSgmtById", pd);
	}

	@Override
	public PageData getPcBasRedncInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasRedncInfSgmtById", pd);
	}

	@Override
	public PageData getPcBasMlgInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasMlgInfSgmtById", pd);
	}

	@Override
	public PageData getPcBasIncInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoMapper.getPcBasIncInfSgmtById", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PecrIndvIdSgmt> getPecrIndvIdSgmtById(Page pd) throws Exception {
		return (List<PecrIndvIdSgmt>) dao.findForList("IndvBasicsInfoMapper.getPecrIndvIdSgmtByIdlistPage", pd);
	}

	

	@Override
	public void deletePcBasIdSgmt(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.deletePcBasIdSgmt", map);
	}

	@Override
	public void updatePcBasIdSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasIdSgmt", map);
	}
	@Override
	public void insertPcBasIdSgmt(Map<String, Object> map) throws Exception {
		dao.save("IndvBasicsInfoMapper.insertPcBasIdSgmt", map);
	}
	/**
	 *  基础段
	 * @param map
	 * @return
	 * @throws Exception
	 */
	
	@Override
	public String insertPcBasBsSgmt(Map<String, Object> map) throws Exception {
		return dao.save("IndvBasicsInfoMapper.insertPcBasBsSgmt", map).toString();
	}
	@Override
	public void updatePcBasBsSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasBsSgmt", map);		
	}
	@Override
	public void deletePcBsSgmt(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasBsSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPecrIndvIdSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPcBasFcsInfSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPcBasEduInfSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPcBasOctpnInfSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPcBasRedncInfSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPcBasMlgInfSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPcBasSpsInfSgmtById", map);
		dao.delete("IndvBasicsInfoMapper.delPcBasIncInfSgmtById", map);
		
	}
	/**
	 *  基本概况信息段
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasFcsInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPcBasFcsInfSgmtKey", map);
	}
	public void insertPcBasFcsInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("IndvBasicsInfoMapper.insertPcBasFcsInfSgmt", map);
	}
	@Override
	public void updatePcBasFcsInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasFcsInfSgmt", map);		
	}
	@Override
	public void delPcBasFcsInfSgmt(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasFcsInfSgmtById", map);
	}
	/**
	 *  教育信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasEduInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPcBasEduInfSgmtKey", map);
	}
	@Override
	public void insertPcBasEduInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.insertPcBasEduInfSgmt", map);		
	}
	@Override
	public void updatePcBasEduInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasEduInfSgmt", map);		
	}
	@Override
	public void delPcBasEduInfSgmtById(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasEduInfSgmtById", map);
	}
	/**
	 *  职业信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasOctpnInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPcBasOctpnInfSgmtKey", map);
	}
	@Override
	public void insertPcBasOctpnInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.insertPcBasOctpnInfSgmt", map);		
	}
	@Override
	public void updatePcBasOctpnInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasOctpnInfSgmt", map);		
	}
	@Override
	public void delPcBasOctpnInfSgmtById(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasOctpnInfSgmtById", map);
	}
	/**
	 *  居住地址段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasRedncInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPcBasRedncInfSgmtKey", map);
	}
	@Override
	public void insertPcBasRedncInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.insertPcBasRedncInfSgmt", map);		
	}
	@Override
	public void updatePcBasRedncInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasRedncInfSgmt", map);		
	}
	@Override
	public void delPcBasRedncInfSgmtById(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasRedncInfSgmtById", map);
	}
	/**
	 * 通讯地址信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasMlgInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPcBasMlgInfSgmtKey", map);
	}
	@Override
	public void insertPcBasMlgInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.insertPcBasMlgInfSgmt", map);		
	}
	@Override
	public void updatePcBasMlgInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasMlgInfSgmt", map);		
	}
	@Override
	public void delPcBasMlgInfSgmtById(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasMlgInfSgmtById", map);
	}
	/**
	 * 婚姻信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasSpsInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPcBasSpsInfSgmtKey", map);
	}
	@Override
	public void insertPcBasSpsInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.insertPcBasSpsInfSgmt", map);		
	}
	@Override
	public void updatePcBasSpsInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasSpsInfSgmt", map);		
	}
	@Override
	public void delPcBasSpsInfSgmtById(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasSpsInfSgmtById", map);
	}
	/**
	 * 收入信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasIncInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPcBasIncInfSgmtKey", map);
	}
	@Override
	public void insertPcBasIncInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.insertPcBasIncInfSgmt", map);		
	}
	@Override
	public void updatePcBasIncInfSgmt(Map<String, Object> map) throws Exception {
		dao.update("IndvBasicsInfoMapper.updatePcBasIncInfSgmt", map);		
	}
	@Override
	public void delPcBasIncInfSgmtById(Map<String, Object> map) throws Exception {
		dao.delete("IndvBasicsInfoMapper.delPcBasIncInfSgmtById", map);
	}

	@Override
	public int getPecrIndvIdSgmtCKey(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("IndvBasicsInfoMapper.getPecrIndvIdSgmtCKey", map);
	}

}
