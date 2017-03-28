/**
 * Created by H81 on 2017/3/14.
 */
$(function () {
    initView();
    bindClick();
});
function initView() {

  /*  initData();*/


}
function bindClick() {

    $("#sure").off("click").on("click", function () {

        $.post(home+"/userController/updateWorkTime.forward",{beginTime:$("#beginTime").val(),endTime:$("#endTime").val(),userId:userId},function(data){
            if(data.success){
                dialog("可兼职日期修改成功");
                $.fui.store.set("beginTime",$("#beginTime").val());
                $.fui.store.set("endTime",$("#endTime").val());
            }else{
                dialog("可兼职日期修改失败");
            }
        },"json");
        
    });

    $("#reset").off("click").on("click", function () {
            $("#beginTime").val("");
            $("#endTime").val("");
    });

}


/*function initData() {
    var param = {};
    param.total = 42;
    param.rows = 8;
    param.pageNumber = 2;
    $("#DataPageBar").pageBar({
        total: param.total,
        rows: param.rows,
        showPageCount: false,
        pageNumber: param.pageNumber,
        callback: function (param) {
            freshData(param);
        }
    });

}
function freshData(param) {

}

function addWorkTime() {
    var _html = "<div style='overflow-x: hidden;padding-bottom: 10px;'>";
    _html += "<div class='row row_content text-center'> <div class='col-sm-6'>开始日期:&nbsp;&nbsp;<input type='datetime-local'></div> <div class='col-sm-6'>结束日期:&nbsp;&nbsp;<input type='datetime-local'></div> </div>";
    _html += "</div>";

    var addRealseInfo = layer.open({
        type: 1,
        skin: 'layui-layer-demo', //样式类名
        btn: ['确定', '取消'], //不显示关闭按钮
        anim: 2,
        closeBtn: 1,
        shadeClose: true, //开启遮罩关闭
        content: _html,
        area: ['50%', '25%'],
        title: '发布消息',
        yes: function () {
            layer.close(addRealseInfo);

        }
    });}*/
