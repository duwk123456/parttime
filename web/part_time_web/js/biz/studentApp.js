



var page = 1;
var rows = 8;
$(function () {
    initView();
    bindClick();
});
function initView() {


    initData();


}

function bindClick() {

    //查询
    $("#sure").off("click").on("click",function(){
        freshData(null,8,1);
    });
    $("#cancle").off("click").on("click",function(){
        $("#userName").val("");
        $("#age").val("");
    });
}

function initData() {
    var listParam = {
        url: home + "/jobController/getUserJobList.forward",
        data: {
            page: page,
            rows: rows,
            userId: userId,
            status: 0,
            isEnd: 1
        },
        success: function (rtnObj) {
            if (rtnObj.success) {
                $("#main").empty();

                var total = rtnObj.total;
                var content = rtnObj.data;
                if (total == 0) {
                    layer.msg("当前还没有学生申请过");
                }
                else {
                    var _html = [];
                    for (var i = 0; i < content.length; i++) {


                        _html.push("<div class='grid'>");
                        _html.push("<div class='prev'> <img src='" + home + "/getImage?imageName=" + content[i].userPic + "'/>  </div>");
                        _html.push("<ul class='details'>");
                        _html.push("<li class=more-text' title='"+content[i].stuName +"'>学生昵称:" + content[i].stuName + "</li>");
                        var end = '';
                        if (content[i].stuEndTime == null || content[i].stuEndTime == '') {
                            end = '';
                        } else {
                            end += "至" + content[i].stuEndTime;
                        }
                        _html.push("<li class='more-text' title='"+content[i].stuBeginTime  +end+"'>兼职时间段:" + content[i].stuBeginTime  +end + "</li>");
                        _html.push("<li>年龄:" + content[i].stuAge + "</li>");
                        _html.push(" <li>电话:" + content[i].stuTel + "</li>");
                        _html.push(" <li>性别:" + content[i].stuSex + "</li>");
                        _html.push("<li onclick='sureFunction(this)' id='ID_" + content[i].flowId + "' flowId='" + content[i].flowId + "'>确认招聘</li>");
                        _html.push("</ul>");
                        _html.push("<div class='clear'></div> </div>");

                    }
                    $("#main").append(_html.join(""));
                    if (total > rows) {
                        $("#pageBar").pageBar({
                            total: total,
                            rows: rows,
                            showPageCount: false,
                            pageNumber: 1,
                            callback: function (total, rows, page) {
                                freshData(total, rows, page);
                            }
                        });
                    }
                }
            }
        }
    };
    requestData(listParam);
}

function freshData(total, rows, page) {

    var listParam = {
        url: home + "/jobController/getUserJobList.forward",
        data: {
            page: page,
            rows: rows,
            userId: userId,
            status: 0,
            isEnd: 1,
            age:$("#age").val(),
            stuName:$("#userName").val()
        },
        success: function (rtnObj) {
            if (rtnObj.success) {
                $("#main").empty();

                var total = rtnObj.total;
                var content = rtnObj.data;
                if (total == 0) {
                    layer.msg("当前还没有学生申请过");
                }
                else {
                    var _html = [];
                    for (var i = 0; i < content.length; i++) {

                        _html.push("<div class='grid'>");
                        _html.push("<div class='prev'> <img src='" + home + "/getImage?imageName=" + content[i].userPic + "'/>  </div>");
                        _html.push("<ul class='details'>");
                        _html.push("<li class=more-text' title='"+content[i].stuName +"'>学生昵称:" + content[i].stuName + "</li>");
                        var end = '';
                        if (content[i].stuEndTime == null || content[i].stuEndTime == '') {
                            end = '';
                        } else {
                            end += "至" + content[i].stuEndTime;
                        }
                        _html.push("<li class='more-text' title='"+content[i].stuBeginTime  +end+"'>兼职时间段:" + content[i].stuBeginTime  +end + "</li>");
                        _html.push("<li>年龄:" + content[i].stuAge + "</li>");
                        _html.push(" <li>电话:" + content[i].stuTel + "</li>");
                        _html.push(" <li>性别:" + content[i].stuSex + "</li>");
                        _html.push("<li onclick='sureFunction(this)' id='ID_" + content[i].flowId + "' flowId='" + content[i].flowId + "'>确认招聘</li>");
                        _html.push("</ul>");
                        _html.push("<div class='clear'></div> </div>");

                    }
                    $("#main").append(_html.join(""));

                    $("#pageBar").pageBar({
                        total: total,
                        rows: rows,
                        showPageCount: false,
                        pageNumber: page,
                        callback: function (total, rows, page) {
                            freshData(total, rows, page);
                        }
                    });

                }
            }
        }
    };
    requestData(listParam);

}

function sureFunction(obj) {
    var setStatusParam = {};
    var flowId = $(obj).attr("flowId");
    var setStatusParam = {};
    setStatusParam.url = home + "/jobController/modifyUserJobStatus.forward";

    var dialog = {
        msg: "是否确认招聘？",
        sure: "确认招聘",
        cancle: "残忍拒绝",
        sureCallBack: function () {

            setStatusParam.data = {
                flowId: flowId,
                status: 1
            };
            setStatusParam.success = function () {
                $("#ID_" + flowId).text("确认成功");
                initData();
            };

            requestData(setStatusParam);

        }
        ,
        cancelCallBack: function () {
            setStatusParam.data = {
                flowId: flowId,
                status: 2
            };
            setStatusParam.success = function () {
                $("#ID_" + flowId).text("已拒绝");
                initData();
            };
            requestData(setStatusParam);
        }
    };
    showDialog(dialog);
}

