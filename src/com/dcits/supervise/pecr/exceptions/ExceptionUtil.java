package com.dcits.supervise.pecr.exceptions;

import com.dcits.supervise.pecr.util.StrUtil;

public class ExceptionUtil
{
  private static final String NULL = "null";

  public static String getMessage(Throwable e)
  {
    if (null == e) {
      return "null";
    }
    return StrUtil.format("{}: {}", new Object[] { e.getClass().getSimpleName(), e.getMessage() });
  }
}