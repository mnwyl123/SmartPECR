package com.dcits.platform.util.dynsource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 实现动态数据源配置
 * 
 * @author pengyj
 * 
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

	protected Object determineCurrentLookupKey() {
		
		return DbContextHolder.getDbType();
	}

}
