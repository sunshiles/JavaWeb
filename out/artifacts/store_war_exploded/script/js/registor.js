;
(function($) {

    //表单验证
    $(function() {
        $('#form').validate({
            rules: {
                username: {
                    required: true,
                    minlength: 2,
                    maxlength: 10,
                    remote: { //将前端的name给后端
                        url: "http://10.31.163.17/second/projectname/php/registor.php", //后台处理程序
                        type: "post" //数据发送方式
                    }
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 12,
                },
                password_comfirm: {
                    required: true,
                    equalTo: '#password'
                }
            },
            messages: {
                username: {
                    required: '用户名不能为空',
                    minlength: '用户名不能小于2',
                    maxlength: '用户名不能大于10',
                    remote: '用户名已存在'
                },
                password: {
                    required: '密码不能为空',
                    minlength: '密码不能小于六位',
                    maxlength: '密码不能多于十二位'
                },
                password_comfirm: {
                    required: '密码不一致',
                    equalTo: '密码不一致'
                }
            }

        });
    });

    $.validator.setDefaults({
        /*添加校验成功后的执行函数--修改提示内容，并为正确提示信息添加新的样式(默认是valid)*/
        success: function(label) {
            label.text('√').css('color', 'green').addClass('valid');
        }
    });

    //注册成功
    $('.login_btn input').on('click', function() {
        $.ajax({
            url: 'http://10.31.163.17/second/projectname/php/registor.php',
            success: function(d) {
                if (d) {
                    alert('注册成功');
                } else {
                    alert('请按要求填写');
                }
            }
        })
    })
})(jQuery);