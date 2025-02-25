package com.dcits.supervise.pecr.util.json;
import java.io.Serializable;

public class JSONNull
  implements Serializable
{
  private static final long serialVersionUID = 2633815155870764938L;
  public static final JSONNull NULL = new JSONNull();

  protected final Object clone()
  {
    return this;
  }

  public boolean equals(Object object)
  {
    return (object == null) || (object == this);
  }

  public int hashCode()
  {
    return super.hashCode();
  }

  public String toString()
  {
    return "null";
  }
}