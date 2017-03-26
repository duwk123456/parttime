/**   
 * Copyright ® 2012 Newland Sci.&Tech.Co.,Ltd
 * All right reserved.
 * 项目名称：MPayWeb   
 * 类名：ParseExcelAnnotationUtil.java
 * 类描述：解析注解工具
 * 作者：SuShiting email: sust@newlandcomputer.com   
 * 创建日期：2013-3-11 下午2:41:14   
 * 修改者：
 * 修改日期：
 * @version    
 */
package com.portalmgr.util.excelUtil;


import com.newland.iot.common.annotation.ExcelAnnotation;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


/**
* @Title: ParseExcelAnnotationUtil.java
* @Package com.newland.iot.webui.common.utils
* @author TuJianQun
* @email:tujq@newlandcomputer.com
* @date 2013年8月20日 下午5:04:12
* @version V1.0
* @Description: TODO 描述：用来解析自定义注解
 */
public class ParseExcelAnnotationUtil {
   public static  List<Excel> parse(Class c) throws Exception{
       List<Excel> list = new ArrayList<Excel>();
//		Field[] fields = c.getDeclaredFields();
//		for (Field field : fields) {
//			Excel excel = new Excel();
//			ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
//			if(null==excelAnnotation){
//				continue;
//			}
//			excel.setExcelTitle(excelAnnotation.excelTitle());
//			excel.setColumnTitle(excelAnnotation.columnTitle());
//			excel.setColumnName(field.getName());
//			excel.setColumnWidth(excelAnnotation.columnWidth());
//			excel.setColumnIndex(excelAnnotation.columnIndex());
//			list.add(excel);
//		}
       initAnnotationFieldsToList(list,c);

       if(list.size()==0){
           throw new Exception("Excel列未指定!请在填写Excel信息Bean:"+c+"中指定!");
       }
       Collections.sort(list);
       return list;
   }

   private static void initAnnotationFieldsToList(List<Excel> list,Class c){
       Field[] fields = c.getDeclaredFields();
       for (Field field : fields) {
           Excel excel = new Excel();
           ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
           if(null==excelAnnotation){
               continue;
           }
           excel.setExcelTitle(excelAnnotation.excelTitle());
           excel.setColumnTitle(excelAnnotation.columnTitle());
           excel.setColumnName(field.getName());
           excel.setColumnWidth(excelAnnotation.columnWidth());
           excel.setColumnIndex(excelAnnotation.columnIndex());
           list.add(excel);
       }

       c = c.getSuperclass();
       //如果给定类有基类，并且基类不是Object，则递归获取其基类的元信息
       if(c != null && c != Object.class){
           initAnnotationFieldsToList(list,c);
       }
   }


   public <T>String sysout(T t){
       System.out.println();
       return null;

   }
   public static void main(String[] args) {

   }
}