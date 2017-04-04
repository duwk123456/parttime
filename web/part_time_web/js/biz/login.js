/**
 * Created by wll on 2017/3/14.
 */
$(function () {
    initView();
    bindClick();
});
function initView() {

    $('input, textarea').placeholder();
    var windWidth = window.outerWidth;
    var objWidth = $("#bottom").outerWidth();
    $("#bottom").css("margin-left", (windWidth - objWidth) / 2 - 30);
}
function bindClick() {
    $("#submit").off("click").on("click", function () {

        //window.location.href = "index.jsp?";
        //
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
                    var userInfo = resultObj.data;
                    if (resultObj.success) {

                        $.fui.store.set("userName", userInfo.userName);
                        $.fui.store.set("userType", userInfo.userType);
                        $.fui.store.set("userId", userInfo.userId);
                        $.fui.store.set("beginTime", userInfo.beginTime);
                        $.fui.store.set("endTime", userInfo.endTime);
                        if(userInfo.userType==2){
                            window.location.href = "releaseInfo.jsp";
                        }else{
                          window.location.href = "index.jsp";
                        }
                    }
                    else {
                        showDialog({
                            msg: resultObj.msg,
                            sure: "确定"
                        });
                    }
                }
            };
            requestData(loginParam);

        }
    });
    $("#register").off("click").on("click", function () {
        window.location.href = home + "/admin/user/add.jsp";
    });


}

