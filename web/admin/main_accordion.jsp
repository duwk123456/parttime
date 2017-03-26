<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>兼职后台系统管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/icon.css">
<script type="text/javascript" src="<%=path%>/script/jquery-1.7.2.js"></script>
<link rel="stylesheet"  type="text/css" href="<%=path%>/css/animation.css">
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/locale/easyui-lang-zh_CN.js"></script>

<style>

     
    .demo-icon
    {
      font-family: "fontello";
      font-style: normal;
      font-weight: normal;
      speak: none;
     
      display: inline-block;
      text-decoration: inherit;
      width: 1em;
      margin-right: .2em;
      text-align: center;
      /* opacity: .8; */
     
      /* For safety - reset parent styles, that can break glyph codes*/
      font-variant: normal;
      text-transform: none;
     
      /* fix buttons height, for twitter bootstrap */
      line-height: 1em;
     
      /* Animation center compensation - margins should be symmetric */
      /* remove if not needed */
      margin-left: .2em;
     
      /* You can be more comfortable with increased icons size */
      /* font-size: 120%; */
     
      /* Font smoothing. That was taken from TWBS */
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
     
      /* Uncomment for 3D effect */
      /* text-shadow: 1px 1px 1px rgba(127, 127, 127, 0.3); */
    }
.west {
	width: 200px;
	padding: 10px;
}

.footer {
	text-align: center;
	color: #15428B;
	margin: 0px;
	padding: 0px;
	line-height: 23px;
	font-weight: bold;
}

.tree-title {
  font-size: 15px;
  display: inline-block;
  text-decoration: none;
  vertical-align: top;
  white-space: nowrap;
  padding: 0 2px;
  height: 18px;
  line-height: 18px;
}
</style>
<script type="text/javascript">
jQuery(function() {


});

</script>
	</head>
	<body class="easyui-layout" style="overflow-y: hidden" scroll="no">

		<div region="north" split="true" border="false"
			style="overflow: hidden; height: 30px; background:  #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
			<span style="float: right; padding-right: 20px;" class="head">欢迎   <i class="demo-icon icon-user">&#xe800;</i> <s:property value="#session.userBean.username"/>
				 <a href="javascript:void(0)" id="editpass"  style="color:white" onclick="editpwd();">修改密码</a> <a href="javascript:void(0)" id="loginOut"  style="color:white" onclick="over()">安全退出</a>
			</span>
			<span style="padding-left: 10px; font-size: 16px;"><img
					src="" width="20" height="20" align="absmiddle" />
				后台管理系统</span>
		</div>

<%--		<div region="center">
			<div class="easyui-tabs" fit="true" border="false" id="tabs"
				tabWidth="150">
				
				<div title="首页" style="padding: 20px; overflow: hidden;" id="home">
	<div  align="center">
				
				
				<a href="javascript:void(0);" data-options="iconCls:'icon-add'" class="easyui-linkbutton" onclick="reload();"  style="font-size: 15px;">
				<font size="2">加载更多</font></a> </div>
					
				<div id="notice_grid">
				
				</div>
				
					
				<s:hidden id="rows" value="%{#session.rows}" ></s:hidden>
				<s:hidden id="page" value="%{#session.page}" ></s:hidden>
			</div>
		</div>
		</div>--%>


		<div region="west" class="west" title="导航菜单"
			style="padding: 0px; margin: 0px;">
			<div class="easyui-accordion" data-options="fit:true">
					
		<%--		<s:iterator value="#bigMenuList">
				
				<div title="<s:property value="menu_name"/>" icon="icon-sys" style="overflow: auto;font-size: 20px;font-family: 新宋体;">
					<div id="tree_div_<s:property value="menu_id"/>"></div>
				</div>
				</s:iterator>--%>
			<div title="用户管理" icon="icon-sys" style="overflow: auto;font-size: 20px;font-family: 新宋体;">
				<div id="tree_div_<s:property value="menu_id"/>"></div>
			</div>

				
			</div>

		</div>

		<div region="south" split="true"
			style="height: 30px; background: #D2E0F2;">
			<div class="footer">
		Copyright  东方锐智  www.dfrz.com.cn
			</div>
		</div>

	<div id=mm class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div> 
<script language="javascript"> 
$(function(){
//绑定右键菜单事件
	<s:iterator value="#bigMenuList">
		var menu_id = "<s:property value="menu_id"/>";
		jQuery("#tree_div_"+menu_id+"").tree({
		  lines:			true,
		  url:			"<%=path%>/mainAction!leftAccordTree?menu_id="+menu_id+"&date="+new Date()+"",
		  onClick:		function(node){
		    if (node.isLeaf == 1){
		    	 addTab(node.text,node.menu_href,null);
		    }
		  }
		});	
	</s:iterator>
	
	


function addTab(subtitle,url,icon){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:				subtitle,
			content:			"<iframe scrolling=\"auto\" frameborder=\"0\"  src=\""+url+"\" style=\"width:100%;height:100%;\"></iframe>",
			closable:			true,
			icon:				icon
		});
	}else{
		$('#tabs').tabs('select',subtitle);
	}
	tabClose();
	
}
function tabClose()
{
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	})
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});
		
		var subtitle =$(this).children(".tabs-closable").text();
		
		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}
//绑定右键菜单事件


	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close',currtab_title);
	})
	//全部关闭
	$('#mm-tabcloseall').click(function(){	
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if (t != "首页"){
				$('#tabs').tabs('close',t);
			}
			
		});	
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if (t != "首页"){
				if(t!=currtab_title)
					$('#tabs').tabs('close',t);
			}
		});	
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			if (t != "首页"){
				$('#tabs').tabs('close',t);
			}
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			
			if (t != "首页"){
				$('#tabs').tabs('close',t);
			}
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})

});

function editpwd(){

	var editURL = "<%=path%>/userAction!editPwd";
			
	var returnObj = window.showModalDialog(editURL,null,"dialogWith:180px;dialogHeight:230px;center:yes");

}

function over(){




jQuery.messager.confirm("确认","您确认退出该系统吗？",function(r){    
    if (r){   
    
 	var removeURL = "<%=path%>/userAction!removeUserBean?date="+new Date()+"";

		jQuery.get(removeURL, function(jsonData){
				
				var flag = jsonData.flag;
				if(flag){
			var x= "<%= basePath%>";
		
			window.location.href="<%= basePath%>";
			} 
			
		}, "json");
	
 
          
    };  
});
}


	



</script>
</body>
</html>
