
<%-- 
    Document   : blog
    Created on : Jan 10, 2024, 7:42:32 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/logo_2.png"/>
        <title> SMART TECH WEBSITE    </title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
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
                                <a class="nav-link" href="Product">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Blog">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="About">Về chúng tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OrderPage">Đơn hàng </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Guarantee">Bảo hành</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CartPage"><i class="fa fa-shopping-cart"></i> Giỏ hàng (${sessionScope.cart.getItems().size()==null?"0":sessionScope.cart.getItems().size()})</a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.acc != null}">
                                    <li class="nav-item dropdown active">
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
                        <h1>Hồ Sơ Của Bạn</h1>
                        <span>Thay đổi và cập nhật mọi thứ</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="single-services">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <div class="row align-items-center justify-content-center">
                                    <img src="images/${sessionScope.acc.getAvatar()}" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px; height:150px ">
                                </div>
                                <form  enctype="multipart/form-data" action="UploadImages" method="POST" >
                                    <div class="mb-3">
                                        <input type="file" accept="image/*" class="form-change" name="photo" required="">
                                        <p style="color: red">${err}</p>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Đổi ảnh đại diện</button>
                                </form>

                                <h5 class="my-3">Tên người dùng của bạn: ${sessionScope.acc.getCus_name()}</h5>
                                <p class="text-muted mb-4">Địa chỉ của bạn: ${sessionScope.acc.getAddress()}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="card mb-4">
                            <div class="card-body">

                                <form  action="Profile" method="post">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Tên người dùng</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input name="name" style="width: 100%" type="text" value="${sessionScope.acc.getCus_name()}" required="">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input name="email" style="width: 100%" type="email" value="${sessionScope.acc.getEmail()}"   pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Format: abc@gmail.com" required />
                                        </div>
                                    </div> 
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Điện thoại</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input name="phone" style="width: 100%" type="tel" value="${sessionScope.acc.getPhone()}" pattern="[0-9]{10}" minlength="10" maxlength="10" title="Ten number"  />
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Địa chỉ</p>
                                        </div>

                                        <div class="col-sm-9">
                                            <input type="text" style="width: 100%" name="address" value="${sessionScope.acc.getAddress()}">
                                        </div>
                                    </div>
                                    <hr>
                                    <div style="text-align: center">                             
                                        <button type="submit" class="btn btn-primary">Thay đổi</button>
                                    </div>
                                </form>
                                <hr>
                                <form action="Profile" method="post">
                                    <div class="row" >
                                        <div class="col-sm-3">
                                            <p class="mb-0">Mật khẩu</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input style="width: 100%" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[\da-zA-Z!@#$%^&*]{6,}" title="Must contain at least one number and one uppercase and lowercase letter and special characters, and at least 6 or more characters and no contain space" name="password" type="password" required="" /><br>
                                        </div>
                                    </div>
                                    <div style="text-align: center; padding-top: 10px">                             
                                        <button type="submit" class="btn btn-primary">Thay đổi</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Starts Here -->
        <jsp:include page="component/footer.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
    </body>
</html>

