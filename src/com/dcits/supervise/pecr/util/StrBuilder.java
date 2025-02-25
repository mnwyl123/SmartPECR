package com.dcits.supervise.pecr.util;
import java.io.Serializable;
import java.util.Arrays;

public class StrBuilder
  implements CharSequence, Appendable, Serializable
{
  private static final long serialVersionUID = 6341229705927508451L;
  public static final int DEFAULT_CAPACITY = 16;
  private char[] value;
  private int position;

  public static StrBuilder create()
  {
    return new StrBuilder();
  }

  public static StrBuilder create(int initialCapacity)
  {
    return new StrBuilder(initialCapacity);
  }

  public static StrBuilder create(CharSequence[] strs)
  {
    return new StrBuilder(strs);
  }

  public StrBuilder()
  {
    this(16);
  }

  public StrBuilder(int initialCapacity)
  {
    this.value = new char[initialCapacity];
  }

  public StrBuilder(CharSequence[] strs)
  {
    this(ArrayUtil.isEmpty(strs) ? 16 : totalLength(strs) + 16);
    for (int i = 0; i < strs.length; i++)
      append(strs[i]);
  }


  public StrBuilder append(char c)
  {
    return insert(this.position, c);
  }

  public StrBuilder append(char[] src)
  {
    if (ArrayUtil.isEmpty(src)) {
      return this;
    }
    return append(src, 0, src.length);
  }

  public StrBuilder append(char[] src, int srcPos, int length)
  {
    return insert(this.position, src, srcPos, length);
  }

  public StrBuilder append(CharSequence csq)
  {
    return insert(this.position, csq);
  }

  public StrBuilder append(CharSequence csq, int start, int end)
  {
    return insert(this.position, csq, start, end);
  }


  public StrBuilder insert(int index, char c)
  {
    moveDataAfterIndex(index, 1);
    this.value[index] = c;
    this.position = (Math.max(this.position, index) + 1);
    return this;
  }

  public StrBuilder insert(int index, char[] src)
  {
    if (ArrayUtil.isEmpty(src)) {
      return this;
    }
    return insert(index, src, 0, src.length);
  }

  public StrBuilder insert(int index, char[] src, int srcPos, int length)
  {
    if ((ArrayUtil.isEmpty(src)) || (srcPos > src.length) || (length <= 0)) {
      return this;
    }
    if (index < 0) {
      index = 0;
    }
    if (srcPos < 0)
      srcPos = 0;
    else if (srcPos + length > src.length)
    {
      length = src.length - srcPos;
    }

    moveDataAfterIndex(index, length);

    System.arraycopy(src, srcPos, this.value, index, length);
    this.position = (Math.max(this.position, index) + length);
    return this;
  }

  public StrBuilder insert(int index, CharSequence csq)
  {
    if (null == csq) {
      csq = "null";
    }
    int len = csq.length();
    moveDataAfterIndex(index, csq.length());
    if ((csq instanceof String)) {
      ((String)csq).getChars(0, len, this.value, index);
    } else if ((csq instanceof StringBuilder)) {
      ((StringBuilder)csq).getChars(0, len, this.value, index);
    } else if ((csq instanceof StringBuffer)) {
      ((StringBuffer)csq).getChars(0, len, this.value, index);
    } else if ((csq instanceof StrBuilder)) {
      ((StrBuilder)csq).getChars(0, len, this.value, index);
    } else {
      int i = 0; for (int j = this.position; i < len; j++) {
        this.value[j] = csq.charAt(i);

        i++;
      }
    }

    this.position = (Math.max(this.position, index) + len);
    return this;
  }

  public StrBuilder insert(int index, CharSequence csq, int start, int end)
  {
    if (csq == null) {
      csq = "null";
    }
    int csqLen = csq.length();
    if (start > csqLen) {
      return this;
    }
    if (start < 0) {
      start = 0;
    }
    if (end > csqLen) {
      end = csqLen;
    }
    if (start >= end) {
      return this;
    }
    if (index < 0) {
      index = 0;
    }

    int length = end - start;
    moveDataAfterIndex(index, length);
    int i = start; for (int j = this.position; i < end; j++) {
      this.value[j] = csq.charAt(i);

      i++;
    }

    this.position = (Math.max(this.position, index) + length);
    return this;
  }

  public StrBuilder getChars(int srcBegin, int srcEnd, char[] dst, int dstBegin)
  {
    if (srcBegin < 0) {
      srcBegin = 0;
    }
    if (srcEnd < 0)
      srcEnd = 0;
    else if (srcEnd > this.position) {
      srcEnd = this.position;
    }
    if (srcBegin > srcEnd) {
      throw new StringIndexOutOfBoundsException("srcBegin > srcEnd");
    }
    System.arraycopy(this.value, srcBegin, dst, dstBegin, srcEnd - srcBegin);
    return this;
  }

  public boolean hasContent()
  {
    return this.position > 0;
  }

  public boolean isEmpty()
  {
    return this.position == 0;
  }

  public StrBuilder clear()
  {
    return reset();
  }

  public StrBuilder reset()
  {
    this.position = 0;
    return this;
  }

  public StrBuilder delTo(int newPosition)
  {
    if (newPosition < 0)
      reset();
    else if (newPosition < this.position) {
      this.position = newPosition;
    }
    return this;
  }

  public StrBuilder del(int start, int end)
  {
    if (start < 0) {
      start = 0;
    }
    if (end > this.position) {
      end = this.position;
    }
    if (start > end) {
      throw new StringIndexOutOfBoundsException("Start is greater than End.");
    }
    if (end == this.position) {
      this.position = start;
    }

    int len = end - start;
    if (len > 0) {
      System.arraycopy(this.value, start + len, this.value, start, this.position - end);
      this.position -= len;
    }
    return this;
  }

  public String toString(boolean isReset)
  {
    if (this.position > 0) {
      String s = new String(this.value, 0, this.position);
      if (isReset) {
        reset();
      }
      return s;
    }
    return "";
  }

  public String toStringAndReset()
  {
    return toString(true);
  }

  public String toString()
  {
    return toString(false);
  }

  public int length()
  {
    return this.position;
  }

  public char charAt(int index)
  {
    if ((index < 0) || (index > this.position)) {
      throw new StringIndexOutOfBoundsException(index);
    }
    return this.value[index];
  }

  public CharSequence subSequence(int start, int end)
  {
    return subString(start, end);
  }

  public String subString(int start)
  {
    return subString(start, this.position);
  }

  public String subString(int start, int end)
  {
    return new String(this.value, start, end - start);
  }

  private void moveDataAfterIndex(int index, int length)
  {
    ensureCapacity(Math.max(this.position, index) + length);
    if (index < this.position)
    {
      System.arraycopy(this.value, index, this.value, index + length, this.position - index);
    } else if (index > this.position)
    {
      Arrays.fill(this.value, this.position, index, ' ');
    }
  }

  private void ensureCapacity(int minimumCapacity)
  {
    if (minimumCapacity > this.value.length)
      expandCapacity(minimumCapacity);
  }

  private void expandCapacity(int minimumCapacity)
  {
    int newCapacity = this.value.length * 2 + 2;
    if (newCapacity < minimumCapacity) {
      newCapacity = minimumCapacity;
    }
    if (newCapacity < 0) {
      if (minimumCapacity < 0)
      {
        throw new OutOfMemoryError("Capacity is too long and max than Integer.MAX");
      }
      newCapacity = 2147483647;
    }
    this.value = Arrays.copyOf(this.value, newCapacity);
  }

  private static int totalLength(CharSequence[] strs)
  {
    int totalLength = 0;
    for (int i = 0; i < strs.length; i++) {
      totalLength += (null == strs[i] ? 4 : strs[i].length());
    }
    return totalLength;
  }
}