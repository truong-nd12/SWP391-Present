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
                                    <a class="nav-link" href="OrderPage">Đơn hàng</a>
                                </li>
                                <li class="nav-item  active">
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
                        <h1>Bảo Hành Của Bạn</h1>
                        <span>Bảo hành trọn đời </span>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="container">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>Thông tin khách hàng </h4>
                        <c:if test="${guarantee_record.creator_id > 0}">
                            <div class="form-group">
                                <label style="color: #177bb6">Người tạo</label>
                                <input class="form-control" type="text" value="${guaranteeDAO.getCreatorNameById(guarantee_record.creator_id)}" readonly=""/>
                            </div>
                        </c:if>
                        <c:if test="${guarantee_record.creator_id == 0}">
                            <div class="form-group">
                                <label style="color: #177bb6">Người tạo</label>
                                <input class="form-control" type="text" value="" readonly=""/>
                            </div>
                        </c:if>
                        </h6>
                        
                        <div class="form-group">
                            <label style="color: #177bb6">Tên</label>
                            <input class="form-control" type="text" name="customerName" value="${requestScope.customer.cus_name}" readonly>
                        </div>
                        <div class="form-group">
                            <label style="color: #177bb6">Số điện thoại</label>
                            <input class="form-control" type="tel" name="customerPhone" value="${requestScope.customer.phone}" readonly>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <h4>Thời hạn bảo hành</h4>
                        <input type="hidden" name="customerId" value="${requestScope.customer.customer_id}">
                        <div class="form-group">
                            <label style="color: #177bb6">Ngày bắt đầu</label>
                            <input class="form-control" required="" type="date" name="startDate" value="${requestScope.order.order_date}" readonly>
                        </div>
                        <div class="form-group">
                            <label style="color: #177bb6">Ghi chú</label>
                            <input class="form-control" type="text" name="note" value="${requestScope.guarantee_record.note}" readonly>
                        </div>
                        <div class="form-group">
                            <label style="color: #177bb6">Ngày kết thúc</label>
                            <input class="form-control" type="date" readonly="" name="dateReturn"  value="${requestScope.guarantee_record.return_date}"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-striped"> 
                        <thead>
                            <tr style="color: #177bb6">
                                <th>#</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th> Ảnh </th>
                                <th>Trạng thái</th>
                                <th>Thời hạn bảo hành </th>
                                <th>Lỗi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>${requestScope.product.product_id}</td>
                                <td>${requestScope.product.product_name}</td>
                                <td>
                                    <img width="50px" height="50px" src="guarantee_image/${requestScope.guarantee_record.image}" alt="alt"/>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${requestScope.guarantee_record.status == 1}">
                                            <p class="text-secondary font-weight-bold">Đợi</p>
                                        </c:when>
                                        <c:when test="${requestScope.guarantee_record.status == 2}">
                                            <p class="text-success">Xác nhận</p>
                                        </c:when>
                                        <c:when test="${requestScope.guarantee_record.status == 3}">
                                            <p class="text-success">Hoàn thành</p>
                                        </c:when>
                                        <c:when test="${requestScope.guarantee_record.status == 4}">
                                            <p class="text-danger">Hủy</p>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>${requestScope.remain} tháng</td>

                                <td>
                                    
                                    <c:if test="${requestScope.guarantee_record.status != 1}">
                                        ${requestScope.guarantee_record.type}
                                    </c:if>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="row" style="text-align: center">
                    <button style="background-color: #177bb6; border: none; border-radius: 5px"><a style="color: white" href="Guarantee">Quay lại</a></button>
                </div>
            </div>
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