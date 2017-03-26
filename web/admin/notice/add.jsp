<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/table.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/icon.css"/>
<script type="text/javascript" src="<%=path%>/script/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

jQuery(function() {




    $("#save").click(function () {
           var content = jQuery("#content").val();

         if (content == "" || content == null) {
         jQuery.messager.alert("错误提示", "内容是必填项", "warning");
         return false;
         }

         var formData = {
         "noticeContent": content
         }

         var saveURL = "<%=path%>/noticeController/addNotice.forward?date=" + new Date() + "";

         jQuery.post(saveURL, formData, function (jsonData) {
         var flag = jsonData.success;
         var message = jsonData.msg;

         if (flag == true) {

         jQuery.messager.alert("操作提示", "发布成功", "info");
         } else {
         jQuery.messager.alert("错误提示", "出现错误,原因  " + message, "warning");
         }
         }, "json");

    });

    $("#reset").click(function () {
        jQuery("#form1")[0].reset();
    })


    });

	


</script>
</head>



<body>

<form  id="form1"  enctype="multipart/form-data" method="post" >
<table width="100%" id="mytab"  border="1" class="t2">


  <tr>
    <td align="center">公告内容</td>
    <td align="left" width="80%">
    
    	<textarea rows="10" cols="40" id="content"></textarea>
    
    </td>
   
  </tr>
 


  <tr>
    <td  colspan="2" align="center">
       <div  id="bb">
		<a href="javascript:void(0);"   data-options="iconCls:'icon-save'" class="easyui-linkbutton" id="save">保存</a>
    	<a href="javascript:void(0);"   data-options="iconCls:'icon-no'" class="easyui-linkbutton"  id="reset">重置</a>
      </div>
   </td>
  </tr>
  

</table>

</form>



</body>
</html>
