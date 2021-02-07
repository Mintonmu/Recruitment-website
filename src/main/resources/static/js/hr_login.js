var form = new Vue({
    el: '#loginForm',
    data: {
        form: {
            userName: '',
            userPass: ''
        }
    },
    methods: {
        login: function () {
            let data = {userName: this.form.userName, userPass: this.form.userPass}
            // console.log(data)
            $.ajax({
                url: '/hr/hr_login',
                type: 'POST',
                data: this.form,
                dataType: 'json',
                success: function (msg) {
                    console.log(msg)
                    if (msg === '0') {
                        layer.msg('您的账号或密码输入错误！！！');
                    } else {
                        layer.msg('登录成功，2S后跳转！');
                        setTimeout(function () {
                            self.location = '/hr/info';
                        }, 2000);
                    }
                }, error: function (msg) {
                    console.error(msg)
                    layer.msg('登录出了点小错误哦！！！');
                }

            });
        }
    }
});

