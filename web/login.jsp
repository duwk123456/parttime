<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>系统登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/table.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/icon.css"/>
<script type="text/javascript" src="<%=path%>/script/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/locale/easyui-lang-zh_CN.js"></script>	
<script language="javascript">
jQuery(function(){
	var buttonArray = [
		{text:"登录系统",iconCls:"icon-save",handler:function(){
			loginSystem();
		}},
		{text:"退出系统",iconCls:"icon-cancel",handler:function(){
			jQuery("#form1").window("close");
		}}		
	];
	jQuery("#form1").dialog({
		title:			"系统登录窗口",
		modal:			true,
	    width: 			500,    
	    height: 		400,    
		buttons:		buttonArray
	});
});
function loginSystem(){	
	//ajax提交表单的数据。
	   var username=document.getElementById("loginName").value;
       
       var userpwd=document.getElementById("password").value;


       if(username==""|| username==null){
	     jQuery.messager.alert("错误提示","用户名不得为空","error");
         document.getElementById("loginName").focus();
       	return false;
       }

         if(userpwd==""||userpwd==null){

			 jQuery.messager.alert("错误提示","密码不得为空","error");
			 document.getElementById("password").focus();

      	 return false;
       }
       
   


	
	var formData = {};
	formData.loginName=username;
	formData.password=userpwd;
	formData.userType=1;
	var loginURL = "<%=path%>/SysController/login.forward?date="+new Date()+"";

		jQuery.post(loginURL, formData, function(jsonData){
				
				var flag = jsonData.success;
				if(flag){
			
				var mainURL = "<%=path%>/admin/main_tree.jsp";
			window.location.href = mainURL;
			} else {

					
					jQuery.messager.alert("错误提示",jsonData.msg,"error");
				}

		}, "json");
	

}


</script>
</head>
  
<body class="easyui-layout">   
<form  id="form1" method="post">
<table width="100%" id="mytab"  border="1" class="t2" style="heigth:600px;">
  <tr>
    <td align="right" width="20%">用户名：</td>
    <td align="left" width="80%"><input name="loginName" id="loginName" /> </td>
 
  </tr>

  <tr>
    <td align="right">密码：</td>
    <td align="left"><input type="password" name="password"   id="password" /></td>
  </tr>

</table>  
</form>
</body>
</html>
