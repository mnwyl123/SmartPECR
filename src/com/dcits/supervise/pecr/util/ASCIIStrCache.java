package com.dcits.supervise.pecr.util;

public class ASCIIStrCache
{
  private static final int ASCII_LENGTH = 128;
  private static final String[] CACHE = new String[''];

  public static String toString(char c)
  {
    return c < '' ? CACHE[c] : String.valueOf(c);
  }

  static
  {
    for (char c = '\000'; c < ''; c = (char)(c + '\001'))
      CACHE[c] = String.valueOf(c);
  }
}