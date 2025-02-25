package com.dcits.supervise.pecr.util;

public abstract interface StreamProgress
{
  public abstract void start();

  public abstract void progress(long paramLong);

  public abstract void finish();
}