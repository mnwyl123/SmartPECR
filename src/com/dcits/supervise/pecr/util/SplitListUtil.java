package com.dcits.supervise.pecr.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.dcits.supervise.pecr.generateReport.entity.IndvBsSgmtReportEntity;
/**
 * 
 * @author 
 * 拆分list工具类
 *
 */
public class SplitListUtil {
	/**
	 * 
	 * @param list 拆分list
	 * @param num  list大于多少时需拆分
	 * @return list返回结果list
	 */
	public static List<List<Object>> splitList(List<Object> list,int num) {
		if(list.isEmpty()){
			list = new ArrayList<Object>();
		}
		int m = list.size() % num == 0 ? list.size() / num : list.size() / num + 1;
		List<Object> subList = null;
		List<List<Object>> resultList = new ArrayList<List<Object>>();
		for (int n = 0; n < m; n++) {
			if (n == m - 1) {
				subList = list.subList(num * n,list.size());
			} else {
				subList = list.subList(num * n,num * (n + 1));
			}
			resultList.add(subList);
		}
		return resultList;
	}
	/**
	 * List<Map<String, Object>>拆分
	 * @param list
	 * @param num
	 * @return
	 */
	public static List<List<Map<String, Object>>> splitListMap(List<Map<String, Object>> list,int num) {
		if(list.isEmpty()){
			list = new ArrayList<Map<String, Object>>();
		}
		int m = list.size() % num == 0 ? list.size() / num : list.size() / num + 1;
		List<Map<String, Object>> subList = null;
		List<List<Map<String, Object>>> resultList = new ArrayList<List<Map<String, Object>>>();
		for (int n = 0; n < m; n++) {
			if (n == m - 1) {
				subList = list.subList(num * n,list.size());
			} else {
				subList = list.subList(num * n,num * (n + 1));
			}
			resultList.add(subList);
		}
		return resultList;
	}
	/**
	 * 
	 * @param list 拆分list
	 * @param num  list大于多少时需拆分
	 * @return list返回结果list
	 */
	public static List<List<IndvBsSgmtReportEntity>> splitListIndv(List<IndvBsSgmtReportEntity> list,int num) {
		if(list.isEmpty()){
			list = new ArrayList<IndvBsSgmtReportEntity>();
		}
		int m = list.size() % num == 0 ? list.size() / num : list.size() / num + 1;
		List<IndvBsSgmtReportEntity> subList = null;
		List<List<IndvBsSgmtReportEntity>> resultList = new ArrayList<List<IndvBsSgmtReportEntity>>();
		for (int n = 0; n < m; n++) {
			if (n == m - 1) {
				subList = list.subList(num * n,list.size());
			} else {
				subList = list.subList(num * n,num * (n + 1));
			}
			resultList.add(subList);
		}
		return resultList;
	}
}
