package com.dcits.supervise.pecr.util;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import com.dcits.supervise.pecr.exceptions.UtilException;

public class URLUtil {

	public static URI toURI(final URL url) throws UtilException {
        if (null == url) {
            return null;
        }
        try {
            return url.toURI();
        }
        catch (URISyntaxException e) {
            throw new UtilException((Throwable)e);
        }
    }

	 public static URI toURI(final String location) throws UtilException {
	        try {
	            return new URI(location.replace(" ", "%20"));
	        }
	        catch (URISyntaxException e) {
	            throw new UtilException((Throwable)e);
	        }
	    }
}
