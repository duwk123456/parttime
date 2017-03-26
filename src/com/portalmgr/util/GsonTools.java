package com.portalmgr.util;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class GsonTools {
	
	private static final Gson gson = new Gson();
	
	
	/**
	 * @param <T>
	 * @param jsonString
	 * @param cls
	 * @return
	 */
	public static <T> T getObject(String jsonString, Class<T> cls) {
		T t = null;
		try {
			t = gson.fromJson(jsonString, cls);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	
	public static void writeJsonObj(HttpServletResponse response,Object obj) {


		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("text/json;charset=UTF-8");
		String jsonStr = "";
		if (obj != null) {
			try {
				jsonStr = getJson(obj);
				response.getWriter().write(jsonStr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


	public static void writeJsonObj1(HttpServletResponse response,HttpServletRequest request,Object obj) throws IOException {

		PrintWriter writer = null;
		try {
			String callback = request.getParameter("callback");
			//JSONObject jsonObject = JSONObject.fromObject(object);
			response.setContentType("application/json;charset=UTF-8");
			writer = response.getWriter();
			if(callback==null){
				writer.write( getJson(obj));
			}else{
				System.out.println(getJson(obj));
				writer.write(callback + "( " + getJson(obj) + ")");
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw new IOException("写出jsonp对象失败");
		} finally {
			if (writer != null) {
				writer.close();
			}
		}
	}
	

	/**
	 * @param jsonString
	 * @return
	 */
	public static List<String> getList(String jsonString) {
		List<String> list = new ArrayList<String>();
		try {
			list = gson.fromJson(jsonString, new TypeToken<List<String>>() {
			}.getType());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Map<String, Object>> listKeyMaps(String jsonString) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			list = gson.fromJson(jsonString,
					new TypeToken<List<Map<String, Object>>>() {
					}.getType());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Map<String, Object> keyMaps(String jsonString) {
		Map<String, Object> hashMap = new HashMap<String, Object>();
		try {
			hashMap = gson.fromJson(jsonString,
					new TypeToken<Map<String, Object>>() {
					}.getType());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashMap;
	}

	public static <T> List<T> getObjects(String strJson, Class<T> clazz) {
		Gson gson = new Gson();
		List<T> lst = new ArrayList<T>();
		JsonParser parser = new JsonParser();
		JsonArray array = parser.parse(strJson).getAsJsonArray();
		for (final JsonElement json : array) {
			T entity = gson.fromJson(json, clazz);
			lst.add(entity);
		}
		return lst;
	}
	
	/**
	 * 对象转成json字符串
	 * @param object
	 * @return
	 */
	public  static String getJson(Object object){
		return gson.toJson(object);
	}
}
  