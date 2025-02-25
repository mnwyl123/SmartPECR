package com.dcits.supervise.pecr.exceptions;

public class BusinessException extends RuntimeException
{
  /**
	 * 
	 */
	private static final long serialVersionUID = -7967119214841715982L;

public BusinessException()
  {
  }

  public BusinessException(String message)
  {
    super(message);
  }

  public BusinessException(String message, Throwable cause) {
    super(message, cause);
  }

  public BusinessException(Throwable cause) {
    super(cause);
  }
}