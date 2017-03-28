<%--
  Created by IntelliJ IDEA.
  User: wll
  Date: 2017/3/27
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Login Form Styling</title>
    <meta name="description" content="Custom Login Form Styling with CSS3"/>
    <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder"/>
    <meta name="author" content="Codrops"/>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/style_login.css"/>
    <script src="js/modernizr.custom.63321.js"></script>
    <!--[if lte IE 7]>
    <style>.main {
        display: none;
    }

    .support-note .note-ie {
        display: block;
    }</style><![endif]-->
    <style>
        @import url(http://fonts.googleapis.com/css?family=Montserrat:400,700|Handlee);

        body {
            background: #eedfcc url(img/bg3.jpg) no-repeat center top;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
        }

        .container > header h1,
        .container > header h2 {
            color: #fff;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>

<jsp:include page="common.jsp"></jsp:include>
<div class="container">

    <!-- Codrops top bar -->
    <!--/ Codrops top bar -->

    <header>

        <h1>好的<strong>兼职 </strong> 在这里</h1>

        <h2>我们期待您的加入</h2>

        <!--<nav class="codrops-demos">-->
        <!--<a href="index.html">Demo 1</a>-->
        <!--<a href="index2.html">Demo 2</a>-->
        <!--<a href="index3.html">Demo 3</a>-->
        <!--<a href="index4.html">Demo 4</a>-->
        <!--<a class="current-demo" href="index5.html">Demo 5</a>-->
        <!--</nav>-->
        <div class="support-note">
            <span class="note-ie">Sorry, only modern browsers.</span>
        </div>

    </header>

    <section class="main">
        <form class="form-5 clearfix">
            <p>
                <input type="text" id="login" name="login" placeholder="登录名">
                <input type="password" name="password" id="password" placeholder="密码">
            </p>
            <button id="submit">
                <i class="icon-arrow-right"></i>
                <span>登录</span>
            </button>
            <p style="text-align: right; margin-left: 25%;border: none;font-size: 22px;color: #c93d75;">注册</p>
            <!--<button>-->
            <!--<span>注册</span>-->
            <!--</button>-->
        </form>

        ​​​​
    </section>

</div>

</body>
<script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="js/biz/login.js"></script>
</html>