/**
 * Created by H81 on 2017/3/14.
 */
$(function () {
    initView();
    bindClick();
});
function initView() {

    initData();


}
function bindClick() {

    $("#release").off("click").on("click", function () {

        addInfo();
    });

}
function initData() {
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