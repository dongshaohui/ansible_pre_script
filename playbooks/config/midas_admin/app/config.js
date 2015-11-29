p2p = {
    api: {
        uri: "/admin/api"
    },
    ums: {
        uri: "/admin/ums"
    },
    yeepay: {
        withdraw: {
            uri: "/admin/payment"
        }
    },
    admin: {
        context: "/admin",
        roles: {
            SUPER_ADMIN: '超级管理员',
            ENTERPRISE_USER: '创建企业用户',
            CHANGE_USER_PHONE: '修改手机号',
            CREATE_SUBJECT: "创建标的",
            ABORT_SUBJECT: "撤销标的",
            SHELVE_SUBJECT: '上架标的',
            CHOICENESS_SUBJECT: '设置精品标的',
            UN_SHELVE_SUBJECT: '下架标的',
            SIGN_CONTRACT: '确认交割',
            MANUAL_DEPOSIT: '补记企业用户取现(放款)',
            MANUAL_WITHDRAW: '补记企业用户充值(还款)',
            FINANCE: '财务管理员',
            BIZ_PARAM: '系统参数管理员',
            UNBIND_BANKCARD: '录入解绑银行卡信息',
            RECHECK_UNBIND_BANKCARD: '复核并解绑银行卡',
            MODIFY_SUBJECT:'修改地产标',
            RECORD_INVESTMENT_REQUESTS:'补记投资者信息',
            DELETE_INVESTMENT_REQUESTS:'清空投资者信息',
            SETTLE_CONTRACT: '手动到期',
            AUTO_SETTLE: '设置自动回款',
            REQUEST_SETTLE:'申请人工回款',
            CHECK_SETTLE_REQUEST:'复核人工回款',
            CREATE_VOUCHER_TYPE:'创建代金券类型',
            MANAGE_VOUCHER_TYPE:'管理代金券类型'
        },
        subjectCatalog: {
            JIASHI_V1: 0,
            JIASHI_V2: 1,
            JIASHI_V3: 2,
            JIASHI_V4: 3,
            properties: {
                0: {
                    name: '固收赢', value: 0, code: 'JIASHI_V1'
                },
                1: {
                    name: '收益赢', value: 1, code: 'JIASHI_V2'
                },
                2: {
                    name: '新手标', value: 2, code: 'JIASHI_V3'
                },
                3: {
                    name: '地产标', value: 3, code: 'JIASHI_V4'
                }
            }
        }
    }
};
p2p.validator = {
    highlight: function (element) {
        $(element).closest('form').find('.submit-btn').attr('disabled','disabled');
        $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function (element) {
        $(element).closest('form').find('.submit-btn').removeAttr('disabled');
        $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function (error, element) {
        if (element.parent('.input-group').length) {
            error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
    }
};
$.ajaxSetup({
    statusCode: {
        401: function () {
            window.location.href = p2p.admin.context + "/login";
        },
        403: function () {
            alert("权限异常");
        }
    },
    beforeSend: function (jqXHR) {
        console.log("set csrf token before send");
        $.cookie.raw = true;
        jqXHR.setRequestHeader("CSRF-TOKEN", $.cookie("_csrf"));
        $.cookie.raw = undefined;
        jqXHR.withCredentials = true;
    }
});
