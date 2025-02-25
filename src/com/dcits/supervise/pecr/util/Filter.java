package com.dcits.supervise.pecr.util;

public abstract interface Filter<T>
{
  public abstract boolean accept(T paramT);
}