<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/logo_2.png"/>
    <title> SMART TECH WEBSITE</title>
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
    <div class="sub-header" style="display: block; color: white; text-align: center">
        <div class="row" style="margin-left: 0; margin-right: 0">
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="#"><i class="fa fa-envelope"></i> SMART TECH</a>
            </div>
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="HomePage"><i class="fa fa-home"></i> Quay lại </a>
            </div>
        </div>
    </div>

    <div class="page-wrapper">
        <main class="main">
            <div class="container py-5 h-100">
                <div style="text-align: center; padding-bottom: 20px">
                    <h1>Nhập mã OTP</h1>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <form action="OTPServlet" method="post">
                            <div class="container">
                                <div class="position-relative">
                                    <div style="padding: 10px 50px 10px 50px; text-align: center; border: 1px gray solid">
                                        <c:if test="${correct == null}">
                                            <h6>Vui lòng nhập mã OTP để xác minh tài khoản của bạn</h6>
                                            <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2">
                                                <input class="m-2 text-center form-control rounded" name="otp" type="text" required=""/>
                                            </div>
                                            <div class="row justify-content-center align-items-center">
                                                <div class="text-center">
                                                    <c:if test="${err != null}">
                                                        <p class="text-danger">${err}</p>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="mt-4">
                                                <button type="submit" class="btn btn-danger px-4 validate">Xác minh</button>
                                            </div>
                                        </c:if>
                                        <c:if test="${correct != null}">
                                            <h6>Vui lòng nhập mật khẩu mới của bạn</h6>
                                            <br>
                                            <div>
                                                <input placeholder="Nhập mật khẩu mới" style="width: 100%; height: 30px; font-size: 12px" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[\da-zA-Z!@#$%^&*]{6,}" title="Phải chứa ít nhất một chữ số và một chữ cái viết hoa và viết thường và ký tự đặc biệt, ít nhất 6 ký tự trở lên và không chứa khoảng trắng" name="pass" type="password" required="" />
                                            </div>
                                            <div class="row justify-content-center align-items-center">
                                                <div class="text-center">
                                                    <p style="color: green">${success}</p>
                                                </div>
                                            </div>
                                            <div class="mt-4">
                                                <button type="submit" class="btn btn-danger px-4 validate">Đổi mật khẩu</button>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-6" style="text-align:left; font-size: 15px; color: #177bb6">
                                                <span><a href="OTPServlet">Gửi lại</a></span>
                                            </div>
                                            <div class="col-6" style="text-align:right; font-size: 15px; color: #177bb6">
                                                <span><a href="LoginPage">Đăng nhập</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
