package com.portalmgr.util.excelUtil;


import jxl.CellView;
import jxl.Workbook;
import jxl.write.*;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;


public class ExportExcelUtil {
	protected static Logger logger = Logger.getLogger(ExportExcelUtil.class);;

	/**
	 * 写入Excel
	 * 
	 * @param exportFile
	 * @param list
	 * @param cls
	 * @param sheetTitle
	 * @throws FileNotFoundException 
	 */
	public static <T> void exportReport(File exportFile, List<T> list,	Class cls, String sheetTitle) throws Exception {
		OutputStream os = new FileOutputStream(exportFile, true);
		exportReport(os,list,cls,sheetTitle);
	}
	
	
	
	/**
	 * 写入多个sheet
	 *@author duwk 
	 *@date  2016-9-21 
	 * @param exportFile
	 * @param sheetDatas
	 * @param cls
	 * @param sheetTitles
	 * @throws Exception
	 */
	public static <T> void exportReport(File exportFile, List<List<T>> sheetDatas, Class cls, List<String> sheetTitles) throws Exception {
		OutputStream os = new FileOutputStream(exportFile, true);
		exportReport(os,sheetDatas,cls,sheetTitles);
	}
	
	
	
	/**
	 * 批量导出多个标签的多个文件，例子参照企业门户| 销售管理| 发货管理 导出
	 * @param exportFiles
	 * @param list
	 * @param cls
	 * @param sheetTitles
	 * @throws Exception
	 */
	public static void exportReport(List<File> exportFiles, List list, List<Class> cls, String[] sheetTitles, int row) throws Exception {
		int len = sheetTitles.length;
		for (int i = 0; i < exportFiles.size(); i++) {
			List sheetDatas = new ArrayList();
			for (int j = 0; j < len; j++) {
				sheetDatas.add(list.get(len * i + j));
			}
			OutputStream os = new FileOutputStream(exportFiles.get(i), true);
			exportReport(os,sheetDatas,cls,sheetTitles, row);
		}
	}
	public static void exportReport(List<File> exportFiles, List list, List<Class> cls, String[] sheetTitles) throws Exception {
		int len = sheetTitles.length;
		for (int i = 0; i < exportFiles.size(); i++) {
			List sheetDatas = new ArrayList();
			for (int j = 0; j < len; j++) {
				sheetDatas.add(list.get(len * i + j));
			}
			OutputStream os = new FileOutputStream(exportFiles.get(i), true);
			exportReport(os,sheetDatas,cls,sheetTitles);
		}
	}
	public static void exportReport(OutputStream os, List<List> sheetDatas, List<Class> cls, String[] sheetTitles, int row) {
		WritableWorkbook workbook = null;
		try {
			workbook = Workbook.createWorkbook(os);
			for (int i = 0; i < sheetTitles.length; i++) {
				WritableSheet wsheet = workbook.createSheet(sheetTitles[i], i);
				Label label = new Label(0, 0, "箱码：" + sheetTitles[i]);
				wsheet.addCell(label);
//				label = new Label(1, 0, sheetTitles[i]);
//				wsheet.addCell(label);
				work(wsheet, sheetDatas.get(i), cls.get(i), row);
			}
			workbook.write();// 总写入文件
			os.flush();
		} catch (Exception e) {
			logger.error("导出报表失败", e);
		} finally {
			try {
				workbook.close();
			} catch (Exception e) {
			}// try
			try {
				os.close();
			} catch (Exception e) {
			}// try
		}
	}
	
	public static void exportReport(OutputStream os, List<List> sheetDatas, List<Class> cls, String[] sheetTitles) {
		WritableWorkbook workbook = null;
		try {
			workbook = Workbook.createWorkbook(os);
			for (int i = 0; i < sheetTitles.length; i++) {
				WritableSheet wsheet = workbook.createSheet(sheetTitles[i], i);
				if (cls.get(i) == null) {
					Object uri = sheetDatas.get(i);
					if (uri == null) continue;
					File file=new File(uri.toString());
					WritableImage image=new WritableImage(2, 6, 5, 18, file);
					wsheet.addImage(image);
				} else {
					work(wsheet, sheetDatas.get(i), cls.get(i));
				}
			}
			workbook.write();// 总写入文件
			os.flush();
		} catch (Exception e) {
			logger.error("导出报表失败", e);
		} finally {
			try {
				workbook.close();
			} catch (Exception e) {
			}// try
			try {
				os.close();
			} catch (Exception e) {
			}// try
		}
	}
	
	//一个excel多个sheet
	public static <T> void exportReport(OutputStream os, List<List<T>> sheetDatas, Class cls, List<String> sheetTitles) {
		WritableWorkbook workbook = null;
		try {
			workbook = Workbook.createWorkbook(os);
			for (int i = 0; i < sheetTitles.size(); i++) {
				WritableSheet wsheet = workbook.createSheet(sheetTitles.get(i), i);
				work(wsheet, sheetDatas.get(i), cls);
			}
			workbook.write();// 总写入文件
			os.flush();
		} catch (Exception e) {
			logger.error("导出报表失败", e);
		} finally {
			try {
				workbook.close();
			} catch (Exception e) {
			}// try
			try {
				os.close();
			} catch (Exception e) {
			}// try
		}
	}
	
	
	public static <T> void exportReport(OutputStream os, List<T> list,	Class cls, String sheetTitle) {
		WritableWorkbook workbook = null;
		try {
			workbook = Workbook.createWorkbook(os);
			WritableSheet wsheet = workbook.createSheet(sheetTitle, 0);
			work(wsheet, list, cls);
			workbook.write();// 总写入文件
			os.flush();
		} catch (Exception e) {
			logger.error("导出报表失败", e);
		} finally {
			try {
				workbook.close();
			} catch (Exception e) {
			}// try
			try {
				os.close();
			} catch (Exception e) {
			}// try
		}
	}

	/**
	 * 核心方法
	 * 
	 * @param wsheet
	 * @param content
	 * @param cls
	 * @throws Exception
	 */
	private static <T> void work(WritableSheet wsheet, List<T> content,Class cls, int row) throws Exception {
		List<Excel> excelList = ParseExcelAnnotationUtil.parse(cls);
		writeExcel(excelList,wsheet,content,cls, row);
	}
	private static <T> void work(WritableSheet wsheet, List<T> content,Class cls) throws Exception {
		List<Excel> excelList = ParseExcelAnnotationUtil.parse(cls);
		writeExcel(excelList,wsheet,content,cls);
	}
	
	/**
	 * 写入Excel
	 * @param excelList
	 * @param wsheet
	 * @param content
	 * @param cls
	 * @param Exception
	 * @param row
	 */
	private static <T> void writeExcel(List<Excel> excelList,WritableSheet wsheet, List<T> content,Class cls, int fromRow) throws Exception {
		Excel excel = excelList.get(0);
		//行开始位置
		int _row = fromRow;
		//是否有表格标题
		if(StringUtils.isNotEmpty(excel.getExcelTitle())) {
			WritableFont titleFont = new WritableFont(	WritableFont.createFont("宋体"), 16, WritableFont.BOLD);
			WritableCellFormat titleCellFormat = new WritableCellFormat(titleFont);
			titleCellFormat.setAlignment(Alignment.CENTRE);
			titleCellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			titleCellFormat.setBorder(Border.ALL, BorderLineStyle.THIN); // 线条
			wsheet.mergeCells(0, 0, excelList.size()-1, 0);// 合并横向列，下标从0开始算，到18
			wsheet.setRowView(0, 1000);
			wsheet.addCell(new Label(0, 0, excel.getExcelTitle(), titleCellFormat));
			_row = 1;
		}

		WritableFont headFont = new WritableFont(WritableFont.createFont("宋体"),10, WritableFont.BOLD);
		WritableCellFormat headCellFormat = new WritableCellFormat(headFont);
		headCellFormat.setAlignment(Alignment.CENTRE);
		headCellFormat.setBorder(Border.ALL, BorderLineStyle.THIN); // 线条
		headCellFormat.setBackground(Colour.GRAY_25);// 背景色暗灰-25%

		WritableCellFormat bodyCellFormat = new WritableCellFormat(NumberFormats.INTEGER); //定义一个单元格样式
	    CellView cv = new CellView(); //定义一个列显示样式
	    cv.setFormat(bodyCellFormat);//把定义的单元格格式初始化进去
		for (int i = 0; i < excelList.size(); i++) {
			wsheet.setColumnView(i, excelList.get(i).getColumnWidth());
			wsheet.addCell(new Label(i, _row, excelList.get(i).getColumnTitle(),
					headCellFormat));
			//wsheet.setColumnView(i, cv);//设置工作表中第n列的样式
		}
		long start = System.currentTimeMillis();
		for (int y = 0; y < content.size(); y++) {
			T respRow = content.get(y);
			if (null == respRow) {
				continue;
			}// if
			int col = 0, row = y + _row+1;
			for (Excel ecl : excelList) {
				String value = String.valueOf(invokeGet(respRow,ecl.getColumnName()));
				if(value.equals("null")){
					value = "";
				}
				wsheet.addCell(new Label(col++, row,value));
			}
		}// for
		logger.info("耗时:"+(System.currentTimeMillis()-start));
	}
	
	
	
	
	
	/**
	 * 写入Excel
	 * @param excelList
	 * @param wsheet
	 * @param content
	 * @param cls
	 * @throws Exception
	 */
	private static <T> void writeExcel(List<Excel> excelList,WritableSheet wsheet, List<T> content,Class cls) throws Exception {
		if(excelList==null || excelList.size()==0) return;
		writeExcel(excelList,wsheet,content,cls,0);
	}
	
	
	
	
	   /**    
	   * @param objectClass    
	   * @param fieldName    
	    * @return    
	    */       
	   public static Method getGetMethod(Class objectClass, String fieldName) {       
	       StringBuffer sb = new StringBuffer();       
	       sb.append("get");       
	       sb.append(fieldName.substring(0, 1).toUpperCase());       
	       sb.append(fieldName.substring(1));       
	       try {       
	           return objectClass.getMethod(sb.toString());       
	       } catch (Exception e) {       
	       }       
	       return null;       
	     
	   }       
	     
	          
	   /**    
	    * java反射bean的set方法    
	    *     
	    * @param objectClass    
	    * @param fieldName    
	    * @return    
	    */       
	   public static Method getSetMethod(Class objectClass, String fieldName) {       
	       try {       
	           Class[] parameterTypes = new Class[1];       
	           Field field = objectClass.getDeclaredField(fieldName);       
	           parameterTypes[0] = field.getType();       
	           StringBuffer sb = new StringBuffer();       
	           sb.append("set");       
	           sb.append(fieldName.substring(0, 1).toUpperCase());       
	           sb.append(fieldName.substring(1));       
	           Method method = objectClass.getMethod(sb.toString(), parameterTypes);       
	           return method;       
	       } catch (Exception e) {       
	           e.printStackTrace();       
	       }       
	       return null;       
	   }       
	     
	          
	     
	   /**    
	    * 执行set方法    
	    * @param o执行对象    
	    * @param fieldName属性    
	     * @param value值    
	     */       
	    public static void invokeSet(Object o, String fieldName, Object value) {       
	        Method method = getSetMethod(o.getClass(), fieldName);       
	        try {       
	            method.invoke(o, new Object[] { value });       
	        } catch (Exception e) {       
	            e.printStackTrace();       
	        }       
	      
	    }       
	           
	    /**    
	     * 执行get方法    
	     *     
	     * @param o执行对象    
	     * @param fieldName属性    
	     */       
	      
	    public static Object invokeGet(Object o, String fieldName) {       
	        Method method = getGetMethod(o.getClass(), fieldName); 
	        try {
	            return method.invoke(o,null);       
	        } catch (Exception e) {       
	            e.printStackTrace();       
	        }       
	        return null;       
	    }  
	    
	    
	    
	    /**
	     * 核心方法
	     * @param wsheet
	     * @param content
	     * @param cls
	     * @param strDynamicTitle Excel中的标题
	     * @throws Exception
	     */
	    private static <T> void work(WritableSheet wsheet, List<T> content,Class cls,String strDynamicTitle) throws Exception {
			List<Excel> excelList = ParseExcelAnnotationUtil.parse(cls);
			List<Excel> list = excelList;
			if(StringUtils.isNotEmpty(strDynamicTitle)){
				strDynamicTitle = strDynamicTitle.trim();
				list = new LinkedList<Excel>();
				if(excelList!=null && excelList.size()>0){
					for(Excel e:excelList){
						e.setExcelTitle(strDynamicTitle);
						list.add(e);
					}
				}
			}
			writeExcel(list,wsheet,content,cls);
		}
		
		/**
		 * 写入Excel
		 * @param exportFile
		 * @param list
		 * @param cls
		 * @param sheetTitle
		 * @param strDynamicTitle Excel中的标题
		 */
		public static <T> void exportReport(File exportFile, List<T> list,	Class cls, String sheetTitle,String strDynamicTitle) {
			OutputStream os = null;
			WritableWorkbook workbook = null;
			try {
				os = new FileOutputStream(exportFile, true);
				workbook = Workbook.createWorkbook(os);
				WritableSheet wsheet = workbook.createSheet(sheetTitle, 0);
				work(wsheet, list, cls,strDynamicTitle);
				workbook.write();// 总写入文件
				os.flush();
			} catch (Exception e) {
				logger.error("导出报表失败", e);
			} finally {
				try {
					workbook.close();
				} catch (Exception e) {
				}// try
				try {
					os.close();
				} catch (Exception e) {
				}// try
			}
		}
}
