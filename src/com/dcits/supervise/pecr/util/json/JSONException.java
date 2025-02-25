package com.dcits.supervise.pecr.util.json;

import com.dcits.supervise.pecr.exceptions.ExceptionUtil;
import com.dcits.supervise.pecr.util.StrUtil;

public class JSONException extends RuntimeException
{
  private static final long serialVersionUID = 0L;

  public JSONException(Throwable e)
  {
    super(ExceptionUtil.getMessage(e), e);
  }

  public JSONException(String message) {
    super(message);
  }

  public JSONException(String messageTemplate, Object[] params) {
    super(StrUtil.format(messageTemplate, params));
  }

  public JSONException(String message, Throwable cause) {
    super(message, cause);
  }

  public JSONException(Throwable throwable, String messageTemplate, Object[] params) {
    super(StrUtil.format(messageTemplate, params), throwable);
  }
}
