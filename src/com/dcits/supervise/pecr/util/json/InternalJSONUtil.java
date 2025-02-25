package com.dcits.supervise.pecr.util.json;

public class InternalJSONUtil {

	  public static Object stringToValue(String string)
	  {
	    if ((null == string) || ("null".equalsIgnoreCase(string))) {
	      return JSONNull.NULL;
	    }

	    if ("".equals(string)) {
	      return string;
	    }
	    if ("true".equalsIgnoreCase(string)) {
	      return Boolean.TRUE;
	    }
	    if ("false".equalsIgnoreCase(string)) {
	      return Boolean.FALSE;
	    }

	    char b = string.charAt(0);
	    if (((b >= '0') && (b <= '9')) || (b == '-'))
	      try {
	        if ((string.indexOf('.') > -1) || (string.indexOf('e') > -1) || (string.indexOf('E') > -1)) {
	          Double d = Double.valueOf(string);
	          if ((!d.isInfinite()) && (!d.isNaN()))
	            return d;
	        }
	        else {
	          Long myLong = new Long(string);
	          if (string.equals(myLong.toString())) {
	            if (myLong.longValue() == myLong.intValue()) {
	              return Integer.valueOf(myLong.intValue());
	            }
	            return myLong;
	          }
	        }
	      }
	      catch (Exception ignore)
	      {
	      }
	    return string;
	  }
}
