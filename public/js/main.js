/*  ---------------------------------------------------
Template Name: Ashion
Description: Ashion ecommerce template
Author: Colorib
Author URI: https://colorlib.com/
Version: 1.0
Created: Colorib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Product filter
        --------------------*/
        $('.filter__controls li').on('click', function () {
            $('.filter__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.property__gallery').length > 0) {
            var containerEl = document.querySelector('.property__gallery');
            var mixer = mixitup(containerEl);
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Search Switch
    $('.search-switch').on('click', function () {
        $('.search-model').fadeIn(400);
    });

    $('.search-close-switch').on('click', function () {
        $('.search-model').fadeOut(400, function () {
            $('#search-input').val('');
        });
    });

    //Canvas Menu
    $(".canvas__open").on('click', function () {
        $(".offcanvas-menu-wrapper").addClass("active");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".offcanvas-menu-overlay, .offcanvas__close").on('click', function () {
        $(".offcanvas-menu-wrapper").removeClass("active");
        $(".offcanvas-menu-overlay").removeClass("active");
    });

    /*------------------
		Navigation
	--------------------*/
    $(".header__menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*------------------
        Accordin Active
    --------------------*/
    $('.collapse').on('shown.bs.collapse', function () {
        $(this).prev().addClass('active');
    });

    $('.collapse').on('hidden.bs.collapse', function () {
        $(this).prev().removeClass('active');
    });

    /*--------------------------
        Banner Slider
    ----------------------------*/
    $(".banner__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*--------------------------
        Product Details Slider
    ----------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: false,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<i class='arrow_carrot-left'></i>","<i class='arrow_carrot-right'></i>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: false,
        mouseDrag: false,
        startPosition: 'URLHash'
    }).on('changed.owl.carousel', function(event) {
        var indexNum = event.item.index + 1;
        product_thumbs(indexNum);
    });

    function product_thumbs (num) {
        var thumbs = document.querySelectorAll('.product__thumb a');
        thumbs.forEach(function (e) {
            e.classList.remove("active");
            if(e.hash.split("-")[1] == num) {
                e.classList.add("active");
            }
        })
    }


    /*------------------
		Magnific
    --------------------*/
    $('.image-popup').magnificPopup({
        type: 'image'
    });


    $(".nice-scroll").niceScroll({
        cursorborder:"",
        cursorcolor:"#dddddd",
        boxzoom:false,
        cursorwidth: 5,
        background: 'rgba(0, 0, 0, 0.2)',
        cursorborderradius:50,
        horizrailenabled: false
    });

    /*------------------
        CountDown
    --------------------*/
    // For demo preview start
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    if(mm == 12) {
        mm = '01';
        yyyy = yyyy + 1;
    } else {
        mm = parseInt(mm) + 1;
        mm = String(mm).padStart(2, '0');
    }
    var timerdate = mm + '/' + dd + '/' + yyyy;
    // For demo preview end


    // Uncomment below and use your date //

    /* var timerdate = "2020/12/30" */

	$("#countdown-time").countdown(timerdate, function(event) {
        $(this).html(event.strftime("<div class='countdown__item'><span>%D</span> <p>Day</p> </div>" + "<div class='countdown__item'><span>%H</span> <p>Hour</p> </div>" + "<div class='countdown__item'><span>%M</span> <p>Min</p> </div>" + "<div class='countdown__item'><span>%S</span> <p>Sec</p> </div>"));
    });

    /*-------------------
		Range Slider
	--------------------- */
	var rangeSlider = $(".price-range"),
    minamount = $("#minamount"),
    maxamount = $("#maxamount"),
    minPrice = rangeSlider.data('min'),
    maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
    range: true,
    min: minPrice,
    max: maxPrice,
    values: [minPrice, maxPrice],
    slide: function (event, ui) {
        minamount.val(ui.values[0] + 'đ');
        maxamount.val(ui.values[1] + 'đ');
        }
    });
    minamount.val( rangeSlider.slider("values", 0) + 'đ');
    maxamount.val( rangeSlider.slider("values", 1) + 'đ');

    /*------------------
		Single Product
	--------------------*/
	$('.product__thumb .pt').on('click', function(){
		var imgurl = $(this).data('imgbigurl');
		var bigImg = $('.product__big__img').attr('src');
		if(imgurl != bigImg) {
			$('.product__big__img').attr({src: imgurl});
		}
    });
    
    /*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
	proQty.prepend('<span class="dec qtybtn">-</span>');
	proQty.append('<span class="inc qtybtn">+</span>');
	proQty.on('click', '.qtybtn', function () {
		var $button = $(this);
		var oldValue = $button.parent().find('input').val();
		if ($button.hasClass('inc')) {
			var newVal = parseFloat(oldValue) + 1;
		} else {
			// Don't allow decrementing below zero
			if (oldValue > 0) {
				var newVal = parseFloat(oldValue) - 1;
			} else {
				newVal = 0;
			}
		}
		$button.parent().find('input').val(newVal);
    });
    
    /*-------------------
		Radio Btn
	--------------------- */
    $(".size__btn label").on('click', function () {
        $(".size__btn label").removeClass('active');
        $(this).addClass('active');
    });


    

    // Tăng giảm số lượng sản phẩm giỏ hàng và chi tiết sản phẩm
    $('.input-next-cart').on('click', '.button-plus', function(e) {
        incrementValue(e);
    });

    $('.input-next-cart').on('click', '.button-minus', function(e) {
        decrementValue(e);
    });

    function incrementValue(e) {
        e.preventDefault();
        var fieldName = $(e.target).data('field');
        var parent = $(e.target).closest('.input-next-cart');
        var currentVal = parseInt(parent.find('.quantity-field-cart').val(), 10);

        var newValue = (!isNaN(currentVal) && currentVal > 0) ? currentVal + 1 : 1;

        parent.find('.quantity-field-cart').val(newValue);
    }

    function decrementValue(e) {
        e.preventDefault();
        var fieldName = $(e.target).data('field');
        var parent = $(e.target).closest('.input-next-cart');
        var currentVal = parseInt(parent.find('.quantity-field-cart').val(), 10);

        var newValue = (!isNaN(currentVal) && currentVal > 0) ? currentVal - 1 : 0;

        parent.find('.quantity-field-cart').val(newValue);
    }

    // Mini cart
    (function(){
 
        $("#cart").on("click", function() {
          $(".shopping-cart").fadeToggle( "fast");
        });
        
      })();

      (function(){
 
        $("#cart-mini").on("click", function() {
          $(".shopping-cart").fadeToggle( "fast");
        });
        
      })();  

      (function(){
 
        $("#close-minicart").on("click", function() {
          $(".shopping-cart").fadeToggle( "fast");
        });
        
      })();  

    //END Mini cart


    // Hàm hiển thị modal khi thêm thành công sản phẩm vào giỏ hàng
    function showSuccessModal() {
        $('#success_tic').modal('show'); // Sử dụng ID của modal để hiển thị nó
    }

    // Gọi hàm này khi sản phẩm được thêm vào giỏ hàng thành công
    // Ví dụ: sau khi thực hiện một AJAX request hoặc bất kỳ xử lý nào khác khi thêm sản phẩm thành công
    function addedToCartSuccessfully() {
        showSuccessModal();
    }
    
    // addedToCartSuccessfully();


})(jQuery);

/*-----------Slider--------*/
const truotanh = document.querySelector('.slider-wrapper'); // Thẻ chứa các ảnh
const danhsachanh = document.querySelectorAll('.slider-wrapper img'); // Danh sách tất cả ảnh
const nextBtn = document.querySelector('.slider-next'); // Nút chuyển tiếp
const prevBtn = document.querySelector('.slider-prev'); // Nút quay lại

let vitrihientai = 0; // Vị trí ảnh hiện tại
let isPausedAtEnd = false; // Đang dừng ở ảnh cuối

function capnhatvitrianh() {
    let khoangcach = vitrihientai * -100; // Tính khoảng cách trượt sang trái
    truotanh.style.transform = `translateX(${khoangcach}%)`;
}

// Chuyển ảnh tiếp theo
function chuyenanhtiep() {
    if (isPausedAtEnd) {
        vitrihientai = 0;
        isPausedAtEnd = false;
        capnhatvitrianh();
        return;
    }

    vitrihientai++;

    if (vitrihientai >= danhsachanh.length) {
        vitrihientai = danhsachanh.length - 1;
        isPausedAtEnd = true;
        clearInterval(tudongchuyenanh);

        setTimeout(() => {
            tudongchuyenanh = setInterval(chuyenanhtiep, 5000);
        }, 5000);
        return;
    }

    capnhatvitrianh();
}

// Quay lại ảnh trước đó
function quaylaianh() {
    vitrihientai = (vitrihientai - 1 + danhsachanh.length) % danhsachanh.length;
    isPausedAtEnd = false;
    capnhatvitrianh();
}

nextBtn.addEventListener('click', chuyenanhtiep);
prevBtn.addEventListener('click', quaylaianh);

let tudongchuyenanh = setInterval(chuyenanhtiep, 4000); //hàm setinterval là hàm tự động chuyển slide

// Click tiêu đề để chuyển slide
const socuanhli = document.querySelectorAll('.slider-content-left-bottom li');

socuanhli.forEach((item, index) => {
    item.addEventListener('click', () => {
        // Cập nhật vị trí hiện tại
        vitrihientai = index;

        // Gọi hàm cập nhật vị trí slider
        capnhatvitrianh();

        // Xoá class active ở tất cả các tiêu đề
        socuanhli.forEach(li => li.classList.remove('active'));

        // Thêm active vào tiêu đề được click
        item.classList.add('active');
    });
});