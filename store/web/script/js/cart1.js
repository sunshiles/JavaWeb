// ------------购物车js-------------
;
(function($) {
    //2.获取cookie，执行渲染列表的函数
    if ($.cookie('cookiesid') && $.cookie('cookienum')) {
        var arrs = $.cookie('cookiesid').split(','); //数组sid
        var arrn = $.cookie('cookienum').split(','); //数组num
        $.each(arrs, function(i, value) {
            goodslist(arrs[i], arrn[i]);
        });
    }

    //1.渲染商品列表, 传入两个参数，一个id和数量，根据id和数量渲染整个可见的列表.
    function goodslist(id, count) {
        $.ajax({
            url: '../php/index.php',
            dataType: 'json'
        }).done(function(data) {
            $.each(data, function(index, value) {
                if (id == value.sid) { //遍历判断sid和传入的sid是否相同，方便将那条数据设置到渲染的商品列表中。
                    var $clonebox = $('.item_list:hidden').clone(true, true);
                    $clonebox.find('.box_img').find('img').attr('src', value.url);
                    $clonebox.find('.box_img').find('img').attr('sid', value.sid);
                    $clonebox.find('.box_titl').find('a').html(value.title);
                    $clonebox.find('.s_price').find('p').html(value.price);
                    $clonebox.find('.s_num').find('input').val(count);
                    $clonebox.find('.s_sum').find('em').html((value.price * count).toFixed(2));
                    $clonebox.css('display', 'block');
                    $('.shop_list').append($clonebox);
                    priceall(); //计算总价的
                }
            });
        })
    }

    //4.计算总价和总的商品件数，必须是选中的商品。
    function priceall() {
        var $sum = 0;
        var $count = 0;

        $('.item_list:visible').each(function(index, element) {

            if ($(element).find('.car_check input').prop('checked')) {
                $sum += parseInt($(element).find('.s_num').find('input').val());
                $count += parseFloat($(element).find('.s_sum').find('em').html());
            }
        });
        $('.sel_ok_num').find('em').html($sum);
        $('.sel_type').find('em').html($count.toFixed(2));
    }

    //5.全选操作
    $('.allsel').on('change', function() {
        $('.item_list:visible').find(':checkbox').prop('checked', $(this).prop('checked'));
        $('.allsel').prop('checked', $(this).prop('checked'));
        priceall(); //取消选项，重算总和。
    });

    var $inputs = $('.item_list:visible').find(':checkbox');
    $('.shop_list').on('change', $inputs, function() { //事件的委托的this指向被委托的元素
        if ($('.item_list:visible').find('input:checkbox').length == $('.item_list:visible').find('input:checked').size()) {
            $('.allsel').prop('checked', true);
        } else {
            $('.allsel').prop('checked', false);
        }
        priceall(); //取消选项，重算总和。
    });

    //6.数量的改变
    //改变商品数量++
    $('.add').on('click', function() {
        var $count = $(this).parents('.item_list').find('.s_num input').val(); //值
        $count++;
        if ($count >= 99) {
            $count = 99;
        }
        $(this).parents('.item_list').find('.s_num input').val($count); //赋值回去
        $(this).parents('.item_list').find('.s_sum').find('strong').html(singlegoodsprice($(this))); //改变后的价格
        priceall(); //重新计算总和。
        setcookie($(this)); //将改变的数量重新添加到cookie
    });

    //改变商品数量--
    $('.redu').on('click', function() {
        var $count = $(this).parents('.item_list').find('.s_num input').val();
        $count--;
        if ($count <= 1) {
            $count = 1;
        }
        $(this).parents('.item_list').find('.s_num input').val($count);
        $(this).parents('.item_list').find('.s_sum').find('em').html(singlegoodsprice($(this))); //改变后的价格
        priceall();
        setcookie($(this));
    });
})(jQuery);