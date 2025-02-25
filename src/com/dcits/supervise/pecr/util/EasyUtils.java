package com.dcits.supervise.pecr.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

/**
 * 工具类
 * @author munan
 *
 */
public class EasyUtils
{
  public static String format(CharSequence template, Map<?, ?> map, String startMark, String endMark)
  {
    return _format(template, map, startMark, endMark);
  }

  public static String format(CharSequence template, Map<?, ?> map, String mark)
  {
    return _format(template, map, mark, mark);
  }

  public static String format(CharSequence template, Map<?, ?> map)
  {
    String defMark = "#";
    return _format(template, map, defMark, defMark);
  }

  private static String _format(CharSequence template, Map<?, ?> map, String startMark, String endMark)
  {
    if (null == template)
      return "Error:template is null";
    if ((null != map) && (!map.isEmpty())) {
      String template2 = template.toString();
      for (Iterator localIterator = map.entrySet().iterator(); localIterator.hasNext(); ) { Object o = localIterator.next();
        Map.Entry entry = (Map.Entry)o;
        if ((entry.getKey() != null) && (entry.getValue() != null)) {
          template2 = template2.replace(startMark + entry.getKey() + endMark, entry.getValue().toString());
        }
      }
      return template2;
    }
    return template.toString();
  }

  public static byte[] subBytes(byte[] src, int begin, int count)
  {
    byte[] newByte = new byte[count];
    try {
      System.arraycopy(src, begin, newByte, 0, count);
    } catch (ArrayIndexOutOfBoundsException e) {
      newByte = new byte[0];
    }
    return newByte;
  }

  public static String stringToAscii(String value)
  {
    StringBuffer sbu = new StringBuffer();
    char[] chars = value.toCharArray();
    for (int i = 0; i < chars.length; i++) {
      if (i != chars.length - 1)
        sbu.append(chars[i]).append(",");
      else {
        sbu.append(chars[i]);
      }
    }
    return sbu.toString();
  }

  public static String asciiToString(String value)
  {
    StringBuffer sbu = new StringBuffer();
    String[] chars = value.split(",");
    for (int i = 0; i < chars.length; i++) {
      sbu.append((char)Integer.parseInt(chars[i]));
    }
    return sbu.toString();
  }

  public static void runbat(String batPath, String[] params)
  {
    try
    {
      String cmd = "cmd /c start /b " + batPath + " ";
      if ((params != null) && (params.length > 0)) {
        for (String param : params) {
          cmd = cmd + param + " ";
        }
      }
      Process ps = Runtime.getRuntime().exec(cmd);
      ps.waitFor();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static List<File> getFiles(String filePath)
  {
    List fileList = new ArrayList();
    File root = new File(filePath);
    if (!root.exists()) {
      throw new NullPointerException("目录不存在：" + filePath);
    }
    File[] files = root.listFiles();
    for (File file : files) {
      fileList.add(file);
    }

    return fileList;
  }

  public static ResponseEntity outPutFile(String path, String fileName)
    throws Exception
  {
    File file = new File(path.trim());
    if (!file.exists()) {
      throw new Exception("文件不存在");
    }
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
    headers.setContentDispositionFormData("attachment", fileName);
    return new ResponseEntity(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
  }
}