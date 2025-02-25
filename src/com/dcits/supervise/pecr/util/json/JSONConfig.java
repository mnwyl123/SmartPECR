package com.dcits.supervise.pecr.util.json;


import java.io.Serializable;

public class JSONConfig
  implements Serializable
{
  private static final long serialVersionUID = 119730355204738278L;
  private boolean order;
  private boolean ignoreError;
  private boolean ignoreCase;
  private String dateFormat;
  private boolean ignoreNullValue = true;

  public static JSONConfig create()
  {
    return new JSONConfig();
  }

  public boolean isOrder()
  {
    return this.order;
  }

  public JSONConfig setOrder(boolean order)
  {
    this.order = order;
    return this;
  }

  public boolean isIgnoreError()
  {
    return this.ignoreError;
  }

  public JSONConfig setIgnoreError(boolean ignoreError)
  {
    this.ignoreError = ignoreError;
    return this;
  }

  public boolean isIgnoreCase()
  {
    return this.ignoreCase;
  }

  public JSONConfig setIgnoreCase(boolean ignoreCase)
  {
    this.ignoreCase = ignoreCase;
    return this;
  }

  public String getDateFormat()
  {
    return this.dateFormat;
  }

  public JSONConfig setDateFormat(String dateFormat)
  {
    this.dateFormat = dateFormat;
    return this;
  }

  public boolean isIgnoreNullValue()
  {
    return this.ignoreNullValue;
  }

  public JSONConfig setIgnoreNullValue(boolean ignoreNullValue)
  {
    this.ignoreNullValue = ignoreNullValue;
    return this;
  }
}