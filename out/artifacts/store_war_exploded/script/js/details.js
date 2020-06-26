// ----------------详情页js----------------
// ----------数据渲染拼接----------
;
(function() {

    // 右边购物车数量
    if ($.cookie('cookiesid') && $.cookie('cookienum')) {
        var $n = $.cookie('cookienum').split(','); //数组num
        console.log($n);
        var $sumn = 0;
        $.each($n, function(i, value) {
            $sumn += +value
        })
        setTimeout(function() {
            $('.car_num').html($sumn)
        }, 200)
    }

    var picid = location.search.substring(1).split('=')[1];

    $.ajax({
        url: '../php/details.php',
        data: {
            sid: picid
        },
        dataType: 'json'
    }).done(function(data) { //data:后端返回的和id对应的数据
        // console.log(data);
        $('#smallpic').attr('src', data.url);
        $('#bpic').attr('src', data.url);
        $('#numsid').html(data.sid);
        $('.sm_tit').html(data.smtitle);
        $('.tit').html(data.title);
        $('title').html(data.title); //浏览器标签页标题
        $('.price_now').html(data.price);
        var arr = data.urls.split(',');
        var str = '';
        $.each(arr, function(index, value) {
            str += '<li class="img_item"><a href="javascript:;"><img src="' + value + '"/></a></li>';
        });
        $('.img_list').html(str);
    });



})();

// -----------放大镜效果----------
;
(function() {

    ! function() {

        $('#sf').width($('#spic').width() * $('#bf').width() / $('#bpic').width());
        $('#sf').height($('#spic').height() * $('#bf').height() / $('#bpic').height());
        var bili = $('#bpic').width() / $('#spic').width();
        $('#spic').hover(function() {
            $('#sf').css('visibility', 'visible');
            $('#bf').css('visibility', 'visible');
            $(this).on('mousemove', function(ev) {
                var $left = ev.pageX - $('.sp_l').offset().left - $('#sf').width() / 2;
                var $top = ev.pageY - $('.sp_l').offset().top - $('#sf').height() / 2;
                if ($left < 0) {
                    $left = 0;
                } else if ($left >= $('#spic').width() - $('#sf').width()) {
                    $left = $('#spic').width() - $('#sf').width();
                }
                if ($top < 0) {
                    $top = 0;
                } else if ($top >= $('#spic').height() - $('#sf').height()) {
                    $top = $('#spic').height() - $('#sf').height();
                }
                $('#sf').css('left', $left);
                $('#sf').css('top', $top);
                $('#bpic').css('left', -$left * bili);
                $('#bpic').css('top', -$top * bili);
            });
        }, function() {
            $('#sf').css('visibility', 'hidden');
            $('#bf').css('visibility', 'hidden');
        });

        //点击小图切换
        $('.img_list').on('click', 'li', function() {
            var $imgurl = $(this).find('img').attr('src');
            $('#smallpic').attr('src', $imgurl);
            $('#bpic').attr('src', $imgurl);
        });

        //点击箭头进行切换
        var $num = 5; //放大镜显示5张。
        $('.r_btn').on('click', function() {
            var $list = $('.img_list li');
            if ($list.length > $num) {
                $num++;
                $('.l_btn').css('color', '#333');
                if ($list.length == $num) {
                    $('.r_btn').css('color', '#fff');
                }
                $('.img_list').animate({
                    left: -($num - 5) * ($list.eq(0).innerWidth() + 10) //加10是因为li标签的边距有10px
                })
            }
        });

        $('.l_btn').on('click', function() {
            var $list = $('.img_list li');
            if ($num > 5) {
                $num--;
                $('.r_btn').css('color', '#333');
                if ($num <= 5) {
                    $('.l_btn').css('color', '#fff');
                }
                $('.img_list').animate({
                    left: -($num - 5) * ($list.eq(0).innerWidth() + 10) //加10是因为li标签的边距有10px
                })
            }
        });
    }();

})();
// -----------商品加减-------------
;
(function() {
    var $reduce = $('.btn_reduce');
    var $add = $('.btn_add');
    var $input = $('.add_sub .text');
    var $num = $input.val();
    $add.on('click', function() {
        if ($num >= 99) {
            $num == 99
        } else {
            $num++;
        }
        $input.val($num);
    });
    $reduce.on('click', function() {
        if ($num <= 1) {
            $num == 1
        } else {
            $num--;
        }
        $input.val($num);
    });

    //直接输入改变数量
    $input.on('input', function() {
        var $reg = /^\d+$/g; //只能输入数字
        var $value = parseInt($(this).val());
        if ($reg.test($value)) { //是数字
            if ($value >= 99) { //限定范围
                $(this).val(99);
            } else if ($value <= 0) {
                $(this).val(1);
            } else {
                $(this).val($value);
            }
        } else { //不是数字
            $(this).val(1);
        }
    });

})();
// -----------将商品加入购物车------------
;
(function() {
    //购物车的思路
    //存放商品的sid和商品的数量--数组实现。
    //如果商品第一次存购物车，存放的是商品的sid和商品的数量。
    //如果是第二次购买商品，从第二次开始改变数量。

    //疑问：判断商品是第一次存还是多次存储。

    //1.解决方式：提前获取cookie里面id和num
    //点击按钮将商品的数量和id存放cookie中
    var arrsid = []; //商品的sid
    var arrnum = []; //商品的数量
    function cookietoarray() {
        if ($.cookie('cookiesid') && $.cookie('cookienum')) { //判断商品是第一次存还是多次存储
            arrsid = $.cookie('cookiesid').split(','); //cookie商品的sid
            arrnum = $.cookie('cookienum').split(','); //cookie商品的num
        }
    }

    //2.有了上面的方法，可以点击加入购物车按钮判断商品是否是第一次还是多次。

    $('.code_buy').on('click', function() { //点击加入购物车按钮。

        //判断当前的商品sid是否存在购物车(cookie)
        //判断当前的按钮对应的商品的sid和取出的cookie里面的sid进行比较

        //获取当前的按钮对应的商品的sid
        var $sid = $(this).parents('.sp_box').find('#numsid').html();
        cookietoarray(); //获取已经存在的cookie值。

        if ($.inArray($sid, arrsid) != -1) { //商品存在，数量叠加 
            //先取出cookie中的对应的数量值+当前添加的数量值，添加到对应的cookie中。
            var num = parseInt(arrnum[$.inArray($sid, arrsid)]) + parseInt($('.add_sub .text').val());
            arrnum[$.inArray($sid, arrsid)] = num;
            // addcookie('cookienum', arrnum.toString(), 10); //数组存入cookie
            $.cookie('cookienum', arrnum.toString(), {
                expires: 7
            })

        } else { //不存在，第一次添加。将商品的id和数量存入数组，再存入cookie.
            arrsid.push($sid); //将当前的id存入数组
            // addcookie('cookiesid', arrsid.toString(), 10); //数组存入cookie
            $.cookie('cookiesid', arrsid.toString(), {
                expires: 7
            })
            arrnum.push($('.add_sub .text').val());
            // addcookie('cookienum', arrnum.toString(), 10); //数组存入cookie
            $.cookie('cookienum', arrnum.toString(), {
                expires: 7
            })
        }

        // 右边购物车数量
        if ($.cookie('cookiesid') && $.cookie('cookienum')) {
            var $n = $.cookie('cookienum').split(','); //数组num
            console.log($n);
            var $sumn = 0;
            $.each($n, function(i, value) {
                $sumn += +value
            })
            setTimeout(function() {
                $('.car_num').html($sumn)
            }, 200)
        }

        alert('添加购物车成功');
    });
})();