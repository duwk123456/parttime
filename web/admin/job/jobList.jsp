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
		{id:"select",	text:"选择兼职项",		iconCls:"icon-select",handler:selectUser},
		{id:"delete",	text:"驳回",		iconCls:"icon-no",handler:updateJob},
		{id:"refresh",	text:"刷新数据",		iconCls:"icon-reload",handler:refreshUser}
	];
	jQuery("#user_grid").datagrid({
	    columns:[[    
	    	{field:"ck",				checkbox:true,		width:10},
	        {field:"jobId",			title:"编号",		width:10,	align:"left"},
	        {field:"userName",			title:"所属商家",	width:15,	align:"left"},
	        {field:"salaryAndUnit",			title:"薪资",	width:8,	align:'left'},
	        {field:"tel",			    title:"联系电话",	width:8,	align:'left'},
			{field:"addr",	        title:"兼职地点",		width:20,		align:'left'},
			{field:"beginTime",	        title:"开始时间",		width:10,		align:'left'},
		    {field:"endTime",	        title:"结束时间",		width:10,		align:'left'},
	        {field:"contactName",	        title:"联系人",		width:10,		align:'left'},
			{field:"statusStr",	        title:"状态",		width:10,		align:'left'},
			{field:"status",	        title:"ss",		width:10,		align:'left',hidden:true}
		]],
	    method:		"post",
	    url:		"<%=path%>/jobController/getJobList.forward?date="+new Date()+"",
	    fit:				true,		//grid占满父级窗口。
	    fitColumns:			true,
	    rownumbers:			true,
	    loadMsg:			"正在加载兼职信息，请稍候...",
	    toolbar:			toolArray,
	    pagination:			true,
	    pageSize:			20,
	    striped:            true,
	    pageList:			[10,20,30]
	});

	jQuery("#endTime").datebox({

	});

	jQuery("#beginTime").datebox({

	});

	function selectUser(){
		jQuery("#user_grid").datagrid("selectAll");  
	}


	function refreshUser(){
		jQuery("#user_grid").datagrid("reload");  
	}


	function updateJob(){
		var selectArray = jQuery("#user_grid").datagrid("getSelections");
		if (selectArray == null || selectArray.length == 0){
			jQuery.messager.alert("错误提示","您还未选择任何一条记录，无法执行该操作","warning");
			return;
		}else{
			var idArray = new Array();
			for(var i = 0;i<selectArray.length;i++){
				var selectObj = selectArray[i];
				var  curr = getNowFormatDate();


				if(curr>selectObj.endTime){
					jQuery.messager.alert("操作提示", "当前时间大于编号为"+ selectObj.jobId+"项兼职的结束时间,无法驳回","warning");
					return ;
				}

				var userid = selectObj.jobId;
				idArray.push(userid);
			}

			var total_user_id = idArray.join(",");


			var paramObj = {
				"total_job_id":		total_user_id
			};
			var deleteURL = "<%=path%>/jobController/updateJobStatus.forward?date="+new Date()+"";

			jQuery.post(deleteURL,paramObj,function(jsonData){
				var flag = jsonData.success;
				var message = jsonData.msg;
				if (flag == true){
					jQuery.messager.alert("操作提示", "驳回兼职发布，操作成功");
					jQuery("#user_grid").datagrid("reload");
				}else{
					jQuery.messager.alert("错误提示","出现错误,原因:"+message+"","warning");
				}
			},"json");
		}
	}

	

	function searchUser(){

		var userName = jQuery("#userName").val();
		var status = jQuery("#status").val();
		var beginTime = jQuery("#beginTime").datetimebox("getValue");
		var endTime = jQuery("#endTime").datetimebox("getValue");
		var paramObj = {
			"userName": userName,
			"status":	status,
			"endTime":endTime,
			"beginTime":beginTime
		};
		
		var dataGridProp =  jQuery("#user_grid").datagrid("options");
		dataGridProp.queryParams = paramObj;
		jQuery("#user_grid").datagrid("reload");  
	}

	function getNowFormatDate() {
		var date = new Date();
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
				/*+ " " + date.getHours() + seperator2 + date.getMinutes()
				+ seperator2 + date.getSeconds();*/
		return currentdate;
	}
});

</script>
</head>
  
<body class="easyui-layout">   
	<div data-options="region:'north'" style="height: 80px;">
		<table width="100%" id="mytab"  border="0" class="t2" style="font-size: 13px;">
		  <tr>
		    <td align="right" width="10%">商家名称：</td>
		    <td align="left" width="20%"><input  type="text" name="userName" id="userName"> </td>
			  <td align="right" width="10%">状态：</td>
			  <td align="left" width="20%"><select id="status"  style="width:172px;height:24px" >
				  <option value=''>不限</option>
				  <option value="1">正常</option>
				  <option value="2">驳回</option>
			  </select> </td>
		  </tr>

			<tr>
				<td align="right" width="10%">开始兼职时间：</td>
				<td align="left" width="20%" colspan="3">
					<input  name="beginTime"  id="beginTime" > 至
					<input  name="endTime"  id="endTime" >

				</td>



			</tr>
		</table>		
	</div>
	
	
    <div data-options="region:'center'">
		<div id="user_grid"></div>
    </div>    
</body>
</html>
