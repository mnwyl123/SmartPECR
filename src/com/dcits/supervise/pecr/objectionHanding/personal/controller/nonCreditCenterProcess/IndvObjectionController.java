package com.dcits.supervise.pecr.objectionHanding.personal.controller.nonCreditCenterProcess;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.objectionHanding.entity.IndvObjection;
import com.dcits.supervise.pecr.objectionHanding.personal.service.nonCreditCenterProcess.IndvObjectionService;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 个人异议处理--异议登记
 *
 * @author 穆楠
 * @date 2020/8/5 - 9:16
 */
@Controller
@RequestMapping("/IndvObjection")
public class IndvObjectionController extends BaseController {

    @Autowired
    private IndvObjectionService indvObjectionService;

    @RequestMapping("/dataPageIndvObjectionRegiste")
    public String dataPageIndvObjectionRegiste() {
        return "pecr/objectionHanding/personal/nonCreditCenterProcess/objectionRegiste";
    }

    @RequestMapping("/dataPageIndvObjectionCheck")
    public String dataPageIndvObjectionCheck() {
        return "pecr/objectionHanding/personal/nonCreditCenterProcess/objectionCheck";
    }

    @RequestMapping("/dataPageIndvObjectionReview")
    public String dataPageIndvObjectionReview() {
        return "pecr/objectionHanding/personal/nonCreditCenterProcess/objectionReview";
    }

    @RequestMapping("/dataPageIndvObjectionApprove")
    public String dataPageIndvObjectionApprove() {
        return "pecr/objectionHanding/personal/nonCreditCenterProcess/objectionApprove";
    }

    @RequestMapping("/dataPageIndvObjectionCorrect")
    public String dataPageIndvObjectionCorrect() {
        return "pecr/objectionHanding/personal/nonCreditCenterProcess/objectionCorrect";
    }

    /*异议登记页面 异议审核页面 异议审批页面*/

    //获取异议数据列表
    @RequestMapping("/getDataList")
    @ResponseBody
    public Map<String, Object> getDataList(Page page) {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        try {
            PageData pageData = this.getPageData();
            pageData.put("COMPANY", company);
            page.setPd(pageData);
            List<IndvObjection> List = indvObjectionService.getDataListIndvObjection(page);
            resultMap.put("data", List);
            resultMap.put("code", 0);
            resultMap.put("msg", "查询成功");
            resultMap.put("count", page.getTotalResult());
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 1);
            resultMap.put("msg", "查询失败");
        }
        return resultMap;
    }

    //新增或修改异议
    @RequestMapping("/addAndUpdate")
    @ResponseBody
    public Map<String, Object> addAndUpdate(Page page) {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        try {
            PageData pageData = this.getPageData();
            pageData.put("COMPANY", company);
            page.setPd(pageData);
            String addOrUpdate = pageData.getString("addOrUpdate");
            if ("add".equals(addOrUpdate)) {
                indvObjectionService.addIndvObjection(page);
                resultMap.put("msg", "新增成功！");
            } else if ("update".equals(addOrUpdate)) {
                indvObjectionService.updateIndvObjectionById(page);
                resultMap.put("msg", "修改成功！");
            } else {
                resultMap.put("code", 1);
                resultMap.put("msg", "新增或修改标识有误！");
                return resultMap;
            }
            resultMap.put("code", 0);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 1);
            resultMap.put("msg", "新增或修出错,请重新操作！");
        }
        return resultMap;
    }

    //删除一条异议记录
    @RequestMapping("/deleteByObjectionById")
    @ResponseBody
    public Map<String, Object> deleteByObjectionById(Page page) {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        try {
            PageData pageData = this.getPageData();
            pageData.put("COMPANY", company);
            indvObjectionService.deleteByObjectionId(pageData);
            resultMap.put("msg", "删除成功！");
            resultMap.put("code", 0);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 1);
            resultMap.put("msg", "删除出错,请重新操作！");
        }
        return resultMap;
    }

    //修改异议状态
    @RequestMapping("/changeObjectionStatus")
    @ResponseBody
    public Map<String, Object> changeObjectionStatus(@RequestBody List<IndvObjection> data) {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        HashMap<String, Object> objectionParam = new HashMap<String, Object>(2);
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        try {
            PageData pageData = this.getPageData();
            String objectionStatus = pageData.getString("objectionStatus");
            for (IndvObjection objection : data) {
            	objectionParam.put("COMPANY", company);
                objectionParam.put("objectionStatus", objectionStatus);
                objectionParam.put("objectionId", objection.getObjectionId());
                indvObjectionService.changeObjectionStatus(objectionParam);
            }
            //如果异议状态为20，调用长银短信接口，发送登记成功短信

            resultMap.put("msg", "异议状态更新成功！");
            resultMap.put("code", 0);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 1);
            resultMap.put("msg", "异议状态修改出错,请重新操作！");
        }
        return resultMap;
    }

}
