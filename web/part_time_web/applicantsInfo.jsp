<%--
  Created by IntelliJ IDEA.
  User: wll
  Date: 2017/3/27
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>applicantsInfo</title>
    <meta name="keywords"
          content="Fundaaz Iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="js/page/pageBar_curr.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="js/layer/skin/layer.css" rel="stylesheet" type="text/css" media="all"/>
    <style type="text/css">
        html, body {
            font-family: 微软雅黑 !important;
        }
    </style>
</head>
<body style="background: #444;">
<jsp:include page="common.jsp"></jsp:include>
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
            <!--<div class="side">-->
            <!--<h3>Mobile Templates</h3>-->
            <!--<ul>-->
            <!--<li><a href="">Abstract</a></li>-->
            <!--<li><a href="">Animals & Pets</a></li>-->
            <!--<li><a href="">Art & Photography</a></li>-->
            <!--<li><a href="">Beauty & Fashion</a></li>-->
            <!--<li><a href="">Business</a></li>-->
            <!--<li><a href="">Communications</a></li>-->
            <!--<li><a href="">Computers & Technologys</a></li>-->
            <!--<li><a href="">Shopping</a></li>-->
            <!--<li><a href="">Sports & Fitness</a></li>-->
            <!--<li><a href="">Travel & Hotel</a></li>-->
            <!--<li><a href="">Web Hosting</a></li>-->
            <!--</ul>-->
            <!--</div>-->
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
            <div class="grid" style="background-color: #CCCCCC;">
                <div class="prev"><a href="inviteStudent.jsp"><img src="http://lorempixel.com/150/150/food/"
                                                                    alt=""/></a>
                </div>
                <ul class="details">
                    <li><a href="inviteStudent.jsp">学生昵称</a></li>
                    <li>兼职时间段</li>
                    <li>年龄</li>
                    <li>电话</li>
                    <li>性别</li>
                    <li style="color: #000;">已邀请</li>
                </ul>
                <div class="clear"></div>
            </div>

            <div class="grid">
                <div class="prev"><a href="inviteStudent.jsp"><img src="http://lorempixel.com/150/150/food/"
                                                                    alt=""/></a>
                </div>
                <ul class="details">
                    <li><a href="inviteStudent.jsp">学生昵称</a></li>
                    <li>兼职时间段</li>
                    <li>年龄</li>
                    <li>电话</li>
                    <li>性别</li>
                    <li><a href="#">确认招聘</a></li>
                </ul>
                <div class="clear"></div>
            </div>

            <div class="grid">
                <div class="prev"><a href="inviteStudent.jsp"><img src="http://lorempixel.com/150/150/food/"
                                                                    alt=""/></a>
                </div>
                <ul class="details">
                    <li><a href="inviteStudent.jsp">学生昵称</a></li>
                    <li>兼职时间段</li>
                    <li>年龄</li>
                    <li>电话</li>
                    <li>性别</li>
                    <li><a href="#">确认招聘</a></li>
                </ul>
                <div class="clear"></div>
            </div>

            <div class="grid" style="background-color: #CCCCCC;">
                <div class="prev"><a href="inviteStudent.jsp"><img src="http://lorempixel.com/150/150/food/"
                                                                    alt=""/></a>
                </div>
                <ul class="details">
                    <li><a href="inviteStudent.jsp">学生昵称</a></li>
                    <li>兼职时间段</li>
                    <li>年龄</li>
                    <li>电话</li>
                    <li>性别</li>
                    <li style="color: #000;">已邀请</li>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
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
<%--<script src="js/biz/index.js"></script>--%>
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

