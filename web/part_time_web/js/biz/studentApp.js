/**
 * Created by H81 on 2017/3/13.
 */
$(function () {
    initData();
    bindEvent();
});
function bindEvent(){
    //查询
    $("#sure").off("click").on("click",function(){
        freshData(null,4,1);
    });
    $("#canle").off("click").on("click",function(){
        $("#feedbackContent").val("");
    });


}

function initData(){
        var param = {};
        param.page = 1;
        param.rows = 6;
       param.userId=userId;
        param.status =0;
        $.post(home + "/jobController/getUserJobList.forward", param, function (data) {
            showData(data, 1, 6);
        }, "json");

}



function showData(result,page,rows){
    var tbody = $("#tbody");
    tbody.empty();
    $("#pageBar").hide();
    var __html=[];
    if(result.success){
        var dataList  = result.data;
        if(dataList&&dataList.length>0){
            for(var i= 0,_len=dataList.length;i<_len;i++) {
                __html.push("<div class='grid'>");
                __html.push(" <div class='prev'><img width='100%' height='100%' src='"+home+"/getImage?imageName="+dataList[i].userPic+"'/> </div>");
                __html.push("<ul class='details'>");
                __html.push("<li>学生昵称:"+dataList[i].stuName+"</li>");
                var end='';
                if(dataList[i].endTime==null || dataList[i].stuEndTime==''){
                    end='';
                }else{
                 end+="至" +dataList[i].stuEndTime ;
                }
                __html.push("<li>兼职时间段:"+dataList[i].stuBeginTime+end+"</li>");
                __html.push("<li>年龄:"+dataList[i].stuAge+"</li>");
                __html.push("<li>电话:"+dataList[i].stuTel+"</li>");
                __html.push("<li>性别:"+dataList[i].stuSex+"</li>");
                __html.push("<li><a href='#' onclick=\"sure('"+dataList[i].flowId+"','1')\">同意</a></li><a href='#' onclick=\"sure('"+dataList[i].flowId+"','2')\">不同意</a></ul>");
                __html.push(" <div class='clear'></div>");
                __html.push("</div>");
            }
        }
    }else{
    }
    tbody.append(__html.join(""));
    $("#pageBar").pageBar({
        total : result.total,
        rows : rows,
        showPageCount: false,
        pageNumber : page,
        callback : function(total, rows, pageNumber) {
            freshData(total,rows, pageNumber);
        }
    });

    if(result.total>6){
        $("#pageBar").show();
    }

}


function freshData(total,rows, pageNumber){
    var params={};
    params.page=pageNumber;
    params.rows=rows;
    params.status=0;
    params.isEnd=1;
    $.post(home+"/userController/getEmployeeList.forward",params,function(data){
        showData(data,pageNumber,rows);
    },"json");

}

function sure(id,status){
    var params={};
    params.flowId=id;
    params.status=status;
    $.post(home+"/jobController/modifyUserJobStatus.forward",params,function(data){
        if(data.success){
            dialog("操作成功");
            initData();
        }else{
            dialog("操作失败");
        }
    },"json");
}