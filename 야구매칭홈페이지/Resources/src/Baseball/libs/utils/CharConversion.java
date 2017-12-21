package Baseball.libs.utils;

import java.io.UnsupportedEncodingException;

public class CharConversion {
	public static String entoutf8(String en){
		String utf8 = null;
		try{
			utf8 = new String(en.getBytes("ISO8859_1"), "utf-8");
		}catch(UnsupportedEncodingException e){}
		return utf8;
	}
	public static String utf8toen(String utf8){
		String en = null;
		try{
			en = new String(utf8.getBytes("utf-8"), "ISO8859_1");
		}catch(UnsupportedEncodingException e){}
		return en;
	}
}
