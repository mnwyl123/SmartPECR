package com.dcits.supervise.pecr.util.json;


import com.dcits.supervise.pecr.util.XML;

public final class JSONUtil
{
  public static JSONObject createObj()
  {
    return new JSONObject();
  }


  public static JSONObject parseFromXml(String xmlStr)
  {
    return XML.toJSONObject(xmlStr);
  }


}
