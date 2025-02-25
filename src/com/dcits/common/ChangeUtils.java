package com.dcits.common;

import java.text.DecimalFormat;

public class ChangeUtils {
	
	public static String stringToFStr(String str){
		Double d = Double.parseDouble(str);
		DecimalFormat decimalFormat = new DecimalFormat("0.00");
		String a = decimalFormat.format(d);
		return a;
	}

}



