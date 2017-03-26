<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/icon.css">
<script type="text/javascript" src="<%=path%>/script/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/locale/easyui-lang-zh_CN.js"></script>	
<script language="javascript">
jQuery(function(){
	var toolArray = [
		{id:"search",	text:"查询数据",		iconCls:"icon-search",handler:searchUser},
		{id:"select",	text:"选择用户",		iconCls:"icon-select",handler:selectUser},
		{id:"delete",	text:"信用扣分",		iconCls:"icon-remove",handler:updateUser},
		{id:"refresh",	text:"刷新数据",		iconCls:"icon-reload",handler:refreshUser}
	];
	jQuery("#user_grid").datagrid({
	    columns:[[    
	    	{field:"ck",				checkbox:true,		width:20},    
	        {field:"userId",			title:"用户ID",		width:10,	align:"left"},
	        {field:"loginName",			title:"登录昵称",	width:15,	align:"left"},
	        {field:"userName",			title:"商家名称",	width:15,	align:'left'},
			{field:"creditScore",		title:"信用分值",	width:10,			align:'left'},
	        {field:"tel",			    title:"联系电话",	width:15,	align:'left'},
			{field:"addr",				title:"地址",		width:15,			align:'left'}

		]],
	    method:		"post",
	    url:		"<%=path%>/userController/getUserList.forward?date="+new Date()+"&userType=2&status=1",
	    fit:				true,		//grid占满父级窗口。
	    fitColumns:			true,
	    rownumbers:			true,
	    loadMsg:			"正在加载商家列表，请稍候...",
	    toolbar:			toolArray,
	    pagination:			true,
	    pageSize:			20,
	    striped:            true,
	    pageList:			[10,20,30]
	});
	
	function selectUser(){
		jQuery("#user_grid").datagrid("selectAll");  
	}

	function updateUser(){
		var selectArray = jQuery("#user_grid").datagrid("getSelections");
		if (selectArray == null || selectArray.length == 0){
			jQuery.messager.alert("错误提示","您还未选择任何一条记录，无法执行该操作","warning");
			return;		
		}else{
			var idArray = new Array();
			for(var i = 0;i<selectArray.length;i++){
				var selectObj = selectArray[i];
				var userid = selectObj.userId;
				idArray.push(userid);
			}
			
			var total_user_id = idArray.join(",");

			var paramObj = {
				"total_userid":		total_user_id
			};
			var deleteURL = "<%=path%>/userController/modifyUserScore.forward?date="+new Date()+"";
			
			jQuery.post(deleteURL,paramObj,function(jsonData){
				var flag = jsonData.success;
				var message = jsonData.msg;
				if (flag == true){
					jQuery.messager.alert("操作提示", "所选商家信用分扣除10分");
					jQuery("#user_grid").datagrid("reload"); 
				}else{
					jQuery.messager.alert("错误提示","出现错误,原因:"+message+"","warning");
				}
			},"json");
		}
	}

	function refreshUser(){
		jQuery("#user_grid").datagrid("reload");  
	}




	

	function searchUser(){
		var loginName = jQuery("#loginName").val();
		var userName = jQuery("#userName").val();
		var paramObj = {
			"loginName":		loginName,
			"userName":	userName
		};
		
		var dataGridProp =  jQuery("#user_grid").datagrid("options");
		dataGridProp.queryParams = paramObj;
		jQuery("#user_grid").datagrid("reload");  
	}	
});

</script>
</head>
  
<body class="easyui-layout">   
	<div data-options="region:'north'" style="height: 80px;">
		<table width="100%" id="mytab"  border="0" class="t2" style="font-size: 13px;">
		  <tr>
		   <td align="right" width="10%">登录昵称：</td>
		    <td align="left" width="20%"><input type="text" name="loginName" id="loginName"  />
		  
		  
		    <td align="right" width="10%">商家名称：</td>
		    <td align="left" width="20%"><input  type="text" name="userName" id="userName"> </td>
		  </tr>
		</table>		
	</div>
	
	
    <div data-options="region:'center'">
		<div id="user_grid"></div>
    </div>    
</body>
</html>
