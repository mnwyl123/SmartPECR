package com.dcits.supervise.pecr.util;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnsupportedCharsetException;

public class CharsetUtil
{
  public static final String ISO_8859_1 = "ISO-8859-1";
  public static final String UTF_8 = "UTF-8";
  public static final String GBK = "GBK";
  public static final Charset CHARSET_ISO_8859_1 = StandardCharsets.ISO_8859_1;

  public static final Charset CHARSET_UTF_8 = StandardCharsets.UTF_8;

  public static final Charset CHARSET_GBK = Charset.forName("GBK");

  public static Charset charset(String charsetName)
    throws UnsupportedCharsetException
  {
    return StrUtil.isBlank(charsetName) ? Charset.defaultCharset() : Charset.forName(charsetName);
  }

  public static String convert(String source, String srcCharset, String destCharset)
  {
    return convert(source, Charset.forName(srcCharset), Charset.forName(destCharset));
  }

  public static String convert(String source, Charset srcCharset, Charset destCharset)
  {
    if (null == srcCharset) {
      srcCharset = StandardCharsets.ISO_8859_1;
    }

    if (null == destCharset) {
      destCharset = StandardCharsets.UTF_8;
    }

    if ((StrUtil.isBlank(source)) || (srcCharset.equals(destCharset))) {
      return source;
    }
    return new String(source.getBytes(srcCharset), destCharset);
  }



  public static String defaultCharsetName()
  {
    return defaultCharset().name();
  }

  public static Charset defaultCharset()
  {
    return Charset.defaultCharset();
  }
}