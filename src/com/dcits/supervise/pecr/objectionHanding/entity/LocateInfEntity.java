package com.dcits.supervise.pecr.objectionHanding.entity;


import java.io.Serializable;

/**
 * 定位信息数据项集合元素
 * @author liuyno
 * @date 2020/9/15 - 15:19
 */
public class LocateInfEntity implements Serializable {

    private static final long serialVersionUID = -700035992295637709L;

    //主键ID
    private String locateInfId;
    //关联征信中心异议处理综合实体类主表的ID
    private String creditCenterObjHandingId;
    //定位信息类别
    private String locateInfType;

    public LocateInfEntity() {
    }

    public LocateInfEntity(String locateInfId, String creditCenterObjHandingId, String locateInfType) {
        this.locateInfId = locateInfId;
        this.creditCenterObjHandingId = creditCenterObjHandingId;
        this.locateInfType = locateInfType;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getLocateInfId() {
        return locateInfId;
    }

    public void setLocateInfId(String locateInfId) {
        this.locateInfId = locateInfId;
    }

    public String getCreditCenterObjHandingId() {
        return creditCenterObjHandingId;
    }

    public void setCreditCenterObjHandingId(String creditCenterObjHandingId) {
        this.creditCenterObjHandingId = creditCenterObjHandingId;
    }

    public String getLocateInfType() {
        return locateInfType;
    }

    public void setLocateInfType(String locateInfType) {
        this.locateInfType = locateInfType;
    }

    @Override
    public String toString() {
        return "LocateInfEntity{" +
                "locateInfId='" + locateInfId + '\'' +
                ", creditCenterObjHandingId='" + creditCenterObjHandingId + '\'' +
                ", locateInfType='" + locateInfType + '\'' +
                '}';
    }
}
