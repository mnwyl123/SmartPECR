package com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.objectionHanding.entity.CreditCenterObjHandingEntity;

import java.util.List;
import java.util.Map;

/**
 * 征信中心异议处理数据与数据库交互
 *
 * @author liuyno
 * @date 2020/10/22 - 10:45
 */
public interface IndvObjWebServiceService {

    public String insertToCheckInf(Map<String, Object> map) throws Exception;

    public void insertHistoricalCheckInf(Map<String, String> map) throws Exception;

    public void updateObjAnnexById(Map<String, String> map) throws Exception;

    public void updateFeedbackCheckResultById(Map<String, String> map) throws Exception;

    public void updateFeedbackCorrectResultById(Map<String, String> map) throws Exception;

    public void updateReceiveResultById(Map<String, String> map) throws Exception;

    public void updateAddObjLabelById(Map<String, String> map) throws Exception;

    public void updateDeleteObjLabelById(Map<String, String> map) throws Exception;

    public List<CreditCenterObjHandingEntity> objectionList(Page page) throws Exception;

    public void insertLocalInfById(Map<String, String> map) throws Exception;

    public void deleteToCheckObjectionById(String id) throws Exception;

    public void deleteHistoricalCheckInf(String id) throws Exception;

    public void deleteLocateInf(String id) throws Exception;

    public PageData getToCheckObjectionById(PageData pd) throws Exception;

    public List getHistoricalCheckInfById(String id) throws Exception;

    public List getLocateInfById(String id) throws Exception;

    public List<String> getTelNoByDate(String dataDate) throws Exception;
}
