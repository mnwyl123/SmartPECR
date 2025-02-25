package com.dcits.platform.plugin.interceptor;

public class MysqlDialect extends Dialect {
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.mybatis.extend.interceptor.IDialect#getLimitString(java.lang.String,
	 * int, int)
	 */
	@Override
	public String getLimitString(String sql, int offset, int limit) {
		sql = sql.trim();
		StringBuffer pagingSelect = new StringBuffer(sql.length() + 100);
		 pagingSelect.append("select a.* from ( ");
		 pagingSelect.append(" select (select @rownum:=@rownum +1 from (select @rownum:=0)r) as rownum,b.* from (");
		 pagingSelect.append(sql);
		 pagingSelect.append(" ) b ) a ");
		 pagingSelect.append(" where a. rownum >"+offset  );
		 pagingSelect.append(" and a. rownum <= "+(offset + limit));
		 //pagingSelect.append(" limit " + offset + " ," + limit);
		return pagingSelect.toString();
	}   
}
