/**   
* @Title: DateUtil.java
* @Package com.newland.iot.system.util
* @Description: (用一句话描述该文件做什么)
* @author A18ccms A18ccms_gmail_com   
* @date 2013年8月5日 上午9:16:34
* @version V1.0   
*/
package com.portalmgr.util;

import org.apache.commons.lang.StringUtils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**   
 * @Title: DateUtil.java
 * @Package com.newland.iot.system.util
 * @author TuJianQun
 * @email:tujq@newlandcomputer.com
 * @date 2013年8月5日 上午9:16:34
 * @version V1.0 
 * @Description: 描述：日期型 工具类
 */
public class DateUtil {
	
	public static final String  DATE="DATE";
	public static final String  MONTH="MONTH";
	public static final String  YEAR="YEAR";
	
	public static final String YYYYMMDDHHMMSS = "yyyyMMddHHmmss";
	
	public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";
    public static final String YYYY_MM_DD_HH_MM = "yyyy-MM-dd HH:mm";
	public static final String YYYY_MM_DD= "yyyy-MM-dd";
	public static final String YYYY_MM = "yyyy-MM";
	public static final String DD = "dd";
	public static final String YYYY = "yyyy";
	public static final String YYYYMM = "yyyyMM";
	public static final String YYYYMMDD = "yyyyMMdd";
	public static final String MMDD="MMdd";
	public static final String MM="MM";
	
	/**
	 * 获取指定时间的字符串标识形式
	 * @param date 转化时间
	 * @param format  时间格式，dateUtil已近提供了静态属性： YYYYMMDDHHMMSS，YYYY_MM_DD_HH_MM_SS等
	 * @return
	 */
	public static String getTimeStr(Date date,String format) {
		if(date==null) return null;
		DateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}
     /**
      * 获取时间间隔内的天数
      * @param strBegin
      * @param strEnd
      * @return
      */
	public static int getDifferDays(String strBegin, String strEnd) {
		try {
			SimpleDateFormat yMd_sdf = new SimpleDateFormat(YYYY_MM_DD);
			return getDifferDays(yMd_sdf.parse(strBegin), yMd_sdf.parse(strEnd));
		} catch (ParseException e) {
			return 0;
		}
	}

	public static int getDifferDays(Date begin, Date end) {
		return (int) ((end.getTime() - begin.getTime()) / (24 * 60 * 60 * 1000));
	}

	public static int getDayDiffer(Date begin, Date end) {
		Calendar c1= Calendar.getInstance();
		Calendar c2= Calendar.getInstance();
		c1.setTime(begin);
		c2.setTime(end);
		return c2.get(Calendar.DAY_OF_YEAR)-c1.get(Calendar.DAY_OF_YEAR);
	}

    public static int getDifferHours(Date begin, Date end) {
        return (int) ((end.getTime() - begin.getTime()) / (60 * 60 * 1000));
    }

    public static int getDifferMinites(Date begin, Date end) {
        return (int) ((end.getTime() - begin.getTime()) / ( 60 * 1000));
    }
    
    public static int getDifferSecond(Date begin, Date end) {
        return (int) ((end.getTime() - begin.getTime()) / (1000));
    }
	
	/**
	 * 相差月份
	 * @param begin
	 * @param end
	 * @return
	 */
	public static int getDiffMonths(Date begin, Date end) {
		Calendar calendar1 = new GregorianCalendar();
		Calendar calendar2 = new GregorianCalendar();
		calendar1.setTime(begin);
		calendar2.setTime(end);
		int y1 = calendar1.get(Calendar.YEAR);
		int y2 = calendar2.get(Calendar.YEAR);
		int m1 = calendar1.get(Calendar.MONTH);
		int m2 = calendar2.get(Calendar.MONTH);
		int len=(y2-y1)*12+(m2-m1);
		return len;
	}
	
	/**
	 * 相差年份
	 * @param begin
	 * @param end
	 * @return
	 */
	public static int getDiffYears(Date begin, Date end) {
		Calendar calendar1 = new GregorianCalendar();
		Calendar calendar2 = new GregorianCalendar();
		calendar1.setTime(begin);
		calendar2.setTime(end);
		int y1 = calendar1.get(Calendar.YEAR);
		int y2 = calendar2.get(Calendar.YEAR);
		return y2-y1;
	}
	
	
	/**
	 * 获取某天中  当月的第一天
	 * @param date
	 * @return
	 */
	public static Date getFirstMonthDay(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DATE));
		return calendar.getTime();
	}
    
	
	/**
	 * 某天中 当月的最后一天
	 * @param date
	 * @return
	 */
	public static Date getLastMonthDay(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE));
		return calendar.getTime();
	}
     
	public static Date format(String dateStr,String format) throws ParseException{
		SimpleDateFormat yMd_sdf = new SimpleDateFormat(format);
		return yMd_sdf.parse(dateStr);
	}
	
	/**
	 *某个时间间隔内的所有 时间
	 * @param start
	 * @param end
	 * @return
	 */
	public static List<Date> getAllDates(Date start, Date end) {
		Calendar calendar1 = new GregorianCalendar();
		calendar1.setTime(start);
		Calendar calendar2 = new GregorianCalendar();
		calendar2.setTime(end);
		List<Date> list = new ArrayList<Date>();
		list.add(start);
		while (calendar1.compareTo(calendar2) < 0) {
			calendar1.add(Calendar.DATE, 1);
			list.add(calendar1.getTime());
		}
		return list;
	}
	
	/**
	 * 返回两个日期间的指定格式的时间列表
	 * 如：2013-10-12  2013-10-18   Calendar.DATE 表示时间+1,也可以是Calendar.MONTH月份+1
	 * 则返回：20131012，20131013，20131014.......20131018
	 * @param start  起始时间
	 * @param end 结束时间
	 * @param formate 日期格式
	 * @return
	* @description:
	 */
	public static List<Date> getFormateDates(Date start, Date end,int filed) {
		Calendar calendar1 = new GregorianCalendar();
		calendar1.setTime(start);
		Calendar calendar2 = new GregorianCalendar();
		calendar2.setTime(end);
		List<Date> list = new ArrayList<Date>();
		list.add(start);
		while (calendar1.compareTo(calendar2) < 0) {
			System.out.println(calendar1.get(Calendar.YEAR)+"-"+calendar1.get(Calendar.MONDAY));
			System.out.println(calendar2.get(Calendar.YEAR)+"-"+calendar1.get(Calendar.MONDAY));
			calendar1.add(filed, 1);
			list.add(calendar1.getTime());
		}
		return list;
	}
	
	

	public static String getZHDateString(Date date) {
		return new SimpleDateFormat("yyyy'\u5e74'MM'\u6708'dd'\u65e5'").format(date);
	}

	public static String getZHTimeString(Date date) {
		return new SimpleDateFormat("HH\u65f6mm'\u5206'ss'\u79d2'").format(date);
	}

	/**
	 * 获取下一个月第一天日期(added 20100331 by ZM)
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp getNextMonthFirstDay(Timestamp time) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, 1, 0, 0, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Timestamp ts = new Timestamp(cal.getTime().getTime());
		return ts;
	}

/**
 * @param format 以提供 静态属性 YYYY_MM_DD 等类型
 * @return
 */
	public static String getCurTimeStr(String format) {
		Calendar cal = Calendar.getInstance();
		//cal.add(Calendar.HOUR, 8);// 中国属于东八区，时间加8小时(适用于JDK1.5)
		return new SimpleDateFormat(format).format(cal.getTime());
	}
	
	public static long getCurrentTimeLong(){
		return new Date().getTime();
	}
	
	/**
	 * 当前时间(当地)
	 * @param format
	 * @return
	 */
	public static String getCurTimeLocaleStr(String format) {
		return new SimpleDateFormat(format).format(getCurTimeLocale());
	}

    /**
     * 当前时间(当地)
     * @return
     */
    public static Date getCurTimeLocale() {
        Calendar calendar1 = new GregorianCalendar();
        Date d = new Date();
        calendar1.setTime(d);
        return calendar1.getTime();
    }
	
	/**
	 * 
	 * @param format
	 * @param file   
	 * @return
	* @description: 返回当前时间的指定字段
	* 
	 */
	public static String getCurTimeByFile(String file){
		Calendar calendar = Calendar.getInstance();
		if(DATE.equals(file)){
			return String.valueOf(calendar.get(Calendar.DATE));
		}else if(YEAR.equals(file)){
			return String.valueOf(calendar.get(Calendar.YEAR));
		}else{
			return String.valueOf(calendar.get(Calendar.MONTH)+1);
		}
	}
	
	/**
	 * 
	 * @param date  日期字符串
	 * @param current_formate  date的日期格式
	 * @param file 要的字段
	 * @return
	 * @throws ParseException
	* @description:
	 */
	public static String getTimeByFile(String date,String current_formate,int file) throws ParseException{
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(format(date, current_formate));
		return getTimeByFile(calendar.getTime(), file);
	}
	
	/**
	 * 获取当前日期的长整型  格式为yyyyMMdd
	 * @return
	 */
	public static long getCurDayLong() {
		return Long.parseLong(getCurDayStr());
	}
	
	/**
	 * 获取当前日期的字符串  格式为yyyyMMdd
	 * @return
	 */
	public static String getCurDayStr() {
		SimpleDateFormat sdfLong = new SimpleDateFormat("yyyyMMdd");
		String date = sdfLong.format(new Date());
		return date;
	}
	
	/**
	 * 返回date的file格式表示
	 * 如：getTimeByFile(new Date(),Calender.Month);
	 * 表示：返回当前时间的月份;
	 * @param date
	 * @param file
	 * @return
	* @description:
	 */
	public static String getTimeByFile(Date date,int file){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		if(Calendar.DATE==file){
			return String.valueOf(calendar.get(Calendar.DATE));
		}else if(Calendar.YEAR==file){
			return String.valueOf(calendar.get(Calendar.YEAR));
		}else{
			return String.valueOf(calendar.get(Calendar.MONTH)+1);
		}
	}
	
	
	/**
	 * 获时间相差几天
	 */
	public static Long getDistDays(Date dateStart,Date dateEnd){
		long totalDate = 0;   
        Calendar calendar = Calendar.getInstance();   
        calendar.setTime(dateStart);   
        long timestart = calendar.getTimeInMillis();   
        calendar.setTime(dateEnd);   
        long timeend = calendar.getTimeInMillis();  
        totalDate = Math.abs((timeend - timestart))/(1000*60*60*24);   
        return totalDate;
	}
	
	/**
	 * 查日期为星期几
	 * @return 1星期日、2星期一、3星期二...7星期六
	 */
	public static int getDayOfWeek(String fomat){
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(new SimpleDateFormat(fomat).parse(fomat));
			return cal.get(Calendar.DAY_OF_WEEK);
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 查日期为星期几
	 * @return 1星期日、2星期一、3星期二...7星期六
	 */
	public static int getDayOfWeek(Date date){
		Calendar cal = Calendar.getInstance();
		
	    cal.setTime(date);
	    int x =cal.get(Calendar.DAY_OF_WEEK);
	    return x;
	}
	/**
	 * 查日期为几号
	 */
	public static int getDayOfMonth(String fomat){
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(new SimpleDateFormat(fomat).parse(fomat));
			return cal.get(Calendar.DAY_OF_MONTH);
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 返回当前月份
	 * 
	 * @description:
	 */
	public static int getCurrentMonth(){
		Calendar d =Calendar.getInstance();
		return d.get(Calendar.MONTH)+1;
	}
	
	/**
	 * 返回当前年份
	 * 
	 * @description:
	 */
	public static int getCurrentYear(){
		Calendar d =Calendar.getInstance();
		return d.get(Calendar.YEAR);
	}
	/**
	 * 返回当前日
	 * */
	public static int getCurrentDay()
	{
		Calendar d =Calendar.getInstance();
		return d.get(Calendar.DATE);
	}
	
	/**
	 * 获取计算后的特定格式的时
	 * 
	 * @param amount >0则当前时间加几天 <0 则当前时间减几天
	 * @param format 时间格式 如果为空则使用默认的yyyy-MM-dd HH:mm:ss
	 * @return
	 * @throws ParseException
	 * @description:
	 */
	public static String getCalcDate(int amount, String format) {
		SimpleDateFormat sdformat = null;
		if(isNotNvl(format)) {
			sdformat = new SimpleDateFormat(format);
		} else {
			sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}
		Calendar d =Calendar.getInstance();
		d.add(Calendar.DAY_OF_MONTH, amount);
		return sdformat.format(d.getTime());
	}
	
	public static boolean isNotNvl(String str) {
		if(null == str || "".equals(str.trim())) {
			return false;
		}
		return true;
	}
	
    /**
     * 获取某个月份下的每天的时间  输入：2013-01: 返回2013-01-01 2013-0-02........2013-01-31;
     * @param dateString
     * @return
    * @description:
     */
	public static String[] getMonthDays(String dateString,String format){
		String[] date = dateString.split("-");
		if(date.length<2){
			//throw new BusinessException("输入：2013-01: 返回2013-01-01 2013-0-02........2013-01-31");
			return null;
		}
		Calendar d =Calendar.getInstance();
		d.set(Calendar.YEAR, Integer.parseInt(date[0]));
		d.set(Calendar.MONDAY, Integer.parseInt(date[1])-1);
		int last=d.getActualMaximum(Calendar.DAY_OF_MONTH);
		d.set(Calendar.DATE, d.getActualMinimum(Calendar.DATE));
		Date fistDate=d.getTime();
 
		Calendar calendarf =new GregorianCalendar();
		calendarf.setTime(fistDate);
		List<Date> list = new ArrayList<Date>();
		for(int i=0;i<last;i++){
			list.add(calendarf.getTime());
			calendarf.add(Calendar.DATE, 1);
		}
		String[] dates = new String[last];
		for(int i=0;i<list.size();i++){
			dates[i]=getTimeStr(list.get(i),format);
		}
		return dates;
	}
	
	public static String[] getYearMonth(String strYear,String monthFormat){
		List<Date> list = new ArrayList<Date>();
		
		Calendar d =Calendar.getInstance();
		d.set(Calendar.YEAR, Integer.parseInt(strYear));
		for(int i=0;i<12;i++){
			d.set(Calendar.MONTH,i);
			list.add(d.getTime());
		}
		
		String[] dates = new String[12];
		for(int i=0;i<list.size();i++){
			dates[i]=getTimeStr(list.get(i),monthFormat);
		}
		return dates;
	}
	
	 /**
     * 转换日期格式从String 到 Date
    * @param strDate 日期字符串
    * @return
    */
   public static Date converStrDateToDate(String strDate,String formatter){
	    if(StringUtils.isEmpty(strDate)) return null;
	    if(StringUtils.isEmpty(formatter)) return null;
	    strDate = strDate.trim();
	    formatter = formatter.trim();
	    
   	    GregorianCalendar gc = new GregorianCalendar();
   	    gc.getTime();
        DateFormat format= new SimpleDateFormat(formatter);
        Date d = null;
        Date d1 = null;
        try {  
       	 d1 =  format.parse(strDate);
       	 gc.setTime(d1);
       	 d = new Date(gc.getTimeInMillis());
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        return d;
    }
   
  
	/**
	 * 获取计算后的特定格式的月
	 * @param amount >0则当前月加几月 <0 则当前月减几月
	 * @param monthFmt 月份时间格式 如果为空则使用默认的yyyy-MM
	 * @return
	 */
	public static String getCalcMonth(int amount, String monthFmt) {
		SimpleDateFormat sdformat = null;
		if(isNotNvl(monthFmt)) {
			sdformat = new SimpleDateFormat(monthFmt);
		} else {
			sdformat = new SimpleDateFormat("yyyy-MM");
		}
		Calendar d =Calendar.getInstance();
		d.add(Calendar.MONTH, amount);
		return sdformat.format(d.getTime());
	}
	
	
	
	/**
	 * 获取计算后的特定格式的年
	 * @param amount >0则当前年加几年 <0 则当前年减几年
	 * @param yearFmt 年份时间格式 如果为空则使用默认的yyyy
	 * @return
	 */
	public static String getCalcYear(int amount, String yearFmt) {
		SimpleDateFormat sdformat = null;
		if(isNotNvl(yearFmt)) {
			sdformat = new SimpleDateFormat(yearFmt);
		} else {
			sdformat = new SimpleDateFormat("yyyy-MM");
		}
		Calendar d =Calendar.getInstance();
		d.add(Calendar.YEAR, amount);
		return sdformat.format(d.getTime());
	}
	
	/**
	 * 得到某年某月的第一天 (开始时刻)
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getFirstDayOfMonthStart(int year, int month) {
		return getFirstDayOfMonthStartDate(year, month)+" 00:00:00";
	}
	
	/**
	 * 得到某年某月的最后一天(结束时刻)
	 * @param year
	 * @param month
	 * @return
	 */ 
	public static String getLastDayOfMonthEnd(int year,int month) {
		return getLastDayOfMonthEndDate(year, month)+" 23:59:59";
	}

	/**
	 * 得到某年某月的第一天 (开始时刻)
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getFirstDayOfMonthStartDate(int year, int month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DAY_OF_MONTH, cal.getMinimum(Calendar.DATE));
		String strDate = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		return strDate;
	}
	
	/**
	 * 得到某年某月的最后一天(结束时刻)
	 * @param year
	 * @param month
	 * @return
	 */ 
	public static String getLastDayOfMonthEndDate(int year,int month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int value = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, value);
		String strDate = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		return strDate;
	}

	/**
	 * 获取计算后的特定格式的年(相对于指定日期时间)
	 * @param specifiedYear 指定的日期年份
	 * @param amount >0则当前年加几年 <0 则当前年减几年
	 * @param yearFmt 年份时间格式 如果为空则使用默认的yyyy
	 * @return
	 */
	public static String getCalcYear(Date specifiedYear,int amount, String yearFmt) {
		SimpleDateFormat sdformat = null;
		if(isNotNvl(yearFmt)) {
			sdformat = new SimpleDateFormat(yearFmt);
		} else {
			sdformat = new SimpleDateFormat("yyyy-MM");
		}
		Calendar d =Calendar.getInstance();
		d.setTime(specifiedYear);
		d.set(Calendar.YEAR, d.get(Calendar.YEAR));
		d.add(Calendar.YEAR, amount);
		return sdformat.format(d.getTime());
	}
	
	/**
	 * 获取计算后的特定格式的月(相对于指定日期时间)
	 * @param specifiedMonth 指定的日期月份
	 * @param amount >0则当前月加几月 <0 则当前月减几月
	 * @param monthFmt 月份时间格式 如果为空则使用默认的yyyy-MM
	 * @return
	 */
	public static String getCalcMonth(Date specifiedMonth,int amount, String monthFmt) {
		SimpleDateFormat sdformat = null;
		if(isNotNvl(monthFmt)) {
			sdformat = new SimpleDateFormat(monthFmt);
		} else {
			sdformat = new SimpleDateFormat("yyyy-MM");
		}
		Calendar d =Calendar.getInstance();
		d.setTime(specifiedMonth);
		d.set(Calendar.MONTH, d.get(Calendar.MONTH));
		d.add(Calendar.MONTH, amount);
		return sdformat.format(d.getTime());
	}
	
	/**
	 * 获取计算后的特定格式的日期(相对于指定日期时间)
	 * @param specifiedDate 指定的日期
	 * @param amount 当前日期的偏移量
	 * @param format 日期格式
	 * @return
	 */
	public static String getCalcDate(Date specifiedDate,int amount, String format) {
		SimpleDateFormat sdformat = null;
		if(isNotNvl(format)) {
			sdformat = new SimpleDateFormat(format);
		} else {
			sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}
		Calendar d =Calendar.getInstance();
		d.setTime(specifiedDate);
		d.add(Calendar.DAY_OF_MONTH, amount);
		return sdformat.format(d.getTime());
	}
	
	/**
	 * 获取计算后的特定格式的年(相对于指定日期时间)
	 * @param specifiedYearStr 指定的日期年份(字符串)
	 * @param amount >0则当前年加几年 <0 则当前年减几年
	 * @param yearFmt 年份时间格式 如果为空则使用默认的yyyy
	 * @return
	 */
	public static String getCalcYear(String specifiedYearStr,int amount, String yearFmt) {
		Date specifiedYear = DateUtil.converStrDateToDate(specifiedYearStr, yearFmt);
		return DateUtil.getCalcYear(specifiedYear, amount, yearFmt);
	}
	
	/**
	 * 获取计算后的特定格式的月(相对于指定日期时间)
	 * @param specifiedMonth 指定的日期月份(字符串)
	 * @param amount >0则当前月加几月 <0 则当前月减几月
	 * @param monthFmt 月份时间格式 如果为空则使用默认的yyyy-MM
	 * @return
	 */
	public static String getCalcMonth(String specifiedMonthStr,int amount, String monthFmt) {
		Date specifiedMonth = DateUtil.converStrDateToDate(specifiedMonthStr, monthFmt);
		return DateUtil.getCalcMonth(specifiedMonth, amount, monthFmt);
	}
	
	/**
	 * 获取计算后的特定格式的日期(相对于指定日期时间)
	 * @param specifiedDateStr 指定的日期(字符串)
	 * @param amount 当前日期的偏移量
	 * @param format 日期格式
	 * @return
	 */
	public static String getCalcDate(String specifiedDateStr,int amount, String format) {
		Date specifiedDate = DateUtil.converStrDateToDate(specifiedDateStr, format);
		return DateUtil.getCalcDate(specifiedDate, amount, format);
	}
	
	/**
	 * 
	 * converDateFormatter:转换时间的格式
	 * @Create Date: 2013-10-21 下午5:11:19
	 * @param strDate 时间字符串
	 * @param strFormatter 时间字符串格式
	 * @param formatter 需要转换为的时间格式
	 * @return
	 */
	public static String converDateFormatter(String strDate, String strFormatter, String formatter) {
		Date date = converStrDateToDate(strDate, strFormatter);
		return getTimeStr(date, formatter);
	}
	 //获得季度的第一天和最后一天   
    public static String getThisSeasonTime(){ 
    	Date date = new Date();   
        SimpleDateFormat dateFormat1 = new SimpleDateFormat("MM");
        int month = Integer.parseInt(dateFormat1.format(date));
         int array[][] = {{1,2,3},{4,5,6},{7,8,9},{10,11,12}};   
         int season = 1;   
         if(month>=1&&month<=3){   
             season = 1;   
         }   
         if(month>=4&&month<=6){   
             season = 2;   
         }   
         if(month>=7&&month<=9){   
             season = 3;   
         }   
         if(month>=10&&month<=12){   
             season = 4;   
         }   
         int start_month = array[season-1][0];   
         int end_month = array[season-1][2];   
            
         SimpleDateFormat   dateFormat   =   new   SimpleDateFormat("yyyy");//可以方便地修改日期格式      
         String  years  = dateFormat.format(date);      
         int years_value = Integer.parseInt(years);   
            
         int start_days =1;//years+"-"+String.valueOf(start_month)+"-1";//getLastDayOfMonth(years_value,start_month);   
         int end_days = getLastDayOfMonth(years_value,end_month);  
         String sMonth = start_month<10 ?"0"+start_month:start_month+"";
         String eMonth = end_month<10?"0"+end_month:end_month+"";
         String seasonDate = years_value+""+sMonth+"0"+start_days+"-"+years_value+eMonth+end_days;   
         return seasonDate;   
     } 
    /**  
         * 获取某年某月的最后一天  
         * @param year 年  
          * @param month 月  
          * @return 最后一天  
          */  
    public static int getLastDayOfMonth(int year, int month) {   
              if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8  
                       || month == 10 || month == 12) {   
                   return 31;   
             }   
             if (month == 4 || month == 6 || month == 9 || month == 11) {   
                   return 30;   
             }   
             if (month == 2) {   
                   if (isLeapYear(year)) {   
                       return 29;   
                   } else {   
                       return 28;   
                   }   
             }   
             return 0;   
       }  
       /**
        * 时间补0
        * */
       public static String patchZero(int num)
       {
    	   if(String.valueOf(num).length()==1)
    	   {
    		   return "0"+num;
    	   }
    	   return String .valueOf(num);
       }
       /**
        * 时间去0
        * */
       public static int removeZero(String num)
       {
    	   if(num.substring(0,1).equals("0"))
    	   {
    		   return Integer.parseInt(num.substring(1,2));
    	   }
    	   else
    	   {
    		  return Integer.parseInt(num);   
    	   }
       }
       /**  
           * 是否闰年  
           * @param year 年  
           * @return   
          */  
         public static boolean isLeapYear(int year) {   
                return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);   
          }  
         /**
          * 获取当前月1号到现在的日期
          * @return
          */
         public static String getFistAndLast() {
         	// 获取Calendar  
         	Calendar calendar = Calendar.getInstance();  
         	// 当月最后一天 
         	calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE));  
         	DateFormat format = new SimpleDateFormat("yyyyMMdd");  
         	String endDate = format.format(calendar.getTime());
         	// 当月第一天
         	calendar.set(Calendar.DATE, calendar.getMinimum(Calendar.DATE));  
         	String startDate = format.format(calendar.getTime()); 
         	return startDate+"-"+endDate;
     	}
         
         public static Date getFirstDayOfWeek() {
     		int mondayPlus;
     		Calendar cd = Calendar.getInstance();
     		// 获得今天是一周的第几天，星期日是第一天，星期二是第二天......
     		int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK) - 1; // 因为按中国礼拜一作为第一天所以这里减1
     		if (dayOfWeek == 1) {
     			mondayPlus = 0;
     		} else {
     			mondayPlus = 1 - dayOfWeek;
     		}
     		GregorianCalendar currentDate = new GregorianCalendar();
     		currentDate.add(GregorianCalendar.DATE, mondayPlus);
     		currentDate.set(Calendar.HOUR_OF_DAY, 0);
     		currentDate.set(Calendar.MINUTE, 0);
     		currentDate.set(Calendar.SECOND, 0);
     		return currentDate.getTime();
     	}
         
	/**
	 * 获取某个月份的第一周的起始时间，若第一天非周一则往前推至周一
	 */
	public static Date getFirstDayOfFirstWeekInMonth(int year, int month) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, month - 1);
		c.set(Calendar.DAY_OF_MONTH, 1);
		c.add(Calendar.DATE, -(c.get(Calendar.DAY_OF_WEEK) == 1 ? 6 : c.get(Calendar.DAY_OF_WEEK) - 2));// 周日为第一天，所以要减一
		return new Date(c.getTimeInMillis());
	}

	/**
	 * 获取月份的所有周起始时间
	 */
	public static List<Date> getStartDatesOfWeeksInMonth(int year, int month) {
		List<Date> list = new ArrayList<Date>();
		Date first = getFirstDayOfFirstWeekInMonth(year, month);
		list.add(first);
		Calendar c = Calendar.getInstance();
		c.setTime(first);
		c.add(Calendar.DATE, 7);
		list.add(c.getTime());
		while (c.get(Calendar.MONTH) + 1 <= month) {
			c.add(Calendar.DATE, 7);
			if (c.get(Calendar.MONTH) + 1 <= month)
				list.add(c.getTime());
		}
		return list;
	}
    /**
     * 返回最大日期
     * 如果是1号则返回上月 否则返回当月
     * 如果是1月1号则返回去年12月
     * */
	public static String getMaxTime()
	{
		  int currentYear=DateUtil.getCurrentYear();
	      int currentMonth=DateUtil.getCurrentMonth();
	      int currentDay=DateUtil.getCurrentDay();
	      Date MaxTime=null;
	      if(currentDay==1)
	      {
	    	  if(currentMonth==1)
	    	  {
	    		  MaxTime=converStrDateToDate((currentYear-1)+"12","yyyyMM");
	    	  }
	    	  else
	    	  {
		    	  MaxTime=converStrDateToDate(currentYear+patchZero((currentMonth-1)),"yyyyMM");
	    	  }
	      }
	      else
	      {
		      MaxTime=new Date();
	      }
	      SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(MaxTime);
	}
	public static void main(String[] args) {
		//String str= getFirstDayOfMonthStartDate(2014,8);
		String num="81";
		
		System.out.print(removeZero(num));
	}

	public static String getTimeStamp() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");

		return dateFormat.format(date);
	}
	public static String getFormatCH_ZN() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yy年MM月dd日 HH时mm分");

		return dateFormat.format(date);
	}


	public static String getSysDateTime() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+8"));
		return dateFormat.format(date);
	}



	public static long diffTimeForDay(String compareTime, String sysTime) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long days = 0;
		try {
			Date d1 = dateFormat.parse(compareTime);

			Date d2 = dateFormat.parse(sysTime);

			long diff = d1.getTime() - d2.getTime();

			days = diff / (1000 * 60 * 60 * 24);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return days;
	}
	public static String FormatString(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );

		return  format.format(date);
	}

	public static String FormatStringSS(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );

		return  format.format(date);
	}

}
