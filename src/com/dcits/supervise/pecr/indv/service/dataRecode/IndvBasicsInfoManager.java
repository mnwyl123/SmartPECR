package com.dcits.supervise.pecr.indv.service.dataRecode;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvEduInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvFcsInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvIdSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvIncInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvMlgInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvOctpnInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvRedncInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvSpsInfSgmt;

public interface IndvBasicsInfoManager {
    //查询个人授信协议信息记录 基础段列表
    public List<PecrIndvBsSgmt> dataBsSgmtList(Page page) throws Exception;
    
    public PageData getPcBasBsSgmtById(PageData pd)throws Exception;
  //查询个人授信协议信息记录 基础段列表
    public List<PecrIndvIdSgmt> getPecrIndvIdSgmtById(Page page) throws Exception;
    
    public PageData getPcBasFcsInfSgmtById(PageData pd)throws Exception;
    
    public PageData getPcBasSpsInfSgmtById(PageData pd)throws Exception;
    
    public PageData getPcBasEduInfSgmtById(PageData pd)throws Exception;
    
    public PageData getPcBasOctpnInfSgmtById(PageData pd)throws Exception;
    
    public PageData getPcBasRedncInfSgmtById(PageData pd)throws Exception;
    
    public PageData getPcBasMlgInfSgmtById(PageData pd)throws Exception;
    
    public PageData getPcBasIncInfSgmtById(PageData pd)throws Exception;
    
    public PecrIndvIdSgmt getPecrIndvIdSgmtById(PageData pd) throws Exception;
    
    public String insertPcBasBsSgmt(Map<String, Object> map) throws Exception;
   
	public int getPecrIndvIdSgmtCKey(Map<String, Object> map) throws Exception;
    
    /**
	 * 基础段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
    public void updatePcBasBsSgmt(Map<String, Object> map) throws Exception;
    
    public void insertPcBasIdSgmt(Map<String, Object> map) throws Exception;
    
    public void deletePcBsSgmt(Map<String, Object> map) throws Exception;
    
    public void deletePcBasIdSgmt(Map<String, Object> map) throws Exception;
	
	public void updatePcBasIdSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 基本概况信息段
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasFcsInfSgmtKey(Map<String, Object> map) throws Exception;
	
	public void insertPcBasFcsInfSgmt(Map<String, Object> map) throws Exception;

	public void updatePcBasFcsInfSgmt(Map<String, Object> map) throws Exception;
	
	public void delPcBasFcsInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 教育信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasEduInfSgmtKey(Map<String, Object> map) throws Exception;
	
	public void insertPcBasEduInfSgmt(Map<String, Object> map) throws Exception;
	
	public void updatePcBasEduInfSgmt(Map<String, Object> map) throws Exception;
	
	public void delPcBasEduInfSgmtById(Map<String, Object> map) throws Exception;
	/**
	 * 职业信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasOctpnInfSgmtKey(Map<String, Object> map) throws Exception;
	
	public void insertPcBasOctpnInfSgmt(Map<String, Object> map) throws Exception;
	
	public void updatePcBasOctpnInfSgmt(Map<String, Object> map) throws Exception;
	
	public void delPcBasOctpnInfSgmtById(Map<String, Object> map) throws Exception;
	/**
	 * 居住地址段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasRedncInfSgmtKey(Map<String, Object> map) throws Exception;
	
	public void insertPcBasRedncInfSgmt(Map<String, Object> map) throws Exception;
	
	public void updatePcBasRedncInfSgmt(Map<String, Object> map) throws Exception;
	
	public void delPcBasRedncInfSgmtById(Map<String, Object> map) throws Exception;
	/**
	 * 通讯地址信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasMlgInfSgmtKey(Map<String, Object> map) throws Exception;
	
	public void insertPcBasMlgInfSgmt(Map<String, Object> map) throws Exception;
	
	public void updatePcBasMlgInfSgmt(Map<String, Object> map) throws Exception;
	
	public void delPcBasMlgInfSgmtById(Map<String, Object> map) throws Exception;
	/**
	 * 婚姻信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasSpsInfSgmtKey(Map<String, Object> map) throws Exception;
	
	public void insertPcBasSpsInfSgmt(Map<String, Object> map) throws Exception;
	
	public void updatePcBasSpsInfSgmt(Map<String, Object> map) throws Exception;
	
	public void delPcBasSpsInfSgmtById(Map<String, Object> map) throws Exception;
	/**
	 * 收入信息段 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getPcBasIncInfSgmtKey(Map<String, Object> map) throws Exception;
	
	public void insertPcBasIncInfSgmt(Map<String, Object> map) throws Exception;
	
	public void updatePcBasIncInfSgmt(Map<String, Object> map) throws Exception;

	public void delPcBasIncInfSgmtById(Map<String, Object> map) throws Exception;
	
	
	
	

}
