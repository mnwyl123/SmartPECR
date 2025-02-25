package com.dcits.supervise.pecr.util;

import com.dcits.supervise.pecr.util.json.JSONException;
import com.dcits.supervise.pecr.util.json.JSONObject;

public class XML {
	
	public static final Character AMP = Character.valueOf('&');

	  public static final Character APOS = Character.valueOf('\'');

	  public static final Character BANG = Character.valueOf('!');

	  public static final Character EQ = Character.valueOf('=');

	  public static final Character GT = Character.valueOf('>');

	  public static final Character LT = Character.valueOf('<');

	  public static final Character QUEST = Character.valueOf('?');

	  public static final Character QUOT = Character.valueOf('"');

	  public static final Character SLASH = Character.valueOf('/');
	  
//	  private static boolean parse(XMLTokener x, JSONObject context, String name, boolean keepStrings)
//			    throws JSONException
//			  {
//			    JSONObject jsonobject = null;
//
//			    Object token = x.nextToken();
//
//			    if (token == BANG) {
//			      char c = x.next();
//			      if (c == '-') {
//			        if (x.next() == '-') {
//			          x.skipPast("-->");
//			          return false;
//			        }
//			        x.back();
//			      } else if (c == '[') {
//			        token = x.nextToken();
//			        if (("CDATA".equals(token)) && 
//			          (x.next() == '[')) {
//			          String string = x.nextCDATA();
//			          if (string.length() > 0) {
////			            context.accumulate("content", string);
//			          }
//			          return false;
//			        }
//
//			        throw x.syntaxError("Expected 'CDATA['");
//			      }
//			      int i = 1;
//			      do {
//			        token = x.nextMeta();
//			        if (token == null)
//			          throw x.syntaxError("Missing '>' after '<!'.");
//			        if (token == LT)
//			          i++;
//			        else if (token == GT)
//			          i--;
//			      }
//			      while (i > 0);
//			      return false;
//			    }if (token == QUEST)
//			    {
//			      x.skipPast("?>");
//			      return false;
//			    }if (token == SLASH)
//			    {
//			      token = x.nextToken();
//			      if (name == null) {
//			        throw x.syntaxError(new StringBuilder().append("Mismatched close tag ").append(token).toString());
//			      }
//			      if (!token.equals(name)) {
//			        throw x.syntaxError(new StringBuilder().append("Mismatched ").append(name).append(" and ").append(token).toString());
//			      }
//			      if (x.nextToken() != GT) {
//			        throw x.syntaxError("Misshaped close tag");
//			      }
//			      return true;
//			    }
//			    if ((token instanceof Character)) {
//			      throw x.syntaxError("Misshaped tag");
//			    }
//
//			    String tagName = (String)token;
//			    token = null;
//			    jsonobject = new JSONObject();
//			    while (true) {
//			      if (token == null) {
//			        token = x.nextToken();
//			      }
//
//			      if (!(token instanceof String)) break;
//			      String string = (String)token;
//			      token = x.nextToken();
//			      if (token == EQ) {
//			        token = x.nextToken();
//			        if (!(token instanceof String)) {
//			          throw x.syntaxError("Missing value");
//			        }
////			        jsonobject.accumulate(string, keepStrings ? token : InternalJSONUtil.stringToValue((String)token));
//			        token = null; continue;
//			      }
////			      jsonobject.accumulate(string, "");
//			    }
//
//			    if (token == SLASH)
//			    {
//			      if (x.nextToken() != GT) {
//			        throw x.syntaxError("Misshaped tag");
//			      }
////			      if (jsonobject.size() > 0)
//////			        context.accumulate(tagName, jsonobject);
////			      else {
//////			        context.accumulate(tagName, "");
////			      }
//			      return false;
//			    }
//			    if (token == GT) {
//			      do {
//			        while (true) {
//			          token = x.nextContent();
//			          if (token == null) {
//			            if (tagName != null) {
//			              throw x.syntaxError(new StringBuilder().append("Unclosed tag ").append(tagName).toString());
//			            }
//			            return false;
//			          }if (!(token instanceof String)) break;
//			          String string = (String)token;
//			          if (string.length() > 0)
//			            jsonobject.accumulate("content", keepStrings ? token : InternalJSONUtil.stringToValue(string));
//			        }
//			      }
//			      while ((token != LT) || 
//			        (!parse(x, jsonobject, tagName, keepStrings)));
//			      if (jsonobject.size() == 0)
//			        context.accumulate(tagName, "");
//			      else if ((jsonobject.size() == 1) && (jsonobject.get("content") != null))
//			        context.accumulate(tagName, jsonobject.get("content"));
//			      else {
//			        context.accumulate(tagName, jsonobject);
//			      }
//			      return false;
//			    }
//
//			    throw x.syntaxError("Misshaped tag");
//			  }

	 public static JSONObject toJSONObject(String string)
			    throws JSONException
			  {
			    return toJSONObject(string, false);
			  }

			  public static JSONObject toJSONObject(String string, boolean keepStrings)
			    throws JSONException
			  {
			    JSONObject jo = new JSONObject();
			    XMLTokener x = new XMLTokener(string);
			    while ((x.more()) && (x.skipPast("<"))) {
//			      parse(x, jo, null, keepStrings);
			    }
			    return jo;
			  }
}
