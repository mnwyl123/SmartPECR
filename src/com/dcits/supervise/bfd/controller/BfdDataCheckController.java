package com.dcits.supervise.bfd.controller;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.bfd.service.BfdDataCheckService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SuppressWarnings(value = "all")
@RequestMapping({"/bfd/check"})
public class BfdDataCheckController extends BaseController {

    @Autowired
    private BfdDataCheckService bfdDataCheckService;

    @RequestMapping(value = {"/showPage"}, method = {org.springframework.web.bind.annotation.RequestMethod.GET})
    public String showPage(Model model, HttpServletRequest request,
                           HttpServletResponse response) {
        return "vise/bfd/bfdDataCheck";
    }

    @RequestMapping({"/findDataTables"})
    @ResponseBody
    public Map<String, ? extends Object> findDataTables(Model model,
                                                        Object cmd, HttpServletRequest request) {
        Map modelMap = new HashMap(3);
        String[] arrM = {"存量单位贷款基础数据", "单位贷款担保合同信息", "单位贷款担保物信息",
                "法人利润及资本统计表", "法人资产负债及风险统计表", "贷款发放信息"};
        String[] arr_M = {"BFD_CLDKXX", "BFD_DBHTXX", "BFD_DBWXX",
                "BFD_FRLRZBTJB", "BFD_FRZCFZFXTJB", "BFD_FSEXX"};
        try {
            int i;
            Map map;
            List list = new ArrayList();
            for (i = 0; i < arrM.length; ++i) {
                map = new HashMap();
                map.put("DATA_CLASS", "M");
                map.put("FILE_CODE", arr_M[i]);
                map.put("FILE_NAME", arrM[i]);
                map.put("FILE_ID", Integer.valueOf(i));
                list.add(map);
            }
            modelMap.put("result", list);
            modelMap.put("totalCount", Integer.valueOf(list.size()));
        } catch (Exception e) {
            e.getMessage();
        }
        return modelMap;
    }

    @RequestMapping({"/toDataCheckPage"})
    public ModelAndView toDataCheckPage(Page page) {
        ModelAndView mv = this.getModelAndView();
        try {
            PageData pd = this.getPageData();
            page.setPd(pd);
            mv.addObject("page", page);
            mv.setViewName("bfd/dataCheck");
        } catch (Exception e) {
            this.logger.error(e.toString(), e);
        }
        return mv;
    }

    @RequestMapping({"/dataQualityCheck"})
    @ResponseBody
    public Map<String, ? extends Object> dataQualityCheck(Model model,
                                                          Object cmd, HttpServletRequest request) {
        Map modelMap = new HashMap(3);
        String dataDate = request.getParameter("DATA_DATE");
        String tabName = request.getParameter("TAB_NAME");
        Map params = new HashMap();
        try {
            params.put("P_DATA_DATE", dataDate);
            params.put("P_CHK_TABLE", tabName);
            params.put("P_O_RESULT", "");
            String result = this.bfdDataCheckService.dataCheck(params);
            if ("SUCCESS".equals(result)) {
                modelMap.put("success", Boolean.valueOf(true));
                modelMap.put("message", "校验成功！");
                return modelMap;
            }
            if ("BUSY".equals(result)) {
                modelMap.put("success", Boolean.valueOf(false));
                modelMap.put("message", "校验程序正在执行，请勿重复操作！");
                return modelMap;
            }
            modelMap.put("success", Boolean.valueOf(false));
            modelMap.put("message", "校验失败！");
            return modelMap;
        } catch (Exception e) {
            modelMap.put("success", Boolean.valueOf(false));
            modelMap.put("message", "校验失败！" + e.getMessage());
        }
        return modelMap;
    }

    @RequestMapping({"/getCheckResult"})
    public ModelAndView getCheckResult(Page page) {
        ModelAndView mv = this.getModelAndView();
        try {
            PageData pd = this.getPageData();
            page.setPd(pd);
            List<Map<String, String>> paramsList = this.bfdDataCheckService
                    .getCheckResult(page);
            mv.addObject("page", page);
            mv.addObject("roleList_z", paramsList);
            mv.setViewName("bfd/checkResult_list");
        } catch (Exception e) {
            this.logger.error(e.toString(), e);
        }
        return mv;
    }

    @RequestMapping({"/toEdit"})
    public ModelAndView toEdit(Page page) {
        ModelAndView mv = this.getModelAndView();
        try {
            PageData pd = this.getPageData();
            page.setPd(pd);
            Map<String, Object> resultOne = this.bfdDataCheckService.getCheckResultById(page);
            mv.setViewName("bfd/checkResult_edit");
            mv.addObject("resultOne", resultOne);
        } catch (Exception e) {
            this.logger.error(e.toString(), e);
        }
        return mv;
    }

    @RequestMapping(value = {"/updateCheckResultById"}, method = RequestMethod.POST)
    public ModelAndView updateCheckResultById(Page page) {
        ModelAndView mv = this.getModelAndView();
        try {
            PageData pd = this.getPageData();
            this.bfdDataCheckService.updateCheckResultById(pd);
            mv.addObject("msg", "success");
        } catch (Exception e) {
            mv.addObject("msg", "failed");
            this.logger.error(e.toString(), e);
        }
        mv.setViewName("save_result");
        return mv;
    }

    @RequestMapping({"/deleteCheckResultById"})
    @ResponseBody
    public Object deleteCheckResultById(Page page) {
        Map<String, String> map = new HashMap();
        String errInfo = "";
        try {
            PageData pd = this.getPageData();
            String id = pd.getString("ID");
            if (null == id || "".equals(id)) {
                this.logger.error("ID参数为空！");
                errInfo = "error";
            } else {
                this.bfdDataCheckService.deleteCheckResultById(pd);
                errInfo = "success";
            }
        } catch (Exception e) {
            this.logger.error(e.toString(), e);
        }
        map.put("result", errInfo);
        return AppUtil.returnObject(new PageData(), map);
    }
}