package com.dcits.supervise.pecr.util.file;


import java.io.File;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

public class FileWrapper
{
  protected File file;
  protected Charset charset;
  public static final Charset DEFAULT_CHARSET = StandardCharsets.UTF_8;

  public FileWrapper(File file, Charset charset)
  {
    this.file = file;
    this.charset = charset;
  }

  public File getFile()
  {
    return this.file;
  }

  public FileWrapper setFile(File file)
  {
    this.file = file;
    return this;
  }

  public Charset getCharset()
  {
    return this.charset;
  }

  public FileWrapper setCharset(Charset charset)
  {
    this.charset = charset;
    return this;
  }

//  public String readableFileSize()
//  {
//    return FileUtil.readableFileSize(this.file.length());
//  }
}
