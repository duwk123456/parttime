<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
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
	jQuery("#dialog_div").dialog({
		region:			"center",
		fit:			true,    
	    title: 			"修改用户",        
	    closable: 		false,       
	    modal: 			true,
	    buttons:		"#bb"  
	}); 		
});
function saveData(){
	//ajax提交表单的数据。
	var formData = jQuery("#form1").serializeArray();
	
	var saveURL = "<%=path%>/userAction!modify?date="+new Date()+"";
	
	jQuery.post(saveURL,formData,function(jsonData){
		var flag = jsonData.flag;
		var message = jsonData.message;
		if (flag == true){
			jQuery.messager.alert("操作提示", "用户信息已修改成功，点击确定按纽，关闭窗口并刷新页面数据","info",function(){
				window.returnValue = "succ";
				window.close();
			
			});
		}else{
			jQuery.messager.alert("错误提示","出现错误,原因:"+message+"","warning");		
		}
	},"json");
}

</script>
</head>
  
<body class="easyui-layout">  
<div id="dialog_div">
	<form action="" id="form1" data-options="region:'center'">
		<table width="100%" id="mytab"  border="1" class="t2">
		  <tr>
		    <td align="right" width="20%">用户ID：</td>
		    <td align="left" width="80%">
			    <input type="text" value="<s:property value="userBean.userid"/>" disabled="disabled"/>
			    
			    <s:hidden name="userBean.userid" readonly="true"/> 
		    </td>
		 
		  </tr>		
		  <tr>
		    <td align="right" width="20%">用户名称：</td>
		    <td align="left" width="80%"><s:textfield name="userBean.username"></s:textfield> </td>
		 
		  </tr>
		
		  <tr>
		    <td align="right">真实姓名：</td>
		    <td align="left"><s:textfield name="userBean.truename"></s:textfield> </td>
		 
		  </tr>
		  
		  <tr>
		    <td align="right">性别：</td>
		    <td><s:radio list="#{1:'男',0:'女'}" name="userBean.usersex"></s:radio>  </td>
		 
		  </tr>

		  <tr>
		    <td align="right">年龄：</td>
		    <td align="left"><s:textfield name="userBean.userage"></s:textfield> </td>
		 
		  </tr>
		  
		  <tr>
		    <td align="right">联系电话：</td>
		    <td align="left"><s:textfield name="userBean.telphone"></s:textfield> </td>
		 
		  </tr>
		  
		  <tr>
		    <td align="right">地址：</td>
		    <td align="left"><s:textfield name="userBean.address"></s:textfield> </td>
		 
		  </tr>	
		  
		    <tr>
		    <td align="right">所属部门：</td>
		    <td align="left">
		    <s:select  list="#deptMap"  name="userBean.deptid" id="deptid" cssStyle="width:80px;"></s:select>
		  
		   
		    </td>
		  </tr>		  	  



<s:if test="%{#session.userBean.is_admin==1}">
		  <tr>
		    <td align="right">所属角色：</td>
		    <td align="left">
		    <s:checkboxlist list="#roleMap" name="userBean.roleList"></s:checkboxlist>
		    </td>
		  </tr>	
		</s:if>  
		  	  
		</table>  
	</form>
</div> 

<div id="bb">
	<a href="javascript:void(0);" data-options="iconCls:'icon-save'" class="easyui-linkbutton" onclick="saveData();">保存数据</a>
	<a href="javascript:void(0);" data-options="iconCls:'icon-no'" class="easyui-linkbutton" onclick="window.close();">关闭窗口</a>
</div>



</body>
</html>
