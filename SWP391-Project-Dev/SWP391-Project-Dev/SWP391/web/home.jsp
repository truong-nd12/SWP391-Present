<%-- 
    Document   : home
    Created on : Jan 9, 2024, 7:49:53 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="helper" class="helper.helper"/>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/logo_2.png"/>
        <title> SMART TECH WEBSITE</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <!--<link rel="stylesheet" href="assets/css/owl.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
    </head>
    
    <body>

        <!-- ***** Preloader Start ***** -->
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
                            <li><a href="tel:0866911235"><i class="fa fa-phone"></i>0866911235</a></li>
                        </ul>
                    </div>
                   
                </div>
            </div>
        </div>

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">

                    <a class="navbar-brand" href="HomePage"><img src="assets/images/logo3.jpg" width="200" height="35"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="HomePage">Trang Chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Product">Sản Phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Blog">Tin Tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="About">Về Chúng Tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OrderPage">Đặt Hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Guarantee">Bảo Hành</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CartPage"><i class="fa fa-shopping-cart"></i> Giỏ Hàng (${sessionScope.cart.getItems().size()==null?"0":sessionScope.cart.getItems().size()})</a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.acc != null}">
                                    <li class="nav-item dropdown">
                                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                            <img class="rounded-circle me-lg-2" src="images/${sessionScope.acc.getAvatar()}" alt="" style="width: 20px; height: 20px;">
                                            ${sessionScope.acc.getCus_name()}</a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="Profile">Hồ Sơ</a>
                                            <a class="dropdown-item" href="LogOut">Đăng Xuất</a>
                                        </div>
                                    </li>

                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item">
                                        <a class="nav-link" href="LoginPage">Đăng Nhập</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Page Content -->
        <!-- Banner Starts Here -->
        <div class="main-banner header-text" id="top">
            <div class="Modern-Slider">
                <c:forEach items="${requestScope.newlist}" var="list">
                    <a href="NewDetail?id=${list.getNews_id()}">
                        <div class="item item-1" >
                            <div class="img-fill" style=" background-image: url(images/${img.getNewsImgURLById(list.getImg_id())});">
                                <div style=" position: absolute;top: 80%;bottom: 10%;right: 30%;left: 30%; transform: translate(-80%, -10%,-30%,-30%); text-align: center">
                                    <button class="btn" style="background-color: #177bb6; color: white">Xem Thêm!!!</button>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
        <!-- Banner Ends Here -->
        <div class="services">
            <div class="container">
                <div class="col-md-12">
                    <div class="section-heading" style="margin-bottom: 30px; margin-top: 30px">
                        <h2>Sản Phẩm <em>Nổi Bật</em></h2>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="owl-testimonials owl-carousel">
                        <c:forEach var="p" items="${requestScope.top5Products}">
                            <div class="service-item" style="text-align: center; ">
                                <div style="height: 180px">
                                    <img src="product_image/${p.getImg_list().get(0).getUrl()}" style="width: 100%; height: 100%; object-fit: cover;">
                                </div>
                                <div class="down-content" style="padding: 10px">
                                    <h4 style="margin: 0">${p.product_name}</h4>
                                    <div style="margin-bottom:10px;">
                                        <span>  <small style="color: #929292"><del>${helper.convertToVietnameseDong(p.price)} </del></small>&nbsp; <br><big style="color: #ee4d2d">${helper.convertToVietnameseDong(p.price-((p.price*p.sale)/100))}</big></span>
                                    </div>
                                    <div>
                                        <a href="ProductDetail?id=${p.product_id}" style="background-color: #177bb6; color: white; padding: 5px" >Chi Tiết</a>
                                        <a href="CartPage?id=${p.product_id}" style="background-color: #177bb6; color: white; padding: 5px" >Thêm <i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
        <div class="fun-facts">
            <div class="container">
                <div class="more-info-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="left-image">
                                <img src="assets/images/about.png" class="img-fluid" alt="">
                            </div>
                        </div>
                        <div class="col-md-6 align-self-center">
                            <div class="right-content">
                                <span>Chúng Tôi Là Ai</span>
                                <h2>Tìm Hiểu Về <em>Shop Của Chúng Tôi</em></h2>
                                <p>Chúng tôi là thương hiệu uy tín chuyên cung cấp sản phẩm chính hãng và giá rẻ đến người tiêu dùng</p>
                                <a href="About" class="filled-button">Đọc Thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="more-info">
            <div class="container">
                <div class="section-heading">
                    <h2>Đọc <em>Tin Tức</em></h2>
                    <span>Điều Tuyệt Vời Và Tất Cả Ở Đây</span>
                </div>

                <div class="row" id="tabs">
                    <div class="col-md-4">
                        <ul>
                            <c:forEach items="${requestScope.newlist2}" var="list">
                                <li><a href='#${list.getNews_id()}'>${list.getTitle()} <br> <small>${admin.getAccNameById(list.getCreatedBy())} &nbsp;|&nbsp;<fmt:formatDate pattern = "dd-MM-yyyy" value = "${list.getCreatedDate()}" /> </small></a></li>
                                    </c:forEach>
                        </ul>
                        <br>
                        <div class="text-center">
                            <a href="Blog" class="filled-button">Đọc Thêm</a>
                        </div>
                        <br>
                    </div>
                    <div class="col-md-8" style="overflow-x: auto">
                        <section class='tabs-content' >
                            <c:forEach items="${requestScope.newlist2}" var="list">
                                <article id='${list.getNews_id()}'>
                                    <img src="images/${img.getNewsImgURLById(list.getImg_id())}"  style="width: 100%">
                                    <h4><a href="blog-details.html">${list.getTitle()}</a></h4>
                                    <p>${list.getContent()}</p>
                                </article>
                            </c:forEach>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <div class="testimonials">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Họ Nói Gì <em>Về Chúng Tôi</em></h2>
                            <span>cảm nhận từ những khách hàng thân thiết</span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="owl-testimonials owl-carousel">

                            <c:forEach items ="${requestScope.feedList}" var ="i">

                                <div class="testimonial-item">
                                    <div class="inner-content">
                                        <h4>${feedbackDAO.getNameById(i.orderId)}</h4>
                                        <span>${guarantee.getProductNameByID(i.productId)}</span>
                                        <p>${i.content}</p>
                                        <c:choose>
                                            <c:when test="${i.stars == 5}">
                                                <div style="color: gold; font-size: 24px;">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="color: gold; font-size: 24px;">&#9733;&#9733;&#9733;&#9733;</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="component/footer.jsp"></jsp:include>
        <button type="button" style="position: fixed; z-index: 99; bottom: 30px; left: 30px;background-color: #177BB6; color: white; border:2px white solid; border-radius: 5px; width: 30px;height: 30px" id="but"><i class="fa fa-angle-double-up"></i></button>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                var silder = $(".owl-carousel");
                silder.owlCarousel({
                    autoplay: true,
                    autoplayTimeout: 3000,
                    autoplayHoverPause: false,
                    items: 1,
                    stagePadding: 20,
                    center: true,
                    nav: false,
                    margin: 50,
                    dots: true,
                    loop: true,
                    responsive: {
                        0: {items: 1},
                        480: {items: 2},
                        575: {items: 2},
                        768: {items: 2},
                        991: {items: 3},
                        1200: {items: 4}
                    }
                });
            });
        </script>
        <script>
            document.getElementById("but").addEventListener("click", () => {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            });
            document.body.appendChild(btn);
        </script>
        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/accordions.js"></script>
        <script language = "text/Javascript">
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
            function clearField(t) {                   //declaring the array outside of the
                if (!cleared[t.id]) {                      // function makes it static and global
                    cleared[t.id] = 1;  // you could use true and false, but that's more typing
                    t.value = '';         // with more chance of typos
                    t.style.color = '#fff';
                }
            }
        </script>
        <script>
            function dieuHuong() {
                // Sử dụng phương thức assign() của đối tượng location để chuyển đến trang khác
                location.assign("http://localhost:9999/SmartTech/Product");
            }
        </script>
    </body>
</html>
