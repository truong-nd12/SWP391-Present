<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/logo_2.png"/>
    <title>SMART TECH WEBSITE </title>
    <!-- Bootstrap core CSS -->
    <%@include file="component/user/head.jsp" %>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="css/login.css">

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
    <div class="sub-header" style="display: block; color: white;text-align: center">
        <div class="row " style="margin-left: 0; margin-right: 0">
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="#"><i class="fa fa-envelope"></i> Smart Tech Store </a>
            </div>
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="HomePage"><i class="fa fa-home"></i> Quay lại</a>
            </div>
        </div>
    </div>

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="page-wrapper">
        <main class="main" style="background-image: url('images/banner4.jpg'); background-size: cover">
            <section class="vh-100 gradient-custom">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card text-white" style="border-radius: 1rem; background-color: #177BB6">
                                <form id="loginFrm" action="LoginPage" method="post">
                                    <div class="card-body p-5 text-center">
                                        <div class="mb-md-5 mt-md-4 pb-5">
                                            <h2 class="fw-bold mb-2 text-uppercase text-white">Đăng Nhập</h2>
                                            <p class="text-white mb-5">Vui lòng nhập tên đăng nhập và mật khẩu của bạn!</p>
                                            <div class="form-white mb-4">
                                                <label class="form-label" style="color: white" for="typeEmailX">Tên Đăng Nhập</label>
                                                <input id-="loginName" placeholder="Nhập Tên Đăng Nhập" name="name" type="" style="width: 100%; height: 30px; font-size: 12px" />
                                            </div>
                                            <div class="form-white mb-4">
                                                <label class="form-label" style="color: white" for="typePasswordX">Mật Khẩu</label>
                                                <div style="display: flex" class="form-white mb-4">
                                                    <input placeholder="Nhập Mật Khẩu" style="width: 100%; height: 30px; font-size: 12px" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[\da-zA-Z!@#$%^&*]{6,}" title="Phải chứa ít nhất một số, một chữ cái viết hoa và viết thường, ký tự đặc biệt, và ít nhất 6 ký tự trở lên, không có khoảng trắng" name="password" type="password" required="" /><br>
                                                </div>
                                            </div>
                                           <span style="color:red; font-size: 10px">${err==null?"":err}</span>  
                                            <p><a class="text-white" href="EmailServlet">Quên mật khẩu?</a></p>
                                            <br>
                                            <button class="btn btn-outline-light btn-lg px-5" type="submit">Đăng Nhập</button>
                                        </div>
                                        <div>
                                            <p class="mb-0 text-white">Chưa có tài khoản? <a href="RegisterPage.jsp" class="text-white fw-bold">ĐĂNG KÝ</a>
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
