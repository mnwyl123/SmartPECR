package com.dcits.supervise.pecr.AObjectionHandingInterface;

import javax.jws.WebService;

/**
 * 拿到WSDL文件后该接口名以及所在的包路径均需要按实际情况进行修改
 *
 * 发文中的地址：http://servername /creditreference/v2/trial/Appname/ServiceAccept
 * 其中，servername 是机构接入征信系统服务器 IP 地址，如 9.0.81.30，Appname 为应用名称，如 channel-query。
 *
 * @author 穆楠
 * @date 2020/10/19 - 14:57
 */
@WebService(targetNamespace = "http://servername/creditreference/v2/trial/Appname/ServiceAccept", name = "ServiceName")
public interface ServiceName {

    //获取个人待核查异议事项接口
    public String psGetToCheckObjReq(String querymessage);

    //获取个人待核查异议事项附件信息接口
    public String psGetEncloReq(String querymessage);

    //反馈个人异议事项核查结果接口
    public String psObjCheckResultReq(String querymessage);

    //反馈个人异议事项更正结果接口
    public String psObjCorrectResultReq(String querymessage);

    //查询个人异议事项更正结果接受情况接口
    public String psObjCorrectResultQueryReq(String querymessage);

    //添加个人标注接口
    public String psAddTagReq(String querymessage);

    //删除个人标注接口
    public String psDelTagReq(String querymessage);
  
    /**
     * wzy
     * 下面为企业的接口
     */
  //获取个人待核查异议事项接口
    public String bsGetToCheckObjReq(String querymessage);

    //获取个人待核查异议事项附件信息接口
    public String bsGetEncloReq(String querymessage);

    //反馈个人异议事项核查结果接口
    public String bsObjCheckResultReq(String querymessage);

    //反馈个人异议事项更正结果接口
    public String bsObjCorrectResultReq(String querymessage);

    //查询个人异议事项更正结果接受情况接口
    public String bsObjCorrectResultQueryReq(String querymessage);

    //添加个人标注接口
    public String bsAddTagReq(String querymessage);

    //删除个人标注接口
    public String bsDelTagReq(String querymessage);
}
