package com.dcits.supervise.pecr.util;


import java.nio.charset.Charset;

public class Base64Decoder
{
  private static final byte PADDING = -2;
  private static final byte[] DECODE_TABLE = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, 62, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, 63, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51 };

  public static String decodeStr(String source)
  {
    return decodeStr(source, "UTF-8");
  }

  public static String decodeStr(String source, String charset)
  {
    return StrUtil.str(decode(source, charset), charset);
  }

  public static String decodeStr(String source, Charset charset)
  {
    return StrUtil.str(decode(source, charset), charset);
  }

  public static byte[] decode(String source)
  {
    return decode(source, "UTF-8");
  }

  public static byte[] decode(String source, String charset)
  {
    return decode(StrUtil.bytes(source, charset));
  }

  public static byte[] decode(String source, Charset charset)
  {
    return decode(StrUtil.bytes(source, charset));
  }

  public static byte[] decode(byte[] in)
  {
    if (ArrayUtil.isEmpty(in)) {
      return in;
    }
    return decode(in, 0, in.length);
  }

  public static byte[] decode(byte[] in, int pos, int length)
  {
    if (ArrayUtil.isEmpty(in)) {
      return in;
    }

    IntWrapper offset = new IntWrapper(pos);

    int maxPos = pos + length - 1;
    int octetId = 0;
    byte[] octet = new byte[length * 3 / 4];
    while (offset.value <= maxPos) {
      byte sestet0 = getNextValidDecodeByte(in, offset, maxPos);
      byte sestet1 = getNextValidDecodeByte(in, offset, maxPos);
      byte sestet2 = getNextValidDecodeByte(in, offset, maxPos);
      byte sestet3 = getNextValidDecodeByte(in, offset, maxPos);

      if (-2 != sestet1) {
        octet[(octetId++)] = (byte)(sestet0 << 2 | sestet1 >>> 4);
      }
      if (-2 != sestet2) {
        octet[(octetId++)] = (byte)((sestet1 & 0xF) << 4 | sestet2 >>> 2);
      }
      if (-2 != sestet3) {
        octet[(octetId++)] = (byte)((sestet2 & 0x3) << 6 | sestet3);
      }
    }

    if (octetId == octet.length) {
      return octet;
    }

    return (byte[])(byte[])ArrayUtil.copy(octet, new byte[octetId], octetId);
  }

  private static byte getNextValidDecodeByte(byte[] in, IntWrapper pos, int maxPos)
  {
    while (pos.value <= maxPos) {
      byte base64Byte = in[(pos.value++)];
      if (base64Byte > -1) {
        byte decodeByte = DECODE_TABLE[base64Byte];
        if (decodeByte > -1) {
          return decodeByte;
        }
      }
    }

    return -2;
  }

  private static class IntWrapper
  {
    int value;

    IntWrapper(int value)
    {
      this.value = value;
    }
  }
}