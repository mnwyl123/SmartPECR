package com.dcits.supervise.pecr.indv.service.packet;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;

import java.util.List;
import java.util.Map;

public interface IndvNormalMessageManager {
    //查询个人需要生成报文记录 
    public List<Map<String, Object>> getNormalMessage(Page page) throws Exception;
    
    public List<Map<String, Object>> autoNormalMessage(Page page) throws Exception;
    
    public List<Map<String, Object>> getAbnormalMessage(Page page) throws Exception;
    
    public boolean checkReportStatusNumEqu(PageData pd) throws Exception;
    
    public List<NeedReportDetail> getReport80StatusNum(PageData pd) throws Exception;
    
}
