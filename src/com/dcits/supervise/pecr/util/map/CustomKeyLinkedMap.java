package com.dcits.supervise.pecr.util.map;


import java.util.LinkedHashMap;
import java.util.Map;


public abstract class CustomKeyLinkedMap<K, V> extends LinkedHashMap<K, V>
{
    private static final long serialVersionUID = 4043263744224569870L;
    
    public CustomKeyLinkedMap() {
    }
    
    public CustomKeyLinkedMap(final int initialCapacity, final float loadFactor) {
        super(initialCapacity, loadFactor);
    }
    
    public CustomKeyLinkedMap(final int initialCapacity) {
        this(initialCapacity, 0.75f);
    }
    
    public CustomKeyLinkedMap(final Map<? extends K, ? extends V> m) {
        super((int)(m.size() / 0.75));
        this.putAll(m);
    }
    
    public CustomKeyLinkedMap(final float loadFactor, final Map<? extends K, ? extends V> m) {
        super(m.size(), loadFactor);
        this.putAll(m);
    }
    
    @Override
    public V get(final Object key) {
        return super.get(this.customKey(key));
    }
    
    @Override
    public V put(final K key, final V value) {
        return super.put((K)this.customKey(key), value);
    }
    
    @Override
    public void putAll(final Map<? extends K, ? extends V> m) {
        for (final Map.Entry<? extends K, ? extends V> entry : m.entrySet()) {
            this.put(entry.getKey(), entry.getValue());
        }
    }
    
    @Override
    public boolean containsKey(final Object key) {
        return super.containsKey(this.customKey(key));
    }
    
    protected abstract Object customKey(final Object p0);
}
