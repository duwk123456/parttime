<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
	<title>用户注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/table.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/icon.css"/>
<script type="text/javascript" src="<%=path%>/script/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/script/ajaxfileupload.js"></script>
<style>


</style>


<script language="javascript">
jQuery(function(){

});





function saveData(){

    var loginName=jQuery("#loginName").val();


    var userName=jQuery("#userName").val();
    var password=jQuery("#password").val();
    var surepwd=jQuery("#surepwd").val();
    var addr=jQuery("#addr").val();
    var tel=jQuery("#tel").val();
    var age=jQuery("#age").val();
	var userPic=jQuery("#pic").val();
    if(loginName==""|| loginName==null){
		jQuery.messager.alert("错误提示","登录名称不得为空","warning");
		return false;
	}
	if(userName==""|| userName==null){
		jQuery.messager.alert("错误提示","用户名称不得为空","warning");
		return false;
	}

	if(password==""|| password==null){
		jQuery.messager.alert("错误提示","密码不得为空","warning");
		return false;
	}
	if(password!=surepwd){
		jQuery.messager.alert("错误提示","两次密码不一致","warning");
		return false;
	}


     if(age==""|| age==null){
		 jQuery.messager.alert("错误提示","年龄不得为空","warning");
		 return false;
       }

	if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
		jQuery.messager.alert("错误提示","不是完整的11位手机号或者正确的手机号前七位","warning");
		return false;
	}
	        	
	    
	 if(addr==""|| addr==null){
		 jQuery.messager.alert("错误提示","地址不得为空","warning");
		 return false;
       }
	var userType = $("input[name='userType'][checked]").val();
	if(userType==""|| userType==null){
		jQuery.messager.alert("错误提示","请选择用户类型","warning");
		return false;

	}

	if(userPic==""|| userPic==null){
		jQuery.messager.alert("错误提示","请上传图片","warning");
		return false;
	}

	var strExtension = userPic.substr(userPic.lastIndexOf('.') + 1);
	if (strExtension != 'jpg' && strExtension != 'gif'
			&& strExtension != 'png' && strExtension != 'bmp') {
		jQuery.messager.alert("错误提示","请选择图片文件","warning");
		return;
	}
	var sex = "";
	var userType = "";

	var radionum = document.getElementsByName("sex");
	var radionum1 = document.getElementsByName("userType");
 	for(var i=0;i<radionum.length;i++){
		if(radionum[i].checked){
			 sex = radionum[i].value
			 }
	 }
	for(var i=0;i<radionum1.length;i++){
		if(radionum1[i].checked){
			userType = radionum1[i].value
		}
	}

	alert(sex);
	alert(userType);
	var formData={};
	formData.loginName=loginName;
	formData.sex=sex;
	formData.userType=userType;
	formData.userName=userName;
	formData.addr=addr;
	formData.age=age;
	formData.tel=tel;
	formData.password=password;

	$.ajaxFileUpload({
		url: "<%=path%>/jobController/uploadPic.forward",
		secureuri: false,
		fileElementId: 'pic',//file标签的id
		dataType: 'json',//返回数据的类型
		data: {},//一同上传的数据
		success: function (data, status) {
			if(data.success){

				formData.userPic=data.data;
				var saveURL = "<%=path%>/userController/addUser.forward?date="+new Date()+"";

				jQuery.post(saveURL,formData,function(jsonData){
					var flag = jsonData.success;
					var message = jsonData.msg;
					if (flag == true){
						jQuery.messager.confirm("操作提示", "用户信息已添加成功 是否前往登录界面吗?", function(r){
							if (r){
								//清空表单
							  window.location.href="part_time_web/login.jsp"
							}
						});
					}else{
						jQuery.messager.alert("错误提示","保存数据出现错误","warning");
					}
				},"json");
			}

		},
		error: function (data, status, e) {
			alert(e);
		}
	});


}


function reset(){

	jQuery("#form1")[0].reset();
}
var flag=false;

function checkUser(){

		var saveURL = "<%=path%>/userController/checkUser.forward?date="+new Date()+"";
		var loginName=$("#loginName").val();
		if(loginName!=""&&loginName!=null){

			jQuery.post(saveURL,{loginName:loginName},function(jsonData){
				if(!jsonData.success){
					jQuery.messager.alert("错误提示","登录名称已经存在","warning");
					flag=false;
				}else{
					flag=true;
				}
			},"json")
		}else{
			return ;
		}


	}

</script>
</head>
  
<body class="easyui-layout">
<div>
<div style="text-align:  center;  height: 50px;
    font-size: 24px;
    line-height: 40px;
}"> 用户注册</div>
<div id="dialog_div" style="margin-bottom: 12px;">
	<form action="" id="form1" data-options="region:'center'">
		<table width="100%" id="mytab"  border="1" class="t2">
		  <tr>
		    <td align="right" width="48%">登录名称：</td>
		    <td align="left" width="52%"><input type="text" name="loginName" id="loginName"  onblur="checkUser()" maxlength="15"/>
		     </td>
		  </tr>
		  
	
		  <tr>
		    <td align="right">用户昵称：</td>
		    <td align="left"><input name="userName" id="userName" maxlength="20"/>
		     </td>
		  </tr>

			<tr>
				<td align="right">用户密码：</td>
				<td align="left"><input type="password" name="password" id="password" maxlength="9"/>
				</td>
			</tr>
			<tr>
				<td align="right">确认密码：</td>
				<td align="left"><input type="password"  name="surePwd" id="surepwd" maxlength="9"/>
				</td>
			</tr>
		  <tr>
		    <td align="right">性别：</td>
		    <td><input type="radio" checked="checked"  name ="sex" value="男">男
				<input type="radio"  name="sex" value="女">女
			 </td>
		 
		  </tr>

		  <tr>
		    <td align="right">年龄：</td>
		    <td align="left"><input type="text" style="width:50px;" id="age" maxlength="2"/>
		    </td>
		 
		  </tr>
		  
		  <tr>
		    <td align="right">手机号码：</td>
		    <td align="left"><input type="text" name="tel" id="tel" maxlength="11"/>
			</td>
		  </tr>
		  
		  <tr>
		    <td align="right">地址：</td>
		    <td align="left"><input type="text" name="addr" id="addr" />
		    </td>
		  </tr>	
		  


		  <tr>
		    <td align="right">用户类型：</td>
		    <td align="left">
				<input type="radio" checked="checked"  name ="userType" value="3">学生
				<input type="radio"  name="userType" value="2">商家
		    </td>
		  </tr>
			<tr>
				<td align="right">上传头像：</td>
				<td align="left"><input type="file" id="pic" name="pic">
				</td>
			</tr>

		</table>  
	</form>
</div> 

<div id="bb" style="text-align: center;">
	<a href="javascript:void(0);" data-options="iconCls:'icon-save'" class="easyui-linkbutton" onclick="saveData();">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:void(0);" data-options="iconCls:'icon-no'" class="easyui-linkbutton" onclick="">重置</a>
</div>
<div>



</body>
</html>
