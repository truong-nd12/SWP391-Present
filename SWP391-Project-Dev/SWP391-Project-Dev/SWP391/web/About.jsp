<%-- 
    Document   : Products
    Created on : Jan 10, 2024, 2:09:10 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="helper.helper"/>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/logo_2.png" />
        <title>SMART TECH WEBSITE </title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <style>
            .banner {
                margin-top: 50px; /* Khoảng cách trên */
                margin-bottom: 50px; /* Khoảng cách dưới */
                display: flex; /* Sử dụng flexbox để quản lý layout */
                flex-wrap: wrap; /* Cho phép các slide chuyển hàng nếu không đủ chỗ */
            }

            .slide {
                width: 33.33%; /* Slide chiếm 1/3 của trang */
                padding: 10px; /* Khoảng cách giữa các slide */
                box-sizing: border-box; /* Box-sizing để tính cả padding và border vào kích thước của phần tử */
                display: flex; /* Sử dụng flexbox để quản lý layout trong từng slide */
            }

            .slide img {
                width: 40%;
                border-radius: 5px; /* Bo tròn viền hình ảnh */
                float: left; /* Thêm thuộc tính float để hình ảnh và mô tả nằm cạnh nhau */
                margin-right: 30px; /* Khoảng cách giữa mô tả và viền phải */
            }

            .description {
                margin-top: 10px; /* Khoảng cách giữa hình ảnh và mô tả */
                text-align: left; /* Căn giữa mô tả */
                flex: 1; /* Chia đều không gian còn lại cho mô tả */
                margin-left: 10px; /* Khoảng cách giữa mô tả và hình ảnh */
                margin-right: 20px; /* Khoảng cách giữa mô tả và viền phải */
            }

        </style>

    </head>

    <body>
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->

        <!-- Header -->
        <div class="sub-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <ul class="left-info">
                            <li><a href="#"><i class="fa fa-envelope"></i>Smarttech@gmail.com</a></li>
                            <li><a href="tel:0948468558"><i class="fa fa-phone"></i>0866911235</a></li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">

                    <a class="navbar-brand" href="index.html"><img src="assets/images/logo3.jpg" width="200" height="35"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="HomePage">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="Product">Sản phẩm </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Blog">Tin tức</a>
                            </li>
                            <li class="nav-item  active">
                                <a class="nav-link" href="About">Về chúng tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OrderPage">Đặt hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Guarantee">Bảo hành</a>
                            </li>
                            <li class="nav-item  ">
                                <a class="nav-link" href="CartPage"><i class="fa fa-shopping-cart"></i> Giỏ hàng (${sessionScope.cart.getItems().size()==null?"0":sessionScope.cart.getItems().size()})</a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.acc != null}">
                                    <li class="nav-item dropdown">
                                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                            <img class="rounded-circle me-lg-2" src="images/${sessionScope.acc.getAvatar()}" alt="" style="width: 20px; height: 20px;">
                                            ${sessionScope.acc.getCus_name()}</a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="Profile">Hồ sơ</a>
                                            <a class="dropdown-item" href="LogOut">Đăng xuất</a>
                                        </div>
                                    </li>

                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item">
                                        <a class="nav-link" href="LoginPage">Đăng nhập</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Page Content -->
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Về chúng tôi</h1>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="more-info about-info">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="more-info-content">
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <div class="right-content">
                                        <span>Khám phá Thế Giới Công Nghệ Di Động cùng chúng tôi!</span>
                                        <h2>Tìm hiểu về <em>công ty của chúng tôi</em></h2>
                                        <p>Tại SmartTech, chúng tôi tự hào về việc tạo ra một bộ sưu tập đa dạng các sản phẩm điện thoại di động mới nhất và được nhiều người săn đón từ các thương hiệu nổi tiếng. Dù bạn là một người đam mê công nghệ, một người dùng thông thường, hoặc một chuyên gia đang tìm kiếm các tính năng tiên tiến, bộ sưu tập của chúng tôi phục vụ mọi nhu cầu và sở thích.
                                            <br><br>Khám phá đối tác di động hoàn hảo cho nhu cầu của bạn tại SmartTech. Đắm chìm vào thế giới xuất sắc về công nghệ, duy trì mạng lưới kết nối và nâng cao trải nghiệm di động của bạn cùng chúng tôi. Khám phá trang web của chúng tôi ngay hôm nay và bắt đầu cuộc hành trình của sự đổi mới và kết nối!
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="left-image">
                                        <img src="assets/images/about-1-570x350.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="fun-facts" style="background-color: #0CC0DF">
            <div class="container" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="left-content">
                            <span>Tại sao chọn chúng tôi?</span>
                            <h2>Chọn Chúng Tôi cho Nhu Cầu Di Động của Bạn:</h2>
                            <p>Trong những năm qua, chúng tôi đã đạt được những thành công tuyệt vời trong việc hài lòng khách hàng, ngoài ra chúng tôi còn thành công trong việc trở thành cửa hàng điện thoại di động uy tín nhất thế giới.
                                <br><br>Vui lòng ủng hộ chúng tôi, cũng như đóng góp cho chúng tôi nếu bạn có bất kỳ câu hỏi nào để chúng tôi có thể cải thiện chất lượng tốt hơn. Cảm ơn bạn.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6 align-self-center">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${requestScope.countOd}</div>
                                    <div class="count-title">Đặt hàng</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${requestScope.countPr}</div>
                                    <div class="count-title">Sản phẩm</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${requestScope.countCu}</div>
                                    <div class="count-title">Khách hàng</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${requestScope.countSt}</div>
                                    <div class="count-title">Khách hàng thân thiết</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="contact-information">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="contact-item">
                            <i class="fa fa-phone"></i>
                            <h4>Số điện thoại</h4>
                            <a href="tel:0866911235" target="_blank">0866911235</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-item">
                            <i class="fa fa-envelope"></i>
                            <h4>Email</h4>
                            <a href="https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=new" target="_blank">Smarttech@gmail.com</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-item">
                            <i class="fa fa-phone-square"></i>
                            <h4>Zalo</h4>
                            <a href="https://zalo.me/0866911235" target="_blank"> Liên hệ Zalo</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="fun-facts" style="background-color: #0CC0DF">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="left-content">
                            <span>Tại sao chọn chúng tôi </span>
                            <h2>Đối tác của chúng tôi:</h2>
                        </div>
                    </div>
                </div>
                <div class="banner">
                    <c:forEach items="${requestScope.brandDAO}" var="b" varStatus="counter">
                        <div class="slide">
                            <img src="brand_image/${b.getImage()}?timestamp=<%= System.currentTimeMillis() %>" alt="alt"/>
                            <div class="description">${b.getDescription()}</div>
                        </div>
                    </c:forEach>
                </div>


                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="slick/slick.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $('.banner').slick({
                            autoplay: true,
                            autoplaySpeed: 2000,
                            arrows: false,
                            dots: true
                        });
                    });
                </script>

            </div>
        </div>                          
        <br>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59591.71420403209!2d105.48538782201499!3d21.013386020881505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134512c753eddb7%3A0x2b504d94479a0fda!2zUGjDsm5nIHR1eeG7g24gc2luaCAtIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1sen!2s!4v1704643495618!5m2!1sen!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

        <br>

        <!-- Footer Starts Here -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 footer-item" style="text-align: center">
                        <h4>SMART TECH</h4>
                        <p>Sản phẩm chất lượng<br> Giá cả phải chăng <br> Nhiều ưu đãi hấp dẫn</p>
                        
                    </div>

                    <div class="col-md-6 footer-item" style="text-align: center">
                        <h4>Trang bổ sung</h4>
                        <ul class="menu-list">
                            <li><a href="Product">Sản phẩm</a></li>
                            <li><a href="About">Về chúng tôi</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </footer>      
        <div class="sub-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>
                            © 2024 SMART TECH
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/accordions.js"></script>

        <script language="text/Javascript">
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
            function clearField(t) {                   //declaring the array outside of the
                if (!cleared[t.id]) {                      // function makes it static and global
                    cleared[t.id] = 1;  // you could use true and false, but that's more typing
                    t.value = '';         // with more chance of typos
                    t.style.color = '#fff';
                }
            }
        </script>

    </body>

</html>
