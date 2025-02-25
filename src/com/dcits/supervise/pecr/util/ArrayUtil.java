package com.dcits.supervise.pecr.util;

import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.util.Arrays;

import com.dcits.supervise.pecr.exceptions.UtilException;

public class ArrayUtil
{
  public static final int INDEX_NOT_FOUND = -1;

  public static <T> boolean isEmpty(T[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(Object array) throws Exception
  {
    if (null == array)
      return true;
    if (isArray(array)) {
      return 0 == Array.getLength(array);
    }
    throw new Exception("Object to provide is not a Array !");
  }

  public static boolean isEmpty(long[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(int[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(short[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(char[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(byte[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(double[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(float[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static boolean isEmpty(boolean[] array)
  {
    return (array == null) || (array.length == 0);
  }

  public static <T> boolean isNotEmpty(T[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(Object array) throws Exception
  {
    return false == isEmpty(array);
  }

  public static boolean isNotEmpty(long[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(int[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(short[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(char[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(byte[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(double[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(float[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static boolean isNotEmpty(boolean[] array)
  {
    return (array != null) && (array.length != 0);
  }

  public static <T> boolean hasNull(T[] array)
  {
    if (isNotEmpty(array)) {
      for (Object element : array) {
        if (null == element) {
          return true;
        }
      }
    }
    return false;
  }

  public static <T> T firstNonNull(T[] array)
  {
    if (isNotEmpty(array)) {
      for (Object val : array) {
        if (null != val) {
          return (T) val;
        }
      }
    }
    return null;
  }

  public static <T> T[] newArray(Class<?> componentType, int newSize)
  {
    return (T[])(Object[])Array.newInstance(componentType, newSize);
  }

  public static <T> T[] newArray(int newSize)
  {
    return (T[])new Object[newSize];
  }

  public static Class<?> getComponentType(Object array)
  {
    return null == array ? null : array.getClass().getComponentType();
  }

  public static Class<?> getComponentType(Class<?> arrayClass)
  {
    return null == arrayClass ? null : arrayClass.getComponentType();
  }

  public static Class<?> getArrayType(Class<?> componentType)
  {
    return newArray(componentType, 0).getClass();
  }

  public static Object[] cast(Class<?> type, Object arrayObj)
    throws NullPointerException, IllegalArgumentException
  {
    if (null == arrayObj) {
      throw new NullPointerException("Argument [arrayObj] is null !");
    }
    if (false == arrayObj.getClass().isArray()) {
      throw new IllegalArgumentException("Argument [arrayObj] is not array !");
    }
    if (null == type) {
      return (Object[])(Object[])arrayObj;
    }

    Class componentType = type.isArray() ? type.getComponentType() : type;
    Object[] array = (Object[])(Object[])arrayObj;
    Object[] result = newArray(componentType, array.length);
    System.arraycopy(array, 0, result, 0, array.length);
    return result;
  }

  public static <T> T[] append(T[] buffer, T[] newElements)
  {
    if (isEmpty(buffer)) {
      return newElements;
    }
    return insert(buffer, buffer.length, newElements);
  }

  public static <T> Object append(Object array, T[] newElements) throws Exception
  {
    if (isEmpty(array)) {
      return newElements;
    }
    return insert(array, length(array), newElements);
  }

  public static <T> T[] setOrAppend(T[] buffer, int index, T value)
  {
    if (index < buffer.length) {
      Array.set(buffer, index, value);
      return buffer;
    }
    return (T[]) append(buffer, new Object[] { value });
  }

  public static Object setOrAppend(Object array, int index, Object value) throws Exception
  {
    if (index < length(array)) {
      Array.set(array, index, value);
      return array;
    }
    return append(array, new Object[] { value });
  }

  public static <T> T[] insert(T[] buffer, int index, T[] newElements)
  {
    return (T[])(Object[])insert(buffer, index, newElements);
  }

  public static <T> Object insert(Object array, int index, T[] newElements) throws Exception
  {
    if (isEmpty(newElements)) {
      return array;
    }
    if (isEmpty(array)) {
      return newElements;
    }

    int len = length(array);
    if (index < 0) {
      index = index % len + len;
    }

    Object[] result = newArray(array.getClass().getComponentType(), Math.max(len, index) + newElements.length);
    System.arraycopy(array, 0, result, 0, Math.min(len, index));
    System.arraycopy(newElements, 0, result, index, newElements.length);
    if (index < len) {
      System.arraycopy(array, index, result, index + newElements.length, len - index);
    }
    return result;
  }

  public static <T> T[] resize(T[] buffer, int newSize, Class<?> componentType)
  {
    Object[] newArray = newArray(componentType, newSize);
    if (isNotEmpty(buffer)) {
      System.arraycopy(buffer, 0, newArray, 0, Math.min(buffer.length, newSize));
    }
    return (T[]) newArray;
  }

  public static <T> T[] resize(T[] buffer, int newSize)
  {
    return resize(buffer, newSize, buffer.getClass().getComponentType());
  }

  @SuppressWarnings("unchecked")
public static <T> T[] addAll(T[][] arrays)
  {
    if (arrays.length == 1) {
      return arrays[0];
    }

    int length = 0;
    for (Object[] array : arrays) {
      if (array == null) {
        continue;
      }
      length += array.length;
    }
    Object[] result = newArray(arrays.getClass().getComponentType().getComponentType(), length);

    length = 0;
    for (Object[] array : arrays) {
      if (array == null) {
        continue;
      }
      System.arraycopy(array, 0, result, length, array.length);
      length += array.length;
    }
    return (T[]) result;
  }

  public static Object copy(Object src, int srcPos, Object dest, int destPos, int length)
  {
    System.arraycopy(src, srcPos, dest, destPos, length);
    return dest;
  }

  public static Object copy(Object src, Object dest, int length)
  {
    System.arraycopy(src, 0, dest, 0, length);
    return dest;
  }

  public static <T> T[] clone(T[] array)
  {
    if (array == null) {
      return null;
    }
    return (T[])array.clone();
  }

  public static <T> T clone(T obj)
  {
    if (null == obj) {
      return null;
    }
    if (isArray(obj))
    {
      Class componentType = obj.getClass().getComponentType();
      Object result;
      if (componentType.isPrimitive()) {
        int length = Array.getLength(obj);
        result = Array.newInstance(componentType, length);
        while (length-- > 0)
          Array.set(result, length, Array.get(obj, length));
      }
      else {
        result = ((Object[])(Object[])obj).clone();
      }
      return (T) result;
    }
    return null;
  }

  public static int[] range(int excludedEnd)
  {
    return range(0, excludedEnd, 1);
  }

  public static int[] range(int includedStart, int excludedEnd)
  {
    return range(includedStart, excludedEnd, 1);
  }

  public static int[] range(int includedStart, int excludedEnd, int step)
  {
    if (includedStart > excludedEnd) {
      int tmp = includedStart;
      includedStart = excludedEnd;
      excludedEnd = tmp;
    }

    if (step <= 0) {
      step = 1;
    }

    int deviation = excludedEnd - includedStart;
    int length = deviation / step;
    if (deviation % step != 0) {
      length++;
    }
    int[] range = new int[length];
    for (int i = 0; i < length; i++) {
      range[i] = includedStart;
      includedStart += step;
    }
    return range;
  }

  public static byte[][] split(byte[] array, int len)
  {
    int x = array.length / len;
    int y = array.length % len;
    int z = 0;
    if (y != 0) {
      z = 1;
    }
    byte[][] arrays = new byte[x + z][];

    for (int i = 0; i < x + z; i++) {
      byte[] arr = new byte[len];
      if ((i == x + z - 1) && (y != 0))
        System.arraycopy(array, i * len, arr, 0, y);
      else {
        System.arraycopy(array, i * len, arr, 0, len);
      }
      arrays[i] = arr;
    }
    return arrays;
  }

  public static <T> int indexOf(T[] array, Object value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        if (ObjectUtil.equal(value, (Object)array[i])) {
          return i;
        }
      }
    }
    return -1;
  }
  

  public static <T> int lastIndexOf(T[] array, Object value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
        if (ObjectUtil.equal(value, array[i])) {
          return i;
        }
      }
    }
    return -1;
  }

  public static <T> boolean contains(T[] array, T value)
  {
    return indexOf(array, value) > -1;
  }

  public static <T> boolean containsAny(T[] array, T[] values)
  {
    for (Object value : values) {
      if (contains(array, value)) {
        return true;
      }
    }
    return false;
  }


  public static int indexOf(long[] array, long value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(long[] array, long value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(long[] array, long value)
  {
    return indexOf(array, value) > -1;
  }

  public static int indexOf(int[] array, int value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(int[] array, int value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(int[] array, int value)
  {
    return indexOf(array, value) > -1;
  }

  public static int indexOf(short[] array, short value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(short[] array, short value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(short[] array, short value)
  {
    return indexOf(array, value) > -1;
  }

  public static int indexOf(char[] array, char value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(char[] array, char value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(char[] array, char value)
  {
    return indexOf(array, value) > -1;
  }

  public static int indexOf(byte[] array, byte value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(byte[] array, byte value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(byte[] array, byte value)
  {
    return indexOf(array, value) > -1;
  }

  public static int indexOf(double[] array, double value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        //if (value == array[i]) {
        if (Double.doubleToLongBits(value) == Double.doubleToLongBits(array[i])) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(double[] array, double value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
    	//if (value == array[i]) {
        if (Double.doubleToLongBits(value) == Double.doubleToLongBits(array[i])) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(double[] array, double value)
  {
    return indexOf(array, value) > -1;
  }

  public static int indexOf(float[] array, float value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
    	//if (value == array[i]) {
         if (Double.doubleToLongBits(value) == Double.doubleToLongBits(array[i])) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(float[] array, float value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
    	//if (value == array[i]) {
        if (Double.doubleToLongBits(value) == Double.doubleToLongBits(array[i])) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(float[] array, float value)
  {
    return indexOf(array, value) > -1;
  }

  public static int indexOf(boolean[] array, boolean value)
  {
    if (null != array) {
      for (int i = 0; i < array.length; i++) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static int lastIndexOf(boolean[] array, boolean value)
  {
    if (null != array) {
      for (int i = array.length - 1; i >= 0; i--) {
        if (value == array[i]) {
          return i;
        }
      }
    }
    return -1;
  }

  public static boolean contains(boolean[] array, boolean value)
  {
    return indexOf(array, value) > -1;
  }

  public static Integer[] wrap(int[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Integer[0];
    }

    Integer[] array = new Integer[length];
    for (int i = 0; i < length; i++) {
      array[i] = Integer.valueOf(values[i]);
    }
    return array;
  }

  public static int[] unWrap(Integer[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new int[0];
    }

    int[] array = new int[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].intValue();
    }
    return array;
  }

  public static Long[] wrap(long[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Long[0];
    }

    Long[] array = new Long[length];
    for (int i = 0; i < length; i++) {
      array[i] = Long.valueOf(values[i]);
    }
    return array;
  }

  public static long[] unWrap(Long[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new long[0];
    }

    long[] array = new long[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].longValue();
    }
    return array;
  }

  public static Character[] wrap(char[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Character[0];
    }

    Character[] array = new Character[length];
    for (int i = 0; i < length; i++) {
      array[i] = Character.valueOf(values[i]);
    }
    return array;
  }

  public static char[] unWrap(Character[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new char[0];
    }

    char[] array = new char[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].charValue();
    }
    return array;
  }

  public static Byte[] wrap(byte[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Byte[0];
    }

    Byte[] array = new Byte[length];
    for (int i = 0; i < length; i++) {
      array[i] = Byte.valueOf(values[i]);
    }
    return array;
  }

  public static byte[] unWrap(Byte[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new byte[0];
    }

    byte[] array = new byte[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].byteValue();
    }
    return array;
  }

  public static Short[] wrap(short[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Short[0];
    }

    Short[] array = new Short[length];
    for (int i = 0; i < length; i++) {
      array[i] = Short.valueOf(values[i]);
    }
    return array;
  }

  public static short[] unWrap(Short[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new short[0];
    }

    short[] array = new short[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].shortValue();
    }
    return array;
  }

  public static Float[] wrap(float[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Float[0];
    }

    Float[] array = new Float[length];
    for (int i = 0; i < length; i++) {
      array[i] = Float.valueOf(values[i]);
    }
    return array;
  }

  public static float[] unWrap(Float[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new float[0];
    }

    float[] array = new float[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].floatValue();
    }
    return array;
  }

  public static Double[] wrap(double[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Double[0];
    }

    Double[] array = new Double[length];
    for (int i = 0; i < length; i++) {
      array[i] = Double.valueOf(values[i]);
    }
    return array;
  }

  public static double[] unWrap(Double[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new double[0];
    }

    double[] array = new double[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].doubleValue();
    }
    return array;
  }

  public static Boolean[] wrap(boolean[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new Boolean[0];
    }

    Boolean[] array = new Boolean[length];
    for (int i = 0; i < length; i++) {
      array[i] = Boolean.valueOf(values[i]);
    }
    return array;
  }

  public static boolean[] unWrap(Boolean[] values)
  {
    if (null == values) {
      return null;
    }
    int length = values.length;
    if (0 == length) {
      return new boolean[0];
    }

    boolean[] array = new boolean[length];
    for (int i = 0; i < length; i++) {
      array[i] = values[i].booleanValue();
    }
    return array;
  }
  public static String toString(Object obj) 
  {
    if (null == obj) {
      return null;
    }
    if (isArray(obj)) {
      try {
        return Arrays.deepToString((Object[])(Object[])obj);
      } catch (Exception e) {
        String className = obj.getClass().getComponentType().getName();
        switch (className) {
        case "long":return Arrays.toString((long[])(long[])obj);
        case "int": return Arrays.toString((int[])(int[])obj);
        case "short": return Arrays.toString((short[])(short[])obj);
        case "char":return Arrays.toString((char[])(char[])obj);
        case "byte": return Arrays.toString((byte[])(byte[])obj);
        case "boolean": return Arrays.toString((boolean[])(boolean[])obj);
        case "float": return Arrays.toString((float[])(float[])obj);
        case "double": return Arrays.toString((double[])(double[])obj);
        	} 
        throw new UtilException(e);
        } 

      
    }

    return obj.toString();
  }
  
  public static boolean isArray(Object obj)
  {
    if (null == obj)
    {
      return false;
    }
    return obj.getClass().isArray();
  }

  public static int length(Object array)
    throws IllegalArgumentException
  {
    if (null == array) {
      return 0;
    }
    return Array.getLength(array);
  }


 

  public static String join(long[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (long item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(int[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (int item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(short[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (short item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(char[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (char item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(byte[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (byte item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(boolean[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (boolean item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(float[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (float item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(double[] array, CharSequence conjunction)
  {
    if (null == array) {
      return null;
    }

    StringBuilder sb = new StringBuilder();
    boolean isFirst = true;
    for (double item : array) {
      if (isFirst)
        isFirst = false;
      else {
        sb.append(conjunction);
      }
      sb.append(item);
    }
    return sb.toString();
  }

  public static String join(Object array, CharSequence conjunction)
  {
    if (isArray(array)) {
      Class componentType = array.getClass().getComponentType();
      if (componentType.isPrimitive()) {
        String componentTypeName = componentType.getName();
        switch (componentTypeName) {
        case "long":
          return join((long[])(long[])array, conjunction);
        case "int":
          return join((int[])(int[])array, conjunction);
        case "short":
          return join((short[])(short[])array, conjunction);
        case "char":
          return join((char[])(char[])array, conjunction);
        case "byte":
          return join((byte[])(byte[])array, conjunction);
        case "boolean":
          return join((boolean[])(boolean[])array, conjunction);
        case "float":
          return join((float[])(float[])array, conjunction);
        case "double":
          return join((double[])(double[])array, conjunction);
        }
        throw new UtilException("Unknown primitive type: [{}]", new Object[] { componentTypeName });
      }

      return join((Object[])(Object[])array, conjunction);
    }

    throw new UtilException(StrUtil.format("[{}] is not a Array!", new Object[] { array == null?"":array.getClass() }));
  }

  public static byte[] toArray(ByteBuffer bytebuffer)
  {
    if (false == bytebuffer.hasArray()) {
      int oldPosition = bytebuffer.position();
      bytebuffer.position(0);
      int size = bytebuffer.limit();
      byte[] buffers = new byte[size];
      bytebuffer.get(buffers);
      bytebuffer.position(oldPosition);
      return buffers;
    }
    return Arrays.copyOfRange(bytebuffer.array(), bytebuffer.position(), bytebuffer.limit());
  }



  public static long[] remove(long[] array, int index)
    throws IllegalArgumentException
  {
    return (long[])(long[])remove(array, index);
  }

  public static int[] remove(int[] array, int index)
    throws IllegalArgumentException
  {
    return (int[])(int[])remove(array, index);
  }

  public static short[] remove(short[] array, int index)
    throws IllegalArgumentException
  {
    return (short[])(short[])remove(array, index);
  }

  public static char[] remove(char[] array, int index)
    throws IllegalArgumentException
  {
    return (char[])(char[])remove(array, index);
  }

  public static byte[] remove(byte[] array, int index)
    throws IllegalArgumentException
  {
    return (byte[])(byte[])remove(array, index);
  }

  public static double[] remove(double[] array, int index)
    throws IllegalArgumentException
  {
    return (double[])(double[])remove(array, index);
  }

  public static float[] remove(float[] array, int index)
    throws IllegalArgumentException
  {
    return (float[])(float[])remove(array, index);
  }

  public static boolean[] remove(boolean[] array, int index)
    throws IllegalArgumentException
  {
    return (boolean[])(boolean[])remove(array, index);
  }

  public static Object remove(Object array, int index)
    throws IllegalArgumentException
  {
    if (null == array) {
      return array;
    }
    int length = length(array);
    if ((index < 0) || (index >= length)) {
      return array;
    }

    Object result = Array.newInstance(array.getClass().getComponentType(), length - 1);
    System.arraycopy(array, 0, result, 0, index);
    if (index < length - 1)
    {
      System.arraycopy(array, index + 1, result, index, length - index - 1);
    }

    return result;
  }


  public static long[] removeEle(long[] array, long element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static int[] removeEle(int[] array, int element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static short[] removeEle(short[] array, short element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static char[] removeEle(char[] array, char element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static byte[] removeEle(byte[] array, byte element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static double[] removeEle(double[] array, double element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static float[] removeEle(float[] array, float element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static boolean[] removeEle(boolean[] array, boolean element)
    throws IllegalArgumentException
  {
    return remove(array, indexOf(array, element));
  }

  public static <T> T[] reverse(T[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      Object tmp = array[j];
      array[j] = array[i];
      array[i] = (T) tmp;
      j--;
      i++;
    }
    return array;
  }

  public static <T> T[] reverse(T[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static long[] reverse(long[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      long tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static long[] reverse(long[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static int[] reverse(int[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      int tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static int[] reverse(int[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static short[] reverse(short[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      short tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static short[] reverse(short[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static char[] reverse(char[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      char tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static char[] reverse(char[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static byte[] reverse(byte[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      byte tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static byte[] reverse(byte[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static double[] reverse(double[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      double tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static double[] reverse(double[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static float[] reverse(float[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      float tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static float[] reverse(float[] array)
  {
    return reverse(array, 0, array.length);
  }

  public static boolean[] reverse(boolean[] array, int startIndexInclusive, int endIndexExclusive)
  {
    if (isEmpty(array)) {
      return array;
    }
    int i = startIndexInclusive < 0 ? 0 : startIndexInclusive;
    int j = Math.min(array.length, endIndexExclusive) - 1;

    while (j > i) {
      boolean tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
    return array;
  }

  public static boolean[] reverse(boolean[] array)
  {
    return reverse(array, 0, array.length);
  }

  

  public static long min(long[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    long min = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (min > numberArray[i]) {
        min = numberArray[i];
      }
    }
    return min;
  }

  public static int min(int[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    int min = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (min > numberArray[i]) {
        min = numberArray[i];
      }
    }
    return min;
  }

  public static short min(short[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    short min = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (min > numberArray[i]) {
        min = numberArray[i];
      }
    }
    return min;
  }

  public static char min(char[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    char min = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (min > numberArray[i]) {
        min = numberArray[i];
      }
    }
    return min;
  }

  public static byte min(byte[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    byte min = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (min > numberArray[i]) {
        min = numberArray[i];
      }
    }
    return min;
  }

  public static double min(double[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    double min = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (min > numberArray[i]) {
        min = numberArray[i];
      }
    }
    return min;
  }

  public static float min(float[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    float min = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (min > numberArray[i]) {
        min = numberArray[i];
      }
    }
    return min;
  }

  

  public static long max(long[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    long max = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (max < numberArray[i]) {
        max = numberArray[i];
      }
    }
    return max;
  }

  public static int max(int[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    int max = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (max < numberArray[i]) {
        max = numberArray[i];
      }
    }
    return max;
  }

  public static short max(short[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    short max = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (max < numberArray[i]) {
        max = numberArray[i];
      }
    }
    return max;
  }

  public static char max(char[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    char max = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (max < numberArray[i]) {
        max = numberArray[i];
      }
    }
    return max;
  }

  public static byte max(byte[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    byte max = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (max < numberArray[i]) {
        max = numberArray[i];
      }
    }
    return max;
  }

  public static double max(double[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    double max = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (max < numberArray[i]) {
        max = numberArray[i];
      }
    }
    return max;
  }

  public static float max(float[] numberArray)
  {
    if (isEmpty(numberArray)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    float max = numberArray[0];
    for (int i = 0; i < numberArray.length; i++) {
      if (max < numberArray[i]) {
        max = numberArray[i];
      }
    }
    return max;
  }

  public static int[] swap(int[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    int tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static long[] swap(long[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    long tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static double[] swap(double[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    double tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static float[] swap(float[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    float tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static boolean[] swap(boolean[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    boolean tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static byte[] swap(byte[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    byte tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static char[] swap(char[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    char tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static short[] swap(short[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Number array must not empty !");
    }
    short tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
    return array;
  }

  public static <T> T[] swap(T[] array, int index1, int index2)
  {
    if (isEmpty(array)) {
      throw new IllegalArgumentException("Array must not empty !");
    }
    Object tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = (T) tmp;
    return array;
  }

}