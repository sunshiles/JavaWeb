<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <title>快乐购商城 - 用户注册</title>
    <meta name="keywords" content="快乐购商城">
    <meta name="description" content="快乐购商城">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/registor.css">
</head>

<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <!-- ----登录注册头部头部---- -->
    <section class="login_header"></section>
    <!-- ------引入头部文件------ -->
    <script>
        $('.login_header').load('public_html/login_header.html');
    </script>
    <!-- ----------------注册框--------------- -->
    <section class="login width1000">
        <div class="login_l clear"></div>
        <div class="login_r clear">
            <div class="login_r_all">
                <div class="login_r_t clear">
                    <h2>用户注册</h2>
                    <div>
                        已有账号
                        <a href="http://10.31.163.17/second/projectname/src/login.html">在此登录</a>
                    </div>
                </div>
                <div class="login_r_b">
                    <form action="http://10.31.163.17/second/projectname/php/registor.php" method="post" id="form">
                        <div class="item">
                            <input type="text" placeholder="请输入用户名" class="text" name="username" id="username">
                            <label id="username-error" class="error" for="username">请输入用户名,长度2-10个字符</label>
                        </div>
                        <div class="item">
                            <input type="password" placeholder="请输入密码" class="text" name="password" id="password">
                            <label id="password-error" class="error" for="password">请输入密码,密码可能为6-12位的字母、数字或符号组合</label>
                        </div>
                        <div class="item">
                            <input type="password" placeholder="请再次输入密码" class="text" name="password_comfirm" id="password_comfirm">
                            <label id="password_comfirm-error" class="error" for="password_comfirm">请再次输入密码,需和上面保持一致</label>
                        </div>
                        <div class="item">
                            <div class="login_btn"><input type="submit" name="submit" value="立即注册"></div>
                            <div class="agree">
                                <input type="checkbox" checked="checked">
                                <label for="autoLogin">
                                        注册即表示同意快乐购
                                        <span><a href="javascript:;">《用户服务协议》</a></span>
                                        条款
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- ----登录注册头部头部---- -->
    <section class="login_footer"></section>
    <!-- ------引入底部文件------ -->
    <script>
        $('.login_footer').load('public_html/login_footer.html');
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script src="script/thirdplugins/jquery.validate.js"></script>
    <script src="script/js/registor.js"></script>
</body>

</html>