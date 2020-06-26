<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" %>

<head>
    <title>快乐购商城 - 立即登录</title>
    <meta name="keywords" content="快乐购商城">
    <meta name="description" content="快乐购商城">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <!-- ----登录注册头部---- -->
    <section class="login_header"></section>
    <!-- ----------------登录框--------------- -->
    <section class="registor width1000">
        <div class="registor_l clear">
            <img src="https://ecimg.happigo.com/data/upload/shop/adv/05657833806768851.jpg">
        </div>
        <form class="registor_r clear" method="post" action="RealUserServlet?operate=login">
            <div class="registor_r_all">
                <div class="registor_r_t clear">
                    <h2>登录快乐购</h2>
                    <div>
                        还没有快乐购账号
                        <a href="registor.jsp">快速注册</a>
                    </div>
                </div>
            </div>
            <div class="select">
                <!-- <span class="fast">
                    <input type="radio">
                    <label for="radio1">快捷登录</label>
                </span> -->
                <span class="common">
                    <!-- <input type="radio" checked="checked"> -->
                    <label for="radio">用户登录</label>
                </span>
            </div>
            <!-- <div class="yzmdl">
                <div>
                    <form method="post">
                        <div class="item mobile">
                            <input type="text" placeholder="请输入手机号码" class="text" name="mobile">
                            <div class="error">
                                <div class="error_box">请输入11位手机号码</div>
                            </div>
                        </div>
                        <div class="item mobile_code">
                            <input type="text" placeholder="请输入短信验证码" class="text yzm" name="mobile_code">
                            <a href="javascript:;" class="a_code">
                                <span></span>
                                <span></span>
                                <div>获取验证码</div>
                            </a>
                            <div class="error">
                                <div class="error_box">请输入发送给您手机上的验证码</div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="registor_btn"><a href="javascript:;">立即登录</a></div>
                        </div>
                    </form>
                </div>
                <div class="reg_type">
                    <h5>您可以使用以下账号登录</h5>
                    <ul>
                        <li><a href="javascript:;" class="qq">QQ</a></li>
                        <li><a href="javascript:;" class="weibo">新浪微博</a></li>
                        <li><a href="javascript:;" class="zfb">支付宝</a></li>
                        <li>
                            <a href="javascript:;" class="weixin"><img src="img/icon_wechat_login.png"></a>
                        </li>
                    </ul>
                </div>
            </div> -->
            <div class="ptdl">
                <div>
                    <form method="post" onsubmit="return false;">
                        <div id="error"></div>
                        <div class="item">
                            <input type="text" placeholder="已验证手机/邮箱/用户名" class="text" id="username" name="username">
                            <div class="error">
                                <div class="error_box">登录名可能是您的手机号、邮箱或用户名</div>
                            </div>
                        </div>
                        <div class="item password">
                            <input type="password" placeholder="请输入密码" class="text" id="password" name="password">
                            <div class="error">
                                <div class="error_box">您的密码可能为字母、数字或符号的组合</div>
                            </div>
                        </div>
                        <!-- <div class="item captcha">
                            <input type="text" placeholder="验证码" class="text yzm" name="captcha">
                            <img src="https://www.happigo.com/shop/index.php?act=seccode&op=makecode&nchash=1aa4c1af&t=0.715310263975373">
                            <a href="javascript:;">换一张</a>
                            <div class="error">
                                <div class="error_box">
                                    <i></i>请输入右侧验证码
                                </div>
                            </div>
                        </div> -->
                        <div class="item remember">
                            <span class="span1">
                                <input type="radio" checked="checked">
                                <label for="radio">记住用户名</label>
                            </span>
                            <span class="span2">
                                <a href="javascript:;">忘记密码？</a>
                            </span>
                        </div>
                        <div class="item">
                            <input type="submit" name="submit" id="btn" class="registor_btn" value="立即登录">
                        </div>
                    </form>
                </div>
                <div class="reg_type">
                    <h5>您可以使用以下账号登录</h5>
                    <ul>
                        <li><a href="javascript:;" class="qq">QQ</a></li>
                        <li><a href="javascript:;" class="weibo">新浪微博</a></li>
                        <li><a href="javascript:;" class="zfb">支付宝</a></li>
                    </ul>
                </div>
            </div>
        </form>
    </section>
    <!-- ----------固定定位二维码下载----------- -->
    <div class="registor_fixed">
        <a href="javascript:;">
            <img src="img/login_r1.png">
            <img src="img/down_app_ewm.png" class="two_code">
        </a>
    </div>
    <!-- ----登录注册底部---- -->
    <section class="login_footer"></section>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <script>
        $('.login_header').load('public_html/login_header.html');
        $('.login_footer').load('public_html/login_footer.html');
    </script>
    <script src="script/thirdplugins/jquery.validate.js"></script>
    <script src="script/js/login.js"></script>
</body>

</html>