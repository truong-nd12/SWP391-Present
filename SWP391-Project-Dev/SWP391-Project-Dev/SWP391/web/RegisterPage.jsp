<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

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
        <div class="row" style="margin-left: 0; margin-right: 0">
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="#"><i class="fa fa-envelope"></i> SMART TECH</a>
            </div>
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="HomePage"><i class="fa fa-home"></i> Quay lại </a>
            </div>
        </div>
    </div>

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="page-wrapper">
        <main class="main">
            <section class="h-100 bg-dark">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <form id="regisFrm" action="registerServlet" method="post">
                                <div class="card card-registration my-4">
                                    <div class="row g-0">
                                        <div class="col-xl-6 d-none d-xl-block">
                                            <img src="assets/images/register1.jpg"
                                                 alt="Sample photo" class="img-fluid"
                                                 />
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="card-body p-md-5 text-black">
                                                <h3 class="mb-5 text-uppercase">Đăng Ký Cửa Hàng SMART TECH</h3>
                                                <!-- Username input -->
                                                <div class=" mb-4">
                                                    <label class="form-label" for="registerUsername">Tên đăng nhập</label>
                                                    <input name="username" type="text" value="${param.username}" id="registerUsername" class="form-control" required pattern="[a-zA-Z0-9]+"/>
                                                </div>

                                                <!-- Email input -->
                                                <div class=" mb-4">
                                                    <label class="form-label">Email</label>
                                                    <input name="email" type="email" value="${param.email}" class="form-control" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Định dạng: abc@gmail.com" required />
                                                </div>

                                                <div class=" mb-4">
                                                    <label class="form-label">Số điện thoại</label>
                                                    <input name="phone" type="tel" value="${param.phone}" pattern="[0-9]{10}" minlength="10" maxlength="10" title="Mười số" class="form-control" required />
                                                </div>

                                                <!-- Password input -->
                                                <div class=" mb-4">
                                                    <label class="form-label" for="registerPassword">Mật khẩu</label>
                                                    <div style="display: flex" class="form-white mb-4">
                                                        <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[\da-zA-Z!@#$%^&*]{6,}" title="Phải chứa ít nhất một số, một chữ cái viết hoa và viết thường, ký tự đặc biệt, và ít nhất 6 ký tự trở lên, không có khoảng trắng" name="password" type="password" class="form-control" required="" /><br>
                                                    </div>
                                                </div>

                                                <!-- Repeat Password input -->
                                                <div class=" mb-4">
                                                    <label class="form-label" for="registerRepeatPassword">Nhập lại mật khẩu</label>
                                                    <div style="display: flex" class="form-white mb-4">
                                                        <input name="resetPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Phải chứa ít nhất một số, một chữ cái viết hoa và viết thường, và ít nhất 6 ký tự trở lên" type="password" class="form-control" required=""/>
                                                    </div>
                                                    <span id="regisErr" style="color:red">${rerr==null?"":rerr}</span>  
                                                </div>
                                                <button type="submit" class="btn btn-warning btn-lg ms-2">Đăng Ký</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                <br>
                                            <div class="form-group text-center">
                                                <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
                                                <label for="agreeTerms" style="color: white;"> Đồng ý với <a href="term.jsp" class="text-white fw-bold">Chính Sách và Điều Khoản</a> của chúng tôi.</label>
                                            </div>
                            </form>
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
