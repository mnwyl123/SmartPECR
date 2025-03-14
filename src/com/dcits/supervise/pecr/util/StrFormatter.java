package com.dcits.supervise.pecr.util;

public class StrFormatter
{
  public static String format(String strPattern, Object[] argArray)
  {
    if ((StrUtil.isBlank(strPattern)) || (ArrayUtil.isEmpty(argArray))) {
      return strPattern;
    }
    int strPatternLength = strPattern.length();

    StringBuilder sbuf = new StringBuilder(strPatternLength + 50);

    int handledPosition = 0;

    for (int argIndex = 0; argIndex < argArray.length; argIndex++) {
      int delimIndex = strPattern.indexOf("{}", handledPosition);
      if (delimIndex == -1) {
        if (handledPosition == 0) {
          return strPattern;
        }
        sbuf.append(strPattern, handledPosition, strPatternLength);
        return sbuf.toString();
      }

      if ((delimIndex > 0) && (strPattern.charAt(delimIndex - 1) == '\\')) {
        if ((delimIndex > 1) && (strPattern.charAt(delimIndex - 2) == '\\'))
        {
          sbuf.append(strPattern, handledPosition, delimIndex - 1);
          sbuf.append(StrUtil.utf8Str(argArray[argIndex]));
          handledPosition = delimIndex + 2;
        }
        else {
          argIndex--;
          sbuf.append(strPattern, handledPosition, delimIndex - 1);
          sbuf.append('{');
          handledPosition = delimIndex + 1;
        }
      } else {
        sbuf.append(strPattern, handledPosition, delimIndex);
        sbuf.append(StrUtil.utf8Str(argArray[argIndex]));
        handledPosition = delimIndex + 2;
      }

    }

    sbuf.append(strPattern, handledPosition, strPattern.length());

    return sbuf.toString();
  }
}
