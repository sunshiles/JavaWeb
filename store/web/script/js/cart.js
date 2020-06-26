// ------------购物车js-------------
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
    $('.all_sel').on('change', function() {
        $('.item_list:visible').find(':checkbox').prop('checked', $(this).prop('checked'));
        $('.all_sel').prop('checked', $(this).prop('checked'));
        priceall(); //取消选项，重算总和。
    });

    var $inputs = $('.item_list:visible').find(':checkbox');
    $('.shop_list').on('change', $inputs, function() { //事件的委托的this指向被委托的元素
        if ($('.item_list:visible').find('input:checkbox').length == $('.item_list:visible').find('input:checked').size()) {
            $('.all_sel').prop('checked', true);
        } else {
            $('.all_sel').prop('checked', false);
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
        $(this).parents('.item_list').find('.s_sum').find('em').html(singlegoodsprice($(this))); //改变后的价格
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

    //直接输入改变数量
    $('.s_num input').on('input', function() {
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
        $(this).parents('.item_list').find('.s_sum').find('em').html(singlegoodsprice($(this))); //改变后的价格
        priceall();
        setcookie($(this));
    });

    //7.计算数量改变后单个商品的价格
    function singlegoodsprice(obj) { //obj:当前元素
        var $dj = parseFloat(obj.parents('.item_list').find('.s_price').find('p').html()); //单价
        var $cnum = parseInt(obj.parents('.item_list').find('.s_num input').val()); //数量
        return ($dj * $cnum).toFixed(2); //结果
    }

    //8.将改变后的数量的值存放到cookie
    //点击按钮将商品的数量和id存放cookie中
    var arrsid = []; //商品的id
    var arrnum = []; //商品的数量
    //提前获取cookie里面id和num
    function cookietoarray() {
        if ($.cookie('cookiesid') && $.cookie('cookienum')) {
            arrsid = $.cookie('cookiesid').split(','); //cookie商品的sid
            arrnum = $.cookie('cookienum').split(','); //cookie商品的num
        }
    }

    function setcookie(obj) { //obj:当前操作的对象
        cookietoarray(); //得到数组
        var $index = obj.parents('.item_list').find('img').attr('sid'); //通过id找数量的位置
        arrnum[$.inArray($index, arrsid)] = obj.parents('.item_list').find('.s_num input').val();
        $.cookie('cookienum', arrnum.toString(), {
            expires: 7
        });
    }


    //9.删除操作
    //删除cookie
    function delgoodslist(sid, arrsid) { //sid：当前删除的sid，arrsid:cookie的sid的值
        var $index = -1;
        $.each(arrsid, function(index, value) { //删除的sid对应的索引位置。 index:数组项的索引
            if (sid == value) {
                $index = index; //如果传入的值和数组的值相同，返回值对应的索引。
            }
        });
        arrsid.splice($index, 1); //删除数组对应的值
        arrnum.splice($index, 1); //删除数组对应的值
        $.cookie('cookiesid', arrsid.toString(), { expires: 7 }); //添加cookie
        $.cookie('cookienum', arrnum.toString(), { expires: 7 }); //添加cookie
    }

    //删除单个商品的函数(委托)
    $('.shop_list').on('click', '.s_del a', function(ev) {
        cookietoarray(); //得到数组,上面的删除cookie需要。
        if (confirm('你确定要删除吗？')) {
            $(this).first().parents('.item_list').remove(); //通过当前点击的元素找到整个一行列表，删除
        }
        delgoodslist($(this).first().parents('.item_list').find('img').attr('sid'), arrsid);
        priceall();
    });

})(jQuery);