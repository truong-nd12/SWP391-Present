<%-- 
    Document   : Cart
    Created on : Jan 10, 2024, 7:50:27 PM
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
        <jsp:include page="component/subHeader.jsp"></jsp:include>
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
                                <li class="nav-item">
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
                                <li class="nav-item active">
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
                        <h1>Gửi bảo hành</h1>
                        <span>Bảo hành trọn đời</span>

                    </div>
                </div>
            </div>
        </div>
        <!-- content here-->
        <br>
        <div class="container">
            <c:if test="${requestScope.ERROR != null}">
                <p class="text-danger">${requestScope.ERROR}</p>
            </c:if>
            <form method="post" action="SendGuarantee" enctype="multipart/form-data" >
                <div class="form-group">
                    <label class="form-label" for="typeOfGuarantee" style="color: #177bb6">Thẻ dịch vụ </label>
                    <select required name="serviceTag" id="tag" class="form-control">
                        <option value="" selected disabled>Chọn thẻ dịch vụ</option>
                        <c:forEach items="${glist}" var="g">
                            <option value="${g}">${g}</option>
                        </c:forEach>
                    </select>
                </div>
                <input name="oID" hidden="" value="${orderID}" class="form-control" type="text" required/>
                <input name="pID" hidden="" value="${productID}" class="form-control" type="text" required/>
                <div class="form-group">
                    <label class="form-label" for="formControlLg" style="color: #177bb6">Ghi chú</label>
                    <input required name="note" type="text" id="formControlLg" class="form-control" />
                </div>

                <div class="form-group">
                    <label  class="form-label" style="color: #177bb6">Ảnh</label>
                    <input name="photo" accept=".png, .jpg" class="form-control" type="file" required/>
                </div>
                <div class="form-group mt-3">
                    <button type="submit" class="btn btn-primary">Tải lên</button>
                </div>
            </form>
        </div>
        <br>
        <br>
        <br>
        <br>
        <!--footer start here-->
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