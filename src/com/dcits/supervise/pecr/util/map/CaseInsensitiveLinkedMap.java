package com.dcits.supervise.pecr.util.map;


import java.util.Map;

public class CaseInsensitiveLinkedMap<K, V> extends CustomKeyLinkedMap<K, V>
{
  private static final long serialVersionUID = 4043263744224569870L;

  public CaseInsensitiveLinkedMap()
  {
  }

  public CaseInsensitiveLinkedMap(int initialCapacity, float loadFactor)
  {
    super(initialCapacity, loadFactor);
  }

  public CaseInsensitiveLinkedMap(int initialCapacity)
  {
    super(initialCapacity);
  }

  public CaseInsensitiveLinkedMap(Map<? extends K, ? extends V> m)
  {
    super(m);
  }

  public CaseInsensitiveLinkedMap(float loadFactor, Map<? extends K, ? extends V> m)
  {
    super(loadFactor, m);
  }

  protected Object customKey(Object key)
  {
    if ((null != key) && ((key instanceof CharSequence))) {
      key = key.toString().toLowerCase();
    }
    return key;
  }
}