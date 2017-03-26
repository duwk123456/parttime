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
<style>


</style>


<script language="javascript">
jQuery(function(){
	jQuery("#dialog_div").dialog({
		region:			"center",
		fit:			true,    
	    title: 			"添加用户",        
	    closable: 		false,       
	    modal: 			true,
	    buttons:		"#bb"  
	}); 		
});

function checkUser(){

	var username =  jQuery("#username").val();
		var paramObj = {
				
				"username":username
				
			};
	if (username != ""){
		username_span.innerHTML="";
		var checkURL = "<%=path%>/userAction!checkUser?date="+new Date()+"";

		jQuery.post(checkURL,paramObj,function(returnData){
			if(returnData == "false"){
					username_span.innerHTML = "<font color= 'red'>用户名【"+username+"】存在</font>";	
					document.getElementById("username").focus();
			}else if (returnData == "true"){
			
			}
		},"text");
	}
}



function saveData(){

    var username=jQuery("#username").val();    

    var truename=jQuery("#truename").val();
    var userage=jQuery("#userage").val();
    var telphone=jQuery("#telphone").val();
    var address=jQuery("#address").val();
    var deptid=jQuery("#deptid").val();
    var roleList=jQuery("#roleList").val();




	

    if(username==""|| username==null){
    
   document.getElementById("username_span").innerHTML="用户名不得为空";
         document.getElementById("username").focus();
        
       	return false;
       }
       if(!/^[a-zA-Z0-9]{3,15}$/.test(username)){
	
	  document.getElementById("username_span").innerHTML="用户名必须数字或者英文 长度为3 ~15";
			return false;	
		}else{
			username_span.innerHTML="";
		}
       

   if(truename==""|| truename==null){
    document.getElementById("truename_span").innerHTML="真实姓名不得为空！";
         document.getElementById("truename").focus();
       	return false;
       }
	     	
	  if(!/[^x00-xff]$/.test(truename)){
	   document.getElementById("truename_span").innerHTML="真实姓名要为中文！";
	    
	       	return false;
	  	}else{
	  	
	  document.getElementById("truename_span").innerHTML="";
	  	}
	

 if(userage==""|| userage==null){
    document.getElementById("userage_span").innerHTML="年龄不得为空！";
         document.getElementById("userage").focus();
       	return false;
       }
       
	  if(userage<10){
       document.getElementById("userage_span").innerHTML="年龄要大于10岁！";
        return false;
      }else{
      document.getElementById("userage_span").innerHTML="";
      }
	     
	     
	    
	      if(telphone==""|| telphone==null){
     document.getElementById("telphone_span").innerHTML="电话不得为空！";
         document.getElementById("telphone").focus();
       	return false;
       }   
	         if(!/^[0-9]*$/.test(telphone)){
	           document.getElementById("telphone_span").innerHTML="电话号码只能为数字！";
	        		return false;
	        	}else{
	          document.getElementById("telphone_span").innerHTML="";
	        	}
	        	
	        	
	    
	 if(address==""|| address==null){
     document.getElementById("address_span").innerHTML="地址不得为空";
         document.getElementById("address").focus();
       	return false;
       }   else{
            document.getElementById("address_span").innerHTML="";
       }
	 
	       	
	       	
	 	
	if (deptid !=null && deptid==0){
	  document.getElementById("deptid_span").innerHTML="部门还未选择！";
	  return false;
	}else{
	 document.getElementById("deptid_span").innerHTML="";
	}
	
	
	if (roleList ==null ){
	  document.getElementById("roleList_span").innerHTML="角色还未选择！";
	  return false;
	}else{
	document.getElementById("roleList_span").innerHTML="";
	}
	
	
	
	var formData = jQuery("#form1").serializeArray();
	
	var saveURL = "<%=path%>/userAction!save?date="+new Date()+"";
	
	jQuery.post(saveURL,formData,function(jsonData){
		var flag = jsonData.flag;
		var message = jsonData.message;
		if (flag == true){
			jQuery.messager.confirm("操作提示", "用户信息已添加成功，是否继续添加?", function(r){
				if (r){
					//清空表单
					document.getElementById("form1").reset();
				}else{
					window.returnValue = "succ";
					window.close();
				}
			});
		}else{
			jQuery.messager.alert("错误提示","保存数据出现错误,原因:"+message+"","warning");		
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
		    <td align="right" width="20%">用户名称：</td>
		    <td align="left" width="80%"><s:textfield name="userBean.username" id="username" onblur="checkUser();" cssStyle="width:138px" maxlength="15"></s:textfield>
		    <span id="username_span" style="color:red"></span>
		     </td>
		 
		  </tr>
		  
	
		  <tr>
		    <td align="right">真实姓名：</td>
		    <td align="left"><s:textfield name="userBean.truename" id="truename" maxlength="20"></s:textfield>
		    <span id="truename_span"  style="color:red"></span>
		     </td>
		 
		  </tr>
		  
		  <tr>
		    <td align="right">性别：</td>
		    <td><s:radio list="#{1:'男',0:'女'}" name="userBean.usersex" ></s:radio>  </td>
		 
		  </tr>

		  <tr>
		    <td align="right">年龄：</td>
		    <td align="left"><s:textfield name="userBean.userage" cssStyle="width:50px;" id="userage" maxlength="2"></s:textfield> 
		    <span id="userage_span" style="color:red"></span>
		    </td>
		 
		  </tr>
		  
		  <tr>
		    <td align="right">联系电话：</td>
		    <td align="left"><s:textfield name="userBean.telphone" id="telphone" maxlength="11"></s:textfield>
		    <span id="telphone_span" style="color:red"></span>
		     </td>
		 
		  </tr>
		  
		  <tr>
		    <td align="right">地址：</td>
		    <td align="left"><s:textfield name="userBean.address"  id="address" maxlength="50"></s:textfield> 
		    <span id="address_span" style="color:red"></span>
		    
		    </td>
		 
		  </tr>	
		  
		    <tr>
		    <td align="right">所属部门：</td>
		    <td align="left">
		    <s:select  list="#deptMap"  name="userBean.deptid" id="deptid" cssStyle="width:80px;"></s:select>
		    <span id="deptid_span" style="color:red"></span>
		    </td>
		  </tr>		  

		  <tr>
		    <td align="right">所属角色：</td>
		    <td align="left">
		    <s:select list="#roleMap" name="userBean.roleList" multiple="true" id="roleList" cssStyle="width:80px;"></s:select>
		    <span id="roleList_span" style="color:red"></span>
		    </td>
		  </tr>			  
		      
		</table>  
	</form>
</div> 

<div id="bb">
	<a href="javascript:void(0);" data-options="iconCls:'icon-save'" class="easyui-linkbutton" onclick="saveData();">保存数据</a>
	<a href="javascript:void(0);" data-options="iconCls:'icon-no'" class="easyui-linkbutton" onclick="window.close();">关闭窗口</a>
</div>



</body>
</html>
