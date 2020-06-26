<%@ page contentType="text/html;charset=UTF-8" %>
<!-- ----头部 注册栏 搜索栏 导航栏---- -->
<section class="header">
    <!-- ----头部上面 登录注册条---- -->
    <div class="header_top clear">
        <div class="width1090">
            <div class="h_t_l">
                <div class="hello">
                    <span>欢迎来到快乐购！</span>
                    <a href="login.jsp" target="_blank" class="a_login">[登录]</a>
                    <a href="registor.jsp" target="_blank" class="a_reg">[免费注册]</a>
                </div>
                <div class="admin" style="display: none;">
                    <span></span>
                    <a href="javascript:;">退出</a>
                </div>
            </div>
            <div class="h_t_r">
                <ul>
                    <li><a href="#">合作招商</a></li>
                    <li><a href="#">订单查询</a></li>
                    <li><a href="#">我的快乐购</a></li>
                    <li>
                        <a href="#">
                            <i></i>
                            <span>400-705-1111</span>
                        </a>
                    </li>
                    <li class="li_hov">
                        <a href="#">下载快乐购app</a>
                        <div class="download">
                            <div class="down">
                                <b></b>
                                <img src="https://ecimg.happigo.com/resource/web/new_web/images/down_load_20160411.png">
                                <p>快乐生活 快乐购</p>
                            </div>
                        </div>
                    </li>
                    <li class="help">
                        <a href="#">
                            客服中心
                            <b></b>
                        </a>
                        <div class="serve">
                            <a href="#">帮助中心</a>
                            <a href="#">会员反馈</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- ----头部中间 搜索框---- -->
    <div class="header_mid clear">
        <div class="header_m width1090">
            <div class="h_m_l">
                <a href><img src="img/logo.png"></a>
            </div>
            <div class="h_m_m">
                <div class="search_input">
                    <i class="icon iconfont iconsearch"></i>
                    <form>
                        <input type="text" class="text_search" placeholder="面膜">
                        <input type="button" value="搜索" class="btn_search">
                    </form>
                </div>
                <div class="search_key">
                    <a href="#">女包</a>
                    <a href="#">
                        <span style="color:red">防晒</span>
                    </a>
                    <a href="#">干衣机</a>
                    <a href="#">潘红妹</a>
                    <a href="#">玉镯</a>
                    <a href="#">榨汁机</a>
                    <a href="#">酵素</a>
                    <a href="#">眼霜</a>
                    <a href="#">艾灸</a>
                    <a href="#">循环扇</a>
                    <a href="#">山药粉</a>
                </div>
            </div>
            <div class="h_m_r">
                <a href="cart.jsp" target="_blank">
                    <i class="iconfont_car iconfont"></i>
                    <span>购物车</span>
                </a>
            </div>
        </div>
    </div>
    <!-- ----头部下面 导航分类栏---- -->
    <div class="header_bottom">
        <div class="width1090 pos_re">
            <ul class="nav">
                <li class="all_type">
                    <a href="#">
                        <i class="iconfont b_down"></i> 所有分类
                    </a>
                    <!-- ----------头部下面  商品分类列表------- -->
                    <div class="list_down">
                        <ul class="type_ul">
                            <li class="type_li type_li_one">
                                <a href="javascript:;" class="type_a">
                                    <i class="iconfont i_type i_type_mwcf"></i> 个护美妆
                                    <i class="iconfont icontypearrow"></i>
                                </a>
                                <div class="type_list">
                                    <ul class="type_list_ul">
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                    面部护理
                                    <i class="iconfont"></i>
                                </a>
                                            <div class="type_content">
                                                <a href="#">面膜</a>
                                                <a href="#">乳液面霜</a>
                                                <a href="#">精华</a>
                                                <a href="#">护肤套组</a>
                                                <a href="#">防晒隔离</a>
                                                <a href="#">爽肤水</a>
                                                <a href="#">洁面乳</a>
                                                <a href="#">眼部护理</a>
                                                <a href="#">眼膜</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                    香水彩妆
                                    <i class="iconfont"></i>
                                </a>
                                            <div class="type_content">
                                                <a href="#">唇膏唇彩</a>
                                                <a href="#">遮瑕</a>
                                                <a href="#">粉底粉饼</a>
                                                <a href="#">睫毛膏</a>
                                                <a href="#">眉笔</a>
                                                <a href="#">眼影/眼线</a>
                                                <a href="#">彩妆工具</a>
                                                <a href="#">卸妆</a>
                                                <a href="#">女士香水</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                    美发护理
                                    <i class="iconfont"></i>
                                </a>
                                            <div class="type_content">
                                                <a href="#">洗发水</a>
                                                <a href="#">护发素</a>
                                                <a href="#">洗护套装</a>
                                                <a href="#">卷发棒</a>
                                                <a href="#">电吹风</a>
                                                <a href="#">染发</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                    身体护理
                                    <i class="iconfont"></i>
                                </a>
                                            <div class="type_content">
                                                <a href="#">私密护理</a>
                                                <a href="#">手工皂</a>
                                                <a href="#">美容养颜</a>
                                                <a href="#">磨砂膏</a>
                                                <a href="#">沐浴露</a>
                                                <a href="#">手足护理</a>
                                                <a href="#">身体乳</a>
                                                <a href="#">香薰精油</a>
                                                <a href="#">卫生巾</a>
                                                <a href="#">纤体瘦身</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                    美容工具
                                    <i class="iconfont"></i>
                                </a>
                                            <div class="type_content">
                                                <a href="#">美容仪</a>
                                                <a href="#">洁面仪</a>
                                                <a href="#">理发器</a>
                                                <a href="#">剃须刀</a>
                                                <a href="#">剃毛器</a>
                                                <a href="#">喷雾器</a>
                                                <a href="#">美容配件</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                    口腔护理
                                    <i class="iconfont"></i>
                                </a>
                                            <div class="type_content">
                                                <a href="#">牙刷</a>
                                                <a href="#">牙膏</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="type_hot">
                                        <ul class="type_hot_all">
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05134417343720876.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05221798162552746.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05127512174986573.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05971632446068369.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05515326926166662.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05439537713883786.jpg">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="type_li">
                                <a href="javascript:;" class="type_a">
                                    <i class="iconfont i_type i_type_mwcf"></i> 食品健康
                                    <i class="iconfont icontypearrow"></i>
                                </a>
                                <div class="type_list">
                                    <ul class="type_list_ul">
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        饮料冲调
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">面膜</a>
                                                <a href="#">乳液面霜</a>
                                                <a href="#">精华</a>
                                                <a href="#">护肤套组</a>
                                                <a href="#">防晒隔离</a>
                                                <a href="#">爽肤水</a>
                                                <a href="#">洁面乳</a>
                                                <a href="#">眼部护理</a>
                                                <a href="#">眼膜</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        粮油调味
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">唇膏唇彩</a>
                                                <a href="#">遮瑕</a>
                                                <a href="#">粉底粉饼</a>
                                                <a href="#">睫毛膏</a>
                                                <a href="#">眉笔</a>
                                                <a href="#">眼影/眼线</a>
                                                <a href="#">彩妆工具</a>
                                                <a href="#">卸妆</a>
                                                <a href="#">女士香水</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        酒水茗茶
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">洗发水</a>
                                                <a href="#">护发素</a>
                                                <a href="#">洗护套装</a>
                                                <a href="#">卷发棒</a>
                                                <a href="#">电吹风</a>
                                                <a href="#">染发</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        休闲食品
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">私密护理</a>
                                                <a href="#">手工皂</a>
                                                <a href="#">美容养颜</a>
                                                <a href="#">磨砂膏</a>
                                                <a href="#">沐浴露</a>
                                                <a href="#">手足护理</a>
                                                <a href="#">身体乳</a>
                                                <a href="#">香薰精油</a>
                                                <a href="#">卫生巾</a>
                                                <a href="#">纤体瘦身</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        营养保健
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">美容仪</a>
                                                <a href="#">洁面仪</a>
                                                <a href="#">理发器</a>
                                                <a href="#">剃须刀</a>
                                                <a href="#">剃毛器</a>
                                                <a href="#">喷雾器</a>
                                                <a href="#">美容配件</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        生鲜食品
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">牙刷</a>
                                                <a href="#">牙膏</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="type_hot">
                                        <ul class="type_hot_all">
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05134417343720876.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05221798162552746.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05127512174986573.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05971632446068369.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05515326926166662.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05439537713883786.jpg">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="type_li">
                                <a href="javascript:;" class="type_a">
                                    <i class="iconfont i_type i_type_mwcf"></i> 餐厨日用
                                    <i class="iconfont icontypearrow"></i>
                                </a>
                                <div class="type_list">
                                    <ul class="type_list_ul">
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        厨房电器
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">面膜</a>
                                                <a href="#">乳液面霜</a>
                                                <a href="#">精华</a>
                                                <a href="#">护肤套组</a>
                                                <a href="#">防晒隔离</a>
                                                <a href="#">爽肤水</a>
                                                <a href="#">洁面乳</a>
                                                <a href="#">眼部护理</a>
                                                <a href="#">眼膜</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        健康保健
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">唇膏唇彩</a>
                                                <a href="#">遮瑕</a>
                                                <a href="#">粉底粉饼</a>
                                                <a href="#">睫毛膏</a>
                                                <a href="#">眉笔</a>
                                                <a href="#">眼影/眼线</a>
                                                <a href="#">彩妆工具</a>
                                                <a href="#">卸妆</a>
                                                <a href="#">女士香水</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        烹饪锅具
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">洗发水</a>
                                                <a href="#">护发素</a>
                                                <a href="#">洗护套装</a>
                                                <a href="#">卷发棒</a>
                                                <a href="#">电吹风</a>
                                                <a href="#">染发</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        清洁收纳
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">私密护理</a>
                                                <a href="#">手工皂</a>
                                                <a href="#">美容养颜</a>
                                                <a href="#">磨砂膏</a>
                                                <a href="#">沐浴露</a>
                                                <a href="#">手足护理</a>
                                                <a href="#">身体乳</a>
                                                <a href="#">香薰精油</a>
                                                <a href="#">卫生巾</a>
                                                <a href="#">纤体瘦身</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        厨房用具
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">美容仪</a>
                                                <a href="#">洁面仪</a>
                                                <a href="#">理发器</a>
                                                <a href="#">剃须刀</a>
                                                <a href="#">剃毛器</a>
                                                <a href="#">喷雾器</a>
                                                <a href="#">美容配件</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        生活用品
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">牙刷</a>
                                                <a href="#">牙膏</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="type_hot">
                                        <ul class="type_hot_all">
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05134417343720876.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05221798162552746.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05127512174986573.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05971632446068369.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05515326926166662.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05439537713883786.jpg">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="type_li">
                                <a href="javascript:;" class="type_a">
                                    <i class="iconfont i_type i_type_mwcf"></i> 服装配饰
                                    <i class="iconfont icontypearrow"></i>
                                </a>
                                <div class="type_list">
                                    <ul class="type_list_ul">
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        面部护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">面膜</a>
                                                <a href="#">乳液面霜</a>
                                                <a href="#">精华</a>
                                                <a href="#">护肤套组</a>
                                                <a href="#">防晒隔离</a>
                                                <a href="#">爽肤水</a>
                                                <a href="#">洁面乳</a>
                                                <a href="#">眼部护理</a>
                                                <a href="#">眼膜</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        香水彩妆
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">唇膏唇彩</a>
                                                <a href="#">遮瑕</a>
                                                <a href="#">粉底粉饼</a>
                                                <a href="#">睫毛膏</a>
                                                <a href="#">眉笔</a>
                                                <a href="#">眼影/眼线</a>
                                                <a href="#">彩妆工具</a>
                                                <a href="#">卸妆</a>
                                                <a href="#">女士香水</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        美发护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">洗发水</a>
                                                <a href="#">护发素</a>
                                                <a href="#">洗护套装</a>
                                                <a href="#">卷发棒</a>
                                                <a href="#">电吹风</a>
                                                <a href="#">染发</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        身体护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">私密护理</a>
                                                <a href="#">手工皂</a>
                                                <a href="#">美容养颜</a>
                                                <a href="#">磨砂膏</a>
                                                <a href="#">沐浴露</a>
                                                <a href="#">手足护理</a>
                                                <a href="#">身体乳</a>
                                                <a href="#">香薰精油</a>
                                                <a href="#">卫生巾</a>
                                                <a href="#">纤体瘦身</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        美容工具
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">美容仪</a>
                                                <a href="#">洁面仪</a>
                                                <a href="#">理发器</a>
                                                <a href="#">剃须刀</a>
                                                <a href="#">剃毛器</a>
                                                <a href="#">喷雾器</a>
                                                <a href="#">美容配件</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        口腔护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">牙刷</a>
                                                <a href="#">牙膏</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="type_hot">
                                        <ul class="type_hot_all">
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05134417343720876.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05221798162552746.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05127512174986573.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05971632446068369.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05515326926166662.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05439537713883786.jpg">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="type_li">
                                <a href="javascript:;" class="type_a">
                                    <i class="iconfont i_type i_type_mwcf"></i> 布艺家纺
                                    <i class="iconfont icontypearrow"></i>
                                </a>
                                <div class="type_list">
                                    <ul class="type_list_ul">
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        面部护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">面膜</a>
                                                <a href="#">乳液面霜</a>
                                                <a href="#">精华</a>
                                                <a href="#">护肤套组</a>
                                                <a href="#">防晒隔离</a>
                                                <a href="#">爽肤水</a>
                                                <a href="#">洁面乳</a>
                                                <a href="#">眼部护理</a>
                                                <a href="#">眼膜</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        香水彩妆
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">唇膏唇彩</a>
                                                <a href="#">遮瑕</a>
                                                <a href="#">粉底粉饼</a>
                                                <a href="#">睫毛膏</a>
                                                <a href="#">眉笔</a>
                                                <a href="#">眼影/眼线</a>
                                                <a href="#">彩妆工具</a>
                                                <a href="#">卸妆</a>
                                                <a href="#">女士香水</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        美发护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">洗发水</a>
                                                <a href="#">护发素</a>
                                                <a href="#">洗护套装</a>
                                                <a href="#">卷发棒</a>
                                                <a href="#">电吹风</a>
                                                <a href="#">染发</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        身体护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">私密护理</a>
                                                <a href="#">手工皂</a>
                                                <a href="#">美容养颜</a>
                                                <a href="#">磨砂膏</a>
                                                <a href="#">沐浴露</a>
                                                <a href="#">手足护理</a>
                                                <a href="#">身体乳</a>
                                                <a href="#">香薰精油</a>
                                                <a href="#">卫生巾</a>
                                                <a href="#">纤体瘦身</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        美容工具
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">美容仪</a>
                                                <a href="#">洁面仪</a>
                                                <a href="#">理发器</a>
                                                <a href="#">剃须刀</a>
                                                <a href="#">剃毛器</a>
                                                <a href="#">喷雾器</a>
                                                <a href="#">美容配件</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        口腔护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">牙刷</a>
                                                <a href="#">牙膏</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="type_hot">
                                        <ul class="type_hot_all">
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05134417343720876.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05221798162552746.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05127512174986573.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05971632446068369.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05515326926166662.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05439537713883786.jpg">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="type_li">
                                <a href="javascript:;" class="type_a">
                                    <i class="iconfont i_type i_type_mwcf"></i> 家电数码
                                    <i class="iconfont icontypearrow"></i>
                                </a>
                                <div class="type_list">
                                    <ul class="type_list_ul">
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        面部护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">面膜</a>
                                                <a href="#">乳液面霜</a>
                                                <a href="#">精华</a>
                                                <a href="#">护肤套组</a>
                                                <a href="#">防晒隔离</a>
                                                <a href="#">爽肤水</a>
                                                <a href="#">洁面乳</a>
                                                <a href="#">眼部护理</a>
                                                <a href="#">眼膜</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        香水彩妆
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">唇膏唇彩</a>
                                                <a href="#">遮瑕</a>
                                                <a href="#">粉底粉饼</a>
                                                <a href="#">睫毛膏</a>
                                                <a href="#">眉笔</a>
                                                <a href="#">眼影/眼线</a>
                                                <a href="#">彩妆工具</a>
                                                <a href="#">卸妆</a>
                                                <a href="#">女士香水</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        美发护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">洗发水</a>
                                                <a href="#">护发素</a>
                                                <a href="#">洗护套装</a>
                                                <a href="#">卷发棒</a>
                                                <a href="#">电吹风</a>
                                                <a href="#">染发</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        身体护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">私密护理</a>
                                                <a href="#">手工皂</a>
                                                <a href="#">美容养颜</a>
                                                <a href="#">磨砂膏</a>
                                                <a href="#">沐浴露</a>
                                                <a href="#">手足护理</a>
                                                <a href="#">身体乳</a>
                                                <a href="#">香薰精油</a>
                                                <a href="#">卫生巾</a>
                                                <a href="#">纤体瘦身</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        美容工具
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">美容仪</a>
                                                <a href="#">洁面仪</a>
                                                <a href="#">理发器</a>
                                                <a href="#">剃须刀</a>
                                                <a href="#">剃毛器</a>
                                                <a href="#">喷雾器</a>
                                                <a href="#">美容配件</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        口腔护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">牙刷</a>
                                                <a href="#">牙膏</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="type_hot">
                                        <ul class="type_hot_all">
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05134417343720876.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05221798162552746.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05127512174986573.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05971632446068369.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05515326926166662.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05439537713883786.jpg">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="type_li">
                                <a href="javascript:;" class="type_a">
                                    <i class="iconfont i_type i_type_mwcf"></i> 品牌馆
                                    <i class="iconfont icontypearrow"></i>
                                </a>
                                <div class="type_list">
                                    <ul class="type_list_ul">
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        个护美妆
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">面膜</a>
                                                <a href="#">乳液面霜</a>
                                                <a href="#">精华</a>
                                                <a href="#">护肤套组</a>
                                                <a href="#">防晒隔离</a>
                                                <a href="#">爽肤水</a>
                                                <a href="#">洁面乳</a>
                                                <a href="#">眼部护理</a>
                                                <a href="#">眼膜</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        食品健康
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">唇膏唇彩</a>
                                                <a href="#">遮瑕</a>
                                                <a href="#">粉底粉饼</a>
                                                <a href="#">睫毛膏</a>
                                                <a href="#">眉笔</a>
                                                <a href="#">眼影/眼线</a>
                                                <a href="#">彩妆工具</a>
                                                <a href="#">卸妆</a>
                                                <a href="#">女士香水</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        餐厨日用
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">洗发水</a>
                                                <a href="#">护发素</a>
                                                <a href="#">洗护套装</a>
                                                <a href="#">卷发棒</a>
                                                <a href="#">电吹风</a>
                                                <a href="#">染发</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        身体护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">私密护理</a>
                                                <a href="#">手工皂</a>
                                                <a href="#">美容养颜</a>
                                                <a href="#">磨砂膏</a>
                                                <a href="#">沐浴露</a>
                                                <a href="#">手足护理</a>
                                                <a href="#">身体乳</a>
                                                <a href="#">香薰精油</a>
                                                <a href="#">卫生巾</a>
                                                <a href="#">纤体瘦身</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        美容工具
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">美容仪</a>
                                                <a href="#">洁面仪</a>
                                                <a href="#">理发器</a>
                                                <a href="#">剃须刀</a>
                                                <a href="#">剃毛器</a>
                                                <a href="#">喷雾器</a>
                                                <a href="#">美容配件</a>
                                            </div>
                                        </li>
                                        <li class="clear">
                                            <a href="#" class="type_title">
                                        口腔护理
                                        <i class="iconfont"></i>
                                    </a>
                                            <div class="type_content">
                                                <a href="#">牙刷</a>
                                                <a href="#">牙膏</a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="type_hot">
                                        <ul class="type_hot_all">
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05134417343720876.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05221798162552746.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05127512174986573.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05971632446068369.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05515326926166662.jpg">
                                                </a>
                                            </li>
                                            <li class="type_hot_list">
                                                <a href="#">
                                                    <img src="https://ecimg.happigo.com/data/upload/shop/brand/05439537713883786.jpg">
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="l_padding"><a href="#">首页</a></li>
                <li><a href="#">TV直播</a></li>
                <li><a href="#">美妆控</a></li>
                <li><a href="#">潮搭范</a></li>
                <li><a href="#">美食家</a></li>
                <li><a href="#">下厨房</a></li>
            </ul>

        </div>
    </div>
</section>