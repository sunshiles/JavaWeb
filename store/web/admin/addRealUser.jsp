<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/21
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>添加用户</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
<%--    <script type="text/javascript">--%>
<%--        $(function () {--%>
<%--            $('#name').blur(checkName);--%>
<%--            //$('#password').blur(checkPassword);--%>
<%--        });--%>

<%--        function checkName() {--%>
<%--            const username = $('#name').val();--%>
<%--            const operate = "queryByName";--%>
<%--            const url = '../UserServlet';--%>
<%--            const data = {operate: operate, username: username};--%>
<%--            $.ajax({--%>
<%--                type: "post",--%>
<%--                url: url,--%>
<%--                data: data,--%>
<%--                dataType: "",--%>
<%--                success: function (result) {--%>
<%--                    $('#tipName').html("");--%>
<%--                    console.log(result == "");--%>
<%--                    if (result != "")--%>
<%--                        $('#tipName').html(result);--%>
<%--                }--%>

<%--            });--%>
<%--        }--%>
<%--    </script>--%>

</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="../RealUserServlet?operate=add">
            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <input type="text" id="name" class="input w50" value="" name="name" data-validate="required:请输入标题"/>
                    <div id="tipName" class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <%--@declare id="sitename"--%><label for="sitename">新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="password1 input w50" name="password1" size="50" placeholder="请输入新密码"
                           data-validate="required:请输入新密码,length#>=5:新密码不能小于5位"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码"
                           data-validate="required:请再次输入新密码,repeat#password1:两次输入的密码不一致"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>真实姓名：</label>
                </div>
                <div class="field">
                    <input type="text" id="realName" class="input w50" value="" name="realName" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field">
                    <input type="text" id="sex" class="input w50" value="" name="sex" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" id="address" class="input w50" value="" name="address" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>问题：</label>
                </div>
                <div class="field">
                    <input type="text" id="question" class="input w50" value="" name="question" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>回答：</label>
                </div>
                <div class="field">
                    <input type="text" id="answer" class="input w50" value="" name="answer" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>邮箱：</label>
                </div>
                <div class="field">
                    <input type="text" id="email" class="input w50" value="" name="email" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>爱好：</label>
                </div>
                <div class="field">
                    <input type="text" id="favorate" class="input w50" value="" name="favorate" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>成绩：</label>
                </div>
                <div class="field">
                    <input type="text" id="score" class="input w50" value="" name="score" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>状态：</label>
                </div>
                <div class="field">
                    <input type="text" id="status" class="input w50" value="" name="status" data-validate="required:请输入标题"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
