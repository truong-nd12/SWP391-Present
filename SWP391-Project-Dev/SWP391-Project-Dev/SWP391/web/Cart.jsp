<%-- 
    Document   : Cart
    Created on : Jan 10, 2024, 7:50:27 PM
    Author     : Dell
--%>
<jsp:useBean id="convert" class="helper.Convert"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="Model.*" %>
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
                            <li class="nav-item">
                                <a class="nav-link" href="OrderPage">Đặt hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Guarantee">Bảo hành</a>
                            </li>
                            <li class="nav-item  active">
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
                        <h1>SMART TECH Website</h1>
                        <span> GIỎ HÀNG  </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-services" style="margin: 40px">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8" style="overflow-x: auto">
                        <table class="table table-striped table-bordered px-4">
                            <thead>
                                <tr class="text-dark">
                                    <th class="text-center" style="width: 15%">Sản phẩm</th>
                                    <th class="text-center" style="width: 30%">Tên</th>
                                    <th class="text-center" style="width: 17%">Đơn giá</th>
                                    <th class="text-center" style="width: 20%">Số lượng</th>
                                    <th class="text-center" style="width: 18%">Tổng giá</th>
                                    <th class="text-center" style="width: 10%">Hành động</th>
                                </tr>
                              
                            </thead>
                            <tbody>
                                <c:if test="${empty sessionScope.cart.getItems()}">
                                    <tr>
                                        <td colspan="6" class="text-center">Giỏ của bạn đang trống.</td>
                                    </tr>
                                </c:if>
                                <c:forEach items="${sessionScope.cart.getItems()}" var="i" varStatus="loop">
                                    <tr>
                                        <td class="text-center">                                        
                                            <img style="max-width: 100%;" src="product_image/${i.getProduct().getImg_list().get(0).getUrl()}" />
                                        </td>
                                        <td class="text-center" hidden="" id="pro_${loop.index}">${i.getProduct().getProduct_id()}</td>
                                        <td class="text-center" >${i.getProduct().getProduct_name()}</td>
                                        <td class="text-center" hidden="" id="proquan_${loop.index}" >${pro.getProductById1(i.getProduct().getProduct_id()).quantity}</td>
                                <script>
                                    var myInt =${i.getPrice()};
                                    var myString = myInt.toString();
                                    document.write("<td class=text-center style=color:red id=price1_${loop.index}>" + myString + "</td>");
                                    document.write("<td class=text-center style=color:red id=price_${loop.index} hidden>" + myString + "</td>");
                                </script>
                                <td class="text-center">
                                    <div class="row" style="padding: 0px 20px; display: flex">
                                        <div class="col-4" style="padding: 0;">
                                            <button id="minusBtn_${loop.index}">-</button>
                                        </div>
                                        <div class="col-4" style="padding: 0">
                                            <input type="text" id="quantity_${loop.index}" value="${i.quality}" readonly style="width: 100%">
                                        </div>
                                        <div class="col-4" style="padding: 0; ">
                                            <button id="plusBtn_${loop.index}">+</button>
                                        </div>
                                    </div>
                                </td>
                                
                                <td class="text-center" style="color: red" id="total_${loop.index}">${convert.convertToVietnameseDong(i.price*i.getQuality())}</td>
                                <td>
                                    <button  style="border: none; background-color: red; border-radius: 5px; color: white; font-size: 10px; padding: 5px; width: 100%"><a style="color: white" href="CartPage?id=${i.getProduct().getProduct_id()}&remove=1">Xóa</a></button>
                                </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h5 style="color: red">${err}</h5>
                    </div>
                    <aside class="col-lg-4" style="text-align: center; ">
                        <div class="summary summary-cart">
                            <div style="background-color: #f9420e; color: white; padding: 20px 10px; border-radius: 5px;margin: 5px 0">
                                <h5 class="summary-title">TỔNG TIỀN : <span id="carttotal">${convert.convertToVietnameseDong(sessionScope.cart.getTotalMoney())}</span> </h5><!-- End .summary-title -->
                            </div>
                            <div style="padding: 10px; border: 1px #869791 solid; border-radius: 5px">
                                <c:forEach items="${sessionScope.cart.getItems()}" var="i" varStatus="loop">
                                    <div class="row" >
                                        <div class="col-6" style="text-align: start">
                                            <p>${i.getProduct().getProduct_name()}</p>
                                        </div>
                                        <div class="col-2" style="text-align: start">
                                            <p id="quantity1_${loop.index}">${i.getQuality()}</p>
                                        </div>
                                        <div class="col-4">
                                            <p id="total1_${loop.index}">${convert.convertToVietnameseDong(i.getPrice()*i.getQuality())}</p>
                                            <script>
                                                var myInt =${i.getPrice() * i.getQuality()};
                                                var myString = myInt.toString();
                                                document.write("<p id=total12_${loop.index} hidden>" + myString + "</p>");
                                            </script>
                                        </div>
                                    </div>
                                    <hr>
                                </c:forEach>
                            </div>
                            <button onclick="location.href = 'CheckOut'" disabled id="check" style="width: 100%;border: none;background-color: #177BB6; color: white; padding: 20px 10px; border-radius: 5px;margin-top: 5px; font-size: 18px ">Thanh toán</button>
                            <div style="background-color: #fba70f; color: white; padding: 15px 10px; border-radius: 5px;margin-top: 5px">
                                <h5 class="summary-title"><a href="Product" style="color: white; font-size: 15px">TIẾP TỤC MUA SẮM <i
                                            class="fa fa-refresh"></i></a></h5><!-- End .summary-title -->
                            </div>
                        </div><!-- End .summary -->
                    </aside>
                </div>
            </div>
        </div>

        <br>
        <br>
        <br>
        <br>

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
            <script>
                                function formatCurrency(number) {
                                    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
                                }
                                var prices1 = document.querySelectorAll('[id^="price1_"]');
                                prices1.forEach((item) => {
                                    item.innerText = formatCurrency(parseInt(item.innerText));
                                }
                                );

                                var minusButtons = document.querySelectorAll('[id^="minusBtn_"]');
                                minusButtons.forEach(function (button) {
                                    button.addEventListener('click', function (event) {
                                        var buttonID = event.target.id;
                                        var loopIndex = buttonID.split('_')[1];
                                        const minusBtn = document.getElementById(buttonID);
                                        const quantityInput = document.getElementById('quantity_' + loopIndex);
                                        const quantityInput1 = document.getElementById('quantity1_' + loopIndex);
                                        const priceElement = document.getElementById('price_' + loopIndex);
                                        const priceElement1 = document.getElementById('price1_' + loopIndex);
                                        const totalElement = document.getElementById('total_' + loopIndex);
                                        const totalElement1 = document.getElementById('total1_' + loopIndex);
                                        const totalElement2 = document.getElementById('total12_' + loopIndex);
                                        let quantity = parseInt(quantityInput.value);
                                        if (quantity > 1) {
                                            quantity--;
                                            quantityInput.value = quantity;
                                            quantityInput1.innerText = quantity;
                                            calculateTotal();
                                            function calculateTotal() {
                                                let price = parseInt(priceElement.innerText);
                                                let total = quantity * price;
                                                totalElement.innerText = formatCurrency(total);
                                                totalElement1.innerText = formatCurrency(total);
                                                totalElement2.innerText = total;
                                                priceElement1.innerText = formatCurrency(price);
                                            }
                                            var dataToSend = {
                                                key1: document.getElementById('pro_' + loopIndex).innerText,
                                                key2: "1"
                                            };
                                            var url = 'CartPage';
                                            $.ajax({
                                                url: url, // The URL to send the data to
                                                type: 'POST', // The HTTP method to use, e.g., 'POST', 'GET'
                                                contentType: 'application/json', // The type of data being sent
                                                data: JSON.stringify(dataToSend), // The data to send
                                                success: function () {
                                                    // This function is called if the request succeeds
                                                    console.log('Data sent successfully:', JSON.stringify(dataToSend));
                                                },
                                                error: function (xhr, status, error) {
                                                    // This function is called if the request fails
                                                    console.error('Error sending data:', error);
                                                }
                                            });
                                        }
                                        var total1 = document.querySelectorAll('[id^="total12_"]');
                                        let totalcart = 0;
                                        total1.forEach((item) => {
                                            console.log(totalcart);
                                            totalcart = totalcart + parseInt(item.innerText);
                                            console.log(totalcart);
                                        }
                                        );
                                        var carttotal = document.getElementById('carttotal');
                                        carttotal.innerText = formatCurrency(totalcart);
                                    });
                                });
                                var plusButtons = document.querySelectorAll('[id^="plusBtn_"]');
                                plusButtons.forEach(function (button) {
                                    button.addEventListener('click', function (event) {
                                        var buttonID = event.target.id;
                                        var loopIndex = buttonID.split('_')[1];
                                        const plusBtn = document.getElementById(buttonID);
                                        const quantityInput = document.getElementById('quantity_' + loopIndex);
                                        const quantityInput1 = document.getElementById('quantity1_' + loopIndex);
                                        const priceElement = document.getElementById('price_' + loopIndex);
                                        const priceElement1 = document.getElementById('price1_' + loopIndex);
                                        const totalElement = document.getElementById('total_' + loopIndex);
                                        const totalElement1 = document.getElementById('total1_' + loopIndex);
                                        const totalElement2 = document.getElementById('total12_' + loopIndex);
                                        const proq = document.getElementById('proquan_' + loopIndex);
                                        let quantity = parseInt(quantityInput.value);
                                        if (quantity < parseInt(proq.innerText)) {
                                            quantity++;
                                            quantityInput.value = quantity;
                                            quantityInput1.innerText = quantity;
                                            calculateTotal();
                                            function calculateTotal() {
                                                let price = parseInt(priceElement.innerText);
                                                let total = quantity * price;
                                                totalElement.innerText = formatCurrency(total);
                                                totalElement1.innerText = formatCurrency(total);
                                                totalElement2.innerText = total;
                                                priceElement1.innerText = formatCurrency(price)
                                            }
                                            var dataToSend = {
                                                key1: document.getElementById('pro_' + loopIndex).innerText,
                                                key2: "2"
                                            };
                                            var url = 'CartPage';
                                            $.ajax({
                                                url: url, // The URL to send the data to
                                                type: 'POST', // The HTTP method to use, e.g., 'POST', 'GET'
                                                contentType: 'application/json', // The type of data being sent
                                                data: JSON.stringify(dataToSend), // The data to send
                                                success: function () {
                                                    // This function is called if the request succeeds
                                                    console.log('Data sent successfully:', JSON.stringify(dataToSend));
                                                },
                                                error: function (xhr, status, error) {
                                                    // This function is called if the request fails
                                                    console.error('Error sending data:', error);
                                                }
                                            });
                                        }
                                        var total1 = document.querySelectorAll('[id^="total12_"]');
                                        let totalcart = 0;
                                        total1.forEach((item) => {
                                            totalcart = totalcart + parseInt(item.innerText);
                                        }
                                        );
                                        var carttotal = document.getElementById('carttotal');
                                        carttotal.innerText = formatCurrency(totalcart);
                                    });
                                });
            </script>
            <script language="text/Javascript">
                cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
                function clearField(t) {                   //declaring the array outside of the
                    if (!cleared[t.id]) {                      // function makes it static and global
                        cleared[t.id] = 1; // you could use true and false, but that's more typing
                        t.value = ''; // with more chance of typos
                        t.style.color = '#fff';
                    }
                }
            </script>
            <script>
                const submitButton = document.querySelector('#check');
                if (${sessionScope.cart.getItems().size()} > 0) {
                    submitButton.disabled = false;
                }
        </script>
    </body>

</html>