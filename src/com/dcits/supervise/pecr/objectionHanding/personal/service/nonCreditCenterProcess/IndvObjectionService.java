package com.dcits.supervise.pecr.objectionHanding.personal.service.nonCreditCenterProcess;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.objectionHanding.entity.IndvObjection;

import java.util.HashMap;
import java.util.List;

/**
 * @author liuyno
 * @date 2020/8/24 - 9:41
 */
public interface IndvObjectionService {

    public List<IndvObjection> getDataListIndvObjection(Page page) throws Exception;

    public void addIndvObjection(Page page) throws Exception;

    public void updateIndvObjectionById(Page page) throws Exception;

    public void deleteByObjectionId(PageData pageData)throws Exception;

    public void changeObjectionStatus(HashMap<String,Object> objectionParam)throws Exception;


}
