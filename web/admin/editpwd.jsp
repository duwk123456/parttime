<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	    title: 			"修改密码",        
	    closable: 		false,       
	    modal: 			true,
	    buttons:		"#bb"  
	}); 		
});

function checkUserPwd(){

	   var userpwd=jQuery("#userpwd").val();
	     var userpwd_span=jQuery("#userpwd_span");
	   
	   
	
		var paramObj = {
				
				"userpwd":userpwd
				
			};
	if (userpwd != ""){
		userpwd_span.innerHTML="";
		var checkURL = "<%=path%>/userAction!checkUserPwd?date="+new Date()+"";

	
		jQuery.post(checkURL,paramObj,function(returnData){
		var flag=returnData.flag;
	
			if(!flag){
			
				document.getElementById("userpwd_span").innerHTML = "<font color= 'red'>与旧密码不一致</font>";	
					document.getElementById("userpwd").focus();
			}else {
			document.getElementById("userpwd_span").innerHTML="<img  src=\"<%=path%>/image/reg_succ.png\"/>";
			
			}
		},"json");
	}
}



function saveData(){

   
    var userpwd=jQuery("#userpwd").val();
    var newpwd=jQuery("#newpwd").val();
     var cknewpwd=jQuery("#cknewpwd").val();

       /*验证密码  */
         if(userpwd==""||userpwd==null){
		 document.getElementById("userpwd_span").innerHTML="请填写当前密码，不得为空";
      	 jQuery("#newpwd").focus();
      	 return false;
       }else{
			 document.getElementById("userpwd_span").innerHTML="";
		
		}
		
		
		  /*验证新密码  */
         if(newpwd==""||newpwd==null){
		 document.getElementById("newpwd_span").innerHTML="密码必须数字或者英文 长度为3 ~15";
      	 jQuery("#newpwd").focus();
      	 return false;
       }
		
		 if(!/^[a-zA-Z0-9]{3,15}$/.test(newpwd)){
				 document.getElementById("newpwd_span").innerHTML="密码必须数字或者英文 长度为3 ~15";
		 	 jQuery("#newpwd").focus();
			return false;	
		}else{
			 document.getElementById("newpwd_span").innerHTML="";
		
		}
		
		
		/* 验证密码的一致性 */
	if(newpwd!=cknewpwd)
	{
 	 document.getElementById("cknewpwd_span").innerHTML="两次密码不一致！";
 	jQuery("#cknewpwd").focus();
 	return false;
	}else{
	 document.getElementById("cknewpwd_span").innerHTML="";
	}
	
	
	var formData={
	
	"newpwd":newpwd
	
	};
	
	var saveURL = "<%=path%>/userAction!modifyPwd?date="+new Date()+"";
	
	jQuery.post(saveURL,formData,function(jsonData){
		var flag = jsonData.flag;
		var message = jsonData.message;
		if (flag == true){
				jQuery.messager.alert("提示","密码修改成功","info");
				window.returnValue = "succ";
			
				}else{
			jQuery.messager.alert("错误提示","修改密码过程出现错误,原因:"+message+"","warning");		
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
		    <td align="right" width="20%">当前密码：</td>
		    <td align="left" width="80%"><s:password name="userBean.password"  id="userpwd" maxlength="15"  onblur="checkUserPwd();"  />

		     </td>
		  </tr>
		  
		   <tr>
		    <td align="right" width="20%">新密码：</td>
		       <td align="left" width="80%"><s:password name="userBean.password"  id="newpwd" maxlength="15"/>
		     </td>
		 
		  </tr>
		  
		<tr>
		    <td align="right" width="20%">确认新密码：</td>
		    <td align="left" width="80%"><s:password name="userBean.password" id="cknewpwd"  maxlength="15"/>
		    
		    <span id="cknewpwd_span" style="color:red"></span>
		     </td>
		 
		  </tr>
		
		      
		</table>  
	</form>
</div> 

<div id="bb">
	<a href="javascript:void(0);" data-options="iconCls:'icon-save'" class="easyui-linkbutton" onclick="saveData();">确定修改</a>
	<a href="javascript:void(0);" data-options="iconCls:'icon-no'" class="easyui-linkbutton" onclick="window.close();">关闭窗口</a>
</div>



</body>
</html>
