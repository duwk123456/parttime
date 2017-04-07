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
        $("#age").val("");
        $("#userName").val("");
    });


}

function initData() {
    var param = {};
    param.page = 1;
    param.rows = 8;
    param.jobId = jobId;
    $.post(home + "/userController/getEmployeeList.forward", param, function (data) {
        showData(data, 1, 8);
    }, "json");

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
                __html.push(" <div class='prev'><img width='100%' height='100%' src='" + home + "/getImage?imageName=" + dataList[i].userPic + "'/> </div>");
                __html.push("<ul class='details'>");
                __html.push("<li class='more-text' title='" + dataList[i].userName + "'>学生昵称:" + dataList[i].userName + "</li>");
                var end = '';
                if (dataList[i].endTime == null || dataList[i].endTime == '') {
                    end = '';
                } else {
                    end += "至" + dataList[i].endTime;
                }
                __html.push("<li class='more-text' title='" + dataList[i].beginTime + end + "'>兼职时间段:" + dataList[i].beginTime + end + "</li>");
                __html.push("<li>年龄:" + dataList[i].age + "</li>");
                __html.push("<li>电话:" + dataList[i].tel + "</li>");
                __html.push("<li>性别:" + dataList[i].sex + "</li>");
                __html.push("<li><a href='#' onclick=\"sure('" + dataList[i].userId + "','" + dataList[i].beginTime + "','" + dataList[i].endTime + "')\">邀请兼职</a></li></ul>");
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


function freshData(total, rows, pageNumber) {
    var params = {};
    params.page = pageNumber;
    params.rows = rows;
    params.status = 1;
    params.isEnd = 1;
    params.userName=$("#userName").val();
    params.age=$("#age").val();
    $.post(home + "/userController/getEmployeeList.forward", params, function (data) {
        showData(data, pageNumber, rows);
    }, "json");

}

function sure(id, begin, end) {
    var params = {};
    params.employeeId = id;
    params.jobId = jobId;
    params.beginTime = begin;
    params.endTime = end;

    $.post(home + "/jobController/addUserJob.forward", params, function (data) {
        if (data.success) {
            dialog("邀请成功");
            initData();
        } else {
            dialog("邀请失败");
        }
    }, "json");

}