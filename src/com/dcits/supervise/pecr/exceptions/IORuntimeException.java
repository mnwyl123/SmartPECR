package com.dcits.supervise.pecr.exceptions;

import com.dcits.supervise.pecr.util.StrUtil;

public class IORuntimeException extends RuntimeException
{
  private static final long serialVersionUID = 8247610319171014183L;

  public IORuntimeException(Throwable e)
  {
    super(ExceptionUtil.getMessage(e), e);
  }

  public IORuntimeException(String message) {
    super(message);
  }

  public IORuntimeException(String messageTemplate, Object[] params) {
    super(StrUtil.format(messageTemplate, params));
  }

  public IORuntimeException(String message, Throwable throwable) {
    super(message, throwable);
  }

  public IORuntimeException(Throwable throwable, String messageTemplate, Object[] params) {
    super(StrUtil.format(messageTemplate, params), throwable);
  }

  public boolean causeInstanceOf(Class<? extends Throwable> clazz)
  {
    Throwable cause = getCause();

    return (null != cause) && (clazz.isInstance(cause));
  }
}