package com.dcits.supervise.pecr.util;


import java.nio.charset.Charset;

public class Base64Encoder
{
  private static final byte[] STANDARD_ENCODE_TABLE = { 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47 };

  private static final byte[] URL_SAFE_ENCODE_TABLE = { 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95 };

  public static byte[] encode(byte[] arr, boolean lineSep)
  {
    return encode(arr, lineSep, false);
  }

  public static byte[] encodeUrlSafe(byte[] arr, boolean lineSep)
  {
    return encode(arr, lineSep, true);
  }

  public static String encode(String source)
  {
    return encode(source, "UTF-8");
  }

  public static String encodeUrlSafe(String source)
  {
    return encodeUrlSafe(source, "UTF-8");
  }

  public static String encode(String source, String charset)
  {
    return encode(StrUtil.bytes(source, charset), charset);
  }

  public static String encodeUrlSafe(String source, String charset)
  {
    return encodeUrlSafe(StrUtil.bytes(source, charset), charset);
  }

  public static String encode(String source, Charset charset)
  {
    return encode(StrUtil.bytes(source, charset), charset);
  }

  public static String encodeUrlSafe(String source, Charset charset)
  {
    return encodeUrlSafe(StrUtil.bytes(source, charset), charset);
  }

  public static String encode(byte[] source)
  {
    return encode(source, "UTF-8");
  }

  public static String encodeUrlSafe(byte[] source)
  {
    return encodeUrlSafe(source, "UTF-8");
  }

  public static String encode(byte[] source, String charset)
  {
    return StrUtil.str(encode(source, false), charset);
  }

  public static String encodeUrlSafe(byte[] source, String charset)
  {
    return StrUtil.str(encodeUrlSafe(source, false), charset);
  }

  public static String encode(byte[] source, Charset charset)
  {
    return StrUtil.str(encode(source, false), charset);
  }

  public static String encodeUrlSafe(byte[] source, Charset charset)
  {
    return StrUtil.str(encodeUrlSafe(source, false), charset);
  }

  public static byte[] encode(byte[] arr, boolean isMultiLine, boolean isUrlSafe)
  {
    if (null == arr) {
      return null;
    }

    int len = arr.length;
    if (len == 0) {
      return new byte[0];
    }

    int evenlen = len / 3 * 3;
    int cnt = (len - 1) / 3 + 1 << 2;
    int destlen = cnt + (isMultiLine ? (cnt - 1) / 76 << 1 : 0);
    byte[] dest = new byte[destlen];

    byte[] encodeTable = isUrlSafe ? URL_SAFE_ENCODE_TABLE : STANDARD_ENCODE_TABLE;

    int s = 0; int d = 0; for (int cc = 0; s < evenlen; ) {
      int i = (arr[(s++)] & 0xFF) << 16 | (arr[(s++)] & 0xFF) << 8 | arr[(s++)] & 0xFF;

      dest[(d++)] = encodeTable[(i >>> 18 & 0x3F)];
      dest[(d++)] = encodeTable[(i >>> 12 & 0x3F)];
      dest[(d++)] = encodeTable[(i >>> 6 & 0x3F)];
      dest[(d++)] = encodeTable[(i & 0x3F)];

      if (isMultiLine) { cc++; if ((cc == 19) && (d < destlen - 2)) {
          dest[(d++)] = 13;
          dest[(d++)] = 10;
          cc = 0;
        }
      }
    }
    int left = len - evenlen;
    if (left > 0) {
      int i = (arr[evenlen] & 0xFF) << 10 | (left == 2 ? (arr[(len - 1)] & 0xFF) << 2 : 0);

      dest[(destlen - 4)] = encodeTable[(i >> 12)];
      dest[(destlen - 3)] = encodeTable[(i >>> 6 & 0x3F)];

      if (isUrlSafe)
      {
        int urlSafeLen = destlen - 2;
        if (2 == left) {
          dest[(destlen - 2)] = encodeTable[(i & 0x3F)];
          urlSafeLen++;
        }
        byte[] urlSafeDest = new byte[urlSafeLen];
        System.arraycopy(dest, 0, urlSafeDest, 0, urlSafeLen);
        return urlSafeDest;
      }
      dest[(destlen - 2)] = (left == 2 ? encodeTable[(i & 0x3F)] : 61);
      dest[(destlen - 1)] = 61;
    }

    return dest;
  }
}