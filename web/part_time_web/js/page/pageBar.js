/**
 * author : zhengqi
 * createDate : 2015-01-04
 */
(function($) {

    var opts = {
        total: 100,
        rows: 10,
        pageNumber: 1,
        items: 6,
        callback: function() {
            return false;
        }
    };
    
    var _goPageInput; // 跳转页面的输入框
    var go;
    function _calc(totalPage, curPage, btnNum) {
        var half = Math.ceil(btnNum / 2);
        var upper_limit = totalPage - btnNum;
        var start = curPage > half ? Math.max(Math.min(curPage - half, upper_limit), 0) : 0;
        var end = curPage > half ? Math.min(curPage + half, totalPage) : Math.min(btnNum, totalPage);
        return [start, end];
    }
    
    function _draw($this) {
        var options = $this.data("options");
        var totalPage = Math.ceil(options.total / options.rows);
        var curIdx = options.pageNumber;
        var prevPage = curIdx == 1 ? curIdx : curIdx - 1;
        var nextPage = (curIdx == totalPage ? curIdx : curIdx + 1);
        var range = _calc(totalPage, curIdx, options.items); // 计算浮动分页按钮开始和结束点
        var start =range[0];
        var end = range[1];
        var div = $("<div class='table_btn_r'></div>");
        var totalObj = $("<span class='skip'>共 "+options.total+" 条</span>");
        var totalPageObj = $("<span class='skip'> "+totalPage+" 页</span>");
        var curPageObj = $("<span class='skip'> 当前第"+curIdx+" 页</span>");
        var ul = $("<ul />");
        ul.append($("<li>首页</li>").on("click", {
        	pageNo: 1,
            pageBar: $this
        }, _selectPage));
        //ul.append($("<li>&lt;上一页</li>").on("click", {
        ul.append($("<li>上一页</li>").on("click", {
            pageNo: prevPage,
            pageBar: $this
        }, _selectPage));
        
//        if (start > 2 && end < totalPage) {
//            ul.append($("<li>1</li>").on("click", {pageNo: 1, pageBar: $this }, _selectPage));
//            ul.append($("<li>...</li>"));
//            for (var i = start; i < end; i++) {
//                if (i == curIdx) {
//                    ul.append($("<li class='select_page'>" + i + "</li>"));
//                } else {
//                    ul.append($("<li>" + i + "</li>").on("click", {pageNo: i, pageBar: $this }, _selectPage));
//                }
//            }
//            ul.append($("<li>...</li>"));
//            ul.append($("<li>" + totalPage + "</li>").on("click", {pageNo: totalPage, pageBar: $this }, _selectPage));
//        } else if (start > 2 && end == totalPage) {
//            ul.append($("<li>1</li>").on("click", {pageNo: 1, pageBar: $this }, _selectPage));
//            ul.append($("<li>...</li>"));
//            for (var i = start; i <= totalPage; i++) {
//                if (i == curIdx) {
//                    ul.append($("<li class='select_page'>" + i + "</li>"));
//                } else {
//                    ul.append($("<li>" + i + "</li>").on("click", {pageNo: i, pageBar: $this }, _selectPage));
//                }
//            }
//        } else if (start <= 2 && end < totalPage) {
//            for (var i = 1; i < end; i++) {
//                if (i == curIdx) {
//                    ul.append($("<li class='select_page'>" + i + "</li>"));
//                } else {
//                    ul.append($("<li>" + i + "</li>").on("click", {pageNo: i, pageBar: $this }, _selectPage));
//                }
//            }
//            ul.append($("<li>...</li>"));
//            ul.append($("<li>" + totalPage + "</li>").on("click", {pageNo: totalPage, pageBar: $this }, _selectPage));
//        } else if (start <= 2 && end >= totalPage - 1) {
//            for (var i = 1; i <= totalPage; i++) {
//                if (i == curIdx) {
//                    ul.append($("<li class='select_page'>" + i + "</li>"));
//                } else {
//                    ul.append($("<li>" + i + "</li>").on("click", {pageNo: i, pageBar: $this }, _selectPage));
//                }
//            }
//        }
        //ul.append($("<li>下一页&gt;</li>").on("click", {
        ul.append($("<li>下一页</li>").on("click", {
            pageNo: nextPage,
            pageBar: $this
        }, _selectPage));
        ul.append($("<li>尾页</li>").on("click", {
        	pageNo: totalPage,
            pageBar: $this
        }, _selectPage));
//        
//        var jump = $("<span class='skip'>跳转到</span>");
//        _goPageInput = $("<input type='text'>").css({
//            width: 30
//        }).on("keydown", _keyDownHandler);
//        go = $("<span class='btn_l f_l m_t3'><span class='btn_r'><span class='btn_c p_0'>GO</span></span></span>");
        div.append(totalObj).append(totalPageObj).append(curPageObj).append(ul);
        /*
        div.append(totalObj).append(ul).append(jump).append(_goPageInput).append(go.on("click", {
            pageBar: $this,
            totalPage: totalPage
        }, _goPage));
        */
        $this.empty();
        $this.append(div);
    }
    
    function _refresh($this) {
        var options = $this.data("options");
        options.callback(options.total, options.rows, options.pageNumber);
    }
    
    
    function _selectPage(e) {
        var $this = e.data.pageBar;
        var options = $this.data("options");
        var totalPage = Math.ceil(options.total / options.rows);
        if (e.data.pageNo > totalPage || e.data.pageNo < 1 || e.data.pageNo == options.pageNumber) {
        	return;
        }
        options.pageNumber = e.data.pageNo;
        _draw($this);
        options.callback(options.total, options.rows, options.pageNumber);
    }


    function _goPage(e) {
        var page = _goPageInput.val();
        var $this = e.data.pageBar;
        var options = $this.data("options");
        if(page == ""){
        	showMessage("请输入跳转的页数");
        }else{
        	if (page && /^[0-9]+$/.test(page) && page <= e.data.totalPage) {
                options.pageNumber = parseInt(page);
                _draw($this);
                options.callback(options.total, options.rows, options.pageNumber);
            }else{
            	showMessage("不能超过最大页数");
            }
        }
    }
    function _keyDownHandler(e) {
        if ((e.keyCode >=48 && e.keyCode <=57) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode == 46 || e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 39 ) {
            return true;
        } else if (e.keyCode == "13") {
            go.click();
            return true;
        } else {
            return false;
        }
    }

    var methods = {
        init: function(options) {
            options = $.extend({}, opts, options || {});
            return this.each(function() {
                var $this = $(this);
                $this.data("options", options);
                _draw($this);
            });
        },
        
        refresh: function() {
            return this.each(function() {
                var $this = $(this);
                _refresh($this);
            });
        }
    };


    $.fn.pageBar = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if ($.isPlainObject(method) || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error(method + '此方法未在pageBar中定义');
        }
    }

})(jQuery);