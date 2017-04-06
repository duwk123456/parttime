
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
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
  <link href="js/page/pageBar_curr.css" rel="stylesheet" type="text/css" media="all"/>
  <link href="js/layer/skin/layer.css" rel="stylesheet" type="text/css" media="all"/>
  <style type="text/css">
    html, body {
      font-family: 微软雅黑 !important;
    }
  </style>
</head>
<body>
<jsp:include page="common.jsp"></jsp:include>
<div class="wrap">
  <div class="header">
    <div class="logo"><a href="index.jsp"><img src="img/logo.png"/></a></div>
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
          <li><a href="index.jsp">兼职信息</a></li>
        </ul>
      </div>
    </div>
    <div class="nav">
      <ul>

        <li><a href="category.jsp">条件查询</a></li>
        <li><a href="category.jsp">条件查询</a></li>
        <li><a href="category.jsp">条件查询</a></li>
        <li><a href="category.jsp">条件查询</a></li>
        <li><a href="category.jsp">条件查询</a></li>

      </ul>
    </div>
    <div class="main">



      <div id="tbody">

      </div>
        <div class="clear"></div>
      </div>

    <div class="clear"></div>
  </div>
  <div id="pageBar" style="padding-left: 30%; text-align: center;width: 50%;">


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
  var userType = $.fui.store.get("userType");
  var beginTime = $.fui.store.get("beginTime");
  var endTime = $.fui.store.get("endTime");
</script>
<script>

  $(function () {
    $("#logout").click(function () {
      window.location.href="<%=path%>/part_time_web/login.jsp"
    })
    $("#modifyPwd").click(function () {
      var _html = "<div style='overflow-x: hidden;padding-bottom: 10px;'>";
      _html += "<table style='width: 100%'><tr> <td style='width:44%;text-align: right'>旧密码:</td><td style='width:50%;text-align: left'>&nbsp;&nbsp;&nbsp;<input type='password' id='pwd' style='height: 30px'></td></tr> " +
              "<tr><td style='width:44%;text-align: right'>新密码:</td><td style='width:50%;text-align: left'>&nbsp;&nbsp;&nbsp;<input type='password' id='newPwd' style='height: 30px'></td></tr> " +
              "<tr><td style='width:44%;text-align: right'>确认密码:</td><td style='width:50%;text-align: left'>&nbsp;&nbsp;&nbsp;<input type='password' id='surePwd' style='height: 30px'></td></tr> "+
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
<script src="js/biz/index.js"></script>
</html>
