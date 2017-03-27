<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<script type="text/javascript" src="<%=path%>/script/ajaxfileupload.js"></script>
<style>


</style>


<script language="javascript">
jQuery(function(){
	jQuery("#endTime").datebox({

	});

	jQuery("#beginTime").datebox({

	});



});





function saveData(){

    var addr=jQuery("#addr").val();

    var salary=jQuery("#salary").val();
    var tel=jQuery("#tel").val();

    var contactName=jQuery("#contactName").val();
    var beginTime=jQuery("#beginTime").datetimebox("getValue");;
	var endTime=jQuery("#endTime").datetimebox("getValue");;
	var pic=jQuery("#pic").val();

	var desc = jQuery("#desc").val();;
	var formData = {};

	formData.addr=addr;
	formData.salary=salary;
	formData.salaryUnit=$("#salay_unit option:selected").val();
	formData.contactName=contactName;
	formData.beginTime=beginTime;
	formData.endTime=endTime;
	formData.tel=tel;
	formData.createUserId=$("#userId").val();
	formData.desc=jQuery("#desc").val();;





var  picture;





    if(addr==""|| addr==null){
		jQuery.messager.alert("错误提示","兼职地址不得为空","warning");
		return false;
       }
	if(salary==""|| salary==null){
		jQuery.messager.alert("错误提示","薪资不得为空","warning");
		return false;
	}


	if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
		jQuery.messager.alert("错误提示","不是完整的11位手机号或者正确的手机号前七位","warning");
		return false;
	}
	if(contactName==""|| contactName==null){
		jQuery.messager.alert("错误提示","联系人不得为空","warning");
		return false;
	}

	if(beginTime==""|| beginTime==null){
		jQuery.messager.alert("错误提示","开始时间不得为空","warning");
		return false;
	}


	if(desc==""|| desc==null){
		jQuery.messager.alert("错误提示","工作内容不得为空","warning");
		return false;
	}

	var strExtension = pic.substr(pic.lastIndexOf('.') + 1);
	if (strExtension != 'jpg' && strExtension != 'gif'
			&& strExtension != 'png' && strExtension != 'bmp') {
		jQuery.messager.alert("错误提示","请选择图片文件","warning");
		return;
	}

	$.ajaxFileUpload({
		url: "<%=path%>/jobController/uploadPic.forward",
		secureuri: false,
		fileElementId: 'pic',//file标签的id
		dataType: 'json',//返回数据的类型
		data: {},//一同上传的数据
		success: function (data, status) {
			if(data.success){
				picture=data.data;
				formData.pic=picture;
				var saveURL = "<%=path%>/jobController/save.forward?date="+new Date()+"";

				jQuery.post(saveURL,formData,function(jsonData){
					var flag = jsonData.success;
					var message = jsonData.msg;
					if (flag == true){
						jQuery.messager.alert("操作提示", "兼职信息发布成功","info");
					}else{
						jQuery.messager.alert("错误提示","保存数据出现错误,原因:"+message+"","warning");
					}
				},"json");
			}
			//$("#hig").attr("src", data.result);
		},
		error: function (data, status, e) {
			alert(e);
		}
	});




}





</script>
</head>
  
<body class="easyui-layout">  
<div id="dialog_div">
	<form  id="form1" data-options="region:'center'" id="uploadForm" method="post" enctype="multipart/form-data">
		<table width="100%" id="mytab"  border="1" class="t2">
		  <tr>
		    <td align="right" width="20%">兼职地点：</td>
		    <td align="left" width="80%"><input  type="text" name="addr" id="addr"  cssStyle="width:138px" /></td>
		  </tr>
		  
	
		  <tr>
		    <td align="right">薪资：</td>
		    <td align="left"><input  type="number" name="salary" id="salary" maxlength="20"/><select id="salay_unit">
				<option value="天">天</option>
				<option value="时">时</option>
			</select>
		     </td>
		  </tr>

			<tr>
				<td align="right" width="20%">联系手机：</td>
				<td align="left" width="80%"><input  type="text" name="tel" id="tel" maxlength="11" cssStyle="width:138px" /></td>
			</tr>

			<tr>
				<td align="right">联系人：</td>
				<td align="left"><input  type="text" name="contactName" id="contactName" maxlength="16"/>
				</td>
			</tr>

			<tr>
				<td align="right">兼职开始时间：</td>
				<td align="left"><input  type="text" name="beginTime" id="beginTime" />
				</td>
			</tr>
			<tr>
				<td align="right">兼职结束时间：</td>
				<td align="left"><input  type="text" name="endTime" id="endTime" />
				</td>
			</tr>
			<tr>
				<td align="right">工作内容：</td>
				<td align="left"><input  type="text" name="desc" id="desc" maxlength="120" />
				</td>
			</tr>


		  
		    <tr>

		    <td align="right">上传图片：</td>
		    <td align="left">

				<input type="file" name="pic" id="pic" runat="server">

		    </td>

		  </tr>
			<input type="hidden" id="userId" value="${sessionScope.userInfo.userId}">

		      
		</table>  
	</form>
</div> 

<div id="bb" style="text-align: center;">
	<a href="javascript:void(0);" data-options="iconCls:'icon-save'" class="easyui-linkbutton" onclick="saveData();">保存数据</a>
</div>



</body>
</html>
