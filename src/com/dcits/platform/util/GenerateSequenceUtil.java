package com.dcits.platform.util;

import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.Format;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
 
import org.apache.log4j.Logger;
 
public class GenerateSequenceUtil {
 
    /** .log */
    private static final Logger logger = Logger.getLogger(GenerateSequenceUtil.class);
 
    /** The FieldPosition. */
    private static final FieldPosition HELPER_POSITION = new FieldPosition(0);
 
    /** This Format for format the data to special format. */
    private final static Format dateFormat = new SimpleDateFormat("yyyyMMddHHmmssS");
 
    /** This Format for format the number to special format. */
    private final static NumberFormat numberFormat = new DecimalFormat("0000");
 
    /** This int is the sequence number ,the default value is 0. */
    private static int seq = 0;
 
    private static final int MAX = 9999;
 
    /**
     * 时间格式生成序列
     * @return String
     */
    public static synchronized String generateSequenceNo(Date now) {
 
        StringBuffer sb = new StringBuffer();
 
        dateFormat.format(now, sb, HELPER_POSITION);
 
        numberFormat.format(seq, sb, HELPER_POSITION);
 
        if (seq == MAX) {
            seq = 0;
        } else {
            seq++;
        }
 
        logger.debug("THE SQUENCE IS :" + sb.toString());
 
        return sb.toString();
    }
}
