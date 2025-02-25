package com.dcits.supervise.pecr.util;


import java.io.File;
import java.io.IOException;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import com.dcits.supervise.pecr.exceptions.IORuntimeException;

public class FileCopier extends SrcToDestCopier<File, FileCopier>
{
  private boolean isOverride;
  private boolean isCopyAttributes;
  private boolean isCopyContentIfDir;
  private boolean isOnlyCopyFile;

  public static FileCopier create(String srcPath, String destPath)
  {
    return new FileCopier(FileUtil.file(srcPath), FileUtil.file(destPath));
  }

  public static FileCopier create(File src, File dest)
  {
    return new FileCopier(src, dest);
  }

  public FileCopier(File src, File dest)
  {
    this.src = src;
    this.dest = dest;
  }

  public boolean isOverride()
  {
    return this.isOverride;
  }

  public FileCopier setOverride(boolean isOverride)
  {
    this.isOverride = isOverride;
    return this;
  }

  public boolean isCopyAttributes()
  {
    return this.isCopyAttributes;
  }

  public FileCopier setCopyAttributes(boolean isCopyAttributes)
  {
    this.isCopyAttributes = isCopyAttributes;
    return this;
  }

  public boolean isCopyContentIfDir()
  {
    return this.isCopyContentIfDir;
  }

  public FileCopier setCopyContentIfDir(boolean isCopyContentIfDir)
  {
    this.isCopyContentIfDir = isCopyContentIfDir;
    return this;
  }

  public boolean isOnlyCopyFile()
  {
    return this.isOnlyCopyFile;
  }

  public FileCopier setOnlyCopyFile(boolean isOnlyCopyFile)
  {
    this.isOnlyCopyFile = isOnlyCopyFile;
    return this;
  }

  public File copy()
    throws IORuntimeException
  {
    File src = (File)this.src;
    File dest = (File)this.dest;

    Assert.notNull(src, "Source File is null !", new Object[0]);
    if (false == src.exists()) {
      throw new IORuntimeException("File not exist: " + src);
    }
    Assert.notNull(dest, "Destination File or directiory is null !", new Object[0]);
    if (FileUtil.equals(src, dest)) {
      throw new IORuntimeException("Files '{}' and '{}' are equal", new Object[] { src, dest });
    }

    if (src.isDirectory()) {
      if ((dest.exists()) && (false == dest.isDirectory()))
      {
        throw new IORuntimeException("Src is a directory but dest is a file!");
      }
      File subDest = this.isCopyContentIfDir ? dest : FileUtil.mkdir(FileUtil.file(dest, src.getName()));
      internalCopyDirContent(src, subDest);
    } else {
      internalCopyFile(src, dest);
    }
    return dest;
  }

  private void internalCopyDirContent(File src, File dest)
    throws IORuntimeException
  {
    if ((null != this.copyFilter) && (false == this.copyFilter.accept(src)))
    {
      return;
    }

    if (false == dest.exists())
    {
      dest.mkdirs();
    } else if (false == dest.isDirectory()) {
      throw new IORuntimeException(StrUtil.format("Src [{}] is a directory but dest [{}] is a file!", new Object[] { src.getPath(), dest.getPath() }));
    }

    String[] files = src.list();

    for (String file : files) {
      File srcFile = new File(src, file);
      File destFile = this.isOnlyCopyFile ? dest : new File(dest, file);

      if (srcFile.isDirectory())
        internalCopyDirContent(srcFile, destFile);
      else
        internalCopyFile(srcFile, destFile);
    }
  }

  private void internalCopyFile(File src, File dest)
    throws IORuntimeException
  {
    if ((null != this.copyFilter) && (false == this.copyFilter.accept(src)))
    {
      return;
    }

    if (dest.exists()) {
      if (dest.isDirectory())
      {
        dest = new File(dest, src.getName());
      }

      if ((dest.exists()) && (false == this.isOverride))
      {
        return;
      }
    }
    else {
      dest.getParentFile().mkdirs();
    }

    ArrayList optionList = new ArrayList(2);
    if (this.isOverride) {
      optionList.add(StandardCopyOption.REPLACE_EXISTING);
    }
    if (this.isCopyAttributes) {
      optionList.add(StandardCopyOption.COPY_ATTRIBUTES);
    }
    try
    {
      Files.copy(src.toPath(), dest.toPath(), (CopyOption[])optionList.toArray(new CopyOption[optionList.size()]));
    } catch (IOException e) {
      throw new IORuntimeException(e);
    }
  }
}
