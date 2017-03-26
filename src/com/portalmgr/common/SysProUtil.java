package com.portalmgr.common;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;


public class SysProUtil {

	private static SysProUtil instance;
	private static Properties properties = new Properties();
	private Log logger = LogFactory.getLog(getClass());
	private static boolean init = false;
	
	public static SysProUtil getInstance() {
		return instance;
	}

	public static Properties getProperties() {
		return properties;
	}


	/**
	 * 初始化配置文件
	 */
	public void initialize() {
		if (init) {
			return;
		}
		init = true;
		instance = this;
		refresh();
	}
	
	/**
	 * 刷新配置文件
	 */
	public void refresh() {
		if (!init) {
			return;
		}
		logger.info("正在重新读取配置文件project.properties...");
		properties.clear();
		InputStream in = SysProUtil.class.getClassLoader().getResourceAsStream("config/project.properties");
		
		try {
			properties.load(in);
			logger.info("读取配置文件记录共计  " + properties.size() + " 条!");
		}  catch (Exception ex) {
			logger.error("读取配置文件错误\n" + ex.getMessage(), ex);
			ex.printStackTrace();
		}
	}
	
	public static String getProperty(String key) {
		String v;
		try {
			v = new String(properties.getProperty(key+"").getBytes("ISO8859-1"), "UTF-8");
			String value = resolve(v);
			return value;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        return "";
	}
	
	/**
	 * 功能描述: 递归解析配置文件中的${}符号，使配置文件支持引用变量
	 * @param value
	 * @return
	 */
	private static String resolve(String value){
		if(value!=null){
			int index = value.indexOf("${");
			while(index!=-1){
				int length = value.length();
				for (int i = index; i < length; i++) {
					if(value.charAt(i)=='}'){
						String key = value.substring(index+2,i);
						String tmpValue = resolve(properties.getProperty(key));
						if(tmpValue!=null){
							value = tmpValue+value.substring(i+1);
						}
						break;
					}
				}
				index = value.indexOf("${");
			}
		}
		return value;
	}







}




