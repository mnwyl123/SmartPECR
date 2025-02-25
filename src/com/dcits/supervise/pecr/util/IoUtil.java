package com.dcits.supervise.pecr.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.nio.charset.Charset;

import com.dcits.supervise.pecr.exceptions.IORuntimeException;

public class IoUtil {

	public static ByteArrayInputStream toStream(String content, String charsetName) {
		return toStream(content, CharsetUtil.charset(charsetName));
	}

	public static ByteArrayInputStream toStream(String content, Charset charset) {
		if (content == null) {
			return null;
		}
		return toStream(StrUtil.bytes(content, charset));
	}

	public static ByteArrayInputStream toStream(byte[] content) {
		if (content == null) {
			return null;
		}
		return new ByteArrayInputStream(content);
	}

	public static FileInputStream toStream(File file) {
		try {
			return new FileInputStream(file);
		} catch (FileNotFoundException e) {
			throw new IORuntimeException(e);
		}

	}

	public static BufferedReader getReader(InputStream in, String charsetName) {
		return getReader(in, Charset.forName(charsetName));
	}

	public static BufferedReader getReader(InputStream in, Charset charset) {
		if (null == in) {
			return null;
		}

		InputStreamReader reader = null;
		if (null == charset)
			reader = new InputStreamReader(in);
		else {
			reader = new InputStreamReader(in, charset);
		}

		return new BufferedReader(reader);
	}

	public static BufferedReader getReader(Reader reader) {
		if (null == reader) {
			return null;
		}

		return (reader instanceof BufferedReader) ? (BufferedReader) reader : new BufferedReader(reader);
	}

	public static void close(Closeable closeable) {
		if (null != closeable)
			try {
				closeable.close();
			} catch (Exception e) {
			}
	}

	public static void close(AutoCloseable closeable) {
		if (null != closeable)
			try {
				closeable.close();
			} catch (Exception e) {
			}
	}

	public static long copy(Reader reader, Writer writer) throws IORuntimeException {
		return copy(reader, writer, 1024);
	}

	public static long copy(Reader reader, Writer writer, int bufferSize) throws IORuntimeException {
		return copy(reader, writer, bufferSize, null);
	}

	public static long copy(Reader reader, Writer writer, int bufferSize, StreamProgress streamProgress)
			throws IORuntimeException {
		char[] buffer = new char[bufferSize];
		long size = 0L;

		if (null != streamProgress)
			streamProgress.start();
		try {
			int readSize;
			while ((readSize = reader.read(buffer, 0, bufferSize)) != -1) {
				writer.write(buffer, 0, readSize);
				size += readSize;
				writer.flush();
				if (null != streamProgress)
					streamProgress.progress(size);
			}
		} catch (Exception e) {
			throw new IORuntimeException(e);
		}
		if (null != streamProgress) {
			streamProgress.finish();
		}
		return size;
	}

	public static long copy(InputStream in, OutputStream out) throws IORuntimeException {
		return copy(in, out, 1024);
	}

	public static long copy(InputStream in, OutputStream out, int bufferSize) throws IORuntimeException {
		return copy(in, out, bufferSize, null);
	}

	public static long copy(InputStream in, OutputStream out, int bufferSize, StreamProgress streamProgress)
			throws IORuntimeException {
		Assert.notNull(in, "InputStream is null !", new Object[0]);
		Assert.notNull(out, "OutputStream is null !", new Object[0]);
		if (bufferSize <= 0) {
			bufferSize = 1024;
		}

		byte[] buffer = new byte[bufferSize];
		if (null != streamProgress) {
			streamProgress.start();
		}
		long size = 0L;
		try {
			for (int readSize ; (readSize = in.read(buffer)) != -1;) {
				out.write(buffer, 0, readSize);
				size += readSize;
				out.flush();
				if (null != streamProgress)
					streamProgress.progress(size);
			}
		} catch (IOException e) {
			//int readSize;
			throw new IORuntimeException(e);
		}
		if (null != streamProgress) {
			streamProgress.finish();
		}
		return size;
	}

}
