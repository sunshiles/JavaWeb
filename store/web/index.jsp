<%@ page import="com.whc.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.whc.dao.ProductDao" %>
<%@ page import="com.whc.factory.DaoFactory" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() +
            "://" + request.getServerName() +
            ":" + request.getServerPort() + path + "/admin/";
%>
<head>
    <meta charset="UTF-8">
    <title>快乐购 - 值得信赖的电视购物平台,视频导购,货到付款,正品行货 -美容护肤、数码、家电、服装、家居、运动休闲</title>
    <meta name="keywords"
          content="快乐购,快乐购物电视购物,快乐购官方网站,快乐购电视购物,快乐购电视购物直播,快乐购网上商城,湖南快乐购,快乐购物,快乐购电视购物网站,快乐购官网,湖南快乐购电视购物,湖南卫视快乐购">
    <meta name="description"
          content="快乐购物股份有限公司官方网站，中国电视购物上市第一股！正品保证，全国配送，便捷支付，让您轻松放心购物！24小时免费订购热线4007051111 4007058800">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">
    <style>
        @font-face {
            font-family: "iconfont";
            src: url('fonts/iconfont.woff') format('woff')
        }

        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
        }
    </style>
</head>
<body>
<%--头部 注册栏 搜索栏 导航栏--%>
<jsp:include page="public_html/header.jsp"/>
<%--    banner轮播图--%>
<section class="banner">
    <div class="lunbo_1">
        <div class="">
            <ul class="lunbo_big">
                <li>
                    <a href="javascript:;"><img
                            src="https://ecimg.happigo.com/data/upload/app/carousel/2019/06104763805660943.jpg"></a>
                </li>
                <li>
                    <a href="javascript:;"><img
                            src="https://ecimg.happigo.com/data/upload/app/carousel/2019/06104764458071744.jpg"></a>
                </li>
                <li>
                    <a href="javascript:;"><img
                            src="https://ecimg.happigo.com/data/upload/app/carousel/2019/06103833319164689.jpg"></a>
                </li>
                <li>
                    <a href="javascript:;"><img
                            src="https://ecimg.happigo.com/data/upload/app/carousel/2019/06103924782412414.jpg"></a>
                </li>
                <li>
                    <a href="javascript:;"><img
                            src="https://ecimg.happigo.com/data/upload/app/carousel/2019/06103709172971754.jpg"></a>
                </li>
            </ul>
            <div class="lunbo_sm">
                <div class="btn_all">
                    <ol class="ol_li">
                        <li class="active"></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ol>
                </div>
                <a href="javascript:;" class="right"></a>
            </div>
        </div>
    </div>
</section>
<!-- ----main主体部分---- -->
<section class="main width1090 clear">
    <!-- ------------新品推荐------------- -->
    <div class="new m_t_30 clear">
        <!-- -------------标题------------ -->
        <div class="title_div">
            <p class="title_p">
                <i></i>新品推荐
                <span>为你寻觅世间好</span>
            </p>
            <a href="#">
                <div class="new_change">
                    <i class="iconfont i_change_g"></i>换一批
                </div>
            </a>
        </div>
        <!-- ---------------商品列表----------------- -->
        <ul class="commodity clear">
            <%
                ProductDao productDao = DaoFactory.getProductDao();
                ArrayList<Product> products = productDao.queryAll();
                if (products != null) {
                    for (Product product : products) {
            %>
            <li>
                <a href="ProductServlet?operate=queryById&id=<%=product.getId()%>" target="_blank" class="a_info">
                    <div class="img_info">
                        <p>
                            <img width="256" height="256" class="lazy"
                                 src="<%=request.getContextPath()+product.getPicture().substring(2)%>">
                        </p>
                    </div>
                    <div class="tit_info">
                        <p class="p_b"><%=product.getProductName()%>
                        </p>
                    </div>
                    <p class="price_info">
                        <span class="price1">
                            <%=product.getPrice()%>
                        </span>
                        <span class="price2">
                        </span>
                    </p>
                </a>
            </li>
            <%
                    }
                }
            %>
        </ul>
    </div>
    <!-- ------------优选好物------------- -->
    <div class="m_t_30 clear">
        <!-- -------------标题------------ -->
        <div class="title_div">
            <p class="title_p">
                <i></i>优选好物
            </p>
        </div>
        <div>
            <ul class="commodity clear dataul"></ul>
        </div>
    </div>
</section>
<!-- ----滚轮滚过一定距离,顶部出现固定搜索栏---- -->
<section class="fixed_top">
    <div class="width1200">
        <div class="fixed_img">
            <img src="img/search_fixed_logo.png">
        </div>
        <div class="fixed_input">
            <i class="icon iconfont iconsearch"></i>
            <form>
                <input type="text" class="text_fixed" placeholder="面膜">
                <input type="button" class="btn_fixed" value="搜索">
            </form>
        </div>
    </div>
</section>
<!-- ----底部---- -->
<jsp:include page="public_html/footer.jsp"/>
<!-- ----右边固定栏---- -->
<section class="fixed_right">
    <div class="fixed_r">
        <div class="r_f_top">
            <div>
                <a href="http://10.31.163.17/second/projectname/src/registor.html" target="_blank">
                    <i class="icon_user iconfont"></i>
                    <div class="number">账号</div>
                </a>
            </div>
            <div>
                <a href="http://10.31.163.17/second/projectname/src/cart.html" target="_black">
                    <i class="icon_car iconfont" id="shopCart"></i>
                    <div class="car">购物车</div>
                    <div class="car_num">0</div>
                </a>
            </div>
            <div>
                <a href="#">
                    <i class="icon_collect iconfont"></i>
                    <div class="collect">收藏</div>
                </a>
            </div>
        </div>
        <div class="r_f_bottom">
            <div class="erweima">
                <a href="#"><i class="ewm_img iconfont"></i></a>
                <div></div>
            </div>
            <div class="kefu">
                <a href="#"><i class="online_cus iconfont"></i></a>
                <div></div>
            </div>
            <div>
                <a href="javacript:;" class="totop"><i class="retrun_top iconfont"></i></a>
            </div>
        </div>
    </div>
</section>
<!-- --------------引入jquery文件------------- -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<!-- 引入文件 -->
<script src="script/thirdplugins/jquery.cookie.js"></script>
<script src="script/thirdplugins/jquery.lazyload.js"></script>
<script src="script/js/index.js"></script>
</body>
</html>