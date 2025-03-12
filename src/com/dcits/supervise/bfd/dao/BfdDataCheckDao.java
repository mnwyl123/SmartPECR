package com.dcits.supervise.bfd.dao;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * bfd校验业务持久化接口层
 *
 * @author 穆楠
 *
 */
public interface BfdDataCheckDao {

    /**
     * 执行存储过程
     *
     * @param params
     * @return String
     * @throws Exception
     */
    public String dataCheck(Map<String, String> params) throws Exception;


    public List<Map<String, String>> getCheckResult(Page page) throws Exception;

    public void updateCheckResultById(PageData pd) throws Exception;

    public void deleteCheckResultById(PageData pd) throws Exception;

    public Map<String,Object> getCheckResultById(Page page) throws Exception;
}
