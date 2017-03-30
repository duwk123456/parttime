$(function(){
    bindEvent();
    initData();
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
    var param={};
    param.page=1;
    param.rows=8;
    param.status=1;
    param.createUserId=userId;
    $.post(home+"/jobController/getJobList.forward",param,function(data){
        showData(data,1,10);
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

                __html.push("<div class='row row_content text-center'>");
                __html.push(" <div class='col-sm-2'>"+dataList[i].desc+"</div>");

                __html.push(" <div class='col-sm-2'>"+dataList[i].salaryAndUnit+"</div>");
                __html.push("<div class='col-sm-2'>"+dataList[i].addr+"</div>");
                __html.push("<div class='col-sm-2'>"+dataList[i].beginTime+"</div>");
                __html.push("<div class='col-sm-2'>"+dataList[i].endTime+"</div>");
                __html.push("<div class='col-sm-2'>查看人员，邀聘</div>");
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

    if(result.total>8){
        $("#pageBar").show();
    }

}



function freshData(total,rows, pageNumber){
    var params={};
    params.page=pageNumber;
    params.rows=rows;
    params.status=1;
    params.createUserId=userId;
    $.post(home+"/jobController/getJobList.forward",params,function(data){
        showData(data,pageNumber,rows);
    },"json");

}

function addInfo() {
    var _html = "<div style='overflow-x: hidden'>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>工作内容:&nbsp;&nbsp;<input type='text'></div> <div class='col-sm-6'>工作日期:&nbsp;&nbsp;<input type=date></div> </div>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>开始日期:&nbsp;&nbsp;<input type='date'></div> <div class='col-sm-6'>结束日期:&nbsp;&nbsp;<input type='date'></div> </div>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>工作酬劳:&nbsp;&nbsp;<input type='text' oninput='isNum($(this),0,false)'></div> <div class='col-sm-6'>工作地点:&nbsp;&nbsp;<input type='text'></div> </div>";
    _html += "</div>";

    var addRealseInfo = layer.open({
        type: 1,
        skin: 'layui-layer-demo', //样式类名
        btn: ['确定', '取消'], //不显示关闭按钮
        anim: 2,
        closeBtn: 1,
        shadeClose: true, //开启遮罩关闭
        content: _html,
        area: ['55%', '30%'],
        title: '发布消息',
        yes: function () {
            layer.close(addRealseInfo);

        }
    });
}