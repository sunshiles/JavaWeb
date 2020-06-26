<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/5/11
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新密码</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#password').blur(checkPassword);
        });

        function checkPassword() {
            const username = "<%=session.getAttribute("username")%>";
            const password = $('#password').val();
            const operate = "queryByName";
            const url = '../UserServlet';
            const data = {operate: operate, userName: username, password:password};
            $.ajax({
                type: "post",
                url: url,
                data: data,
                dataType: "",
                success: function (result) {
                    $('#tipPassword').html(" ");
                    if (result != "")
                        $('#tipPassword').html(result);
                }

            });
        }
    </script>
</head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() +
            "://" + request.getServerName() +
            ":" + request.getServerPort() + path + "/admin/";
%>
<body>
<base href="<%=basePath %>">
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改会员密码</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="../UserServlet?operate=newPassword&username=<%=session.getAttribute("username")%>">
            <div class="form-group">
                <div class="label">
                    <label for="sitename">管理员帐号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <%=session.getAttribute("username")%>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <%--@declare id="sitename"--%><label for="sitename">原始密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="password" name="password" size="50" placeholder="请输入原始密码"
                           data-validate="required:请输入原始密码"/>
                    <div id="tipPassword" class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="newPassword" size="50" placeholder="请输入新密码"
                           data-validate="required:请输入新密码,length#>=5:新密码不能小于5位"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码"
                           data-validate="required:请再次输入新密码,repeat#newPassword:两次输入的密码不一致"/>
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
