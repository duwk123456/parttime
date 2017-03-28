<%--
  Created by IntelliJ IDEA.
  User: wll
  Date: 2017/3/28
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String home = request.getContextPath();
    request.setAttribute("home", home);

%>
<html>
<head>
    <title></title>
    <script>
        var home = "${home}";
    </script>
</head>
<body>

</body>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/biz/common.js"></script>
<script src="js/fui.min.js"></script>
</html>
