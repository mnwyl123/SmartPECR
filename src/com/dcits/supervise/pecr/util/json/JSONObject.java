package com.dcits.supervise.pecr.util.json;


import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.collections.map.CaseInsensitiveMap;

import com.dcits.supervise.pecr.util.ArrayUtil;
import com.dcits.supervise.pecr.util.StrUtil;
import com.dcits.supervise.pecr.util.map.CaseInsensitiveLinkedMap;


public class JSONObject  implements JSON, Map<String, Object>
{
    private static final long serialVersionUID = -330220388580734346L;
    private static final int DEFAULT_CAPACITY = 16;
    private final Map<String, Object> rawHashMap;
    private JSONConfig config;
    
    public JSONObject() {
        this(16, false);
    }
    
    public JSONObject(final boolean isOrder) {
        this(16, isOrder);
    }
    
    public JSONObject(final int capacity, final boolean isOrder) {
        this(capacity, false, isOrder);
    }
    
    public JSONObject(final int capacity, final boolean isIgnoreCase, final boolean isOrder) {
        this(capacity, JSONConfig.create().setIgnoreCase(isIgnoreCase).setOrder(isOrder));
    }
    

    public JSONObject(int capacity, JSONConfig config)
    {
      if (config.isIgnoreCase())
        this.rawHashMap = (config.isOrder() ? new CaseInsensitiveLinkedMap(capacity) : new CaseInsensitiveMap(capacity));
      else {
        this.rawHashMap = (config.isOrder() ? new LinkedHashMap(capacity) : new HashMap(capacity));
      }
      this.config = config;
    }
    

    public JSONObject(Object source)
    {
      this(source, true);
    }

    public JSONObject(Object source, boolean ignoreNullValue)
    {
      this(16, JSONConfig.create().setOrder(source instanceof LinkedHashMap).setIgnoreCase(((source instanceof CaseInsensitiveMap)) || ((source instanceof CaseInsensitiveLinkedMap))).setIgnoreNullValue(ignoreNullValue));

      init(source);
    }
    
    

    private void init( Object source) {
//        if (null != source) {
//            if (source instanceof Map) {
//                final boolean ignoreNullValue = this.config.isIgnoreNullValue();
//                for (Entry<?, ?> e : ((Map)source).entrySet()) {
//                    final Object value = e.getValue();
//                    if (!ignoreNullValue || null != value) {
//                        this.rawHashMap.put(Convert.toStr((Object)e.getKey()), JSONUtil.wrap(value, ignoreNullValue));
//                    }
//                }
//            }
//            else if (source instanceof CharSequence) {
//                this.init((CharSequence)source);
//            }
//            else if (!(source instanceof Number)) {
//                this.populateMap(source);
//            }
//        }
    }
    
    private void init(final CharSequence source) {
        this.init(new JSONTokener(source.toString()));
    }
    
    private void init(final JSONTokener x) {
        if (x.nextClean() != '{') {
            throw x.syntaxError("A JSONObject text must begin with '{'");
        }
        while (true) {
            char c = x.nextClean();
            switch (c) {
                case '\0': {
                    throw x.syntaxError("A JSONObject text must end with '}'");
                }
                case '}': {}
                default: {
                    x.back();
                    final String key = x.nextValue().toString();
                    c = x.nextClean();
                    if (c != ':') {
                        throw x.syntaxError("Expected a ':' after a key");
                    }
                    this.putOnce(key, x.nextValue());
                    switch (x.nextClean()) {
                        case ',':
                        case ';': {
                            if (x.nextClean() == '}') {
                                return;
                            }
                            x.back();
                            continue;
                        }
                        case '}': {
                            return;
                        }
                        default: {
                            throw x.syntaxError("Expected a ',' or '}'");
                        }
                    }
                }
            }
        }
    }
    
    public JSONObject putOnce(String key, Object value)
    	    throws JSONException
    	  {
    	    if ((key != null) && (value != null)) {
    	      if (this.rawHashMap.containsKey(key)) {
    	        throw new JSONException("Duplicate key \"{}\"", new Object[] { key });
    	      }
    	      put(key, value);
    	    }
    	    return this;
    	  }

	@Override
	public int size() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean containsKey(Object key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean containsValue(Object value) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object get(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object put(String key, Object value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object remove(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void putAll(Map<? extends String, ? extends Object> m) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Set<String> keySet() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Object> values() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<java.util.Map.Entry<String, Object>> entrySet() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getByExp(String paramString) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T getByExp(String paramString, Class<T> paramClass) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getByPath(String paramString) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void putByPath(String paramString, Object paramObject) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public <T> T getByPath(String paramString, Class<T> paramClass) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Writer write(Writer paramWriter) throws JSONException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Writer write(Writer paramWriter, int paramInt1, int paramInt2) throws JSONException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String toJSONString(int paramInt) throws JSONException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String toStringPretty() throws JSONException {
		// TODO Auto-generated method stub
		return null;
	}

}