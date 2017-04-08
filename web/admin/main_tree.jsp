<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>兼职发布系统后台管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/script/easyui_1.3.6/themes/icon.css">
<script type="text/javascript" src="<%=path%>/script/jquery-1.7.2.js"></script>
<link rel="stylesheet"  type="text/css" href="<%=path%>/css/animation.css">
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/script/easyui_1.3.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"> 


</script> 
<script> 
$(function(){


  //实例化树形菜单
  jQuery("#tree").tree({
    lines:			true,
    url:			"<%=path%>/SysController/leftTree.forward?date="+new Date()+"",
    onClick:		function(node){
      if (node.isLeaf == 1){
      	 addTab(node.text,node.url,null);
      }
    }
  });
  
  



function addTab(subtitle,url,icon){
   if(!$('#tabs').tabs('exists',subtitle)) {
	   $('#tabs').tabs('add', {
		   title: subtitle,

		   content: "<iframe scrolling=\"auto\" frameborder=\"0\"  src=\"" + url + "\" style=\"width:100%;height:100%;\"></iframe>",
		   closable: true,

		   icon: icon
	   });
   }else{
		$('#tabs').tabs('select',subtitle);
	}

		
	tabClose();
	
}

$('#tabs').tabs({    
  
    onSelect:function(title){    
   
        var pp = $('#tabs').tabs('getSelected');
        var content = pp.panel('options').content;
       
       $("#tabs").tabs('update',{//更新
    	tab:pp,
    	options:content
});
          
    }    
});  



$("#l").click(function(){

var tab = $('#tabs').tabs('getSelected');
var index = $('#tabs').tabs('getTabIndex',tab);

});
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
	});
	

		$("#m-refresh").click(function(){
		
        var currTab = $('#tabs').tabs('getSelected');
       var x=currTab.panel('options').content;
  
      
		
		//tab.panel('refresh', 'get_content.php');

       
     
    });
	

	
	
});

function editpwd(){

	var editURL = "<%=path%>/userAction!editPwd";
			
	var returnObj = window.showModalDialog(editURL,null,"dialogWith:180px;dialogHeight:230px;center:yes");

}

</script>

<script language="javascript">

	function over(){




jQuery.messager.confirm("确认","您确认退出该系统吗？",function(r){    
    if (r){   
    
 	var removeURL = "<%=path%>/SysController/logOut.forward?date="+new Date()+"";

		jQuery.get(removeURL, function(jsonData){
				
				var flag = jsonData.success;
				if(flag){
				
				
			var x= "<%= basePath%>";
			
		
		window.location.href="<%= basePath%>";
			} 
			
		}, "json");
	
 
          
    }    
}); 

	
	}

	
	

</script>

<style> 
  .west{
    width:200px;
    padding:10px;
   
  }

     
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
     
.footer{text-align:center;color:#15428B; margin:0px; padding:0px;line-height:23px; font-weight:bold;}  
</style> 
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">

    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎  ${sessionScope.userInfo.userName}  &nbsp;&nbsp;<a href="javascript:void(0)"  style="color:white"  onclick="editpwd();" id="editpass" >修改密码</a> <a href="javascript:void(0)"   style="color:white" onclick="over()" id="loginOut" >安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "> 兼职后台管理系统</span>
    </div>


	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs" tabWidth="150" >


		</div>

	</div>

  
  <div region="west" class="west" title="导航菜单" style="padding: 0px;margin: 0px;">
    <ul id="tree"></ul>
  </div>

    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">	Copyright © 2017-2018.闽江学院 版权所有.</div>
    </div>
    <div  id="xxx"></div>
  
  
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

</body>
</html>