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
        freshData(null,10,1);
    });
    $("#canle").off("click").on("click",function(){
        $("#feedbackContent").val("");
    });

    $("#release").off("click").on("click",function(){
        addInfo();
    });


}

function initData(){
    if(userType==3) {
        $("#storeDiv").css("display","none");
        var param = {};
        param.page = 1;
        param.rows = 6;
        param.status = 1;
        param.isEnd = 1;
        /*    param.createUserId=userId;*/
        $.post(home + "/jobController/getJobList.forward", param, function (data) {
            showData(data, 1, 6);
        }, "json");
    }else　if(userType==2){

        var param={};
        param.page=1;
        param.rows=8;
        param.status=1;
        param.createUserId=userId;
        $.post(home+"/jobController/getJobList.forward",param,function(data){
            showDataStroe(data,1,8);
        },"json");

    }else{
        var param = {};
        param.page = 1;
        param.rows = 6;
        param.status = 1;
        param.isEnd = 1;
        /*    param.createUserId=userId;*/
        $.post(home + "/jobController/getJobList.forward", param, function (data) {
            showData(data, 1, 6);
        }, "json");
    }
}









function showDataStroe(result,page,rows){
    var tbody = $("#tbody");
    tbody.empty();
    $("#pageBar").hide();
    var __html=[];
    if(result.success){
        var dataList  = result.rows;
        if(dataList&&dataList.length>0){
            for(var i= 0,_len=dataList.length;i<_len;i++) {

                __html.push("<div class='row row_content text-center'>");
                __html.push(" <div class='col-sm-2'>"+dataList[i].desc+"</div>");

                __html.push(" <div class='col-sm-2'>"+dataList[i].salaryAndUnit+"</div>");
                __html.push("<div class='col-sm-2'>"+dataList[i].addr+"</div>");
                __html.push("<div class='col-sm-2'>"+dataList[i].beginTime+"</div>");
                __html.push("<div class='col-sm-2'>"+dataList[i].endTime+"</div>");
                __html.push("<div class='col-sm-2'><span onclick=\"goto('"+dataList[i].jobId+"')\">邀聘</span></div>");
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
            refreshDataStroe(total,rows, pageNumber);
        }
    });

    if(result.total>8){
        $("#pageBar").show();
    }

}



function refreshDataStroe(total,rows, pageNumber){
    var params={};
    params.page=pageNumber;
    params.rows=rows;
    params.status=1;
    params.createUserId=userId;
    $.post(home+"/jobController/getJobList.forward",params,function(data){
        showDataStroe(data,pageNumber,rows);
    },"json");

}




function showData(result,page,rows){
    var tbody = $("#tbody");
    tbody.empty();
    $("#pageBar").hide();
    var __html=[];
    if(result.success){
        var dataList  = result.rows;
        if(dataList&&dataList.length>0){
            for(var i= 0,_len=dataList.length;i<_len;i++) {


                __html.push("<div class='grid'>");
                __html.push(" <div class='prev'><img width='100%' height='100%' src='"+home+"/getImage?imageName="+dataList[i].pic+"'/> </div>");
                __html.push("<ul class='details'>");
                __html.push("<li>商家名称:"+dataList[i].userName+"</li>");
                __html.push("<li>工资:"+dataList[i].salaryAndUnit+"</li>");
                __html.push("<li>工作时间:"+dataList[i].beginTime+"至"+dataList[i].endTime+"</li>");
                __html.push("<li>工作内容:"+dataList[i].desc+"</li>");
                __html.push("<li>联系方式:"+dataList[i].tel+"</li></ul>");
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
    params.status=1;
    params.isEnd=1;
    $.post(home+"/jobController/getJobList.forward",params,function(data){
        showData(data,pageNumber,rows);
    },"json");

}

function  goto(id) {
   window.location.href=home+"/part_time_web/applicantsInfo.jsp?jobId="+id;
    
}