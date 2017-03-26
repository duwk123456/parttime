<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'index.jsp' starting page</title>
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
		{id:"search",	text:"查询数据    ",		iconCls:"icon-search",handler:searchNotice},
		{id:"select",	text:"选择公告   ",		iconCls:"icon-tip",handler:selectNotice},
		{id:"edit",		text:"编辑公告   ",		iconCls:"icon-edit",handler:editNotice},
		{id:"delete",	text:"删除公告   ",		iconCls:"icon-remove",handler:delNotice},
		{id:"refresh",	text:"刷新数据   ",		iconCls:"icon-reload",handler:refreshNotice}
	];
	jQuery("#notice_grid").datagrid({
	    columns:[[    
	    	{field:"ck",				checkbox:true,		width:80},    
	        {field:"notice_id",			title:"公告ID",		width:10,	align:"center",hidden:true},    
	   	 	 {field:"notice_title",			title:"公告主题",		width:35,	align:'left' ,halign:"center"},
	        {field:"notice_addtime",			title:"上传时间",	width:30,	align:"center",halign:"center"},    
	        {field:"notice_adduser",			title:"上传人员",	width:17,	align:'center'},
	  
	        {field:"is_approve",			title:"审批状态",		width:25,	align:'center',
	        formatter: function(value,row,index){
					if (value == "0"){
						return "<font color='black'>未审批</font>";
					}else if (value == "1"){
						return "<font color='black'>审核通过</font>";
					}else{
							return "<font color='red'>审核未通过</font>";
					}
				}
	        
	        },
	        {field:"approve_time",			title:"审批时间",	width:35,	align:'center' ,halign:"center"},
	        {field:"approve_user",			title:"审批人员",		width:17,	align:'center' ,halign:"center"}    
	    ]],
	    method:		"post",
	    url:		"<%=path%>/noticeAction!noticeListJson?doPage=yes&approve=all&date="+new Date()+"",
	    fit:				true,		//grid占满父级窗口。
	    fitColumns:			true,
	    rownumbers:			true,
	    loadMsg:			"正在加载用户列表，请稍候...",
	    toolbar:			toolArray,
	    pagination:			true,
	    pageSize:			20,
	    pageList:			[10,20,30],
	    striped:            true
	});
	
	
	jQuery("#approve_time").datebox({    
  
}); 
	function selectNotice(){
		jQuery("#notice_grid").datagrid("selectAll");  
	}
	
	
	function editNotice(){
		
		var selectObj = jQuery("#notice_grid").datagrid("getSelected");
		if (selectObj == null){
			jQuery.messager.alert("错误提示","您还未选择任何一条记录，无法执行该操作","warning");
			return;
		}else{
		
		
		    var is_approve = selectObj.is_approve;
		
		    if(is_approve=="1"){
		    jQuery.messager.alert("错误提示","审核通过的公告不能再进行修改！","warning");
		    
		    return;
		    }
			var notice_id = selectObj.notice_id;
		var title=	selectObj.notice_title;
			var editURL = "<%=path%>/noticeAction!edit?notice_id="+notice_id+"";
 	 		var $parent = self.parent.$;
			$parent('#tabs').tabs('add',{
			title:				"编辑公告-"+title,
			content:			"<iframe scrolling=\"auto\" frameborder=\"0\"  src=\""+editURL+"\" style=\"width:100%;height:100%;\"></iframe>",
			closable:			true,
			icon:				null
		});
			
			
		}
	}
	
	
	function delNotice(){
		var selectArray = jQuery("#notice_grid").datagrid("getSelections");
		if (selectArray == null || selectArray.length == 0){
			jQuery.messager.alert("错误提示","您还未选择任何一条记录，无法执行该操作","warning");
			return;		
		}else{
			var idArray = new Array();
			for(var i = 0;i<selectArray.length;i++){
				var selectObj = selectArray[i];
				var role_id = selectObj.notice_id;
				var is_approve = selectObj.is_approve;
			
				}
			
				var is_approve=selectObj.is_approve;	
				idArray.push(role_id);
			
			}
			
				jQuery.messager.confirm("确认对话框", "确定删除选中的公告吗?", function(r){
					if (r){
					
				var total_notice_id = idArray.join(",");
				
				var paramObj = {
					"total_notice_id":		total_notice_id
				};
				var deleteURL = "<%=path%>/noticeAction!delNotice?date="+new Date()+"";
			
				jQuery.post(deleteURL,paramObj,function(jsonData){
						var flag = jsonData.flag;
						var message = jsonData.message;
				if (flag == true){
						jQuery.messager.alert("操作提示", "公告信息已删除成功");
						jQuery("#notice_grid").datagrid("reload"); 
				}else{
						jQuery.messager.alert("错误提示","删除数据出现错误,原因:"+message+"","warning");		
				}
			},"json");		
				}else{
					jQuery("#notice_grid").datagrid("reload"); 
				}
		});
			
		
		}


	function refreshNotice(){
		jQuery("#notice_grid").datagrid("reload");  
	}
	

	
	function searchNotice(){
	
		var approve_time = jQuery("#approve_time").datetimebox("getValue");
		var notice_title = jQuery("#notice_title").val();
		
		
		var paramObj = {
			"approve_time":		approve_time,
			"notice_title":	notice_title
		};
		
		var dataGridProp =  jQuery("#notice_grid").datagrid("options");
		dataGridProp.queryParams = paramObj;
		jQuery("#notice_grid").datagrid("reload");  
	}	
});

</script>
</head>
  
<body class="easyui-layout">   
	<div data-options="region:'north'" style="height: 80px;">
		<table width="100%" id="mytab"  border="0" class="t2" style="font-size: 13px;">
		  <tr>
		    <td align="right" width="15%">审核时间：</td>
		    <td align="left" width="35%"><s:textfield name="approve_time"  id="approve_time"    ></s:textfield></td>
		    
		    <td align="right" width="15%">公告主题：</td>
		    <td align="left" width="35%"><s:textfield name="notice_title" id="notice_title"></s:textfield> </td>		    
		 
		  </tr>
		</table>		
	</div>
	
	
    <div data-options="region:'center'">
		<div id="notice_grid"></div>
    </div>    
</body>
</html>
