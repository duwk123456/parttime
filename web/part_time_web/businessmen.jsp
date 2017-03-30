<%--
  Created by IntelliJ IDEA.
  User: wll
  Date: 2017/3/27
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <title>index</title>
  <meta name="keywords"
        content="Fundaaz Iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
  <link href="js/page/pageBar_curr.css" rel="stylesheet" type="text/css" media="all"/>
  <link href="js/layer/skin/layer.css" rel="stylesheet" type="text/css" media="all"/>
  <style type="text/css">
    html, body {
      font-family: 微软雅黑 !important;
    }

    .main div {
      padding: 5px;
    }
  </style>

</head>
<body>
<div class="wrap">
  <div class="header">
    <div class="logo"><a href="index.jsp"><img src="img/logo.png"/></a></div>
    <!--<div class="search">-->
    <!--<form>-->
    <!--<input type="text" value=""/>-->
    <!--<input type="submit" value=""/>-->
    <!--</form>-->
    <!--</div>-->
    <div class="social">
      <ul>
        <li><span id="modifyPwd" >修改密码</span>&nbsp;|&nbsp;<span id="logout">注销</span></li>

      </ul>
    </div>
    <div class="clear"></div>
  </div>
  <div class="content">
    <div class="sidebar">
      <div class="side">
        <h3>系统功能</h3>
        <ul>
          <li><a href="myPartTime.jsp">我的兼职时间</a></li>
          <li><a href="businessInfo.jsp">商家邀请</a></li>
          <li><a href="releaseInfo.jsp">发布消息</a></li>
          <li><a href="applicantsInfo.jsp">应聘者信息</a></li>
        </ul>
      </div>
    </div>
    <div class="nav">
      <ul>

        <li><a href="">条件查询</a></li>
        <li><a href="">条件查询</a></li>
        <li><a href="">条件查询</a></li>
        <li><a href="">条件查询</a></li>
        <li><a href="">条件查询</a></li>

      </ul>
    </div>
    <div class="main">
      <div class="col-sm-4">
        <img src="img/logo.png">

        <div style="text-align: center;">申请兼职</div>
      </div>
      <div class="col-sm-6">
        <div>商家名称</div>
        <div>兼职时间段</div>
        <div>联系方式</div>
        <div>工作地点</div>
        <div>工资</div>
      </div>
      <div class="col-sm-12" style="margin-top: 50px">
        <div style="font-weight: bold;">工作内容简介</div>
        <div style="margin-top: 15px"> 简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容
        </div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
  <div id="DataPageBar" style="padding-left: 30%; text-align: center;width: 50%;">


  </div>
</div>
<!--------------------------------------->
<div class="wrap">
  <div id="bg_footer">
    <div class="clear"></div>
    <div class="copy" style="text-align: center;">Copyright &copy; 2017-2018.闽江学院 版权所有.</div>
  </div>
</div>
</body>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/page/pageBar_curr.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/biz/common.js"></script>
<script src="js/fui.min.js"></script>
<script>
  var userId = $.fui.store.get("userId");
</script>
<script>

  $(function () {

    $("#logout").click(function () {
      window.location.href="<%=path%>/part_time_web/login.jsp"
    })

    $("#modifyPwd").click(function () {

      var _html = "<div style='overflow-x: hidden;padding-bottom: 10px;'>";
      _html += "<table style='width: 100%'><tr> <td style='width:44%;text-align: right; font-size: 14px;'>旧密码:</td><td style='width:50%;text-align: left'>&nbsp;&nbsp;&nbsp;<input type='password' id='pwd' style='height: 30px'></td></tr> " +
              "<tr><td style='width:44%;text-align: right; font-size: 14px;'>新密码:</td><td style='width:50%;text-align: left'>&nbsp;&nbsp;&nbsp;<input type='password' id='newPwd' style='height: 30px'></td></tr> " +
              "<tr><td style='width:44%;text-align: right; font-size: 14px;'>确认密码:</td><td style='width:50%;text-align: left'>&nbsp;&nbsp;&nbsp;<input type='password' id='surePwd' style='height: 30px'></td></tr> "+
              "</table>";
      _html += "</div>";

      var addRealseInfo = layer.open({
        type: 1,
        skin: 'layui-layer-demo', //样式类名
        btn: ['确定', '取消'], //不显示关闭按钮
        anim: 2,
        closeBtn: 1,
        shadeClose: true, //开启遮罩关闭
        content: _html,
        area: ['50%', '25%'],
        title: '修改密码',
        yes: function () {
          var pwd = $("#pwd");
          var surePwd = $("#surePwd");
          var newPwd = $('#newPwd');

          if (pwd.val() == "") {

            dialog("旧密码不能为空!");
            return false;

          }
          if (newPwd.val() == "") {

            dialog("请输入新密码");
            return false;
          }

          if (newPwd.val() != surePwd.val()) {

            dialog("确认密码和新密码不一致");
            return false;
          }

          $.post(home+"/userController/updatePwd.forward",{password:pwd.val(),newPwd:newPwd.val(),userId:userId},function(data){
            if(data.success){
              dialog("密码修改成功");
              layer.close(addRealseInfo);
            }else{
              dialog("密码修改失败");
            }
          },"json");


        }
      })

    })
  })
</script>
</html>
