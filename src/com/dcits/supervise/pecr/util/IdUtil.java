package com.dcits.supervise.pecr.util;

public class IdUtil
{
  public static String randomUUID()
  {
    return UUID.randomUUID().toString();
  }
  public static String simpleUUID()
  {
    return UUID.randomUUID().toString(true);
  }
}