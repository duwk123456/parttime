/**
 * Created by H81 on 2017/3/13.
 */
$(function () {
    initView();
    bindClick();
});
function initView() {

    initData();


}
function bindClick() {

}
function initData() {
    var param = {};
    param.total = 42;
    param.rows = 8;
    param.pageNumber = 4;
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