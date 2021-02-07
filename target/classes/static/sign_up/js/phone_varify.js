function register() {
    var nickName = document.getElementById("name").value;
    var mobile = document.getElementById("tel");
    var pass = document.getElementById("password").value;
    var role = $("#role_select option:selected").val()
    if (nickName != null && mobile != null && pass != null && role != null) {
        $.ajax({
            url: "http://localhost:8080/user/registerPost" + "?mobile=" + mobile.value + "&password=" + pass + "&nickName=" + nickName + "&type=" + role,
            type: "post",
            dataType: "json",
            success: function (output) {
                console.log(output)
                if (output === 1) {
                    swal("注册成功", "注册成功", "success");
                    setTimeout(function () {
                        window.location.href = "http://localhost:8080/user/login";
                    }, 2000);

                } else {
                    swal("注册失败", "注册失败", "error");
                }
            }
        });


    } else {
        swal("哦哦...", "请正确填写哦", "error");
    }
    return false;
}


function showPass() {
    console.log("change showing~");
    var pass_notshow = document.getElementById("password");
    if (show_flag == 0) {
        pass_notshow.type = 'text';
        show_flag = 1;
        document.getElementById("show_pass").src = "sign_up/img/openeye.jpg";
    } else {
        pass_notshow.type = 'password';
        show_flag = 0;
        document.getElementById("show_pass").src = "sign_up/img/closeeye.jpg";
    }
}
