package com.portalmgr.common;


import javax.servlet.http.HttpServletRequest;


/**
 * 上下文信息
 * @author Administrator
 *
 */
public class CommonContext {

	public static UserSessionInfo getUsessionInfo(HttpServletRequest request){
		Object session = (UserSessionInfo) request.getSession().getAttribute(ClientConstantPool.SESSION_KEY);
		if(session!=null)
		return (UserSessionInfo)session;
		else return null;
	}
	
	/**
	 * 将需要的值保存到session中
	 * @param key
	 * @param ob
	 * @param request
	 */
	public static void setSessionValue(String key,Object ob,HttpServletRequest request){
		request.getSession().setAttribute(key, ob);
	}
	
	/**
	 * 获取session中的值
	 * @param key
	 * @param request
	 * @return
	 */
	public static Object getSessionValue(String key,HttpServletRequest request){
		return request.getSession().getAttribute(key);
	}

	public static void removeSessionValue(String userKey,HttpServletRequest request) {
		request.getSession().removeAttribute(userKey);
	}
}
