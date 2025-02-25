package com.dcits.supervise.pecr.util.file;

import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.Map;

import com.dcits.supervise.pecr.exceptions.IORuntimeException;
import com.dcits.supervise.pecr.util.Assert;
import com.dcits.supervise.pecr.util.CharsetUtil;
import com.dcits.supervise.pecr.util.FileUtil;
import com.dcits.supervise.pecr.util.IoUtil;
import com.dcits.supervise.pecr.util.StrUtil;

public class FileWriter extends FileWrapper {
	public static FileWriter create(File file, Charset charset) {
		return new FileWriter(file, charset);
	}

	public static FileWriter create(File file) {
		return new FileWriter(file);
	}

	public FileWriter(File file, Charset charset) {
		super(file, charset);
		checkFile();
	}

	public FileWriter(File file, String charset) {
		this(file, CharsetUtil.charset(charset));
	}

	public FileWriter(String filePath, Charset charset) {
		this(FileUtil.file(filePath), charset);
	}

	public FileWriter(String filePath, String charset) {
		this(FileUtil.file(filePath), CharsetUtil.charset(charset));
	}

	public FileWriter(File file) {
		this(file, DEFAULT_CHARSET);
	}

	public FileWriter(String filePath) {
		this(filePath, DEFAULT_CHARSET);
	}

	public File write(String content, boolean isAppend) throws IORuntimeException {
		BufferedWriter writer = null;
		try {
			writer = getWriter(isAppend);
			writer.write(content);
			writer.flush();
		} catch (IOException e) {
			throw new IORuntimeException(e);
		} finally {
			IoUtil.close(writer);
		}
		return this.file;
	}

	public File write(String content) throws IORuntimeException {
		return write(content, false);
	}

	public File append(String content) throws IORuntimeException {
		return write(content, true);
	}

	public <T> File writeLines(Collection<T> list) throws IORuntimeException {
		return writeLines(list, false);
	}

	public <T> File appendLines(Collection<T> list) throws IORuntimeException {
		return writeLines(list, true);
	}

	public <T> File writeLines(Collection<T> list, boolean isAppend) throws IORuntimeException {
		return writeLines(list, null, isAppend);
	}

	public <T> File writeLines( Collection<T> list,  LineSeparator lineSeparator,  boolean isAppend) throws IORuntimeException {
        try ( PrintWriter writer = this.getPrintWriter(isAppend)) {
            for ( T t : list) {
                if (null != t) {
                    writer.print(t.toString());
                    this.printNewLine(writer, lineSeparator);
                    writer.flush();
                }
            }
        }
        return this.file;
    }

	public File writeMap(Map<?, ?> map, String kvSeparator, boolean isAppend) throws IORuntimeException {
		return writeMap(map, null, kvSeparator, isAppend);
	}

	public File writeMap(Map<?, ?> map, LineSeparator lineSeparator, String kvSeparator, boolean isAppend)
			throws IORuntimeException {
		if (null == kvSeparator) {
			kvSeparator = " = ";
		}
		PrintWriter writer = getPrintWriter(isAppend);
		Throwable localThrowable2 = null;
		try {
			for (Map.Entry<?, ?> entry : map.entrySet())
				if (null != entry) {
					writer.print(
							StrUtil.format("{}{}{}", new Object[] { entry.getKey(), kvSeparator, entry.getValue() }));
					printNewLine(writer, lineSeparator);
					writer.flush();
				}
		} catch (Throwable localThrowable1) {
			localThrowable2 = localThrowable1;
			throw localThrowable1;
		} finally {
			if (writer != null)
				if (localThrowable2 != null)
					try {
						writer.close();
					} catch (Throwable x2) {
						localThrowable2.addSuppressed(x2);
					}
				else
					writer.close();
		}
		return this.file;
	}

	public File write(byte[] data, int off, int len) throws IORuntimeException {
		return write(data, off, len, false);
	}

	public File append(byte[] data, int off, int len) throws IORuntimeException {
		return write(data, off, len, true);
	}

	public File write(byte[] data, int off, int len, boolean isAppend) throws IORuntimeException {
		FileOutputStream out = null;
		try {
			out = new FileOutputStream(FileUtil.touch(this.file), isAppend);
			out.write(data, off, len);
			out.flush();
		} catch (IOException e) {
			throw new IORuntimeException(e);
		} finally {
			IoUtil.close(out);
		}
		return this.file;
	}

	public File writeFromStream(InputStream in) throws IORuntimeException {
		FileOutputStream out = null;
		try {
			out = new FileOutputStream(FileUtil.touch(this.file));
			IoUtil.copy(in, out);
		} catch (IOException e) {
			throw new IORuntimeException(e);
		} finally {
			IoUtil.close(out);
		}
		return this.file;
	}

	public BufferedOutputStream getOutputStream() throws IORuntimeException {
		BufferedOutputStream bos = null;
		FileOutputStream os = null;
		try {
			os = new FileOutputStream(FileUtil.touch(this.file));
			bos = new BufferedOutputStream(os);
			return bos;
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}finally {
			if(bos != null) {
				try {
					bos.close();
				} catch (IOException e) {
				}
			}
			if(os != null) {
				try {
					os.close();
				} catch (IOException e) {
				}
			}
		}
		
	}

	public BufferedWriter getWriter(boolean isAppend) throws IORuntimeException {
		BufferedWriter bw = null;
		FileOutputStream os = null;
		OutputStreamWriter osw = null;
		try {
			os = new FileOutputStream(FileUtil.touch(this.file), isAppend);
			osw = new OutputStreamWriter(os, this.charset);
			bw = new BufferedWriter(osw);
			return bw;
		} catch (Exception e) {
			throw new IORuntimeException(e);
		}finally {
			if(os != null) {
				try {
					os.close();
				} catch (IOException e) {
				}
			}
			if(osw != null) {
				try {
					osw.close();
				} catch (IOException e) {
				}
			}
			if(bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
				}
			}
		}
	}

	public PrintWriter getPrintWriter(boolean isAppend) throws IORuntimeException {
		return new PrintWriter(getWriter(isAppend));
	}

	private void checkFile() throws IORuntimeException {
		Assert.notNull(this.file, "File to write content is null !", new Object[0]);
		if ((this.file.exists()) && (false == this.file.isFile()))
			throw new IORuntimeException("File [{}] is not a file !", new Object[] { this.file.getAbsoluteFile() });
	}

	private void printNewLine(PrintWriter writer, LineSeparator lineSeparator) {
		if (null == lineSeparator) {
			writer.println();
		} else
			writer.print(lineSeparator.getValue());
	}
}