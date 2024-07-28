
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <%@include file="component/user/head.jsp" %>
    </head>
    <body >
       
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
                    <div class="col-md-4">
                        <ul class="right-icons">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">

                    <a class="navbar-brand" href="index.html"><img src="assets/images/logo.png" width="200" height="35"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.html">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="products.html">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="blog.html">Tin tức</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>

                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="about.html">Về chúng tôi</a>
                                    <a class="dropdown-item" href="blog.html">Liên hệ với chúng tôi</a>
                                    <a class="dropdown-item" href="terms.html">Điều kiện</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.html">Bảo hành</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.html"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Login.jsp">Đăng nhập</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="page-wrapper">
            <main class="main">
                <section class="vh-100 gradient-custom">
                    <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                <div class="card bg-dark text-white" style="border-radius: 1rem;">
                                    <form action="loginServlet" method="post">
                                        <div class="card-body p-5 text-center">

                                            <div class="mb-md-5 mt-md-4 pb-5">

                                                <h2 class="fw-bold mb-2 text-uppercase text-white">Đăng nhập</h2>
                                                <p class="text-white-50 mb-5">Vui lòng điền tài khoản và mật khẩu của bạn!</p>

                                                <div class="form-white mb-4">
                                                    <label class="form-label" style="color: white" for="typeEmailX">Tài khoản</label>
                                                    <input  placeholder="username" name="name" type="" class="form-control form-control-lg" />

                                                </div>

                                                <div class="form-white mb-4">
                                                    <label class="form-label" style="color: white" for="typePasswordX">Mật khẩu</label>
                                                    <div style="display: flex" class="form-white mb-4">
                                                        <input placeholder="password"   name="password" type="password" class="form-control" class="form-control form-control-lg" required="" />
                                                    </div>
                                                </div>

                                                <span style="color:red">${err==null?"":err}</span>  

                                                <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="inputEmail.jsp">Quên mật khẩu ?</a></p>

                                                <button class="btn btn-outline-light btn-lg px-5" type="submit">Đăng nhập</button>

                                                <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                                    <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                                    <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                                    <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                                </div>

                                            </div>

                                            <div>
                                                <p class="mb-0">Bạn chưa có tài khoản? <a href="RegisterPage.jsp" class="text-white-50 fw-bold">Đăng nhập</a>
                                                </p>
                                            </div>

                                        </div>  
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="row">
                    &nbsp;
                </div>
            </main>
        </div>

    </body>

   
</html>
