package com.dcits.supervise.pecr.util.file;

public enum LineSeparator
{
  MAC("\r"), 

  LINUX("\n"), 

  WINDOWS("\r\n");

  private String value;

  private LineSeparator(String lineSeparator) { this.value = lineSeparator; }

  public String getValue()
  {
    return this.value;
  }
}