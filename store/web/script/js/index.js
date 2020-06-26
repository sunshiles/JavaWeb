// ----------------首页js----------------

// --------------固定搜索框-------------
;
(function($) {
    $(window).on('scroll', function() {

        var $top = $(window).scrollTop()
        if ($top > 800) {
            $('.fixed_top').stop(true).animate({
                top: 0
            })
        } else {
            $('.fixed_top').stop(true).animate({
                top: -54
            })
        }
    })

})(jQuery);
// ------------banner轮播------------
;
(function($) {
    class bannerlunbo {
        constructor() {
            this.banner = $('.banner');
            this.picLi = $('.lunbo_big li');
            this.btnLi = $('.ol_li li');
            this.btn_right = $('.right');
            this.timer = null;
            this.num = 0;
        }
        init() {
            var _this = this;
            this.btnLi.each(function() {
                $(this).on('click', function() {
                    _this.btnli(this)
                })
            })
            this.banner.hover(function() {
                _this.over()
            }, function() {
                _this.out()
            })
            this.btn_right.on('click', function() {
                _this.rightclick()
            })
        }
        btnli(bli) {
            this.num = $(bli).index()
            $(bli).addClass('active').siblings('li').removeClass('active');
            this.picLi.eq($(bli).index()).stop(true).animate({
                'opacity': 1
            }).siblings().stop(true).animate({
                'opacity': 0
            })
        }
        over() {
            clearInterval(this.timer)
        }
        out() {
            var _this = this
            this.timer = setInterval(function() {
                _this.btn_right.click()
            }, 3000);
        }
        rightclick() {
            this.num++;
            if (this.num > this.btnLi.size() - 1) {
                this.num = 0;
            }
            this.btnLi.eq(this.num).addClass('active').siblings('li').removeClass('active');
            this.picLi.eq(this.num).stop(true).animate({
                'opacity': 1
            }).siblings().stop(true).animate({
                'opacity': 0
            })
        }
    }
    new bannerlunbo().init();
})(jQuery);
// -------------TV直播轮播--------------
;
(function($) {
    class live {
        constructor() {
            this.wrap = $('.live_li');
            this.list = $('.lunbo_start li');
            this.ul = $('.lunbo_start');
            this.left = $('.prev');
            this.right = $('.next');
        }
        init() {
                var _this = this;
                // this.wrap.hover(function() {
                //     _this.over()
                // }, function() {
                //     _this.out()
                // })

                //计算ul的宽度
                this.liwidth = this.list.outerWidth(true);
                this.ul.width(this.list.length * this.liwidth);

                //给左右箭头添加点击事件
                this.showlength = 3;

                this.right.on('click', function() {
                    _this.rightclick();
                });

                this.left.on('click', function() {
                    _this.leftclick();
                });

            }
            // over() {
            //     this.left.show();
            //     this.right.show();
            // }
            // out() {
            //     this.left.hide();
            //     this.right.hide();
            // }
        rightclick() {
            if (this.list.length > this.showlength) {
                this.showlength++;
            }
            this.ul.animate({
                left: -(this.showlength - 3) * this.liwidth
            });
        }
        leftclick() {
            if (this.showlength > 3) {
                this.showlength--;
            }
            this.ul.animate({
                left: -(this.showlength - 3) * this.liwidth
            });
        }
    }
    setTimeout(function() {
        new live().init();
    }, 200)
})(jQuery);
// -------------------数据渲染---------------------
;
(function($) {
    $.ajax({
        url: '../php/index.php',
        dataType: 'json'
    }).done(function(data) {
        var $html = '';
        $.each(data, function(index, value) {
            $html += `
                <li style="margin-right:0;">
                <a href="details.html?sid=${value.sid}" class="a_info" target="_blank">
                    <div class="img_info">
                        <p>
                            <img class="lazy" data-original="${value.url}" width="256" height="256">
                        </p>
                    </div>
                    <div class="tit_info">
                        <p class="p_t">${value.smtitle}</p>
                        <p class="p_b">${value.title}</p>
                    </div>
                    <p class="price_info">
                        <span class="price1">
                            ￥<span>${value.price}</span>
                        </span>
                    </p>
                </a>
            </li>
			`;
        });
        $('.dataul').html($html);
    });
})(jQuery);
// ----------回到顶部----------
;
(function($) {
    var $top = $('.totop')
    $top.on('click', function() {
        $('html,body').animate({
            scrollTop: 0
        });
    })
})(jQuery);

//-----------登录成功显示用户名----------
;
(function($) {
    //显示隐藏
    $(function() {
        setTimeout(function() {
            if ($.cookie('username')) {
                $('.hello').hide();
                $('.admin').show().find('span').html('你好,' + $.cookie('username'));
            }
            $('.admin a').on('click', function() {
                $.cookie('username', '', { expires: -1 });
                $('.admin').hide();
                $('.hello').show();
            });
        }, 200)
    });
})(jQuery);


//-----------懒加载-----------
;
(function($) {
    setTimeout(function() {
        $(function() {
            $("img.lazy").lazyload({
                effect: "fadeIn"
            });
        });
    }, 200)
})(jQuery);