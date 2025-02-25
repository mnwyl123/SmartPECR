package com.dcits.supervise.pecr.util;

import java.io.StringReader;
import java.io.StringWriter;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;



public class StrUtil
{
  public static final int INDEX_NOT_FOUND = -1;
  public static final char C_SPACE = ' ';
  public static final char C_TAB = '\t';
  public static final char C_DOT = '.';
  public static final char C_SLASH = '/';
  public static final char C_BACKSLASH = '\\';
  public static final char C_CR = '\r';
  public static final char C_LF = '\n';
  public static final char C_UNDERLINE = '_';
  public static final char C_COMMA = ',';
  public static final char C_DELIM_START = '{';
  public static final char C_DELIM_END = '}';
  public static final char C_BRACKET_START = '[';
  public static final char C_BRACKET_END = ']';
  public static final char C_COLON = ':';
  public static final String SPACE = " ";
  public static final String TAB = "\t";
  public static final String DOT = ".";
  public static final String DOUBLE_DOT = "..";
  public static final String SLASH = "/";
  public static final String BACKSLASH = "\\";
  public static final String EMPTY = "";
  public static final String CR = "\r";
  public static final String LF = "\n";
  public static final String CRLF = "\r\n";
  public static final String UNDERLINE = "_";
  public static final String DASHED = "-";
  public static final String COMMA = ",";
  public static final String DELIM_START = "{";
  public static final String DELIM_END = "}";
  public static final String BRACKET_START = "[";
  public static final String BRACKET_END = "]";
  public static final String COLON = ":";
  public static final String HTML_NBSP = "&nbsp;";
  public static final String HTML_AMP = "&amp;";
  public static final String HTML_QUOTE = "&quot;";
  public static final String HTML_APOS = "&apos;";
  public static final String HTML_LT = "&lt;";
  public static final String HTML_GT = "&gt;";
  public static final String EMPTY_JSON = "{}";

  public static boolean isBlank(CharSequence str)
  {
    int length;
    if ((str == null) || ((length = str.length()) == 0))
      return true;
    for (int i = 0; i < length; i++)
    {
      if (false == CharUtil.isBlankChar(str.charAt(i))) {
        return false;
      }
    }

    return true;
  }

  public static boolean isBlankIfStr(Object obj)
  {
    if (null == obj)
      return true;
    if ((obj instanceof CharSequence)) {
      return isBlank((CharSequence)obj);
    }
    return false;
  }

  public static boolean isNotBlank(CharSequence str)
  {
    return false == isBlank(str);
  }

  public static boolean hasBlank(CharSequence[] strs)
  {
    if (ArrayUtil.isEmpty(strs)) {
      return true;
    }

    for (CharSequence str : strs) {
      if (isBlank(str)) {
        return true;
      }
    }
    return false;
  }

  public static boolean isAllBlank(CharSequence[] strs)
  {
    if (ArrayUtil.isEmpty(strs)) {
      return true;
    }

    for (CharSequence str : strs) {
      if (isNotBlank(str)) {
        return false;
      }
    }
    return true;
  }

  public static boolean isEmpty(CharSequence str)
  {
    return (str == null) || (str.length() == 0);
  }

  public static boolean isEmptyIfStr(Object obj)
  {
    if (null == obj)
      return true;
    if ((obj instanceof CharSequence)) {
      return 0 == ((CharSequence)obj).length();
    }
    return false;
  }

  public static boolean isNotEmpty(CharSequence str)
  {
    return false == isEmpty(str);
  }

  public static String nullToEmpty(CharSequence str)
  {
    return nullToDefault(str, "");
  }

  public static String nullToDefault(CharSequence str, String defaultStr)
  {
    return str == null ? defaultStr : str.toString();
  }

  public static String emptyToDefault(CharSequence str, String defaultStr)
  {
    return isEmpty(str) ? defaultStr : str.toString();
  }

  public static String blankToDefault(CharSequence str, String defaultStr)
  {
    return isBlank(str) ? defaultStr : str.toString();
  }

  public static String emptyToNull(CharSequence str)
  {
    return isEmpty(str) ? null : str.toString();
  }

  public static boolean hasEmpty(CharSequence[] strs)
  {
    if (ArrayUtil.isEmpty(strs)) {
      return true;
    }

    for (CharSequence str : strs) {
      if (isEmpty(str)) {
        return true;
      }
    }
    return false;
  }

  public static boolean isAllEmpty(CharSequence[] strs)
  {
    if (ArrayUtil.isEmpty(strs)) {
      return true;
    }

    for (CharSequence str : strs) {
      if (isNotEmpty(str)) {
        return false;
      }
    }
    return true;
  }

  public static boolean isNullOrUndefined(CharSequence str)
  {
    if (null == str) {
      return true;
    }
    return isNullOrUndefinedStr(str);
  }

  public static boolean isEmptyOrUndefined(CharSequence str)
  {
    if (isEmpty(str)) {
      return true;
    }
    return isNullOrUndefinedStr(str);
  }

  public static boolean isBlankOrUndefined(CharSequence str)
  {
    if (isBlank(str)) {
      return true;
    }
    return isNullOrUndefinedStr(str);
  }

  private static boolean isNullOrUndefinedStr(CharSequence str)
  {
    String strString = str.toString().trim();
    return ("null".equals(strString)) || ("undefined".equals(strString));
  }

  public static String trim(CharSequence str)
  {
    return null == str ? null : trim(str, 0);
  }

  public static void trim(String[] strs)
  {
    if (null == strs) {
      return;
    }

    for (int i = 0; i < strs.length; i++) {
      String str = strs[i];
      if (null != str)
        strs[i] = str.trim();
    }
  }

  public static String trimToEmpty(CharSequence str)
  {
    return str == null ? "" : trim(str);
  }

  public static String trimToNull(CharSequence str)
  {
    String trimStr = trim(str);
    return "".equals(trimStr) ? null : trimStr;
  }

  public static String trimStart(CharSequence str)
  {
    return trim(str, -1);
  }

  public static String trimEnd(CharSequence str)
  {
    return trim(str, 1);
  }

  public static String trim(CharSequence str, int mode)
  {
    if (str == null) {
      return null;
    }

    int length = str.length();
    int start = 0;
    int end = length;

    if (mode <= 0) {
      while ((start < end) && (CharUtil.isBlankChar(str.charAt(start)))) {
        start++;
      }

    }

    if (mode >= 0) {
      while ((start < end) && (CharUtil.isBlankChar(str.charAt(end - 1)))) {
        end--;
      }
    }

    if ((start > 0) || (end < length)) {
      return str.toString().substring(start, end);
    }

    return str.toString();
  }

  public static boolean startWith(CharSequence str, char c)
  {
    return c == str.charAt(0);
  }

  public static boolean startWith(CharSequence str, CharSequence prefix, boolean isIgnoreCase)
  {
    if ((null == str) || (null == prefix))
    {
      return (null == str) && (null == prefix);
    }

    if (isIgnoreCase) {
      return str.toString().toLowerCase().startsWith(prefix.toString().toLowerCase());
    }
    return str.toString().startsWith(prefix.toString());
  }

  public static boolean startWith(CharSequence str, CharSequence prefix)
  {
    return startWith(str, prefix, false);
  }

  public static boolean startWithIgnoreCase(CharSequence str, CharSequence prefix)
  {
    return startWith(str, prefix, true);
  }

  public static boolean startWithAny(CharSequence str, CharSequence[] prefixes)
  {
    if ((isEmpty(str)) || (ArrayUtil.isEmpty(prefixes))) {
      return false;
    }

    for (CharSequence suffix : prefixes) {
      if (startWith(str, suffix, false)) {
        return true;
      }
    }
    return false;
  }

  public static boolean endWith(CharSequence str, char c)
  {
    return c == str.charAt(str.length() - 1);
  }

  public static boolean endWith(CharSequence str, CharSequence suffix, boolean isIgnoreCase)
  {
    if ((null == str) || (null == suffix))
    {
      return (null == str) && (null == suffix);
    }

    if (isIgnoreCase) {
      return str.toString().toLowerCase().endsWith(suffix.toString().toLowerCase());
    }
    return str.toString().endsWith(suffix.toString());
  }

  public static boolean endWith(CharSequence str, CharSequence suffix)
  {
    return endWith(str, suffix, false);
  }

  public static boolean endWithIgnoreCase(CharSequence str, CharSequence suffix)
  {
    return endWith(str, suffix, true);
  }

  public static boolean endWithAny(CharSequence str, CharSequence[] suffixes)
  {
    if ((isEmpty(str)) || (ArrayUtil.isEmpty(suffixes))) {
      return false;
    }

    for (CharSequence suffix : suffixes) {
      if (endWith(str, suffix, false)) {
        return true;
      }
    }
    return false;
  }

  public static boolean contains(CharSequence str, char searchChar)
  {
    return indexOf(str, searchChar) > -1;
  }

  public static boolean containsAny(CharSequence str, CharSequence[] testStrs)
  {
    return null != getContainsStr(str, testStrs);
  }

  public static boolean containsAny(CharSequence str, char[] testChars)
  {
    if (false == isEmpty(str)) {
      int len = str.length();
      for (int i = 0; i < len; i++) {
        if (ArrayUtil.contains(testChars, str.charAt(i))) {
          return true;
        }
      }
    }
    return false;
  }

  public static boolean containsBlank(CharSequence str)
  {
    if (null == str) {
      return false;
    }
    int length = str.length();
    if (0 == length) {
      return false;
    }

    for (int i = 0; i < length; i++) {
      if (CharUtil.isBlankChar(str.charAt(i))) {
        return true;
      }
    }
    return false;
  }

  public static String getContainsStr(CharSequence str, CharSequence[] testStrs)
  {
    if ((isEmpty(str)) || (ArrayUtil.isEmpty(testStrs))) {
      return null;
    }
    for (CharSequence checkStr : testStrs) {
      if (str.toString().contains(checkStr)) {
        return checkStr.toString();
      }
    }
    return null;
  }

  public static boolean containsIgnoreCase(CharSequence str, CharSequence testStr)
  {
    if (null == str)
    {
      return null == testStr;
    }
    return str.toString().toLowerCase().contains(testStr.toString().toLowerCase());
  }

  public static boolean containsAnyIgnoreCase(CharSequence str, CharSequence[] testStrs)
  {
    return null != getContainsStrIgnoreCase(str, testStrs);
  }

  public static String getContainsStrIgnoreCase(CharSequence str, CharSequence[] testStrs)
  {
    if ((isEmpty(str)) || (ArrayUtil.isEmpty(testStrs))) {
      return null;
    }
    for (CharSequence testStr : testStrs) {
      if (containsIgnoreCase(str, testStr)) {
        return testStr.toString();
      }
    }
    return null;
  }

  public static String getGeneralField(CharSequence getOrSetMethodName)
  {
    String getOrSetMethodNameStr = getOrSetMethodName.toString();
    if ((getOrSetMethodNameStr.startsWith("get")) || (getOrSetMethodNameStr.startsWith("set"))) {
      return removePreAndLowerFirst(getOrSetMethodName, 3);
    }
    return null;
  }

  public static String genSetter(CharSequence fieldName)
  {
    return upperFirstAndAddPre(fieldName, "set");
  }

  public static String genGetter(CharSequence fieldName)
  {
    return upperFirstAndAddPre(fieldName, "get");
  }

  public static String removeAll(CharSequence str, CharSequence strToRemove)
  {
    if (isEmpty(str)) {
      return str(str);
    }
    return str.toString().replace(strToRemove, "");
  }

  public static String removePreAndLowerFirst(CharSequence str, int preLength)
  {
    if (str == null) {
      return null;
    }
    if (str.length() > preLength) {
      char first = Character.toLowerCase(str.charAt(preLength));
      if (str.length() > preLength + 1) {
        return new StringBuilder().append(first).append(str.toString().substring(preLength + 1)).toString();
      }
      return String.valueOf(first);
    }
    return str.toString();
  }

  public static String removePreAndLowerFirst(CharSequence str, CharSequence prefix)
  {
    return lowerFirst(removePrefix(str, prefix));
  }

  public static String upperFirstAndAddPre(CharSequence str, String preString)
  {
    if ((str == null) || (preString == null)) {
      return null;
    }
    return new StringBuilder().append(preString).append(upperFirst(str)).toString();
  }

  public static String upperFirst(CharSequence str)
  {
    if (null == str) {
      return null;
    }
    if (str.length() > 0) {
      char firstChar = str.charAt(0);
      if (Character.isLowerCase(firstChar)) {
        return new StringBuilder().append(Character.toUpperCase(firstChar)).append(subSuf(str, 1)).toString();
      }
    }
    return str.toString();
  }

  public static String lowerFirst(CharSequence str)
  {
    if (null == str) {
      return null;
    }
    if (str.length() > 0) {
      char firstChar = str.charAt(0);
      if (Character.isUpperCase(firstChar)) {
        return new StringBuilder().append(Character.toLowerCase(firstChar)).append(subSuf(str, 1)).toString();
      }
    }
    return str.toString();
  }

  public static String removePrefix(CharSequence str, CharSequence prefix)
  {
    if ((isEmpty(str)) || (isEmpty(prefix))) {
      return str(str);
    }

    String str2 = str.toString();
    if (str2.startsWith(prefix.toString())) {
      return subSuf(str2, prefix.length());
    }
    return str2;
  }

  public static String removePrefixIgnoreCase(CharSequence str, CharSequence prefix)
  {
    if ((isEmpty(str)) || (isEmpty(prefix))) {
      return str(str);
    }

    String str2 = str.toString();
    if (str2.toLowerCase().startsWith(prefix.toString().toLowerCase())) {
      return subSuf(str2, prefix.length());
    }
    return str2;
  }

  public static String removeSuffix(CharSequence str, CharSequence suffix)
  {
    if ((isEmpty(str)) || (isEmpty(suffix))) {
      return str(str);
    }

    String str2 = str.toString();
    if (str2.endsWith(suffix.toString())) {
      return subPre(str2, str2.length() - suffix.length());
    }
    return str2;
  }

  public static String removeSufAndLowerFirst(CharSequence str, CharSequence suffix)
  {
    return lowerFirst(removeSuffix(str, suffix));
  }

  public static String removeSuffixIgnoreCase(CharSequence str, CharSequence suffix)
  {
    if ((isEmpty(str)) || (isEmpty(suffix))) {
      return str(str);
    }

    String str2 = str.toString();
    if (str2.toLowerCase().endsWith(suffix.toString().toLowerCase())) {
      return subPre(str2, str2.length() - suffix.length());
    }
    return str2;
  }

  public static String strip(CharSequence str, CharSequence prefixOrSuffix)
  {
    return strip(str, prefixOrSuffix, prefixOrSuffix);
  }

  public static String strip(CharSequence str, CharSequence prefix, CharSequence suffix)
  {
    if (isEmpty(str)) {
      return str(str);
    }
    int from = 0;
    int to = str.length();

    String str2 = str.toString();
    if (startWith(str2, prefix)) {
      from = prefix.length();
    }
    if (endWith(str2, suffix)) {
      to -= suffix.length();
    }
    return str2.substring(from, to);
  }

  public static String stripIgnoreCase(CharSequence str, CharSequence prefixOrSuffix)
  {
    return stripIgnoreCase(str, prefixOrSuffix, prefixOrSuffix);
  }

  public static String stripIgnoreCase(CharSequence str, CharSequence prefix, CharSequence suffix)
  {
    if (isEmpty(str)) {
      return str(str);
    }
    int from = 0;
    int to = str.length();

    String str2 = str.toString();
    if (startWithIgnoreCase(str2, prefix)) {
      from = prefix.length();
    }
    if (endWithIgnoreCase(str2, suffix)) {
      to -= suffix.length();
    }
    return str2.substring(from, to);
  }

  public static String addPrefixIfNot(CharSequence str, CharSequence prefix)
  {
    if ((isEmpty(str)) || (isEmpty(prefix))) {
      return str(str);
    }

    String str2 = str.toString();
    String prefix2 = prefix.toString();
    if (false == str2.startsWith(prefix2)) {
      return prefix2.concat(str2);
    }
    return str2;
  }

  public static String addSuffixIfNot(CharSequence str, CharSequence suffix)
  {
    if ((isEmpty(str)) || (isEmpty(suffix))) {
      return str(str);
    }

    String str2 = str.toString();
    String suffix2 = suffix.toString();
    if (false == str2.endsWith(suffix2)) {
      return str2.concat(suffix2);
    }
    return str2;
  }

  public static String cleanBlank(CharSequence str)
  {
    if (str == null) {
      return null;
    }

    int len = str.length();
    StringBuilder sb = new StringBuilder(len);

    for (int i = 0; i < len; i++) {
      char c = str.charAt(i);
      if (false == CharUtil.isBlankChar(c)) {
        sb.append(c);
      }
    }
    return sb.toString();
  }



 

  public static String sub(CharSequence str, int fromIndex, int toIndex)
  {
    if (isEmpty(str)) {
      return str(str);
    }
    int len = str.length();

    if (fromIndex < 0) {
      fromIndex = len + fromIndex;
      if (fromIndex < 0)
        fromIndex = 0;
    }
    else if (fromIndex > len) {
      fromIndex = len;
    }

    if (toIndex < 0) {
      toIndex = len + toIndex;
      if (toIndex < 0)
        toIndex = len;
    }
    else if (toIndex > len) {
      toIndex = len;
    }

    if (toIndex < fromIndex) {
      int tmp = fromIndex;
      fromIndex = toIndex;
      toIndex = tmp;
    }

    if (fromIndex == toIndex) {
      return "";
    }

    return str.toString().substring(fromIndex, toIndex);
  }

  public static String subPre(CharSequence string, int toIndex)
  {
    return sub(string, 0, toIndex);
  }

  public static String subSuf(CharSequence string, int fromIndex)
  {
    if (isEmpty(string)) {
      return null;
    }
    return sub(string, fromIndex, string.length());
  }

  public static String subSufByLength(CharSequence string, int length)
  {
    if (isEmpty(string)) {
      return null;
    }
    if (length <= 0) {
      return "";
    }
    return sub(string, -length, string.length());
  }

  public static String subWithLength(String input, int fromIndex, int length)
  {
    return sub(input, fromIndex, fromIndex + length);
  }

  public static String subBefore(CharSequence string, CharSequence separator, boolean isLastSeparator)
  {
    if ((isEmpty(string)) || (separator == null)) {
      return null == string ? null : string.toString();
    }

    String str = string.toString();
    String sep = separator.toString();
    if (sep.isEmpty()) {
      return "";
    }
    int pos = isLastSeparator ? str.lastIndexOf(sep) : str.indexOf(sep);
    if (-1 == pos) {
      return str;
    }
    if (0 == pos) {
      return "";
    }
    return str.substring(0, pos);
  }

  public static String subBefore(CharSequence string, char separator, boolean isLastSeparator)
  {
    if (isEmpty(string)) {
      return null == string ? null : string.toString();
    }

    String str = string.toString();
    int pos = isLastSeparator ? str.lastIndexOf(separator) : str.indexOf(separator);
    if (-1 == pos) {
      return str;
    }
    if (0 == pos) {
      return "";
    }
    return str.substring(0, pos);
  }

  public static String subAfter(CharSequence string, CharSequence separator, boolean isLastSeparator)
  {
    if (isEmpty(string)) {
      return null == string ? null : string.toString();
    }
    if (separator == null) {
      return "";
    }
    String str = string.toString();
    String sep = separator.toString();
    int pos = isLastSeparator ? str.lastIndexOf(sep) : str.indexOf(sep);
    if ((-1 == pos) || (string.length() - 1 == pos)) {
      return "";
    }
    return str.substring(pos + separator.length());
  }

  public static String subAfter(CharSequence string, char separator, boolean isLastSeparator)
  {
    if (isEmpty(string)) {
      return null == string ? null : string.toString();
    }
    String str = string.toString();
    int pos = isLastSeparator ? str.lastIndexOf(separator) : str.indexOf(separator);
    if (-1 == pos) {
      return "";
    }
    return str.substring(pos + 1);
  }

  public static String subBetween(CharSequence str, CharSequence before, CharSequence after)
  {
    if ((str == null) || (before == null) || (after == null)) {
      return null;
    }

    String str2 = str.toString();
    String before2 = before.toString();
    String after2 = after.toString();

    int start = str2.indexOf(before2);
    if (start != -1) {
      int end = str2.indexOf(after2, start + before2.length());
      if (end != -1) {
        return str2.substring(start + before2.length(), end);
      }
    }
    return null;
  }

  public static String subBetween(CharSequence str, CharSequence beforeAndAfter)
  {
    return subBetween(str, beforeAndAfter, beforeAndAfter);
  }

  public static boolean isSurround(CharSequence str, CharSequence prefix, CharSequence suffix)
  {
    if (isBlank(str)) {
      return false;
    }
    if (str.length() < prefix.length() + suffix.length()) {
      return false;
    }

    String str2 = str.toString();
    return (str2.startsWith(prefix.toString())) && (str2.endsWith(suffix.toString()));
  }

  public static boolean isSurround(CharSequence str, char prefix, char suffix)
  {
    if (isBlank(str)) {
      return false;
    }
    if (str.length() < 2) {
      return false;
    }

    return (str.charAt(0) == prefix) && (str.charAt(str.length() - 1) == suffix);
  }

  public static String repeat(char c, int count)
  {
    if (count <= 0) {
      return "";
    }

    char[] result = new char[count];
    for (int i = 0; i < count; i++) {
      result[i] = c;
    }
    return new String(result);
  }

  public static String join(CharSequence conjunction, Object[] objs)
  {
    return ArrayUtil.join(objs, conjunction);
  }

  public static String toUnderlineCase(CharSequence str)
  {
    return toSymbolCase(str, '_');
  }

  public static String toSymbolCase(CharSequence str, char symbol)
  {
    if (str == null) {
      return null;
    }

    int length = str.length();
    StringBuilder sb = new StringBuilder();

    for (int i = 0; i < length; i++) {
      char c = str.charAt(i);
      Character preChar = i > 0 ? Character.valueOf(str.charAt(i - 1)) : null;
      if (Character.isUpperCase(c))
      {
        Character nextChar = i < str.length() - 1 ? Character.valueOf(str.charAt(i + 1)) : null;
        if ((null != preChar) && (Character.isUpperCase(preChar.charValue())))
        {
          sb.append(c);
        } else if ((null != nextChar) && (Character.isUpperCase(nextChar.charValue())))
        {
          if ((null != preChar) && (symbol != preChar.charValue()))
          {
            sb.append(symbol);
          }
          sb.append(c);
        }
        else {
          if ((null != preChar) && (symbol != preChar.charValue()))
          {
            sb.append(symbol);
          }
          sb.append(Character.toLowerCase(c));
        }
      } else {
        if ((sb.length() > 0) && (Character.isUpperCase(sb.charAt(sb.length() - 1))) && (symbol != c))
        {
          sb.append(symbol);
        }

        sb.append(c);
      }
    }
    return sb.toString();
  }

  public static String toCamelCase(CharSequence name)
  {
    if (null == name) {
      return null;
    }

    String name2 = name.toString();
    if (name2.contains("_")) {
      StringBuilder sb = new StringBuilder(name2.length());
      boolean upperCase = false;
      for (int i = 0; i < name2.length(); i++) {
        char c = name2.charAt(i);

        if (c == '_') {
          upperCase = true;
        } else if (upperCase) {
          sb.append(Character.toUpperCase(c));
          upperCase = false;
        } else {
          sb.append(Character.toLowerCase(c));
        }
      }
      return sb.toString();
    }
    return name2;
  }

  public static String wrap(CharSequence str, CharSequence prefixAndSuffix)
  {
    return wrap(str, prefixAndSuffix, prefixAndSuffix);
  }

  public static String wrap(CharSequence str, CharSequence prefix, CharSequence suffix)
  {
    return nullToEmpty(prefix).concat(nullToEmpty(str)).concat(nullToEmpty(suffix));
  }

  public static String[] wrapAll(CharSequence prefixAndSuffix, CharSequence[] strs)
  {
    return wrapAll(prefixAndSuffix, prefixAndSuffix, strs);
  }

  public static String[] wrapAll(CharSequence prefix, CharSequence suffix, CharSequence[] strs)
  {
    String[] results = new String[strs.length];
    for (int i = 0; i < strs.length; i++) {
      results[i] = wrap(strs[i], prefix, suffix);
    }
    return results;
  }

  public static String wrapIfMissing(CharSequence str, CharSequence prefix, CharSequence suffix)
  {
    int len = 0;
    if (isNotEmpty(str)) {
      len += str.length();
    }
    if (isNotEmpty(prefix)) {
      len += str.length();
    }
    if (isNotEmpty(suffix)) {
      len += str.length();
    }
    StringBuilder sb = new StringBuilder(len);
    if ((isNotEmpty(prefix)) && (false == startWith(str, prefix))) {
      sb.append(prefix);
    }
    if (isNotEmpty(str)) {
      sb.append(str);
    }
    if ((isNotEmpty(suffix)) && (false == endWith(str, suffix))) {
      sb.append(suffix);
    }
    return sb.toString();
  }

  public static String[] wrapAllIfMissing(CharSequence prefixAndSuffix, CharSequence[] strs)
  {
    return wrapAllIfMissing(prefixAndSuffix, prefixAndSuffix, strs);
  }

  public static String[] wrapAllIfMissing(CharSequence prefix, CharSequence suffix, CharSequence[] strs)
  {
    String[] results = new String[strs.length];
    for (int i = 0; i < strs.length; i++) {
      results[i] = wrapIfMissing(strs[i], prefix, suffix);
    }
    return results;
  }

  public static String unWrap(CharSequence str, String prefix, String suffix)
  {
    if (isWrap(str, prefix, suffix)) {
      return sub(str, prefix.length(), str.length() - suffix.length());
    }
    return str.toString();
  }

  public static String unWrap(CharSequence str, char prefix, char suffix)
  {
    if (isEmpty(str)) {
      return str(str);
    }
    if ((str.charAt(0) == prefix) && (str.charAt(str.length() - 1) == suffix)) {
      return sub(str, 1, str.length() - 1);
    }
    return str.toString();
  }

  public static String unWrap(CharSequence str, char prefixAndSuffix)
  {
    return unWrap(str, prefixAndSuffix, prefixAndSuffix);
  }

  public static boolean isWrap(CharSequence str, String prefix, String suffix)
  {
    if (ArrayUtil.hasNull(new CharSequence[] { str, prefix, suffix })) {
      return false;
    }
    String str2 = str.toString();
    return (str2.startsWith(prefix)) && (str2.endsWith(suffix));
  }

  public static boolean isWrap(CharSequence str, String wrapper)
  {
    return isWrap(str, wrapper, wrapper);
  }

  public static boolean isWrap(CharSequence str, char wrapper)
  {
    return isWrap(str, wrapper, wrapper);
  }

  public static boolean isWrap(CharSequence str, char prefixChar, char suffixChar)
  {
    if (null == str) {
      return false;
    }

    return (str.charAt(0) == prefixChar) && (str.charAt(str.length() - 1) == suffixChar);
  }

  public static String padPre(CharSequence str, int minLength, char padChar)
  {
    if (null == str)
      str = "";
    else if (str.length() >= minLength) {
      return str.toString();
    }

    return repeat(padChar, minLength - str.length()).concat(str.toString());
  }

  public static String padEnd(CharSequence str, int minLength, char padChar)
  {
    if (null == str)
      str = "";
    else if (str.length() >= minLength) {
      return str.toString();
    }

    return str.toString().concat(repeat(padChar, minLength - str.length()));
  }

  public static StringBuilder builder()
  {
    return new StringBuilder();
  }

  public static StrBuilder strBuilder()
  {
    return StrBuilder.create();
  }

  public static StringBuilder builder(int capacity)
  {
    return new StringBuilder(capacity);
  }

  public static StrBuilder strBuilder(int capacity)
  {
    return StrBuilder.create(capacity);
  }

  public static StringBuilder builder(CharSequence[] strs)
  {
    StringBuilder sb = new StringBuilder();
    for (CharSequence str : strs) {
      sb.append(str);
    }
    return sb;
  }

  public static StrBuilder strBuilder(CharSequence[] strs)
  {
    return StrBuilder.create(strs);
  }

  public static StringReader getReader(CharSequence str)
  {
    if (null == str) {
      return null;
    }
    return new StringReader(str.toString());
  }

  public static StringWriter getWriter()
  {
    return new StringWriter();
  }

  public static int count(CharSequence content, CharSequence strForSearch)
  {
    if ((hasEmpty(new CharSequence[] { content, strForSearch })) || (strForSearch.length() > content.length())) {
      return 0;
    }

    int count = 0;
    int idx = 0;
    String content2 = content.toString();
    String strForSearch2 = strForSearch.toString();
    while ((idx = content2.indexOf(strForSearch2, idx)) > -1) {
      count++;
      idx += strForSearch.length();
    }
    return count;
  }

  public static int count(CharSequence content, char charForSearch)
  {
    int count = 0;
    if (isEmpty(content)) {
      return 0;
    }
    int contentLength = content.length();
    for (int i = 0; i < contentLength; i++) {
      if (charForSearch == content.charAt(i)) {
        count++;
      }
    }
    return count;
  }

  public static String[] cut(CharSequence str, int partLength)
  {
    if (null == str) {
      return null;
    }
    int len = str.length();
    if (len < partLength) {
      return new String[] { str.toString() };
    }
    int part = NumberUtil.count(len, partLength);
    String[] array = new String[part];

    String str2 = str.toString();
    for (int i = 0; i < part; i++) {
      array[i] = str2.substring(i * partLength, i == part - 1 ? len : partLength + i * partLength);
    }
    return array;
  }

  public static int compare(CharSequence str1, CharSequence str2, boolean nullIsLess)
  {
    if (str1 == str2) {
      return 0;
    }
    if (str1 == null) {
      return nullIsLess ? -1 : 1;
    }
    if (str2 == null) {
      return nullIsLess ? 1 : -1;
    }
    return str1.toString().compareTo(str2.toString());
  }

  public static int compareIgnoreCase(CharSequence str1, CharSequence str2, boolean nullIsLess)
  {
    if (str1 == str2) {
      return 0;
    }
    if (str1 == null) {
      return nullIsLess ? -1 : 1;
    }
    if (str2 == null) {
      return nullIsLess ? 1 : -1;
    }
    return str1.toString().compareToIgnoreCase(str2.toString());
  }


  public static int indexOf(CharSequence str, char searchChar)
  {
    return indexOf(str, searchChar, 0);
  }

  public static int indexOf(CharSequence str, char searchChar, int start)
  {
    if ((str instanceof String)) {
      return ((String)str).indexOf(searchChar, start);
    }
    return indexOf(str, searchChar, start, -1);
  }

  public static int indexOf(CharSequence str, char searchChar, int start, int end)
  {
    int len = str.length();
    if ((start < 0) || (start > len)) {
      start = 0;
    }
    if ((end > len) || (end < 0)) {
      end = len;
    }
    for (int i = start; i < end; i++) {
      if (str.charAt(i) == searchChar) {
        return i;
      }
    }
    return -1;
  }

  public static int indexOfIgnoreCase(CharSequence str, CharSequence searchStr)
  {
    return indexOfIgnoreCase(str, searchStr, 0);
  }

  public static int indexOfIgnoreCase(CharSequence str, CharSequence searchStr, int fromIndex)
  {
    return indexOf(str, searchStr, fromIndex, true);
  }

  public static int indexOf(CharSequence str, CharSequence searchStr, int fromIndex, boolean ignoreCase)
  {
    if ((str == null) || (searchStr == null)) {
      return -1;
    }
    if (fromIndex < 0) {
      fromIndex = 0;
    }

    int endLimit = str.length() - searchStr.length() + 1;
    if (fromIndex > endLimit) {
      return -1;
    }
    if (searchStr.length() == 0) {
      return fromIndex;
    }

    if (false == ignoreCase)
    {
      return str.toString().indexOf(searchStr.toString(), fromIndex);
    }

    for (int i = fromIndex; i < endLimit; i++) {
      if (isSubEquals(str, i, searchStr, 0, searchStr.length(), true)) {
        return i;
      }
    }
    return -1;
  }

  public static int lastIndexOfIgnoreCase(CharSequence str, CharSequence searchStr)
  {
    return lastIndexOfIgnoreCase(str, searchStr, str.length());
  }

  public static int lastIndexOfIgnoreCase(CharSequence str, CharSequence searchStr, int fromIndex)
  {
    return lastIndexOf(str, searchStr, fromIndex, true);
  }

  public static int lastIndexOf(CharSequence str, CharSequence searchStr, int fromIndex, boolean ignoreCase)
  {
    if ((str == null) || (searchStr == null)) {
      return -1;
    }
    if (fromIndex < 0) {
      fromIndex = 0;
    }
    fromIndex = Math.min(fromIndex, str.length());

    if (searchStr.length() == 0) {
      return fromIndex;
    }

    if (false == ignoreCase)
    {
      return str.toString().lastIndexOf(searchStr.toString(), fromIndex);
    }

    for (int i = fromIndex; i > 0; i--) {
      if (isSubEquals(str, i, searchStr, 0, searchStr.length(), true)) {
        return i;
      }
    }
    return -1;
  }

  public static int ordinalIndexOf(String str, String searchStr, int ordinal)
  {
    if ((str == null) || (searchStr == null) || (ordinal <= 0)) {
      return -1;
    }
    if (searchStr.length() == 0) {
      return 0;
    }
    int found = 0;
    int index = -1;
    do {
      index = str.indexOf(searchStr, index + 1);
      if (index < 0) {
        return index;
      }
      found++;
    }while (found < ordinal);
    return index;
  }

  public static String appendIfMissing(CharSequence str, CharSequence suffix, CharSequence[] suffixes)
  {
    return appendIfMissing(str, suffix, false, suffixes);
  }

  public static String appendIfMissingIgnoreCase(CharSequence str, CharSequence suffix, CharSequence[] suffixes)
  {
    return appendIfMissing(str, suffix, true, suffixes);
  }

  public static String appendIfMissing(CharSequence str, CharSequence suffix, boolean ignoreCase, CharSequence[] suffixes)
  {
    if ((str == null) || (isEmpty(suffix)) || (endWith(str, suffix, ignoreCase))) {
      return str(str);
    }
    if ((suffixes != null) && (suffixes.length > 0)) {
      for (CharSequence s : suffixes) {
        if (endWith(str, s, ignoreCase)) {
          return str.toString();
        }
      }
    }
    return str.toString().concat(suffix.toString());
  }

  public static String prependIfMissing(CharSequence str, CharSequence prefix, CharSequence[] prefixes)
  {
    return prependIfMissing(str, prefix, false, prefixes);
  }

  public static String prependIfMissingIgnoreCase(CharSequence str, CharSequence prefix, CharSequence[] prefixes)
  {
    return prependIfMissing(str, prefix, true, prefixes);
  }

  public static String prependIfMissing(CharSequence str, CharSequence prefix, boolean ignoreCase, CharSequence[] prefixes)
  {
    if ((str == null) || (isEmpty(prefix)) || (startWith(str, prefix, ignoreCase))) {
      return str(str);
    }
    if ((prefixes != null) && (prefixes.length > 0)) {
      for (CharSequence s : prefixes) {
        if (startWith(str, s, ignoreCase)) {
          return str.toString();
        }
      }
    }
    return prefix.toString().concat(str.toString());
  }

  public static String reverse(String str)
  {
    return new String(ArrayUtil.reverse(str.toCharArray()));
  }

  public static String fillBefore(String str, char filledChar, int len)
  {
    return fill(str, filledChar, len, true);
  }

  public static String fillAfter(String str, char filledChar, int len)
  {
    return fill(str, filledChar, len, false);
  }

  public static String fill(String str, char filledChar, int len, boolean isPre)
  {
    int strLen = str.length();
    if (strLen > len) {
      return str;
    }

    String filledStr = repeat(filledChar, len - strLen);
    return isPre ? filledStr.concat(str) : str.concat(filledStr);
  }

  public static boolean isSubEquals(CharSequence str1, int start1, CharSequence str2, int start2, int length, boolean ignoreCase)
  {
    if ((null == str1) || (null == str2)) {
      return false;
    }

    return str1.toString().regionMatches(ignoreCase, start1, str2.toString(), start2, length);
  }

  public static String replaceIgnoreCase(CharSequence str, CharSequence searchStr, CharSequence replacement)
  {
    return replace(str, 0, searchStr, replacement, true);
  }

  public static String replace(CharSequence str, CharSequence searchStr, CharSequence replacement)
  {
    return replace(str, 0, searchStr, replacement, false);
  }

  public static String replace(CharSequence str, CharSequence searchStr, CharSequence replacement, boolean ignoreCase)
  {
    return replace(str, 0, searchStr, replacement, ignoreCase);
  }

  public static String replace(CharSequence str, int fromIndex, CharSequence searchStr, CharSequence replacement, boolean ignoreCase)
  {
    if ((isEmpty(str)) || (isEmpty(searchStr))) {
      return str(str);
    }
    if (null == replacement) {
      replacement = "";
    }

    int strLength = str.length();
    int searchStrLength = searchStr.length();
    if (fromIndex > strLength)
      return str(str);
    if (fromIndex < 0) {
      fromIndex = 0;
    }

    StrBuilder result = StrBuilder.create(strLength + 16);
    if (0 != fromIndex) {
      result.append(str.subSequence(0, fromIndex));
    }

    int preIndex = fromIndex;
    int index ;
    while ((index = indexOf(str, searchStr, preIndex, ignoreCase)) > -1) {
      result.append(str.subSequence(preIndex, index));
      result.append(replacement);
      preIndex = index + searchStrLength;
    }

    if (preIndex < strLength)
    {
      result.append(str.subSequence(preIndex, strLength));
    }
    return result.toString();
  }

  public static String replace(CharSequence str, int startInclude, int endExclude, char replacedChar)
  {
    if (isEmpty(str)) {
      return str(str);
    }
    int strLength = str.length();
    if (startInclude > strLength) {
      return str(str);
    }
    if (endExclude > strLength) {
      endExclude = strLength;
    }
    if (startInclude > endExclude)
    {
      return str(str);
    }

    char[] chars = new char[strLength];
    for (int i = 0; i < strLength; i++) {
      if ((i >= startInclude) && (i < endExclude))
        chars[i] = replacedChar;
      else {
        chars[i] = str.charAt(i);
      }
    }
    return new String(chars);
  }

  public static String hide(CharSequence str, int startInclude, int endExclude)
  {
    return replace(str, startInclude, endExclude, '*');
  }

  public static String replaceChars(CharSequence str, String chars, CharSequence replacedStr)
  {
    if ((isEmpty(str)) || (isEmpty(chars))) {
      return str(str);
    }
    return replaceChars(str, chars.toCharArray(), replacedStr);
  }

  public static String replaceChars(CharSequence str, char[] chars, CharSequence replacedStr)
  {
    if ((isEmpty(str)) || (ArrayUtil.isEmpty(chars))) {
      return str(str);
    }

    Set set = new HashSet(chars.length);
    for (char c : chars) {
      set.add(Character.valueOf(c));
    }
    int strLen = str.length();
    StringBuilder builder = builder();

    for (int i = 0; i < strLen; i++) {
      char c = str.charAt(i);
      builder.append(set.contains(Character.valueOf(c)) ? replacedStr : Character.valueOf(c));
    }
    return builder.toString();
  }


  public static boolean equalsCharAt(CharSequence str, int position, char c)
  {
    if ((null == str) || (position < 0)) {
      return false;
    }
    return (str.length() > position) && (c == str.charAt(position));
  }

  public static int totalLength(CharSequence[] strs)
  {
    int totalLength = 0;
    for (int i = 0; i < strs.length; i++) {
      totalLength += (null == strs[i] ? 0 : strs[i].length());
    }
    return totalLength;
  }

  public static String move(CharSequence str, int startInclude, int endExclude, int moveLength)
  {
    if (isEmpty(str)) {
      return str(str);
    }
    int len = str.length();
    if (Math.abs(moveLength) > len)
    {
      moveLength %= len;
    }
    StrBuilder strBuilder = StrBuilder.create(len);
    if (moveLength > 0) {
      int endAfterMove = Math.min(endExclude + moveLength, str.length());
      strBuilder.append(str.subSequence(0, startInclude)).append(str.subSequence(endExclude, endAfterMove)).append(str.subSequence(startInclude, endExclude)).append(str.subSequence(endAfterMove, str.length()));
    }
    else if (moveLength < 0) {
      int startAfterMove = Math.max(startInclude + moveLength, 0);
      strBuilder.append(str.subSequence(0, startAfterMove)).append(str.subSequence(startInclude, endExclude)).append(str.subSequence(startAfterMove, startInclude)).append(str.subSequence(endExclude, str.length()));
    }
    else
    {
      return str(str);
    }
    return strBuilder.toString();
  }

  public static String uuid()
  {
    return IdUtil.randomUUID();
  }

  public static String concat(boolean isNullToEmpty, CharSequence[] strs)
  {
    StrBuilder sb = new StrBuilder();
    for (CharSequence str : strs) {
      sb.append(isNullToEmpty ? nullToEmpty(str) : str);
    }
    return sb.toString();
  }
  
  public static String format(CharSequence template, Object[] params)
  {
    if (null == template) {
      return null;
    }
    if ((ArrayUtil.isEmpty(params)) || (isBlank(template))) {
      return template.toString();
    }
    return StrFormatter.format(template.toString(), params);
  }

  public static String indexedFormat(CharSequence pattern, Object[] arguments)
  {
    return MessageFormat.format(pattern.toString(), arguments);
  }

  public static String format(CharSequence template, Map<?, ?> map) throws Exception
  {
    if (null == template) {
      return null;
    }
    if ((null == map) || (map.isEmpty())) {
      return template.toString();
    }

    String template2 = template.toString();

    for (Map.Entry entry : map.entrySet()) {
      String value = utf8Str(entry.getValue());
      if (null != value) {
        template2 = replace(template2, new StringBuilder().append("{").append(entry.getKey()).append("}").toString(), value);
      }
    }
    return template2;
  }
  public static String utf8Str(Object obj) 
  {
    return str(obj, CharsetUtil.CHARSET_UTF_8);
  }
  public static String str(Object obj, String charsetName) 
  {
    return str(obj, Charset.forName(charsetName));
  }

  public static String str(Object obj, Charset charset) 
  {
    if (null == obj) {
      return null;
    }

    if ((obj instanceof String))
      return (String)obj;
    if ((obj instanceof byte[]))
      return str((byte[])(byte[])obj, charset);
    if ((obj instanceof Byte[]))
      return str((Byte[])(Byte[])obj, charset);
    if ((obj instanceof ByteBuffer))
      return str((ByteBuffer)obj, charset);
    if (ArrayUtil.isArray(obj)) {
      return ArrayUtil.toString(obj);
    }

    return obj.toString();
  }

  public static String str(byte[] bytes, String charset)
  {
    return str(bytes, isBlank(charset) ? Charset.defaultCharset() : Charset.forName(charset));
  }

  public static String str(byte[] data, Charset charset)
  {
    if (data == null) {
      return null;
    }

    if (null == charset) {
      return new String(data);
    }
    return new String(data, charset);
  }

  public static String str(Byte[] bytes, String charset)
  {
    return str(bytes, isBlank(charset) ? Charset.defaultCharset() : Charset.forName(charset));
  }

  public static String str(Byte[] data, Charset charset)
  {
    if (data == null) {
      return null;
    }

    byte[] bytes = new byte[data.length];

    for (int i = 0; i < data.length; i++) {
      Byte dataByte = data[i];
      bytes[i] = (null == dataByte ? -1 : dataByte.byteValue());
    }

    return str(bytes, charset);
  }

  public static String str(ByteBuffer data, String charset)
  {
    if (data == null) {
      return null;
    }

    return str(data, Charset.forName(charset));
  }

  public static String str(ByteBuffer data, Charset charset)
  {
    if (null == charset) {
      charset = Charset.defaultCharset();
    }
    return charset.decode(data).toString();
  }

  public static String str(CharSequence cs)
  {
    return null == cs ? null : cs.toString();
  }

  public static String toString(Object obj)
  {
    return null == obj ? "null" : obj.toString();
  }
  public static byte[] bytes(CharSequence str)
  {
    return bytes(str, Charset.defaultCharset());
  }

  public static byte[] bytes(CharSequence str, String charset)
  {
    return bytes(str, isBlank(charset) ? Charset.defaultCharset() : Charset.forName(charset));
  }

  public static byte[] bytes(CharSequence str, Charset charset)
  {
    if (str == null) {
      return null;
    }

    if (null == charset) {
      return str.toString().getBytes();
    }
    return str.toString().getBytes(charset);
  }
}