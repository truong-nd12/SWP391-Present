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
    <title>SMART TECH WEBSITE</title>
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

    <!-- Header -->
    <div class="sub-header" style="display: block; color: white;text-align: center">
        <div class="row" style="margin-left: 0; margin-right: 0">
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="#"><i class="fa fa-envelope"></i> SMART TECH</a>
            </div>
            <div class="col-6">
                <a style="color: white; font-size: 15px" href="HomePage"><i class="fa fa-home"></i> Quay lại trang chủ</a>
            </div>
        </div>
    </div>

    <div class="page-wrapper">
        <main class="main">
            <div class="container py-5 h-100">
                <div style="text-align: center; padding-bottom: 20px">
                    <h1>Quên mật khẩu</h1>
                </div>
                <div class="row d-flex justify-content-center align-items-center">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-body" style="padding: 10px 50px 50px 50px; text-align: center">
                                <form method="post" action="EmailServlet">
                                    <label>Email</label>
                                    <input class="form-control" name="email" type="email" placeholder="examples@gmail.com" required>
                                    <div class="mb-3">
                                        <div id="emailHelp" class="form-text text-primary">Chúng tôi sẽ không bao giờ chia sẻ email của bạn với người khác.</div>
                                        <span style="color: red">${requestScope.err}</span>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Gửi</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
                <div class="row">
                    &nbsp;
                </div>
            </div>
        </main>
    </div>

</body>
</html>
