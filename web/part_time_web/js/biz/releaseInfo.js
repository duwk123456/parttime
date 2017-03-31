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
        showData(data,1,8);
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
    var _html = "<div style='overflow-x: hidden;height: 100%'>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>兼职地点:&nbsp;&nbsp;<input type='text' id='addr'></div> <div class='col-sm-6' style='text-align: left;'>工作酬劳:&nbsp;&nbsp;<input type='text' oninput='isNum($(this),0,false)' id='salary'><select id='salay_unit' style='height: 26px;'><option value='天'>天</option><option value='时'>时</option></select></div> </div>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>手机号码:&nbsp;&nbsp;<input type='text' id='tel' maxlength='11' ></div> <div class='col-sm-6' style='text-align: left;'>联系人员:&nbsp;&nbsp;<input type='text' id='contactName'></div> </div>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>开始日期:&nbsp;&nbsp;<input type='date' id='beginTime'></div> <div class='col-sm-6' style='text-align: left;'>结束日期:&nbsp;&nbsp;<input type='date' id='endTime'></div> </div>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>工作内容:&nbsp;&nbsp;<input type='text' id='desc'></div> <div class='col-sm-6'style='text-align: left;display: flex'>上传图片:&nbsp;&nbsp;<input type='file' id='pic' name='pic'></div> </div>";
    _html += "</div>";

    var addRealseInfo = layer.open({
        type: 1,
        skin: 'layui-layer-demo', //样式类名
        btn: ['确定', '取消'], //不显示关闭按钮
        anim: 2,
        closeBtn: 1,
        shadeClose: true, //开启遮罩关闭
        content: _html,
        area: ['55%', '40%'],
        title: '兼职发布',
        yes: function () {


            var addr=jQuery("#addr").val();

            var salary=jQuery("#salary").val();
            var tel=jQuery("#tel").val();

            var contactName=jQuery("#contactName").val();
            var beginTime=jQuery("#beginTime").val();;
            var endTime=jQuery("#endTime").val();;;
            var pic=jQuery("#pic").val();

            var desc = jQuery("#desc").val();;
            var formData = {};
            formData.addr=addr;
            formData.salary=salary;
            formData.salaryUnit=$("#salay_unit option:selected").val();
            formData.contactName=contactName;
            formData.beginTime=beginTime;
            formData.endTime=endTime;
            formData.tel=tel;
            formData.createUserId=userId;
            formData.desc=desc;

            var  picture;





            if(addr==""|| addr==null){
                dialog("兼职地点不得为空");
                return false;
            }
            if(salary==""|| salary==null){
                dialog("工作酬劳不得为空");
                return false;
            }


            if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
                dialog("不是完整的11位手机号或者正确的手机号前七位");
                return false;
            }
            if(contactName==""|| contactName==null){
                dialog("联系人不得为空");
                return false;
            }

            if(beginTime==""|| beginTime==null){
                dialog("开始时间不得为空");
                return false;
            }


            if(desc==""|| desc==null){
                dialog("工作内容不得为空");
                return false;
            }

            var strExtension = pic.substr(pic.lastIndexOf('.') + 1);
            if (strExtension != 'jpg' && strExtension != 'gif'
                && strExtension != 'png' && strExtension != 'bmp') {
                dialog("请选择图片文件");
                return;
            }

            $.ajaxFileUpload({
                url: home+"/jobController/uploadPic.forward",
                secureuri: false,
                fileElementId: 'pic',//file标签的id
                dataType: 'json',//返回数据的类型
                data: {},//一同上传的数据
                success: function (data, status) {
                    if(data.success){
                        formData.pic=data.data;
                        var saveURL = home+"/jobController/save.forward?date="+new Date()+"";

                        jQuery.post(saveURL,formData,function(jsonData){
                            var flag = jsonData.success;
                            var message = jsonData.msg;
                            if (flag == true){
                                dialog("兼职信息发布成功");
                                initData();
                                layer.close(addRealseInfo);
                            }else{
                                dialog("保存数据出现错误,原因:"+message+"");
                            }
                        },"json");
                    }
                },
                error: function (data, status, e) {
                    dialog(e);
                }
            });




        }
    });
}
function goto(id) {


}