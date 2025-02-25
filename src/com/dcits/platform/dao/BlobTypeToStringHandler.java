package com.dcits.platform.dao;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class BlobTypeToStringHandler extends BaseTypeHandler {
	private org.apache.log4j.Logger logger;
	// 指定字符集
	private static final String DEFAULT_CHARSET = "utf-8";

	@Override
	public Object getNullableResult(ResultSet arg0, String arg1) throws SQLException {
		Blob blob = arg0.getBlob(arg1);

		byte[] returnValue = null;

		String result = null;

		if (null != blob) {

			returnValue = blob.getBytes(1L, (int) blob.length());

		}
		try {

			if (returnValue != null) {
				result = new String(returnValue, DEFAULT_CHARSET);
			}
		} catch (UnsupportedEncodingException e) {
			// e.printStackTrace();
			logger.error(e);
		}

		return result;

	}

	@Override
	public Object getNullableResult(ResultSet arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getNullableResult(CallableStatement arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setNonNullParameter(PreparedStatement arg0, int arg1, Object parameter, JdbcType arg3)
			throws SQLException {
		ByteArrayInputStream bis = new ByteArrayInputStream(((String) parameter).getBytes());
		arg0.setBinaryStream(arg1, bis, ((String) parameter).getBytes().length);
	}

}
