package com.portalmgr.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author   TuJianqun
 * @version Date：2012-12-12 上午9:33:24
 * @description:
 */
public class MD5Util {
   public static String MD5(String password){
	   try {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		String pwd = new BigInteger(1, md.digest()).toString(16);
		int l=32-pwd.length();
		for(int i=l;i>0;i--){
			pwd=0+pwd;
		}
		return pwd;
	} catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
	}
	   return null;
   }
   /**
    * Md5加密
    * @param password
    * @return
    */
   public static String encodeStr(String password){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());
			StringBuilder sb = new StringBuilder();
			byte[] newByte = md.digest();
			// 转换为16进制
			for (int i = 0; i < newByte.length; i++) {
				if ((newByte[i] & 0xff) < 0x10) {
					sb.append("0");
				}
				sb.append(Long.toString(newByte[i] & 0xff, 16));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
  }
   
   public static void main(String args[]) throws NoSuchAlgorithmException{
	   //a = cc175b9c0f1b6a831c399e269772661
	   System.out.println(MD5Util.MD5("855671"));
	   //a md5 = 0cc175b9c0f1b6a831c399e269772661
	   System.out.println(MD5Util.encodeStr("855671"));
   }
}
