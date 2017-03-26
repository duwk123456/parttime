
<%@page import="java.io.File"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="ueditor.Uploader"%>
<%@ page import="java.io.FileInputStream"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String currentPath = request.getRequestURI().replace(
			request.getContextPath(), "");

	
	File currentFile = new File(currentPath);

	currentPath = currentFile.getParent() + File.separator;
	
	//加载配置文件
	String propertiesPath = request.getSession().getServletContext()
			.getRealPath(currentPath + "config.properties");
	Properties properties = new Properties();
	try {
		properties.load(new FileInputStream(propertiesPath));
		
	} catch (Exception e) {
		//加载失败的处理
		e.printStackTrace();
	}

	Uploader up = new Uploader(request);

	up.setSavePath("upload"); //保存路径
	String[] fileType = { ".rar", ".doc", ".docx", ".zip", ".pdf",
			".txt", ".swf", ".wmv", ".avi", ".rm", ".rmvb", ".mpeg",
			".mpg", ".ogg", ".mov", ".wmv", ".mp4" }; //允许的文件类型
	up.setAllowFiles(fileType);
	up.setMaxSize(1024); //允许的文件最大尺寸，单位KB
	up.upload();

	 response.getWriter().print(
			"{'url':'" + "noticeAction!download?filename="+up.getFileName() + "','fileType':'" + up.getType()
					+ "','state':'" + up.getState() + "','original':'"
					+up.getOriginalName() + "'}");
%>