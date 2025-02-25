package com.dcits.supervise.pecr.util;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;

public class Base64
{
  public static byte[] encode(byte[] arr, boolean lineSep)
  {
    return Base64Encoder.encode(arr, lineSep);
  }

  public static byte[] encodeUrlSafe(byte[] arr, boolean lineSep)
  {
    return Base64Encoder.encodeUrlSafe(arr, lineSep);
  }

  public static String encode(String source)
  {
    return Base64Encoder.encode(source);
  }

  public static String encodeUrlSafe(String source)
  {
    return Base64Encoder.encodeUrlSafe(source);
  }

  public static String encode(String source, String charset)
  {
    return Base64Encoder.encode(source, charset);
  }

  public static String encodeUrlSafe(String source, String charset)
  {
    return Base64Encoder.encodeUrlSafe(source, charset);
  }

  public static String encode(String source, Charset charset)
  {
    return Base64Encoder.encode(source, charset);
  }

  public static String encodeUrlSafe(String source, Charset charset)
  {
    return Base64Encoder.encodeUrlSafe(source, charset);
  }

  public static String encode(byte[] source)
  {
    return Base64Encoder.encode(source);
  }

  public static String encodeUrlSafe(byte[] source)
  {
    return Base64Encoder.encodeUrlSafe(source);
  }

//  public static String encode(InputStream in)
//  {
//    return Base64Encoder.encode(IoUtil.readBytes(in));
//  }
//
//  public static String encodeUrlSafe(InputStream in)
//  {
//    return Base64Encoder.encodeUrlSafe(IoUtil.readBytes(in));
//  }
//
/*  public static String encode(File file)
  {
    return Base64Encoder.encode(FileUtil.readBytes(file));
  }*/
//
//  public static String encodeUrlSafe(File file)
//  {
//    return Base64Encoder.encodeUrlSafe(FileUtil.readBytes(file));
//  }

  public static String encode(byte[] source, String charset)
  {
    return Base64Encoder.encode(source, charset);
  }

  public static String encodeUrlSafe(byte[] source, String charset)
  {
    return Base64Encoder.encodeUrlSafe(source, charset);
  }

  public static String encode(byte[] source, Charset charset)
  {
    return Base64Encoder.encode(source, charset);
  }

  public static String encodeUrlSafe(byte[] source, Charset charset)
  {
    return Base64Encoder.encodeUrlSafe(source, charset);
  }

  public static byte[] encode(byte[] arr, boolean isMultiLine, boolean isUrlSafe)
  {
    return Base64Encoder.encode(arr, isMultiLine, isUrlSafe);
  }

  public static String decodeStr(String source)
  {
    return Base64Decoder.decodeStr(source);
  }

  public static String decodeStr(String source, String charset)
  {
    return Base64Decoder.decodeStr(source, charset);
  }

  public static String decodeStr(String source, Charset charset)
  {
    return Base64Decoder.decodeStr(source, charset);
  }

//  public static File decodeToFile(String base64, File destFile)
//  {
//    return FileUtil.writeBytes(Base64Decoder.decode(base64), destFile);
//  }
//
//  public static void decodeToStream(String base64, OutputStream out, boolean isCloseOut)
//  {
//    IoUtil.write(out, isCloseOut, Base64Decoder.decode(base64));
//  }

  public static byte[] decode(String base64)
  {
    return Base64Decoder.decode(base64);
  }

  public static byte[] decode(String source, String charset)
  {
    return Base64Decoder.decode(source, charset);
  }

  public static byte[] decode(String source, Charset charset)
  {
    return Base64Decoder.decode(source, charset);
  }

  public static byte[] decode(byte[] in)
  {
    return Base64Decoder.decode(in);
  }
}
