<?php
    $listProducts = $ProductModel->select_products_limit(8);

    $listCategories = $CategoryModel->select_categories_limit(10);

    $product_limit_3 = $ProductModel->select_products_limit(3); //lấy 3 sản phẩm
    $product_order_by = $ProductModel->select_products_order_by(3, 'ASC');
?>

<!-- Banner Section Begin -->
<section class="container my-3">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                <div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" style="border-radius: 10px;">
                        <div class="carousel-item active" >
                            <img class="img-fluid" src="public/img/banner-fpt-1.png" alt="Image">
                            
                        </div>
                        <div class="carousel-item" >
                            <img class="img-fluid" src="public/img/banner-fpt-2.png" alt="Image">
                            
                        </div>
                        <div class="carousel-item" >
                            <img class="img-fluid" src="public/img/banner-fpt-1.png" alt="Image">
                            
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                    
                </div>
            </div>
            <div class="col-lg-4">
                <div class="product-offer" >
                    <img class="img-fluid" src="public/img/banner-fpt-1.png" alt="">
                    
                </div>
                <div class="product-offer">
                    <img class="img-fluid" src="public/img/banner-fpt-2.png" alt="">
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->


<!-- Product Section Begin -->
<section class="product spad" style="background-color: #F4F4F9;">

    <!-- CATER -->
    <section class="container cate-home" style="background-color: #ffffff; border-radius: 10px;">    

        <div class="section-title pt-2" style="margin-bottom: 30px;">
            <h4>Danh mục sản phẩm</h4>
        </div>
        
        <div class="row g-1 mb-4 mt-2 pb-4">
            <?php foreach ($listCategories as $value) {
                extract($value);
                $link = 'index.php?url=danh-muc-san-pham&id=' .$category_id;
            ?>
            <div class="col-lg-2 col-md-3 col-sm-6 text-center p-1 cate-gory">
                <a href="<?=$link?>"><img style="width: 50%;" src="upload/<?=$image?>" alt=""></a>
                <div class="mt-2">
                    <a class="cate-name text-dark" href="<?=$link?>"><?=$name?></a>
                </div>
            </div>
            
            <?php
            }
            ?>
            
            
        </div>
    </section>
    <!-- CATE END-->


    <div class="container" style="background-color: #ffffff; border-radius: 10px;">
        
        <div class="row pt-3">
            <div class="col-lg-4 col-md-4">
                <div class="section-title">
                    <h4>Sản phẩm</h4>
                </div>
            </div>
            
        </div>
        <div class="row property__gallery">
            <?php foreach ($listProducts as $product) {
                extract($product);

                $discount_percentage = $ProductModel->discount_percentage($price, $sale_price);
            ?>
            <div class="col-lg-3 col-md-4 col-sm-6 mix sach-1">
                <div class="product__item sale" style="cursor: pointer;" onclick="window.location.href='index.php?url=chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>'">
                    <div class="product__item__pic set-bg" data-setbg="upload/<?=$image?>">
                        <!-- <div class="label sale">Sale</div> -->
                        <div class="label_right sale">-<?=$discount_percentage?></div>
                        <ul class="product__hover">
                            <li><a href="upload/<?=$image?>" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li>
                                <a href="index.php?url=chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>">
                                <span class="icon_search_alt"></span>
                                </a>
                            </li>
                            
                            
                            <li>
                                <?php if(isset($_SESSION['user'])) {?>
                                <form action="index.php?url=gio-hang" method="post">
                                    <input value="<?=$product_id?>" type="hidden" name="product_id">
                                    <input value="<?=$_SESSION['user']['id']?>" type="hidden" name="user_id">
                                    <input value="<?=$name?>" type="hidden" name="name">
                                    <input value="<?=$image?>"type="hidden" name="image">
                                    <input value="<?=$sale_price?>" type="hidden" name="price">
                                    <input value="1" type="hidden" name="product_quantity">
                                    <input value="<?=$image?>" type="hidden" name="image">

                                    <button type="submit" name="add_to_cart" id="toastr-success-top-right">
                                        <a href="#" ><span class="icon_bag_alt"></span></a>
                                    </button>
                                </form>
                                <?php }else{?>
                                    <button type="submit" onclick="alert('Vui lòng dăng nhập để thực hiện chức năng');" name="add_to_cart" id="toastr-success-top-right">
                                        <a href="dang-nhap" ><span class="icon_bag_alt"></span></a>
                                    </button>
                                <?php }?>
                            </li>
                            
                        </ul>
                        
                    </div>
                    <div class="product__item__text">
                        <h6 class="text-truncate-1" onclick="window.location.href='index.php?url=chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>'"><a href=""><?=$name?></a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price"><?=number_format($sale_price) ."₫"?> <span><?=number_format($price)."đ"?></span></div>
                    </div>
                </div>
            </div>

            <?php 
            } 
            ?>

            
            
            <div class="col-lg-12 text-center mb-4">
                <a href="index.php?url=cua-hang" class="btn btn-outline-primary">Xem tất cả</a>
            </div>
        </div>
        
    </div>


    

</section>


<!-- Slider Section Begin -->
<section class="slider">
    <div class="container">
        <div class="slider-content">
            <div class="slider-content-left">
                <div class="slider-content-left-top">
                    <div class="slider-wrapper">
                        <a href=""><img src="public/img/banner/slide1.png" alt=""></a>
                        <a href=""><img src="public/img/banner/slide2.png" alt=""></a>
                        <a href=""><img src="public/img/banner/slide3.png" alt=""></a>
                        <a href=""><img src="public/img/banner/slide4.png" alt=""></a>
                        <a href=""><img src="public/img/banner/slide2.png" alt=""></a>
                    </div>
                    <!-- Nút trái/phải -->
                    <button class="slider-prev"><i class="fa-solid fa-chevron-left"></i></button>
                    <button class="slider-next"><i class="fa-solid fa-chevron-right"></i></button>
                </div>
                
                <div class="slider-content-left-bottom">
                    <li class="active" data-index="0">Samsung Galaxy A05s <br>Giá siêu rẻ </li>
                    <li data-index="1">Iphone 16 Series <br>Giá 19.990.000đ, Quà Ngon</li>
                    <li data-index="2">Sắm Redmi Note 14 5G <br>Nhận Ngàn Quà Tặng </li>
                    <li data-index="3">Honor X7C 8Gb/256Gb <br> Giảm Ngay 500K</li>
                    <li data-index="4">Mua Honor X8C <br>Nhận Quà 1,5 Triệu </li>
                </div>
            </div>  
           <!-- <div class="slider-content-right">
                <li><a href=""><img src="image/" alt=""></a></li>
            </div> --> 
        </div>
    </div>
</section>
<!-- Slider Section End -->

<!-- Trend Section Begin -->
<section class="trend spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>Xu hướng</h4>
                    </div>
                    <?php
                        foreach ($product_limit_3 as $value) {
                            extract($value);
                        
                    ?>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><img src="upload/<?=$image?>" style="width: 90px;" alt=""></a>
                        </div>
                        <div class="trend__item__text">
                            <h6>
                                <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>" class="text-dark"><?=$name?></a>
                            </h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price"><?=number_format($sale_price)?>₫</div>
                        </div>
                    </div>
                    <?php
                        }
                    ?>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>BÁN CHẠY</h4>
                    </div>
                    <?php
                        foreach ($product_order_by as $value) {
                            extract($value);
                        
                    ?>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><img src="upload/<?=$image?>" style="width: 90px;" alt=""></a>
                        </div>
                        <div class="trend__item__text">
                            <h6>
                                <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>" class="text-dark"><?=$name?></a>
                            </h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price"><?=number_format($sale_price)?>₫</div>
                        </div>
                    </div>
                    <?php
                        }
                    ?>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="trend__content">
                    <div class="section-title">
                        <h4>Hot sale</h4>
                    </div>
                    <?php
                        foreach ($product_limit_3 as $value) {
                            extract($value);
                        
                    ?>
                    <div class="trend__item">
                        <div class="trend__item__pic">
                            <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><img src="upload/<?=$image?>" style="width: 90px;" alt=""></a>
                        </div>
                        <div class="trend__item__text">
                            <h6>
                                <a href="chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>" class="text-dark"><?=$name?></a>
                            </h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price"><?=number_format($sale_price)?>₫</div>
                        </div>
                    </div>
                    <?php
                        }
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Trend Section End -->

<!-- Discount Section Begin -->
<section class="discount">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 p-0">
                <div class="discount__pic">
                    <img src="public/img/khuyenmai.jpg" alt="Hình ảnh">
                </div>
            </div>
            <div class="col-lg-6 p-0">
                <div class="discount__text">
                    <div class="discount__text__title">
                        <span>Khuyến mãi</span>
                        <h2>Chào hè đến !</h2>
                        <h5><span>Giảm giá tới</span> 30%</h5>
                    </div>
                    <div class="discount__countdown" id="countdown-time">
                        <div class="countdown__item">
                            <span>22</span>
                            <p>Ngày</p>
                        </div>
                        <div class="countdown__item">
                            <span>18</span>
                            <p>Giờ</p>
                        </div>
                        <div class="countdown__item">
                            <span>46</span>
                            <p>Phút</p>
                        </div>
                        <div class="countdown__item">
                            <span>05</span>
                            <p>Giây</p>
                        </div>
                    </div>
                    <a href="/shop.php">Mua ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Discount Section End -->

<!-- Services Section Begin -->
<section class="services spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-car"></i>
                    <h6>Miễn phí vận chuyển</h6>
                    <p>Cho tất cả các đơn hàng trên 200.000đ</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-money"></i>
                    <h6>Đảm bảo hoàn tiền</h6>
                    <p>Nếu sản phẩm có vấn đề</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-support"></i>
                    <h6>Hỗ trợ trực tuyến 24/7</h6>
                    <p>Hỗ trợ chuyên dụng</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="services__item">
                    <i class="fa fa-headphones"></i>
                    <h6>Thanh toán an toàn</h6>
                    <p>Thanh toán an toàn 100%</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Services Section End -->