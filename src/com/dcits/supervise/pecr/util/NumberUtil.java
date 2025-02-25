package com.dcits.supervise.pecr.util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class NumberUtil
{
  private static final int DEFAUT_DIV_SCALE = 10;

  public static double add(float v1, float v2)
  {
    return add(new String[] { Float.toString(v1), Float.toString(v2) }).doubleValue();
  }

  public static double add(float v1, double v2)
  {
    return add(new String[] { Float.toString(v1), Double.toString(v2) }).doubleValue();
  }

  public static double add(double v1, float v2)
  {
    return add(new String[] { Double.toString(v1), Float.toString(v2) }).doubleValue();
  }

  public static double add(double v1, double v2)
  {
    return add(new String[] { Double.toString(v1), Double.toString(v2) }).doubleValue();
  }

 

  public static BigDecimal add(Number v1, Number v2)
  {
    return add(new Number[] { v1, v2 });
  }

  public static BigDecimal add(Number[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    Number value = values[0];
    BigDecimal result = new BigDecimal(null == value ? "0" : value.toString());
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.add(new BigDecimal(value.toString()));
      }
    }
    return result;
  }

  public static BigDecimal add(String[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    String value = values[0];
    BigDecimal result = new BigDecimal(null == value ? "0" : value);
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.add(new BigDecimal(value));
      }
    }
    return result;
  }

  public static BigDecimal add(BigDecimal[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    BigDecimal value = values[0];
    BigDecimal result = null == value ? BigDecimal.ZERO : value;
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.add(value);
      }
    }
    return result;
  }

  public static double sub(float v1, float v2)
  {
    return sub(new String[] { Float.toString(v1), Float.toString(v2) }).doubleValue();
  }

  public static double sub(float v1, double v2)
  {
    return sub(new String[] { Float.toString(v1), Double.toString(v2) }).doubleValue();
  }

  public static double sub(double v1, float v2)
  {
    return sub(new String[] { Double.toString(v1), Float.toString(v2) }).doubleValue();
  }

  public static double sub(double v1, double v2)
  {
    return sub(new String[] { Double.toString(v1), Double.toString(v2) }).doubleValue();
  }

  

  public static BigDecimal sub(Number v1, Number v2)
  {
    return sub(new Number[] { v1, v2 });
  }

  public static BigDecimal sub(Number[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    Number value = values[0];
    BigDecimal result = new BigDecimal(null == value ? "0" : value.toString());
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.subtract(new BigDecimal(value.toString()));
      }
    }
    return result;
  }

  public static BigDecimal sub(String[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    String value = values[0];
    BigDecimal result = new BigDecimal(null == value ? "0" : value);
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.subtract(new BigDecimal(value));
      }
    }
    return result;
  }

  public static BigDecimal sub(BigDecimal[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    BigDecimal value = values[0];
    BigDecimal result = null == value ? BigDecimal.ZERO : value;
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.subtract(value);
      }
    }
    return result;
  }

  public static double mul(float v1, float v2)
  {
    return mul(Float.toString(v1), Float.toString(v2)).doubleValue();
  }

  public static double mul(float v1, double v2)
  {
    return mul(Float.toString(v1), Double.toString(v2)).doubleValue();
  }

  public static double mul(double v1, float v2)
  {
    return mul(Double.toString(v1), Float.toString(v2)).doubleValue();
  }

  public static double mul(double v1, double v2)
  {
    return mul(Double.toString(v1), Double.toString(v2)).doubleValue();
  }


  public static BigDecimal mul(Number v1, Number v2)
  {
    return mul(new Number[] { v1, v2 });
  }

  public static BigDecimal mul(Number[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    Number value = values[0];
    BigDecimal result = new BigDecimal(null == value ? "0" : value.toString());
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.multiply(new BigDecimal(value.toString()));
      }
    }
    return result;
  }

  public static BigDecimal mul(String v1, String v2)
  {
    return mul(new BigDecimal(v1), new BigDecimal(v2));
  }

  public static BigDecimal mul(String[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    String value = values[0];
    BigDecimal result = new BigDecimal(null == value ? "0" : value);
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.multiply(new BigDecimal(value));
      }
    }
    return result;
  }

  public static BigDecimal mul(BigDecimal[] values)
  {
    if (ArrayUtil.isEmpty(values)) {
      return BigDecimal.ZERO;
    }

    BigDecimal value = values[0];
    BigDecimal result = null == value ? BigDecimal.ZERO : value;
    for (int i = 1; i < values.length; i++) {
      value = values[i];
      if (null != value) {
        result = result.multiply(value);
      }
    }
    return result;
  }

  public static double div(float v1, float v2)
  {
    return div(v1, v2, 10);
  }

  public static double div(float v1, double v2)
  {
    return div(v1, v2, 10);
  }

  public static double div(double v1, float v2)
  {
    return div(v1, v2, 10);
  }

  public static double div(double v1, double v2)
  {
    return div(v1, v2, 10);
  }


  public static BigDecimal div(Number v1, Number v2)
  {
    return div(v1, v2, 10);
  }

  public static BigDecimal div(String v1, String v2)
  {
    return div(v1, v2, 10);
  }

  public static double div(float v1, float v2, int scale)
  {
    return div(v1, v2, scale, RoundingMode.HALF_UP);
  }

  public static double div(float v1, double v2, int scale)
  {
    return div(v1, v2, scale, RoundingMode.HALF_UP);
  }

  public static double div(double v1, float v2, int scale)
  {
    return div(v1, v2, scale, RoundingMode.HALF_UP);
  }

  public static double div(double v1, double v2, int scale)
  {
    return div(v1, v2, scale, RoundingMode.HALF_UP);
  }


  public static BigDecimal div(Number v1, Number v2, int scale)
  {
    return div(v1, v2, scale, RoundingMode.HALF_UP);
  }

  public static BigDecimal div(String v1, String v2, int scale)
  {
    return div(v1, v2, scale, RoundingMode.HALF_UP);
  }

  public static double div(float v1, float v2, int scale, RoundingMode roundingMode)
  {
    return div(Float.toString(v1), Float.toString(v2), scale, roundingMode).doubleValue();
  }

  public static double div(float v1, double v2, int scale, RoundingMode roundingMode)
  {
    return div(Float.toString(v1), Double.toString(v2), scale, roundingMode).doubleValue();
  }

  public static double div(double v1, float v2, int scale, RoundingMode roundingMode)
  {
    return div(Double.toString(v1), Float.toString(v2), scale, roundingMode).doubleValue();
  }

  public static double div(double v1, double v2, int scale, RoundingMode roundingMode)
  {
    return div(Double.toString(v1), Double.toString(v2), scale, roundingMode).doubleValue();
  }

  

  public static BigDecimal div(Number v1, Number v2, int scale, RoundingMode roundingMode)
  {
    return div(v1.toString(), v2.toString(), scale, roundingMode);
  }

  public static BigDecimal div(String v1, String v2, int scale, RoundingMode roundingMode)
  {
    return div(new BigDecimal(v1), new BigDecimal(v2), scale, roundingMode);
  }

  public static BigDecimal div(BigDecimal v1, BigDecimal v2, int scale, RoundingMode roundingMode)
  {
    Assert.notNull(v2, "Divisor must be not null !", new Object[0]);
    if (null == v1) {
      return BigDecimal.ZERO;
    }
    if (scale < 0) {
      scale = -scale;
    }
    return v1.divide(v2, scale, roundingMode);
  }

  public static BigDecimal round(double v, int scale)
  {
    return round(v, scale, RoundingMode.HALF_UP);
  }

  public static String roundStr(double v, int scale)
  {
    return round(v, scale).toString();
  }

  public static BigDecimal round(String numberStr, int scale)
  {
    return round(numberStr, scale, RoundingMode.HALF_UP);
  }

  public static BigDecimal round(BigDecimal number, int scale)
  {
    return round(number, scale, RoundingMode.HALF_UP);
  }

  public static String roundStr(String numberStr, int scale)
  {
    return round(numberStr, scale).toString();
  }

  public static BigDecimal round(double v, int scale, RoundingMode roundingMode)
  {
    return round(Double.toString(v), scale, roundingMode);
  }

  public static String roundStr(double v, int scale, RoundingMode roundingMode)
  {
    return round(v, scale, roundingMode).toString();
  }

  public static BigDecimal round(String numberStr, int scale, RoundingMode roundingMode)
  {
    Assert.notBlank(numberStr);
    if (scale < 0) {
      scale = 0;
    }
    return round(toBigDecimal(numberStr), scale, roundingMode);
  }

  public static BigDecimal round(BigDecimal number, int scale, RoundingMode roundingMode)
  {
    if (null == number) {
      number = BigDecimal.ZERO;
    }
    if (scale < 0) {
      scale = 0;
    }
    if (null == roundingMode) {
      roundingMode = RoundingMode.HALF_UP;
    }

    return number.setScale(scale, roundingMode);
  }

  public static String roundStr(String numberStr, int scale, RoundingMode roundingMode)
  {
    return round(numberStr, scale, roundingMode).toString();
  }

  public static BigDecimal roundHalfEven(Number number, int scale)
  {
    return roundHalfEven(toBigDecimal(number), scale);
  }

  public static BigDecimal roundHalfEven(BigDecimal value, int scale)
  {
    return round(value, scale, RoundingMode.HALF_EVEN);
  }

  public static BigDecimal roundDown(Number number, int scale)
  {
    return roundDown(toBigDecimal(number), scale);
  }

  public static BigDecimal roundDown(BigDecimal value, int scale)
  {
    return round(value, scale, RoundingMode.DOWN);
  }

  public static String decimalFormat(String pattern, double value)
  {
    return new DecimalFormat(pattern).format(value);
  }

  public static String decimalFormat(String pattern, long value)
  {
    return new DecimalFormat(pattern).format(value);
  }

  public static String decimalFormatMoney(double value)
  {
    return decimalFormat(",###", value);
  }

  public static String formatPercent(double number, int scale)
  {
    NumberFormat format = NumberFormat.getPercentInstance();
    format.setMaximumFractionDigits(scale);
    return format.format(number);
  }

  public static boolean isNumber(String str)
  {
    if (StrUtil.isBlank(str)) {
      return false;
    }
    char[] chars = str.toCharArray();
    int sz = chars.length;
    boolean hasExp = false;
    boolean hasDecPoint = false;
    boolean allowSigns = false;
    boolean foundDigit = false;

    int start = chars[0] == '-' ? 1 : 0;
    if ((sz > start + 1) && 
      (chars[start] == '0') && (chars[(start + 1)] == 'x')) {
      int i = start + 2;
      if (i == sz) {
        return false;
      }

      for (; i < chars.length; i++) {
        if (((chars[i] < '0') || (chars[i] > '9')) && ((chars[i] < 'a') || (chars[i] > 'f')) && ((chars[i] < 'A') || (chars[i] > 'F'))) {
          return false;
        }
      }
      return true;
    }

    sz--;

    int i = start;

    while ((i < sz) || ((i < sz + 1) && (allowSigns) && (!foundDigit))) {
      if ((chars[i] >= '0') && (chars[i] <= '9')) {
        foundDigit = true;
        allowSigns = false;
      }
      else if (chars[i] == '.') {
        if ((hasDecPoint) || (hasExp))
        {
          return false;
        }
        hasDecPoint = true;
      } else if ((chars[i] == 'e') || (chars[i] == 'E'))
      {
        if (hasExp)
        {
          return false;
        }
        if (!foundDigit) {
          return false;
        }
        hasExp = true;
        allowSigns = true;
      } else if ((chars[i] == '+') || (chars[i] == '-')) {
        if (!allowSigns) {
          return false;
        }
        allowSigns = false;
        foundDigit = false;
      } else {
        return false;
      }
      i++;
    }
    if (i < chars.length) {
      if ((chars[i] >= '0') && (chars[i] <= '9'))
      {
        return true;
      }
      if ((chars[i] == 'e') || (chars[i] == 'E'))
      {
        return false;
      }
      if (chars[i] == '.') {
        if ((hasDecPoint) || (hasExp))
        {
          return false;
        }

        return foundDigit;
      }
      if ((!allowSigns) && ((chars[i] == 'd') || (chars[i] == 'D') || (chars[i] == 'f') || (chars[i] == 'F'))) {
        return foundDigit;
      }
      if ((chars[i] == 'l') || (chars[i] == 'L'))
      {
        return (foundDigit) && (!hasExp);
      }

      return false;
    }

    return (!allowSigns) && (foundDigit);
  }

  public static boolean isInteger(String s)
  {
    try
    {
      parseInt(s);
    } catch (NumberFormatException e) {
      return false;
    }
    return true;
  }

  public static boolean isLong(String s)
  {
    try
    {
      parseLong(s);
    } catch (NumberFormatException e) {
      return false;
    }
    return true;
  }

  public static boolean isDouble(String s)
  {
    try
    {
      Double.parseDouble(s);

      return s.contains(".");
    }
    catch (NumberFormatException e)
    {
    }
    return false;
  }

  public static boolean isPrimes(int n)
  {
    Assert.isTrue(n > 1, "The number must be > 1", new Object[0]);
    for (int i = 2; i <= Math.sqrt(n); i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  public static int[] generateRandomNumber(int begin, int end, int size) throws Exception
  {
    if (begin > end) {
      int temp = begin;
      begin = end;
      end = temp;
    }

    if (end - begin < size) {
      throw new Exception("Size is larger than range between begin and end!");
    }

    int[] seed = new int[end - begin];

    for (int i = begin; i < end; i++) {
      seed[(i - begin)] = i;
    }
    int[] ranArr = new int[size];
    Random ran = new Random();

    for (int i = 0; i < size; i++)
    {
      int j = ran.nextInt(seed.length - i);

      ranArr[i] = seed[j];

      seed[j] = seed[(seed.length - 1 - i)];
    }
    return ranArr;
  }

  public static Integer[] generateBySet(int begin, int end, int size) throws Exception
  {
    if (begin > end) {
      int temp = begin;
      begin = end;
      end = temp;
    }

    if (end - begin < size) {
      throw new Exception("Size is larger than range between begin and end!");
    }

    Random ran = new Random();
    Set set = new HashSet();
    while (set.size() < size) {
      set.add(Integer.valueOf(begin + ran.nextInt(end - begin)));
    }

    Integer[] ranArr = (Integer[])set.toArray(new Integer[size]);
    return ranArr;
  }

  public static int[] range(int stop)
  {
    return range(0, stop);
  }

  public static int[] range(int start, int stop)
  {
    return range(start, stop, 1);
  }

  public static int[] range(int start, int stop, int step)
  {
    if (start < stop)
      step = Math.abs(step);
    else if (start > stop)
      step = -Math.abs(step);
    else {
      return new int[] { start };
    }

    int size = Math.abs((stop - start) / step) + 1;
    int[] values = new int[size];
    int index = 0;
    for (int i = start; step > 0 ? i <= stop : i >= stop; i += step) {
      values[index] = i;
      index++;
    }
    return values;
  }

  public static Collection<Integer> appendRange(int start, int stop, Collection<Integer> values)
  {
    return appendRange(start, stop, 1, values);
  }

  public static Collection<Integer> appendRange(int start, int stop, int step, Collection<Integer> values)
  {
    if (start < stop) {
      step = Math.abs(step);
    } else if (start > stop) {
      step = -Math.abs(step);
    } else {
      values.add(Integer.valueOf(start));
      return values;
    }

    for (int i = start; step > 0 ? i <= stop : i >= stop; i += step) {
      values.add(Integer.valueOf(i));
    }
    return values;
  }

  public static long factorial(long start, long end)
  {
    if (start < end) {
      return 0L;
    }
    if (start == end) {
      return 1L;
    }
    return start * factorial(start - 1L, end);
  }

  public static long factorial(long n)
  {
    return factorial(n, 1L);
  }

  public static long sqrt(long x)
  {
    long y = 0L;
    long b = 4611686018427387904L;
    while (b > 0L) {
      if (x >= y + b) {
        x -= y + b;
        y >>= 1;
        y += b;
      } else {
        y >>= 1;
      }
      b >>= 2;
    }
    return y;
  }

  public static int processMultiple(int selectNum, int minNum)
  {
    int result = mathSubnode(selectNum, minNum) / mathNode(selectNum - minNum);
    return result;
  }

  public static int divisor(int m, int n)
  {
    while (m % n != 0) {
      int temp = m % n;
      m = n;
      n = temp;
    }
    return n;
  }

  public static int multiple(int m, int n)
  {
    return m * n / divisor(m, n);
  }

  public static String getBinaryStr(Number number)
  {
    if ((number instanceof Long))
      return Long.toBinaryString(((Long)number).longValue());
    if ((number instanceof Integer)) {
      return Integer.toBinaryString(((Integer)number).intValue());
    }
    return Long.toBinaryString(number.longValue());
  }

  public static int binaryToInt(String binaryStr)
  {
    return Integer.parseInt(binaryStr, 2);
  }

  public static long binaryToLong(String binaryStr)
  {
    return Long.parseLong(binaryStr, 2);
  }

  public static int compare(char x, char y)
  {
    return x - y;
  }

  public static int compare(double x, double y)
  {
    return Double.compare(x, y);
  }

  public static int compare(int x, int y)
  {
    if (x == y) {
      return 0;
    }
    if (x < y) {
      return -1;
    }
    return 1;
  }

  public static int compare(long x, long y)
  {
    if (x == y) {
      return 0;
    }
    if (x < y) {
      return -1;
    }
    return 1;
  }

  public static int compare(short x, short y)
  {
    if (x == y) {
      return 0;
    }
    if (x < y) {
      return -1;
    }
    return 1;
  }

  public static int compare(byte x, byte y)
  {
    return x - y;
  }

  public static boolean isGreater(BigDecimal bigNum1, BigDecimal bigNum2)
  {
    Assert.notNull(bigNum1);
    Assert.notNull(bigNum2);
    return bigNum1.compareTo(bigNum2) > 0;
  }

  public static boolean isGreaterOrEqual(BigDecimal bigNum1, BigDecimal bigNum2)
  {
    Assert.notNull(bigNum1);
    Assert.notNull(bigNum2);
    return bigNum1.compareTo(bigNum2) >= 0;
  }

  public static boolean isLess(BigDecimal bigNum1, BigDecimal bigNum2)
  {
    Assert.notNull(bigNum1);
    Assert.notNull(bigNum2);
    return bigNum1.compareTo(bigNum2) < 0;
  }

  public static boolean isLessOrEqual(BigDecimal bigNum1, BigDecimal bigNum2)
  {
    Assert.notNull(bigNum1);
    Assert.notNull(bigNum2);
    return bigNum1.compareTo(bigNum2) <= 0;
  }

  public static boolean equals(BigDecimal bigNum1, BigDecimal bigNum2)
  {
    Assert.notNull(bigNum1);
    Assert.notNull(bigNum2);
    return 0 == bigNum1.compareTo(bigNum2);
  }

  public static boolean equals(char c1, char c2, boolean ignoreCase)
  {
    return CharUtil.equals(c1, c2, ignoreCase);
  }


  public static long min(long[] numberArray)
  {
    return ArrayUtil.min(numberArray);
  }

  public static int min(int[] numberArray)
  {
    return ArrayUtil.min(numberArray);
  }

  public static short min(short[] numberArray)
  {
    return ArrayUtil.min(numberArray);
  }

  public static double min(double[] numberArray)
  {
    return ArrayUtil.min(numberArray);
  }

  public static float min(float[] numberArray)
  {
    return ArrayUtil.min(numberArray);
  }


  public static long max(long[] numberArray)
  {
    return ArrayUtil.max(numberArray);
  }

  public static int max(int[] numberArray)
  {
    return ArrayUtil.max(numberArray);
  }

  public static short max(short[] numberArray)
  {
    return ArrayUtil.max(numberArray);
  }

  public static double max(double[] numberArray)
  {
    return ArrayUtil.max(numberArray);
  }

  public static float max(float[] numberArray)
  {
    return ArrayUtil.max(numberArray);
  }

 

  

  public static BigDecimal toBigDecimal(Number number)
  {
    if (null == number) {
      return BigDecimal.ZERO;
    }
    return toBigDecimal(number.toString());
  }

  public static BigDecimal toBigDecimal(String number)
  {
    return null == number ? BigDecimal.ZERO : new BigDecimal(number);
  }

  @Deprecated
  public static boolean isBlankChar(char c)
  {
    return isBlankChar(c);
  }

  @Deprecated
  public static boolean isBlankChar(int c)
  {
    return (Character.isWhitespace(c)) || (Character.isSpaceChar(c)) || (c == 65279) || (c == 8234);
  }

  public static int count(int total, int part)
  {
    return total % part == 0 ? total / part : total / part + 1;
  }

  public static BigDecimal null2Zero(BigDecimal decimal)
  {
    return decimal == null ? BigDecimal.ZERO : decimal;
  }

  public static int zero2One(int value)
  {
    return 0 == value ? 1 : value;
  }

  public static BigInteger newBigInteger(String str)
  {
    str = StrUtil.trimToNull(str);
    if (null == str) {
      return null;
    }

    int pos = 0;
    int radix = 10;
    boolean negate = false;
    if (str.startsWith("-")) {
      negate = true;
      pos = 1;
    }
    if ((str.startsWith("0x", pos)) || (str.startsWith("0X", pos)))
    {
      radix = 16;
      pos += 2;
    } else if (str.startsWith("#", pos))
    {
      radix = 16;
      pos++;
    } else if ((str.startsWith("0", pos)) && (str.length() > pos + 1))
    {
      radix = 8;
      pos++;
    }

    if (pos > 0) {
      str = str.substring(pos);
    }
    BigInteger value = new BigInteger(str, radix);
    return negate ? value.negate() : value;
  }

  public static boolean isBeside(long number1, long number2)
  {
    return Math.abs(number1 - number2) == 1L;
  }

  public static boolean isBeside(int number1, int number2)
  {
    return Math.abs(number1 - number2) == 1;
  }

  public static int partValue(int total, int partCount)
  {
    return partValue(total, partCount, true);
  }

  public static int partValue(int total, int partCount, boolean isPlusOneWhenHasRem)
  {
    int partValue = 0;
    if (total % partCount == 0) {
      partValue = total / partCount;
    } else {
      partValue = (int)Math.floor(total / partCount);
      if (isPlusOneWhenHasRem) {
        partValue++;
      }
    }
    return partValue;
  }

  public static BigDecimal pow(Number number, int n)
  {
    return pow(toBigDecimal(number), n);
  }

  public static BigDecimal pow(BigDecimal number, int n)
  {
    return number.pow(n);
  }

  public static int parseInt(String number)
    throws NumberFormatException
  {
    if (StrUtil.isBlank(number)) {
      return 0;
    }

    number = StrUtil.subBefore(number, '.', false);
    if (StrUtil.isEmpty(number)) {
      return 0;
    }

    if (StrUtil.startWithIgnoreCase(number, "0x"))
    {
      return Integer.parseInt(number.substring(2), 16);
    }if ((number.startsWith("0")) && (number.length() > 1))
    {
      return Integer.parseInt(number.substring(1), 8);
    }

    return Integer.parseInt(removeNumberFlag(number));
  }

  public static long parseLong(String number)
  {
    if (StrUtil.isBlank(number)) {
      return 0L;
    }

    number = StrUtil.subBefore(number, '.', false);
    if (StrUtil.isEmpty(number)) {
      return 0L;
    }

    if (number.startsWith("0x"))
    {
      return Long.parseLong(number.substring(2), 16);
    }if ((number.startsWith("0")) && (number.length() > 1))
    {
      return Long.parseLong(number.substring(1), 8);
    }
    return Long.parseLong(removeNumberFlag(number));
  }

  public static Number parseNumber(String numberStr) throws Exception
  {
    numberStr = removeNumberFlag(numberStr);
    try {
      return NumberFormat.getInstance().parse(numberStr); } catch (ParseException e) {
    }
    throw new Exception();
  }

  private static int mathSubnode(int selectNum, int minNum)
  {
    if (selectNum == minNum) {
      return 1;
    }
    return selectNum * mathSubnode(selectNum - 1, minNum);
  }

  private static int mathNode(int selectNum)
  {
    if (selectNum == 0) {
      return 1;
    }
    return selectNum * mathNode(selectNum - 1);
  }

  private static String removeNumberFlag(String number)
  {
    int lastPos = number.length() - 1;
    char lastCharUpper = Character.toUpperCase(number.charAt(lastPos));
    if (('D' == lastCharUpper) || ('L' == lastCharUpper) || ('F' == lastCharUpper)) {
      number = StrUtil.subPre(number, lastPos);
    }
    return number;
  }
}