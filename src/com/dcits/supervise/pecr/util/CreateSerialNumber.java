package com.dcits.supervise.pecr.util;

import java.util.Map;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;

public class CreateSerialNumber {

	private int serialNumb = -1;
	
	private String serial_number = "";
	
	private final static String id = "serialnumber";
	
	private static ReportMessageManager reportMessageManager;

	private static CreateSerialNumber instance = new CreateSerialNumber();//饿汉模式
	
	private CreateSerialNumber(){}
	
	public static CreateSerialNumber getInstance(){
		return instance;
	}
	
	public void setReportMessageManager(ReportMessageManager reportMessageManager){
		CreateSerialNumber.reportMessageManager=reportMessageManager;
	}
	
	/**
	 * 设定事务以及事务的隔离级别
	 * isolation=Isolation.READ_COMMITTED：读提交（会出现不可重复读和幻读）
	 * Isolation.REPEATABLE_READ:可重复读（会出现幻读）
	 * Isolation.READ_UNCOMMITTED:读未提交（会出现脏读，不可重复读）基本不用
	 * Isolation.SERIALIZABLE:串行化。
	 * MYSQL:默认是REPEATABLE_READ
	 * SQLSERVER:默认是READ_COMMITTED
	 * ORACLE:默认是READ_COMMITTED
	 */
	@Transactional(isolation = Isolation.REPEATABLE_READ)
	synchronized public String getSerialNumb(String inRefType) throws Exception {
		
		return null;
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	synchronized public String getSerialNumb(Map<String,Object> maps) throws Exception {
		String date = StringDateUtil.getDateString("yyyyMMdd");//获取到抽取流水号当天的日期
		//根据 信息记录类型和法人进行查询
		PageData pd = new PageData();
		pd.put("inRefType", maps.get("inRefType").toString());
		pd.put("company", maps.get("company").toString());
		PageData serialNumberPd = CreateSerialNumber.reportMessageManager.getLock(pd);
		//防止没有初始化数据
		pd.put("extractDate", date);
		if(serialNumberPd == null){
			pd.put("ID", "serialnumber");
			pd.put("serialNumber", "000");
			CreateSerialNumber.reportMessageManager.insertSerivalNumber(pd);
			serialNumberPd = CreateSerialNumber.reportMessageManager.getLock(pd);
			serialNumb=Integer.parseInt(serialNumberPd.getString("SERIAL_NUMBER"));
		}else{
			String extractDate = serialNumberPd.getString("EXTRACT_DATE");
			if(date.equals(extractDate)){
				serialNumb=Integer.parseInt(serialNumberPd.getString("SERIAL_NUMBER"));
			}else{
				serialNumb = 0;
			}
		}
		if(serialNumb == 999){
			serialNumb = 0;
		}
		serialNumb++;
		serial_number = String.format("%03d", serialNumb);
		pd.put("serialNumber", serial_number);
		boolean flag = CreateSerialNumber.reportMessageManager.updateSerivalNumber(pd);
		if(flag){
			return serial_number;
		}
		return null;
	}
}
