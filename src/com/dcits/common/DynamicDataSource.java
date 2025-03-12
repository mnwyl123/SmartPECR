package com.dcits.common;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 实现动态数据源配置
 * 
 * @author 穆楠
 * 
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

	protected Object determineCurrentLookupKey() {
		
		return DbContextHolder.getDbType();
	}

}
