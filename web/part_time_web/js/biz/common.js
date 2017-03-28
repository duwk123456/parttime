/**
 * Created by H81 on 2017/3/13.
 */


function showDialog(dialogInfo) {
    var btnInfo = {};

    if (dialogInfo.sure == undefined || dialogInfo.sure == null) {
        dialogInfo.sure = "确定";
    }
    if (dialogInfo.cancle == undefined) {
        btnInfo.btn = [dialogInfo.sure];
    }
    else {
        btnInfo.btn = [dialogInfo.sure, dialogInfo.cancle]
    }

    var msgDialog = layer.confirm(dialogInfo.msg,
        btnInfo //按钮信息
        , function () {

            if (dialogInfo.sureCallBack) {

                dialogInfo.sureCallBack();

            }
            layer.close(msgDialog);

        }, function () {

            if (dialogInfo.cancelCallBack) {
                dialogInfo.cancelCallBack();
            }
            layer.close(msgDialog);
        });
}
//时间戳
var getTimestamp = function () {
    var timestamp = new Date().getTime();
    return timestamp;
};

/***
 *  对输入的值进行验证
 * @param obj
 * @param decimalPlaces  ---小数位数
 * @param allowNegative ---是否允许负数
 * @returns {boolean}
 */
function isNum(obj, decimalPlaces, allowNegative) {
    var temp = obj.val();

    //控制首位不能为0
    if (temp.length > 1) {
        if (temp[0] == "0" && temp[1] != ".") {
            temp = temp[1];
            obj.val(temp);
        }
    }
    // 如果已正确格式化，请避免更改
    var reg0Str = '[0-9]*';
    if (decimalPlaces > 0) {
        reg0Str += '\\.?[0-9]{0,' + decimalPlaces + '}';
    } else if (decimalPlaces < 0) {
        reg0Str += '\\.?[0-9]*';
    }
    reg0Str = allowNegative ? '^-?' + reg0Str : '^' + reg0Str;
    reg0Str = reg0Str + '$';
    var reg0 = new RegExp(reg0Str);
    if (reg0.test(temp)) return true;

    // 首先替换所有非数字
    var reg1Str = '[^0-9' + (decimalPlaces != 0 ? '.' : '') + (allowNegative ? '-' : '') + ']';
    var reg1 = new RegExp(reg1Str, 'g');
    temp = temp.replace(reg1, '');

    if (allowNegative) {
        // 替换额外负数
        var hasNegative = temp.length > 0 && temp.charAt(0) == '-';
        var reg2 = /-/g;
        temp = temp.replace(reg2, '');
        if (hasNegative) temp = '-' + temp;
    }

    if (decimalPlaces != 0) {
        var reg3 = /\./g;
        var reg3Array = reg3.exec(temp);
        if (reg3Array != null) {
            //只保留第一次出现
            // 和由小数指定的位数Place或整个字符串的小数位<0
            var reg3Right = temp.substring(reg3Array.index + reg3Array[0].length);
            reg3Right = reg3Right.replace(reg3, '');
            reg3Right = decimalPlaces > 0 ? reg3Right.substring(0, decimalPlaces) : reg3Right;
            temp = temp.substring(0, reg3Array.index) + '.' + reg3Right;
        }
    }

    obj.val(temp);
}

function requestData(param) {
    $.post(param.url, param.data, function (data) {
        if (param.success) {
            param.success(data);
        }
    }, "json");
}
