package com.dcits.supervise.pecr.util.json;

import java.io.Serializable;
import java.io.Writer;


public abstract interface JSON extends Serializable
{
  @Deprecated
  public abstract Object getByExp(String paramString);

  @Deprecated
  public abstract <T> T getByExp(String paramString, Class<T> paramClass);

  public abstract Object getByPath(String paramString);

  public abstract void putByPath(String paramString, Object paramObject);

  public abstract <T> T getByPath(String paramString, Class<T> paramClass);

  public abstract Writer write(Writer paramWriter)
    throws JSONException;

  public abstract Writer write(Writer paramWriter, int paramInt1, int paramInt2)
    throws JSONException;

  public abstract String toJSONString(int paramInt)
    throws JSONException;

  public abstract String toStringPretty()
    throws JSONException;
}
