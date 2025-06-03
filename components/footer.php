<!-- Instagram End -->
<div style="border: 1px solid #0A68FF;"></div>
<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-7">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="./index.html"><img src="public/img/logo.png" alt=""></a>
                    </div>
                    <ul>
                        <li>Địa chỉ: Thôn 5, Thuần Mỹ, Ba Vì, Hà Nội</li>
                        <br>
                        <li>Số điện thoại: 0967.676.103</li>
                        <br>
                        <li>Email: quachmanhthao1985@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-5">
                <div class="footer__widget">
                    <h6>Giới thiệu</h6>
                    <ul>
                        <li><a href="#">Về chúng tôi</a></li>
                        <li><a href="#">Blogs</a></li>
                        <li><a href="#">Liên hệ</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="footer__widget">
                    <h6>Tài Khoản</h6>
                    <ul>
                        <li><a href="#">Tài khoản của tôi</a></li>
                        <li><a href="#">Theo dõi đơn hàng</a></li>
                        <li><a href="#">Thủ tục thanh toán</a></li>
                        <li><a href="#">Danh sách yêu thích</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-8 col-sm-8">
                <div class="footer__newslatter">
                    <h6>BẢN TIN</h6>
                    <form action="#">
                        <input type="text" placeholder="Email">
                        <button type="submit" class="site-btn">Theo dõi</button>
                    </form>
                    <div class="footer__payment">
                        <div class="social-message-icons">
                            <a href="https://www.facebook.com/dung.bui.708852" target="_blank" title="Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="https://www.instagram.com/fuhffg2003/" target="_blank" title="Instagram">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="https://id.zalo.me/" target="_blank" title="Zalo" class="zalo-icon">
                                <img src="upload/zaloicon.png" alt="Zalo" style="width: 45px; height: 45px;">
                            </a>
                            <a href="https://www.facebook.com/messages/t/100014424046031" target="_blank" title="Messenger">
                                <i class="fab fa-facebook-messenger"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
    <p>
        Copyright &copy; <script>document.write(new Date().getFullYear());</script>
        Cửa hàng điện thoại Thao Yến Mobile <i class="fa fa-heart" aria-hidden="true"></i> 
        by <a href="#">Thao Yến Mobile – Uy tín tạo nên thương hiệu</a>
        <img src="public/img/payment/payment-item.png" alt="" style="height: 20px; margin-left: 10px;">
    </p>
</div>

                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form action="tim-kiem" method="get" class="search-model-form">
            <input type="search" name="query" id="search-input" placeholder="TÌM KIẾM.....">
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Toatr -->
<script>
$(document).ready(function() {
    $("#toastr-success-top-right").on("click", function() {
        toastr.success("1 sản phẩm đã thêm vào giỏ", "Thành công", {
            closeButton: true,
            debug: false,
            newestOnTop: false,
            progressBar: true,
            positionClass: "toast-top-right",
            preventDuplicates: false,
            onclick: null,
            showDuration: "300",
            hideDuration: "1000",
            timeOut: "5000",
            extendedTimeOut: "1000",
            showEasing: "swing",
            hideEasing: "linear",
            showMethod: "fadeIn",
            hideMethod: "fadeOut"
        });
    });
});
</script>

<!-- Js Plugins -->
<script src="public/js/jquery-3.3.1.min.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/jquery.magnific-popup.min.js"></script>
<script src="public/js/jquery-ui.min.js"></script>
<script src="public/js/mixitup.min.js"></script>
<script src="public/js/jquery.countdown.min.js"></script>
<script src="public/js/jquery.slicknav.js"></script>
<script src="public/js/owl.carousel.min.js"></script>
<script src="public/js/jquery.nicescroll.min.js"></script>
<script src="public/js/main.js"></script>

<!-- dialogflow -->
<!-- <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
    intent="WELCOME"
    chat-title="Chat"
    agent-id="a111a74a-8334-4098-9636-0f1433d6fc97"
    language-code="vi"
></df-messenger> -->


</body>

</html>