<%-- 
    Document   : ProductDetail
    Created on : Jan 10, 2024, 8:30:27 PM
    Author     : Dell
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
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <link rel="shortcut icon" href="assets/images/logo_2.png"/>
        <title>SMART TECH WEBSITE    </title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="asset/css/style.css">
        <link rel="stylesheet" href="asset/css/bootstrap.min.css">
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
                            <li><a href="#"><i class="fa fa-phone"></i>0866911235</a></li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.html"><img src="assets/images/logo3.jpg" width="200" height="35"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="HomePage">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="Product">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Blog">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="About">Về chúng tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OrderPage">Đơn hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Guarantee">Bảo hành</a>
                            </li>
                            <li class="nav-item">
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
                        <h1>Sản phẩm</h1>
                        <span>SMART TECH｜Trang web uy tín hàng đầu Việt Nam.</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="product-gallery product-gallery-vertical">
                            <div class="row">
                                <figure class="product-main-image">
                                    <img id="product-zoom" src="product_image/${product.getImg_list().get(0).getUrl()}" data-zoom-image="product_image/${product.getImg_list().get(0).getUrl()}" alt="product image">

                                </figure><!-- End .product-main-image -->

                                <div id="product-zoom-gallery" class="product-image-gallery">
                                    <c:forEach var="i" varStatus="counter" items="${product.getImg_list()}">
                                        <a class="product-gallery-item" href="#" data-image="product_image/${i.getUrl()}" data-zoom-image="product_image/${i.getUrl()}">
                                            <img src="product_image/${i.getUrl()}" alt="product side">
                                        </a>
                                    </c:forEach>
                                </div><!-- End .product-image-gallery -->
                                <br>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <h1 style="color: black; font-size: 30px; line-height: 1.2;">${product.product_name}</h1><!-- End .product-title -->
                        <br>
                        <div class="ratings-container">
                            <div class="ratings">
                                <div class="ratings-val" style="width:${product.getAverageStars() * 20}%;"></div><!-- End .ratings-val -->
                            </div><!-- End .ratings -->
                            <a class="ratings-text" href="#product-review-link" id="review-link">( ${requestScope.feedBacks.size()} Reviews )</a>
                        </div><!-- End .rating-container -->
                        <span style="font-size: 20px; line-height: 1.4;">
                            <big style="color: #ee4d2d">${helper.convertToVietnameseDong(product.price-((product.price*product.sale)/100))}</big>&nbsp; <small style="color: #929292"><del>${helper.convertToVietnameseDong(product.price)} </del></small>
                        </span>
                        <br>
                        <br>
                        <form action="CartPage" method="get">
                            <div style="font-size: 20px; line-height: 1.4;" class="details-filter-row details-row-size">
                                <span  for="qty">Số lượng: </span>
                                <input type="hidden" name="id" value="${product.product_id}">
                                <div class="product-details-quantity">
                                    <input type="number" id="qty" class="form-control" name="quantity" value="1" min="1" max=${product.quantity} step="1" data-decimals="0" required>
                                </div><!-- End .product-details-quantity -->
                            </div><!-- End .details-filter-row -->
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-lg">Thêm vào giỏ hàng</button>
                                </div>
                            </div>

                        </form>
                        <div class="product-details-footer">


                            <div style="font-size: 20px; line-height: 1.4;" class="social-icons social-icons-sm">
                                <span class="social-label">Chia sẻ:</span>
                                <a href="#" class="social-icon" title="Facebook" target="_blank"><i class="icon-facebook-f"></i></a>
                                <a href="#" class="social-icon" title="Twitter" target="_blank"><i class="icon-twitter"></i></a>
                                <a href="#" class="social-icon" title="Instagram" target="_blank"><i class="icon-instagram"></i></a>
                                <a href="#" class="social-icon" title="Pinterest" target="_blank"><i class="icon-pinterest"></i></a>
                            </div>
                        </div><!-- End .product-details-footer -->
                        <br>
                    </div>
                </div>

                <div class="product-details-tab">
                    <ul class="nav nav-pills justify-content-center" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="product-desc-link" data-toggle="tab" href="#product-desc-tab" role="tab" aria-controls="product-desc-tab" aria-selected="true">Mô tả</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="product-review-link" data-toggle="tab" href="#product-review-tab" role="tab" aria-controls="product-review-tab" aria-selected="false">Đánh giá (${requestScope.feedBacks.size()})</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="product-desc-tab" role="tabpanel" aria-labelledby="product-desc-link">
                            <div class="product-desc-content">
                                ${product.description}
                            </div><!-- End .product-desc-content -->
                        </div><!-- .End .tab-pane -->
                        <div class="tab-pane fade" id="product-review-tab" role="tabpanel" aria-labelledby="product-review-link">
                            <div class="reviews">
                                <h3>Đánh giá ${requestScope.feedBacks.size()}</h3>
                                <c:forEach var="feed" items="${requestScope.feedBacks}">
                                    <div class="review">
                                        <div class="row no-gutters">
                                            <div class="col-auto">
                                                <h4><img class="rounded-circle" src="images/${feedbackDAO.getAvatarById(feed.orderId)}" alt="alt" style="width: 80px; height: 80px;"/><a href="#">${feedbackDAO.getNameById(feed.orderId)}</a></h4>
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: ${feed.stars * 20}%;"></div><!-- End .ratings-val -->
                                                    </div><!-- End .ratings -->
                                                </div><!-- End .rating-container -->
                                                <span class="review-date">${feed.dateSend}</span>
                                            </div><!-- End .col -->
                                            <div class="col">
                                                <div class="review-content">
                                                    <p>${feed.content}</p>
                                                </div><!-- End .review-content -->
                                            </div><!-- End .col-auto -->
                                        </div><!-- End .row -->
                                    </div><!-- End .review -->
                                </c:forEach>
                            </div><!-- End .reviews -->
                        </div><!-- .End .tab-pane -->
                    </div><!-- End .tab-content -->
                </div><!-- End .product-details-tab -->

                <div>
                    <h5 class="title text-center mb-4" style="color: #177BB6">Có thể bạn cũng thích</h5>
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="row">
                                <c:forEach items="${requestScope.top5Products}" var="p">
                                    <div class="col-2">
                                        <div class="text-center">
                                            <a href="ProductDetail?id=${p.getProduct_id()}">
                                                <img style="max-width: 100%;" src="product_image/${p.getImg_list().get(0).url}" alt="Product image" class="product-image">
                                            </a>
                                            <h4 style="margin-bottom:10px; font-size: 18px; line-height: 1.4;"><a href="ProductDetail?id=${p.getProduct_id()}">${p.getProduct_name()}</a></h4>
                                            <div class="product-price">
                                                <small style="color: #929292"><del>${helper.convertToVietnameseDong(p.price)}</del></small>&nbsp; <big style="color: #ee4d2d">${helper.convertToVietnameseDong(p.price-((p.price*p.sale)/100))}</big>
                                            </div><!-- End .product-price -->
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Starts Here -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 footer-item" style="text-align: center">
                        <h4>Smart Tech</h4>
                        <p>Chất lượng sản phẩm<br> Giá cả phải chăng<br> Nhiều ưu đãi hấp dẫn</p>
                        
                    </div>

                    <div class="col-md-6 footer-item" style="text-align: center">
                        <h4>Trang bổ sung </h4>
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
        <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>

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
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.waypoints.min.js"></script>
        <script src="assets/js/superfish.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <script src="assets/js/jquery.elevateZoom.min.js"></script>
        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
