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
    $("#sure").off("click").on("click", function () {
        freshData(null, 8, 1);
    });
    $("#cancle").off("click").on("click", function () {
        $("#desc").val("");
        $("#userName").val("");
    });
}

function initData() {
    var listParam = {
        url: home + "/jobController/getUserJobList.forward",
        data: {
            page: page,
            rows: rows,
            employeeId: userId,
            status: 0,
            isEnd: 1
        },
        success: function (rtnObj) {
            if (rtnObj.success) {
                $("#main").empty();

                var total = rtnObj.total;
                var dataList = rtnObj.data;
                if (total == 0) {
                    layer.msg("当前还没有商家邀请过");
                }
                else {
                    var _html = [];
                    for (var i = 0; i < dataList.length; i++) {

                        _html.push("<div class='grid'>");
                        _html.push(" <div class='prev'><img width='100%' height='100%' src='" + home + "/getImage?imageName=" + dataList[i].userPic + "'/> </div>");
                        _html.push("<ul class='details'>");
                        _html.push("<li class='more-text' title='" + dataList[i].storeName + "'>商家名称:" + dataList[i].storeName + "</li>");
                        _html.push("<li>工资:" + dataList[i].salaryAndUnit + "</li>");
                        _html.push("<li class='more-text' title='" + dataList[i].jobBeginTime + "至" + dataList[i].jobEndTime + "'>工作时间:" + dataList[i].jobBeginTime + "至" + dataList[i].jobEndTime + "</li>");
                        _html.push("<li  class='more-text' title='" + dataList[i].jobDesc + "'>工作内容:" + dataList[i].jobDesc + "</li>");
                        _html.push("<li>联系方式:" + dataList[i].jobTel + "</li>");
                        _html.push("<li onclick='sureFunction(this)' id='ID_" + dataList[i].flowId + "' flowId='" + dataList[i].flowId + "'>确认邀请</li></ul>");
                        _html.push(" <div class='clear'></div>");
                        _html.push("</div>");

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
            employeeId: userId,
            status: 0,
            isEnd: 1,
            desc:$("#desc").val(),
            userName:$("#userName").val()
        },
        success: function (rtnObj) {
            if (rtnObj.success) {
                $("#main").empty();

                var total = rtnObj.total;
                var dataList = rtnObj.data;
                if (total == 0) {
                    layer.msg("当前还没有商家邀请过");
                }
                else {
                    var _html = [];
                    for (var i = 0; i < dataList.length; i++) {

                        _html.push("<div class='grid'>");
                        _html.push(" <div class='prev'><img width='100%' height='100%' src='" + home + "/getImage?imageName=" + dataList[i].userPic + "'/> </div>");
                        _html.push("<ul class='details'>");
                        _html.push("<li class='more-text' title='" + dataList[i].storeName + "'>商家名称:" + dataList[i].storeName + "</li>");
                        _html.push("<li>工资:" + dataList[i].salaryAndUnit + "</li>");
                        _html.push("<li class='more-text' title='" + dataList[i].jobBeginTime + "至" + dataList[i].jobEndTime + "'>工作时间:" + dataList[i].jobBeginTime + "至" + dataList[i].jobEndTime + "</li>");
                        _html.push("<li  class='more-text' title='" + dataList[i].jobDesc + "'>工作内容:" + dataList[i].jobDesc + "</li>");
                        _html.push("<li>联系方式:" + dataList[i].jobTel + "</li>");
                        _html.push("<li onclick='sureFunction(this)' id='ID_" + dataList[i].flowId + "' flowId='" + dataList[i].flowId + "'>确认邀请</li></ul>");
                        _html.push(" <div class='clear'></div>");
                        _html.push("</div>");

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
        msg: "是否确认邀请？",
        sure: "确认邀请",
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

