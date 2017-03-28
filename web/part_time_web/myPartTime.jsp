<%--
  Created by IntelliJ IDEA.
  User: wll
  Date: 2017/3/27
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>index_manager</title>
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

    .row_content {
      border: solid 1px #CCCCCC;
      padding: 10px 0;
    }

    input {
      height: 30px !important;
    }

  </style>
</head>
<body>
<div class="wrap">
  <div class="header">
    <div class="logo"><a href="index.html"><img src="img/logo.png"/></a></div>
    <!--<div class="search">-->
    <!--<form>-->
    <!--<input type="text" value=""/>-->
    <!--<input type="submit" value=""/>-->
    <!--</form>-->
    <!--</div>-->
    <div class="social">
      <ul>
        <li>修改密码&nbsp;|&nbsp;</li>
        <li>注销</li>

      </ul>
    </div>
    <div class="clear"></div>
  </div>
  <div class="content">
    <div class="sidebar">
      <div class="side">
        <h3>系统管理</h3>
        <ul>
          <li><a href="myPartTime.html">我的兼职时间</a></li>
          <li><a href="businessInfo.html">商家邀请</a></li>
          <li><a href="releaseInfo.html">发布消息</a></li>
          <li><a href="applicantsInfo.html">应聘者信息</a></li>
        </ul>
      </div>

    </div>
    <div class="nav">
      <ul>
        <li><a href="#">条件查询</a></li>
        <li><a href="#">条件查询</a></li>
        <li><a href="#">条件查询</a></li>
        <li><a href="#">条件查询</a></li>
        <li><a id="addWorkTime">增加工作时间</a></li>
      </ul>
    </div>

    <div class="main">
      <div class="row row_content" style="padding-left: 10%;">
        <div>可工作日期</div>
      </div>
      <div class="row row_content text-center">
        <div class="col-sm-6">开始时间</div>
        <div class="col-sm-6">结束时间</div>
      </div>

      <div class="row row_content text-center">
        <div class="col-sm-6">2017-03-12&nbsp;&nbsp;09:00</div>
        <div class="col-sm-6">2017-03-12&nbsp;&nbsp;12:00</div>
      </div>
      <div class="row row_content text-center">
        <div class="col-sm-6">2017-03-12&nbsp;&nbsp;09:00</div>
        <div class="col-sm-6">2017-03-12&nbsp;&nbsp;12:00</div>
      </div>

    </div>
    <div class="clear"></div>
  </div>
  <div id="DataPageBar" style="padding-left: 30%; width: 100%;">

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

<script src="js/biz/myPartTime.js"></script>
</html>
