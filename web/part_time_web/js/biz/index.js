/**
 * Created by H81 on 2017/3/13.
 */
$(function () {
    initData();
    bindEvent();
});
function bindEvent() {
    //查询
    $("#sure").off("click").on("click", function () {
        freshData(null, 8, 1);
    });
    $("#cancle").off("click").on("click", function () {
        $("#desc").val("");
        $("#userName").val("");
    });

    $("#release").off("click").on("click", function () {
        addInfo();
    });


}

function initData() {
    if (userType == 3) {
        var param = {};
        param.page = 1;
        param.rows = 8;
        param.status = 1;
        param.isEnd = 1;
        param.inc = 1;
        param.employeeId = userId;

        $.post(home + "/jobController/getJobList.forward", param, function (data) {
            showData(data, 1, 8);
        }, "json");
    }
}


function showData(result, page, rows) {
    var tbody = $("#tbody");
    tbody.empty();
    $("#pageBar").hide();
    var __html = [];
    if (result.success) {
        var dataList = result.rows;
        if (dataList && dataList.length > 0) {
            for (var i = 0, _len = dataList.length; i < _len; i++) {


                __html.push("<div class='grid'>");
                __html.push(" <div class='prev'><img width='100%' height='100%' src='" + home + "/getImage?imageName=" + dataList[i].pic + "'/> </div>");
                __html.push("<ul class='details'>");
                __html.push("<li class='more-text' title='" + dataList[i].userName + "'>商家名称:" + dataList[i].userName + "</li>");
                __html.push("<li>工资:" + dataList[i].salaryAndUnit + "</li>");
                __html.push("<li class='more-text' title='" + dataList[i].beginTime + "至" + dataList[i].endTime + "'>工作时间:" + dataList[i].beginTime + "至" + dataList[i].endTime + "</li>");
                __html.push("<li class='more-text' title='" + dataList[i].desc + "'>工作内容:" + dataList[i].desc + "</li>");
                __html.push("<li>联系方式:" + dataList[i].tel + "</li>");
                __html.push("<li><a href='#' onclick=\"sure('" + dataList[i].jobId + "')\">申请兼职</a></li></ul>");
                __html.push(" <div class='clear'></div>");
                __html.push("</div>");
            }
        }
    } else {
    }
    tbody.append(__html.join(""));
    $("#pageBar").pageBar({
        total: result.total,
        rows: rows,
        showPageCount: false,
        pageNumber: page,
        callback: function (total, rows, pageNumber) {
            freshData(total, rows, pageNumber);
        }
    });

    if (result.total > 8) {
        $("#pageBar").show();
    }

}
function sure(id) {
    var params = {};
    params.employeeId = userId;
    params.jobId = id;
    params.beginTime = beginTime;
    params.endTime = endTime;
    params.createJobUserId=userId;
    $.post(home + "/jobController/addUserJob.forward", params, function (data) {
        if (data.success) {
            dialog("申请成功");
            initData();
        } else {
            dialog("申请失败");
        }
    }, "json");

}


function freshData(total, rows, pageNumber) {
    var params = {};
    params.page = pageNumber;
    params.rows = rows;
    params.status = 1;
    params.isEnd = 1;
    params.inc = 1;
    params.employeeId = userId;
    params.userName=$("#userName").val();
    params.desc=$("#desc").val();
    $.post(home + "/jobController/getJobList.forward", params, function (data) {
        showData(data, pageNumber, rows);
    }, "json");

}

function goto(id) {
    window.location.href = home + "/part_time_web/applicantsInfo.jsp?jobId=" + id;

}