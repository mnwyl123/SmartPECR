package com.dcits.supervise.pecr.util;

public class Assert
{
  public static void isTrue(boolean expression, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if (false == expression)
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
  }

  public static void isTrue(boolean expression)
    throws IllegalArgumentException
  {
    isTrue(expression, "[Assertion failed] - this expression must be true", new Object[0]);
  }

  public static void isFalse(boolean expression, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if (expression)
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
  }

  public static void isFalse(boolean expression)
    throws IllegalArgumentException
  {
    isFalse(expression, "[Assertion failed] - this expression must be false", new Object[0]);
  }

  public static void isNull(Object object, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if (object != null)
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
  }

  public static void isNull(Object object)
    throws NullPointerException
  {
    isNull(object, "[Assertion failed] - the object argument must be null", new Object[0]);
  }

  public static <T> T notNull(T object, String errorMsgTemplate, Object[] params)
    throws NullPointerException
  {
    if (object == null) {
      throw new NullPointerException(StrUtil.format(errorMsgTemplate, params));
    }
    return object;
  }

  public static <T> T notNull(T object)
    throws NullPointerException
  {
    return notNull(object, "[Assertion failed] - this argument is required; it must not be null", new Object[0]);
  }

  public static String notEmpty(String text, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if (StrUtil.isEmpty(text)) {
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
    }
    return text;
  }

  public static String notEmpty(String text)
    throws IllegalArgumentException
  {
    return notEmpty(text, "[Assertion failed] - this String argument must have length; it must not be null or empty", new Object[0]);
  }

  public static String notBlank(String text, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if (StrUtil.isBlank(text)) {
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
    }
    return text;
  }

  public static String notBlank(String text)
    throws IllegalArgumentException
  {
    return notBlank(text, "[Assertion failed] - this String argument must have text; it must not be null, empty, or blank", new Object[0]);
  }

  public static String notContain(String textToSearch, String substring, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if ((StrUtil.isNotEmpty(textToSearch)) && (StrUtil.isNotEmpty(substring)) && (textToSearch.contains(substring))) {
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
    }
    return substring;
  }

  public static String notContain(String textToSearch, String substring)
    throws IllegalArgumentException
  {
    return notContain(textToSearch, substring, "[Assertion failed] - this String argument must not contain the substring [{}]", new Object[] { substring });
  }

  public static Object[] notEmpty(Object[] array, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if (ArrayUtil.isEmpty(array)) {
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
    }
    return array;
  }

  public static Object[] notEmpty(Object[] array)
    throws IllegalArgumentException
  {
    return notEmpty(array, "[Assertion failed] - this array must not be empty: it must contain at least 1 element", new Object[0]);
  }

  public static <T> T[] noNullElements(T[] array, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    if (ArrayUtil.hasNull(array)) {
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
    }
    return array;
  }

  public static <T> T[] noNullElements(T[] array)
    throws IllegalArgumentException
  {
    return noNullElements(array, "[Assertion failed] - this array must not contain any null elements", new Object[0]);
  }





  public static void isAssignable(Class<?> superType, Class<?> subType)
    throws IllegalArgumentException
  {
    isAssignable(superType, subType, "{} is not assignable to {})", new Object[] { subType, superType });
  }

  public static void isAssignable(Class<?> superType, Class<?> subType, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException
  {
    notNull(superType, "Type to check against must not be null", new Object[0]);
    if ((subType == null) || (!superType.isAssignableFrom(subType)))
      throw new IllegalArgumentException(StrUtil.format(errorMsgTemplate, params));
  }

  public static void state(boolean expression, String errorMsgTemplate, Object[] params)
    throws IllegalStateException
  {
    if (false == expression)
      throw new IllegalStateException(StrUtil.format(errorMsgTemplate, params));
  }

  public static void state(boolean expression)
    throws IllegalStateException
  {
    state(expression, "[Assertion failed] - this state invariant must be true", new Object[0]);
  }

  public static int checkIndex(int index, int size)
    throws IllegalArgumentException, IndexOutOfBoundsException
  {
    return checkIndex(index, size, "[Assertion failed]", new Object[0]);
  }

  public static int checkIndex(int index, int size, String errorMsgTemplate, Object[] params)
    throws IllegalArgumentException, IndexOutOfBoundsException
  {
    if ((index < 0) || (index >= size)) {
      throw new IndexOutOfBoundsException(badIndexMsg(index, size, errorMsgTemplate, params));
    }
    return index;
  }

  public static int checkBetween(int value, int min, int max)
  {
    if ((value < min) || (value > max)) {
      throw new IllegalArgumentException(StrUtil.format("Length must be between {} and {}.", new Object[] { Integer.valueOf(min), Integer.valueOf(max) }));
    }
    return value;
  }

  public static long checkBetween(long value, long min, long max)
  {
    if ((value < min) || (value > max)) {
      throw new IllegalArgumentException(StrUtil.format("Length must be between {} and {}.", new Object[] { Long.valueOf(min), Long.valueOf(max) }));
    }
    return value;
  }

  public static double checkBetween(double value, double min, double max)
  {
    if ((value < min) || (value > max)) {
      throw new IllegalArgumentException(StrUtil.format("Length must be between {} and {}.", new Object[] { Double.valueOf(min), Double.valueOf(max) }));
    }
    return value;
  }

  public static Number checkBetween(Number value, Number min, Number max)
  {
    notNull(value);
    notNull(min);
    notNull(max);
    double valueDouble = value.doubleValue();
    double minDouble = min.doubleValue();
    double maxDouble = max.doubleValue();
    if ((valueDouble < minDouble) || (valueDouble > maxDouble)) {
      throw new IllegalArgumentException(StrUtil.format("Length must be between {} and {}.", new Object[] { min, max }));
    }
    return value;
  }

  private static String badIndexMsg(int index, int size, String desc, Object[] params)
  {
    if (index < 0)
      return StrUtil.format("{} ({}) must not be negative", new Object[] { StrUtil.format(desc, params), Integer.valueOf(index) });
    if (size < 0) {
      throw new IllegalArgumentException("negative size: " + size);
    }
    return StrUtil.format("{} ({}) must be less than size ({})", new Object[] { StrUtil.format(desc, params), Integer.valueOf(index), Integer.valueOf(size) });
  }
}