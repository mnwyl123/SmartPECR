package com.dcits.supervise.pecr.util;

/**
 * 常用常量类
 *
 * @author munan
 */
public class PecrConstantUtil {


    /**
     * 传递的生成报文StringBuffer对象
     */
    public final static String MESSAGE_BUFFER = "messageBuffer";
    /**
     * 传递的生成报文的名称
     */
    public final static String MESSAGE_NAME = "messageName";
    /**
     * 传递所需更新已生成报文对象的具体数据
     */
    public final static String UPDATE_MESSAGE = "updateMessage";
    /**
     * 传递已生成报文所需要插入新的报文信息 的具体数据对象
     */
    public final static String INSERT_REPORT_MESSAGE = "insertReportMessage";
    /**
     * 传递生成报文所需要更新的数据和报文名信息 的具体数据对象
     */
    public final static String INSERT_REPORT_NAME = "insertReportName";

    //异议处理状态
    /**
     * 异议处理状态-新记录
     */
    public final static String OBJECTION_HANDING_STATUS_10 = "10";
    /**
     * 异议处理状态-核查中
     */
    public final static String OBJECTION_HANDING_STATUS_20 = "20";
    /**
     * 异议处理状态-待更正
     */
    public final static String OBJECTION_HANDING_STATUS_40 = "40";
    /**
     * 异议处理状态-更正完成
     */
    public final static String OBJECTION_HANDING_STATUS_50 = "50";
    /**
     * 异议处理状态-结果已接受
     */
    public final static String OBJECTION_HANDING_STATUS_60 = "60";
    /**
     * 异议处理状态-归档
     */
    public final static String OBJECTION_HANDING_STATUS_70 = "70";
    //报文状态
    /**
     * 报文状态-报文已生成
     */
    public final static String REPORT_STATUS_SEND_NO = "10";
    /**
     * 报文状态-已报送
     */
    public final static String REPORT_STATUS_SEND_OK = "20";
    /**
     * 报文状态-报送成功
     */
    public final static String REPORT_STATUS_BACK_OK = "30";
    /**
     * 报文状态-反馈全出错  
     */
    public final static String REPORT_STATUS_BACK_ALL_ERROR = "40";
    /**
     * 报文状态-反馈全成功  
     */
    public final static String REPORT_STATUS_BACK_ALL_OK = "41";
    /**
     * 报文状态-反馈部分出错
     */
    public final static String REPORT_STATUS_BACK_PORT_ERROR = "50";
    /**
     * 报文状态-预处理成功
     */
    public final static String REPORT_STATUS_CHECK_OK = "60";
    /**
     * 报文状态-预处理全失败
     */
    public final static String REPORT_STATUS_CHECK_ALL_ERROR = "70";
    /**
     * 报文状态-预处理部分失败
     */
    public final static String REPORT_STATUS_CHECK_PORT_ERROR = "80";


    //数据状态
    /**
     * 数据状态-待校验
     */
    public final static String BUSINESS_STATUS_11 = "11";
    /**
     * 数据状态-校验失败
     */
    public final static String BUSINESS_STATUS_10 = "10";
    /**
     * 数据状态-校验成功
     */
    public final static String BUSINESS_STATUS_20 = "20";
    /**
     * 数据状态-审核通过
     */
    public final static String BUSINESS_STATUS_30 = "30";
    /**
     * 数据状态-审核拒绝
     */
    public final static String BUSINESS_STATUS_40 = "40";
    /**
     * 数据状态-已生成报文
     */
    public final static String BUSINESS_STATUS_50 = "50";
    /**
     * 数据状态-已上报
     */
    public final static String BUSINESS_STATUS_60 = "60";
    /**
     * 数据状态-上报成功
     */
    public final static String BUSINESS_STATUS_70 = "70";
    /**
     * 数据状态-80反馈错误
     */
    public final static String BUSINESS_STATUS_80 = "80";
    /**
     * 数据状态-中间状态（审核成功--生成报文中）
     */
    public final static String BUSINESS_STATUS_85 = "85";
    /**
     * 数据状态-生成报文中
     */
    public final static String BUSINESS_STATUS_90 = "90";
    /**
     * 数据状态-审核中
     */
    public final static String BUSINESS_STATUS_100 = "100";
    /**
     * 数据状态-预处理失败
     */
    public final static String BUSINESS_STATUS_110 = "110";
    /**
     * 数据状态-预处理成功
     */
    public final static String BUSINESS_STATUS_120 = "120";

    /**
     * 个人征信正常报文
     */
    public final static String INDV_NORMAL = "indvnormal";
    /**
     * 个人征信特殊报文
     */
    public final static String INDV_ABNORMAL = "indvabnormal";
    /**
     * 企业征信正常报文
     */
    public final static String ENT_NORMAL = "entnormal";
    /**
     * 企业征信特殊报文
     */
    public final static String ENT_ABNORMAL = "entabnormal";
    /**
     * 抵质押报文
     */
    public final static String MCC_NORMAL = "mccnormal";
    /**
     * 抵质押特殊报文
     */
    public final static String MCC_ABNORMAL = "mccabnormal";
    /**
     * 个人基本信息记录类型
     */
    public final static String INDV_BS_SGMT = "110";
    /**
     * 家族关系信息记录类型
     */
    public final static String IN_FAL_MMBS_INF = "120";
    /**
     * 个人证件有效信息记录类型
     */
    public final static String IN_ID_EFCT_INF = "130";
    /**
     * 个人证件整合信息记录类型
     */
    public final static String IN_CTF_ITG_INF = "140";
    /**
     * 个人借贷账户信息记录类型
     */
    public final static String ACCT_BS_SGMT = "210";
    /**
     * 个人借贷账户特殊事件说明信息记录类型
     */
    public final static String IN_SPC_EVT_DSC_INF = "215";
    /**
     * 个人借贷账户信息-C1账户类型
     */
    public final static String ACCT_BS_SGMT_C1 = "C1";
    /**
     * 个人借贷账户信息-R2账户类型
     */
    public final static String ACCT_BS_SGMT_R2 = "R2";
    /**
     * 个人授信协议信息记录类型
     */
    public final static String CTRCT_BS_SGMT = "220";
    /**
     * 个人担保账户信息记录类型
     */
    public final static String IN_SEC_ACCT_INF = "230";
    /**
     * 企业基本信息
     */
    public final static String ENT_BS_SGMT = "310";
    /**
     * 事业单位收入支出
     */
    public final static String ENT_INCOME_AND_EXPENSE_STATEME_BS = "650";
    /**
     * 企业间关联关系信息
     */
    public final static String ENT_EN_ICDN_RLTP_INF = "350";
    /**
     * 企业借贷账户交易
     */
    public final static String ENT_ACCT_BS_SGMT = "410";
    /**
     * 企业担保账户交易
     */
    public final static String ENT_GUAR_ACCT_BS_SGMT = "440";

    /**
     * 企业授信协议信息
     */
    public final static String ENT_EN_CTRCT_INF = "420";

    /**
     * 企业资产负债表
     */
    public final static String ENT_BALANCE_SHEET = "610";

    /**
     * 企业现金流量表
     */
    public final static String ENT_CASH_FLOWS = "630";

    /**
     * 企业利润及利润分配表
     */
    public final static String ENT_INCODE_STATE_PRO = "620";

    /**
     * 事业单位资产负债表
     */
    public final static String ENT_INST_BALANCE = "640";


    //抵质押合同模块
    /**
     * 抵（质）押合同正常报文
     */
    public final static String MOTGA_CLTAL_CTRCT_INF = "510";

    /**
     * 抵（质）押合同标识变更
     */
    public final static String MOC_ID_CAGS_INF = "511";
    /**
     * 抵（质）押合同整笔删除
     */
    public final static String MOC_ENT_DEL = "514";

    //特殊报文

    //个人特殊
    /**
     * 个人基本信息整笔删除请求记录表
     */
    public final static String IN_BS_INF_DLT = "114";
    /**
     * 134-个人证件有效期信息整笔删除请求记录表
     */
    public final static String IN_ID_EFCT_INF_DLT = "134";
    /**
     * 211-个人借贷账户标识变更请求记录表
     */
    public final static String IN_ACCT_ID_CAGS_INF = "211";
    /**
     * 212-个人借贷账户按段更正
     */
    public final static String IN_ACCT_MDFC = "212";
    /**
     * 213-个人借贷账户按段删除请求记录表
     */
    public final static String IN_ACCT_DEL = "213";
    /**
     * 214-个人借贷账户整笔删除请求记录表
     */
    public final static String IN_ACCT_ENT_DEL = "214";
    /**
     * 221-个人授信协议标识变更
     */
    public final static String IN_CTRCT_ID_CAGS_INF = "221";
    /**
     * 222-个人授信协议按段更正请求记录
     */
    public final static String IN_CTRCT_MDFC = "222";
    /**
     * 223-个人授信协议按段删除请求记录表
     */
    public final static String IN_CTRCT_DEL = "223";
    /**
     * 224-个人授信协议整笔删除请求记录表
     */
    public final static String IN_CTRCT_ENT_DEL = "224";
    /**
     * 231-个人担保账户标识变更请求记录表
     */
    public final static String IN_SEC_ACCT_ID_CAGS_INF = "231";
    /**
     * 个人担保账户按段更正
     */
    public final static String IN_SEC_ACCT_MDFC = "232";
    /**
     * 233-个人担保账户按段删除请求记录表
     */
    public final static String IN_SEC_ACCT_DEL = "233";
    /**
     * 234-个人担保账户整笔删除请求记录表
     */
    public final static String IN_SEC_ACCT_ENT_DEL = "234";

    //企业特殊
    /**
     * 614-企业资产负债表整笔删除请求记录
     */
    public final static String ENT_BALANCE_SHEET_DLT = "614";
    /**
     * 624-企业利润及利润分配表整笔删除请求记录
     */
    public final static String ENT_INCODE_STATE_PRO_DLT = "624";
    /**
     * 634-企业现金流量表整笔删除请求记录
     */
    public final static String ENT_CASH_FLOWS_DLT = "634";
    /**
     * 644-事业单位资产负债表整笔删除请求记录
     */
    public final static String ENT_INST_BALANCE_DLT = "644";
    /**
     * 654-事业单位收入支出表整笔删除请求记录
     */
    public final static String ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT = "654";
    /**
     * 441-企业担保账户标识变更请求记录
     */
    public final static String EN_SEC_ACCT_ID_CAGS_INF = "441";
    /**
     * 442-企业担保账户更正请求记录
     */
    public final static String EN_SEC_ACCT_MDFC = "442";
    /**
     * 443-企业担保账户按段删除请求记录
     */
    public final static String EN_SEC_ACCT_DEL = "443";
    /**
     * 444-企业担保账户整笔删除请求记录
     */
    public final static String EN_SEC_ACCT_ENT_DEL = "444";
    /**
     * 314-企业基本信息整笔删除请求记录
     */
    public final static String EN_BS_INF_DLT = "314";
    /**
     * 411-企业借贷账户信息标识变更请求记录
     */
    public final static String EN_ACCT_INF_ID_CAGS_INF = "411";
    /**
     * 412-企业借贷账户更正请求类记录
     */
    public final static String EN_ACCT_INF_MDFC = "412";
    /**
     * 413-企业借贷账户按段删除请求类记录
     */
    public final static String EN_ACCT_INF_DEL = "413";
    /**
     * 414-企业借贷账户整笔删除请求类记录
     */
    public final static String EN_ACCT_INF_ENT_DEL = "414";
    /**
     * 421-企业授信协议标识变更请求记录
     */
    public final static String EN_CTRCT_INF_ID_CAGS_INF = "421";
    /**
     * 422-企业授信协议按段更正请求记录
     */
    public final static String EN_CTRCT_INF_MDFC = "422";
    /**
     * 423-企业授信协议按段删除请求记录
     */
    public final static String EN_CTRCT_INF_DEL = "423";
    /**
     * 424-企业授信协议整笔删除请求记录
     */
    public final static String EN_CTRCT_INF_ENT_DEL = "424";

    /**
     * 异议处理报文-报文类型
     */
    //获取个人待核查异议事项-请求报文
    public final static String PORM_OBJECTION_MSG_TYPE = "G101";

    //获取个人待核查异议事项-应答报文
    public final static String POAM_OBJECTION_MSG_TYPE = "G102";

    //获取个人待核查异议事项附件信息-请求报文
    public final static String RTPB_OBJECTION_MSG_TYPE = "G103";

    //获取个人待核查异议事项附件信息-应答报文
    public final static String ATPB_OBJECTION_MSG_TYPE = "G104";

    //反馈个人异议事项核查结果-请求报文
    public final static String RMF_OBJECTION_MSG_TYPE = "G105";

    //反馈个人异议事项更正结果-请求报文
    public final static String FRMC_OBJECTION_MSG_TYPE = "G106";

    //查询个人异议事项更正结果接受情况-请求报文
    public final static String IPMC_OBJECTION_MSG_TYPE = "G107";

    //查询个人异议事项更正结果接受情况-应答报文
    public final static String APMC_OBJECTION_MSG_TYPE = "G108";

    //添加个人标注-请求报文
    public final static String APLR_OBJECTION_MSG_TYPE = "G109";

    //添加个人标注-应答报文
    public final static String APLA_OBJECTION_MSG_TYPE = "G110";

    //删除个人标注-请求报文
    public final static String DPLR_OBJECTION_MSG_TYPE = "G111";

    //通用-应答报文
    public final static String GRM_OBJECTION_MSG_TYPE = "G199";
    
    //获取企业待核查异议事项-请求报文
    public final static String ENT_PORM_OBJECTION_MSG_TYPE = "G151";

    //获取企业待核查异议事项-应答报文
    public final static String ENT_POAM_OBJECTION_MSG_TYPE = "G152";

    //获取企业待核查异议事项附件信息-请求报文
    public final static String ENT_RTPB_OBJECTION_MSG_TYPE = "G153";

    //获取企业待核查异议事项附件信息-应答报文
    public final static String ENT_ATPB_OBJECTION_MSG_TYPE = "G154";

    //反馈企业异议事项核查结果-请求报文
    public final static String ENT_RMF_OBJECTION_MSG_TYPE = "G155";

    //反馈企业异议事项更正结果-请求报文
    public final static String ENT_FRMC_OBJECTION_MSG_TYPE = "G156";

    //查询企业异议事项更正结果接受情况-请求报文
    public final static String ENT_IPMC_OBJECTION_MSG_TYPE = "G157";

    //查询企业异议事项更正结果接受情况-应答报文
    public final static String ENT_APMC_OBJECTION_MSG_TYPE = "G158";

    //添加企业标注-请求报文
    public final static String ENT_APLR_OBJECTION_MSG_TYPE = "G159";

    //添加企业标注-应答报文
    public final static String ENT_APLA_OBJECTION_MSG_TYPE = "G160";

    //删除企业标注-请求报文
    public final static String ENT_DPLR_OBJECTION_MSG_TYPE = "G161";

    //通用-应答报文
    public final static String ENT_GRM_OBJECTION_MSG_TYPE = "G199";


    //更新报文段标识
    //个人借贷更新段标识
    /**
     * 个人借贷更新报文更正段标识——B-基础段
     */
    public final static String IN_ACCT_MDFC_B = "B";
    /**
     * 个人借贷更新报文更正段标识——C-基本信息段
     */
    public final static String IN_ACCT_MDFC_C = "C";
    /**
     * 个人借贷更新报文更正段标识——D-相关还款责任人段
     */
    public final static String IN_ACCT_MDFC_D = "D";
    /**
     * 个人借贷更新报文更正段标识——E-抵质押物信息段
     */
    public final static String IN_ACCT_MDFC_E = "E";
    /**
     * 个人借贷更新报文更正段标识——F-授信额度信息段
     */
    public final static String IN_ACCT_MDFC_F = "F";
    /**
     * 个人借贷更新报文更正段标识——G-初始债权说明段
     */
    public final static String IN_ACCT_MDFC_G = "G";
    /**
     * 个人借贷更新报文更正段标识——H-月度表现信息段
     */
    public final static String IN_ACCT_MDFC_H = "H";
    /**
     * 个人借贷更新报文更正段标识——I-大额专项分期信息段
     */
    public final static String IN_ACCT_MDFC_I = "I";
    /**
     * 个人借贷更新报文更正段标识——J-非月度表现信息段
     */
    public final static String IN_ACCT_MDFC_J = "J";
    /**
     * 个人借贷更新报文更正段标识——K-特殊交易说明段
     */
    public final static String IN_ACCT_MDFC_K = "K";

    //个人授信更正段标识

    /**
     * 个人授信协议按段更正段——B-基础段
     */
    public final static String IN_CTRCT_MDFC_B = "B";
    /**
     * 个人授信协议按段更正段——C-共同受信人信息段
     */
    public final static String IN_CTRCT_MDFC_C = "C";
    /**
     * 个人授信协议按段更正段——D-额度信息段
     */
    public final static String IN_CTRCT_MDFC_D = "D";

    //个人担保段更正段标识
    /**
     * 个人担保账户按段更正段——B-基础段
     */
    public final static String IN_SEC_ACCT_MDFC_B = "B";
    /**
     * 个人担保账户按段更正段——C-基本信息段
     */
    public final static String IN_SEC_ACCT_MDFC_C = "C";
    /**
     * 个人担保账户按段更正段——D-在保责任信息段
     */
    public final static String IN_SEC_ACCT_MDFC_D = "D";
    /**
     * 个人担保账户按段更正段——E-相关还款责任人段
     */
    public final static String IN_SEC_ACCT_MDFC_E = "E";
    /**
     * 个人担保账户按段更正段——F-抵质押物信息段
     */
    public final static String IN_SEC_ACCT_MDFC_F = "F";


    //企业授信更正段标识
    /**
     * 422-企业授信协议按段更正段标识——B-基础段
     */
    public final static String EN_CTRCT_INF_MDFC_B = "B";
    /**
     * 422-企业授信协议按段更正段标识——C-共同受信人信息段
     */
    public final static String EN_CTRCT_INF_MDFC_C = "C";
    /**
     * 422-企业授信协议按段更正段标识——D-额度信息段
     */
    public final static String EN_CTRCT_INF_MDFC_D = "D";

    //企业担保更正段标识
    /**
     * 企业担保更正段标识——B-基础段
     */
    public final static String EN_SEC_ACCT_MDFC_B = "B";
    /**
     * 企业担保更正段标识——C-基本信息段
     */
    public final static String EN_SEC_ACCT_MDFC_C = "C";
    /**
     * 企业担保更正段标识——D-在保责任信息段
     */
    public final static String EN_SEC_ACCT_MDFC_D = "D";
    /**
     * 企业担保更正段标识——E-相关还款责任人段
     */
    public final static String EN_SEC_ACCT_MDFC_E = "E";
    /**
     * 企业担保更正段标识——F-抵质押物信息段
     */
    public final static String EN_SEC_ACCT_MDFC_F = "F";
    /**
     * 企业担保更正段标识——G-授信额度信息段
     */
    public final static String EN_SEC_ACCT_MDFC_G = "G";


    //企业借贷更新报文更正段标识
    /**
     * 企业借贷更新报文更正段标识——B-基础段
     */
    public final static String EN_ACCT_INF_MDFC_B = "B";
    /**
     * 企业借贷更新报文更正段标识——C-基本信息段
     */
    public final static String EN_ACCT_INF_MDFC_C = "C";
    /**
     * 企业借贷更新报文更正段标识——D-相关还款责任人段
     */
    public final static String EN_ACCT_INF_MDFC_D = "D";
    /**
     * 企业借贷更新报文更正段标识——E-抵质押物信息段
     */
    public final static String EN_ACCT_INF_MDFC_E = "E";
    /**
     * 企业借贷更新报文更正段标识——F-授信额度信息段
     */
    public final static String EN_ACCT_INF_MDFC_F = "F";
    /**
     * 企业借贷更新报文更正段标识——G-初始债权说明段
     */
    public final static String EN_ACCT_INF_MDFC_G = "G";
    /**
     * 企业借贷更新报文更正段标识——H-还款表现信息段
     */
    public final static String EN_ACCT_INF_MDFC_H = "H";
    /**
     * 企业借贷更新报文更正段标识——I-特定交易说明段
     */
    public final static String EN_ACCT_INF_MDFC_I = "I";
}
