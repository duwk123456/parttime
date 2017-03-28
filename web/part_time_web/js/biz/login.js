/**
 * Created by wll on 2017/3/14.
 */
$(function () {
    initView();
    bindClick();

});
function initView() {
    $(function () {
        $('input, textarea').placeholder();
    });
}
function bindClick() {
    $("#submit").off("click").on("click", function () {

        var login = $("#login").val();
        var password = $("#password").val();

        if (login == "") {
            showDialog({
                msg: "请输入用户名",
                sure: "确定",
                sureCallBack: function () {
                    $("#login").focus();
                }
            });

            return false;
        }
        if (password == "") {
            showDialog({
                msg: "请输入密码",
                sure: "确定",
                sureCallBack: function () {
                    $("#login").focus();
                }
            });

            return false;
        }
        else {


            var loginParam = {
                url: home + "/SysController/login.forward",
                data: {
                    loginName: login,
                    password: password
                },
                success: function (resultObj) {
                    alert(resultObj);
                    var userInfo = resultObj.data;
                    if (resultObj.success) {
                        var param = "userName=" + userInfo.userName + "&userType=" + userInfo.userType + "&userId=" + userInfo.userId;
                        window.location.href = "index.jsp?" + param;
                    }
                    else {
                        showDialog({
                            msg: resultObj.msg,
                            sure: "确定"
                        });
                    }
                }
            };
            console.info(JSON.stringify(loginParam));
            requestData(loginParam);

        }
    });


}

