package com.dcits.supervise.pecr.util;

public abstract class SrcToDestCopier<T, C extends SrcToDestCopier<T, C>> implements Copier<T>
{
    protected T src;
    protected T dest;
    protected Filter<T> copyFilter;
    
    public T getSrc() {
        return this.src;
    }
    
    public C setSrc(final T src) {
        this.src = src;
        return (C)this;
    }
    
    public T getDest() {
        return this.dest;
    }
    
    public C setDest(final T dest) {
        this.dest = dest;
        return (C)this;
    }
    
    public Filter<T> getCopyFilter() {
        return this.copyFilter;
    }
    
    public C setCopyFilter(final Filter<T> copyFilter) {
        this.copyFilter = copyFilter;
        return (C)this;
    }
}