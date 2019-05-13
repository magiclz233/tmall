
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<main class="register">

    <script>
        var msg = "${msg}";
        if(msg !== ""){
            alert(msg);
        }
        $(function () {
            $("#refer").val(document.referrer);
           $("#form").submit(function () {
               if($("#repeatpassword").val()!=$("#password").val()){
                   alert("两次输入的密码不一致");
                   return false;
               }
               if($("#password").val() == "" || $("#name").val() == ""){
                   alert("用户名或密码为空");
                   return false;
               }
               return true;
           });
        });
    </script>

    <div class="container">
        <div class="row" >
            <div class="panel panel-default" style="width: 600px;margin:auto">
                <div class="panel-heading">新增用户</div>
                <div class="panel-body">
                    <form action="/admin/user/adminAdd" method="post" id="form" class="form-group">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">登录名</label>
                            <div class="col-sm-10">
                                <input class="form-control" placeholder="会员名一旦设置成功，无法修改" name="name" id="name">
                            </div>
                        </div>
                        <br><br>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">登陆密码</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="password" placeholder="设置你的登陆密码" name="password" id="password">
                            </div>
                        </div>
                        <br><br>
                        <div class="form-group">
                            <label for="repeatpassword" class="col-sm-2 control-label">密码确认</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="password" placeholder="请再次输入你的密码" id="repeatpassword">
                            </div>
                        </div>
                        <br><br>
                        <div class="form-group">
                            <label for="group" class="col-sm-2 control-label">设置权限</label>
                            <div class="col-sm-10">
                                <input class="radio-inline" value="superAdmin" name="group" id="group" type="radio" checked="checked"/>管理员
                                <input class="radio-inline" value="user" name="group" id="group" type="radio" />用户 </td>
                            </div>
                        </div>

                        <input type="hidden" name="refer" id="refer">

                        <div class="form-group">
                            <div style="text-align: center">
                                <button type="submit" class="btn btn-success btn-sm">新建用户</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>