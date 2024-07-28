<%-- 
    Document   : Cart
    Created on : Jan 10, 2024, 7:50:27 PM
    Author     : Dell
--%>
<jsp:useBean id="convert" class="helper.Convert"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <style>
            a{
                color: #177BB6;
            }
            .link{
                display: block;
                padding: .3rem 1rem;
                border-radius: 5px;
            }
            .link.active{
                color: white;
                background-color: #177BB6;
            }
        </style>
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
                            <li class="nav-item">
                                <a class="nav-link" href="Product">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Blog">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="About">Về chúng tôi</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="OrderPage">Đơn hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Guarantee">Bảo hành</a>
                            </li>
                            <li class="nav-item  ">
                                <a class="nav-link" href="CartPage"><i class="fa fa-shopping-cart"></i> Cart (${sessionScope.cart.getItems().size()==null?"0":sessionScope.cart.getItems().size()})</a>
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
                        <h1>SMART TECH Website </h1>
                        <span>Đơn hàng của bạn</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-services" style="margin: 40px 10px">
            <div class="container_1">
                <div class="manger">
                    <c:set value="0" var="tc" ></c:set>
                    <c:set value="0" var="ts" ></c:set>
                    <c:set value="0" var="tr" ></c:set>
                    <c:set value="0" var="co" ></c:set>
                    <c:set value="0" var="ca" ></c:set>
                    <c:set value="0" var="re" ></c:set>
                        <ul class="nav nav-pills justify-content-center" role="tablist">
                        <c:forEach items="${order}" var="od">
                            <c:if test="${od.status==0}">
                                <c:set value="${tc+1}" var="tc" ></c:set>
                            </c:if>
                            <c:if test="${od.getStatus()==1}">
                                <c:set value="${ts+1}" var="ts" ></c:set>
                            </c:if>
                            <c:if test="${od.status==2}">
                                <c:set value="${tr+1}" var="tr" ></c:set>
                            </c:if>
                            <c:if test="${od.status==3}">
                                <c:set value="${co+1}" var="co" ></c:set>
                            </c:if>
                            <c:if test="${od.status==4}">
                                <c:set value="${ca+1}" var="ca" ></c:set>
                            </c:if>
                            <c:if test="${od.status==5}">
                                <c:set value="${re+1}" var="re" ></c:set>
                            </c:if>
                        </c:forEach>
                        <li class="nav-item">
                            <a class="link active"data-toggle="tab" href="#all" role="tab" aria-controls="product-desc-tab" aria-selected="true">Tất cả (${order.size()})</a>
                        </li>
                        <li class="nav-item">
                            <a class="link" data-toggle="tab" href="#toconfirm" role="tab" aria-controls="product-review-tab" aria-selected="false">Xác nhận (${tc})</a>
                        </li>
                        <li class="nav-item">
                            <a class="link" data-toggle="tab" href="#toship" role="tab" aria-controls="product-review-tab" aria-selected="false">Đang vận chuyển (${ts})</a>
                        </li>
                        <li class="nav-item">
                            <a class="link"  data-toggle="tab" href="#toreceive" role="tab" aria-controls="product-review-tab" aria-selected="false">Đã nhận hàng (${tr})</a>
                        </li>
                        <li class="nav-item">
                            <a class="link"data-toggle="tab" href="#completed" role="tab" aria-controls="product-review-tab" aria-selected="false">Hoàn thành (${co})</a>
                        </li>
                        <li class="nav-item">
                            <a class="link"  data-toggle="tab" href="#cancelled" role="tab" aria-controls="product-review-tab" aria-selected="false">Hủy (${ca})</a>
                        </li>
                        <li class="nav-item">
                            <a class="link" data-toggle="tab" href="#return" role="tab" aria-controls="product-review-tab" aria-selected="false">Hoàn trả (${re})</a>
                        </li>
                    </ul>
                    <br>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="product-review-link" style="overflow-x: auto">
                            <table class="table table-striped table-bordered px-4" >
                                <thead>
                                    <tr style="background-color: #177BB6; color: white">
                                        <th class="text-center" style="width: 10%">Mã đơn hàng</th>
                                        <th class="text-center" style="width: 20%">Ngày đặt hàng</th>
                                        <th class="text-center" style="width: 30%">Tổng tiền</th>
                                        <th class="text-center" style="width: 20%">Tình trạng thanh toán</th>
                                        <th class="text-center" style="width: 20%">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="od">
                                        <tr>
                                            <td class="text-center">${od.order_id}</td>
                                            <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                            <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                            <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán":od.getPayment_status()==2?"Awaiting...(VNPay)":"Đã thanh toán "}</td>
                                            <td class="text-center">
                                                <button class="btn btn-primary"><a href="OrderDetail?id=${od.order_id}" style="color: white;"> xem chi tiết </a></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade show" id="toconfirm" role="tabpanel" aria-labelledby="product-review-link" style="overflow-x: auto">
                            <table class="table table-striped table-bordered px-4" >
                                <thead>
                                    <tr style="background-color: #177BB6; color: white">
                                        <th class="text-center" style="width: 10%">Mã đơn hàng</th>
                                        <th class="text-center" style="width: 20%">Ngày đặt hàng</th>
                                        <th class="text-center" style="width: 30%">Tổng tiền</th>
                                        <th class="text-center" style="width: 20%">Tình trạng thanh toán</th>
                                        <th class="text-center" style="width: 20%">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="od">
                                        <c:if test="${od.status==0}">
                                            <tr>
                                                <td class="text-center">${od.order_id}</td>
                                                <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                                <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                                <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán ":od.getPayment_status()==2?"Awaiting...(VNPay)":"Đã thanh toán"}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-primary"><a href="OrderDetail?id=${od.order_id}" style="color: white;"> xem chi tiết </a></button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade show" id="toship" role="tabpanel" aria-labelledby="product-review-link" style="overflow-x: auto">
                            <table class="table table-striped table-bordered px-4" >
                                <thead>
                                    <tr style="background-color: #177BB6; color: white">
                                        <th class="text-center" style="width: 10%">Mã đơn hàng</th>
                                        <th class="text-center" style="width: 20%">Ngày đặt hàng</th>
                                        <th class="text-center" style="width: 30%">Tổng tiền</th>
                                        <th class="text-center" style="width: 20%">Tình trạng thanh toán</th>
                                        <th class="text-center" style="width: 20%">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="od">
                                        <c:if test="${od.status==1}">
                                            <tr>
                                                <td class="text-center">${od.order_id}</td>
                                                <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                                <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                                <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán":od.getPayment_status()==2?"Awaiting...(VNPay)":"Đã thanh toán"}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-primary"><a href="OrderDetail?id=${od.order_id}" style="color: white;"> xem chi tiết </a></button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade show" id="toreceive" role="tabpanel" aria-labelledby="product-review-link" style="overflow-x: auto">
                            <table class="table table-striped table-bordered px-4" >
                                <thead>
                                    <tr style="background-color: #177BB6; color: white">
                                        <th class="text-center" style="width: 10%">Mã đơn hàng</th>
                                        <th class="text-center" style="width: 20%">Ngày đặt hàng</th>
                                        <th class="text-center" style="width: 30%">Tổng tiền</th>
                                        <th class="text-center" style="width: 20%">Tình trạng thanh toán</th>
                                        <th class="text-center" style="width: 20%">Trạng thái</th>                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="od">
                                        <c:if test="${od.status==2}">
                                            <tr>
                                                <td class="text-center">${od.order_id}</td>
                                                <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                                <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                                <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán":od.getPayment_status()==2?"Awaiting...(VNPay)":"Đã thanh toán"}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-primary"><a href="OrderDetail?id=${od.order_id}" style="color: white;"> xem chi tiết </a></button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade show" id="completed" role="tabpanel" aria-labelledby="product-review-link" style="overflow-x: auto">
                            <table class="table table-striped table-bordered px-4" >
                                <thead>
                                    <tr style="background-color: #177BB6; color: white">
                                        <th class="text-center" style="width: 10%">Mã đơn hàng</th>
                                        <th class="text-center" style="width: 20%">Ngày đặt hàng</th>
                                        <th class="text-center" style="width: 30%">Tổng tiền</th>
                                        <th class="text-center" style="width: 20%">Tình trạng thanh toán</th>
                                        <th class="text-center" style="width: 20%">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="od">
                                        <c:if test="${od.status==3}">
                                            <tr>
                                                <td class="text-center">${od.order_id}</td>
                                                <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                                <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                                <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán":od.getPayment_status()==2?"Awaiting...(VNPay)":"Đã thanh toán"}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-primary"><a href="OrderDetail?id=${od.order_id}" style="color: white;"> xem chi tiết </a></button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade show" id="cancelled" role="tabpanel" aria-labelledby="product-review-link" style="overflow-x: auto">
                            <table class="table table-striped table-bordered px-4" >
                                <thead>
                                    <tr style="background-color: #177BB6; color: white">
                                        <th class="text-center" style="width: 10%">Mã đơn hàng</th>
                                        <th class="text-center" style="width: 20%">Ngày đặt hàng</th>
                                        <th class="text-center" style="width: 30%">Tổng tiền</th>
                                        <th class="text-center" style="width: 20%">Tình trạng thanh toán</th>
                                        <th class="text-center" style="width: 20%">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="od">
                                        <c:if test="${od.status==4}">
                                            <tr>
                                                <td class="text-center">${od.order_id}</td>
                                                <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                                <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                                <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán":od.getPayment_status()==2?"Awaiting...(VNPay)":"Đã thanh toán"}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-primary"><a href="OrderDetail?id=${od.order_id}" style="color: white;"> xem chi tiết </a></button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade show" id="return" role="tabpanel" aria-labelledby="product-review-link" style="overflow-x: auto">
                            <table class="table table-striped table-bordered px-4" >
                                <thead>
                                    <tr style="background-color: #177BB6; color: white">
                                        <th class="text-center" style="width: 10%">Mã đơn hàng</th>
                                        <th class="text-center" style="width: 20%">Ngày đặt hàng</th>
                                        <th class="text-center" style="width: 30%">Tổng tiền</th>
                                        <th class="text-center" style="width: 20%">Tình trạng thanh toán</th>
                                        <th class="text-center" style="width: 20%">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="od">
                                        <c:if test="${od.status==5}">
                                            <tr>
                                                <td class="text-center">${od.order_id}</td>
                                                <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                                <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                                <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán":od.getPayment_status()==2?"Awaiting...(VNPay)":"Đã thanh toán"}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-primary"><a href="OrderDetail?id=${od.order_id}" style="color: white;"> xem chi tiết </a></button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
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