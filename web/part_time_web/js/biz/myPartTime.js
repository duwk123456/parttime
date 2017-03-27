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

    $("#addWorkTime").off("click").on("click", function () {

        addWorkTime();
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
    });
}