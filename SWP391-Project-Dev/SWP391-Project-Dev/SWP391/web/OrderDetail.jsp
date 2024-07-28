<%-- 
    Document   : OrderDetail
    Created on : Jan 28, 2024, 10:08:56 AM
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
                                <a class="nav-link" href="HomePage">Tràn chủ
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
                                        <a class="nav-link" href="LoginPage">Đăng nhậpp</a>
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
                        <h1>Thông tin đơn hàng của bạn</h1>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-services" style="margin: 40px">
            <div class="container_1">

                <div class="row" >
                    <div class="col-lg-8" style="overflow-x: auto">

                        <h5>Đơn hàng của bạn</h5>
                        <br>
                        <p>Ngày đặt hàng: <fmt:formatDate pattern = "dd-MM-yyyy" value = "${order.order_date}" /></p>
                        <br>
                        <table class="table table-striped table-bordered px-4">
                            <thead>
                                <tr style="background-color: #177BB6; color: white">
                                    <th class="text-center" style="width: 15%">Sản phẩm</th>
                                    <th class="text-center" style="width: 30%">Tên</th>
                                    <th class="text-center" style="width: 17%">Đơn giá </th>
                                    <th class="text-center" style="width: 10%">Số lượng</th>
                                    <th class="text-center" style="width: 18%">Tổng tiền</th>
                                    <th class="text-center" style="width: 10%">Hành động</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:set var="orderId" value="${order.order_id}" />
                                <c:forEach items="${orderdetail}" var="i" varStatus="counter">
                                    <c:set var="productId" value="${i.product_id}" />
                                    <c:set var="f" value="${feedback.getFeedbackById(productId,orderId)}" />
                                    <tr>
                                        <td class="text-center">
                                            <img style="max-width: 100%;" src="product_image/${pro.getNameById(i.product_id).getImg_list().get(0).getUrl()}" />
                                        </td>
                                        <td class="text-center">${pro.getNameById(i.product_id).product_name}</td>
                                        <td class="text-center" style="color: red">${convert.convertToVietnameseDong(i.price)}</td>
                                        <td class="text-center">${i.quantity}</td>
                                        <td class="text-center" style="color: red">${convert.convertToVietnameseDong(i.price*i.quantity)}</td>
                                        <td>
                                            <c:if test="${order.status == 3}">
                                                <a href="SendGuarantee?orderID=${i.orderId}&productID=${i.product_id}" style="width: 100%; margin-bottom: 2px" class="btn btn-primary">
                                                    Gửi bảo hành
                                                </a>
                                            </c:if>
                                            <c:if test="${not empty f}">
                                                <button type="button"  style="width: 100%; margin-top: 2px" class="btn btn-primary" >
                                                    <a style="color: white" href="OrderDetail?feedbackid=${f.getId()}&id=${orderId}">Xóa đánh giá</a>  
                                                </button>
                                            </c:if>
                                            <c:if test="${empty f}">
                                                <button type="button" style="width: 100%; margin-top: 2px" class="btn btn-primary" disabled id="send" data-toggle="modal" data-target="#review-${counter.count}">
                                                    Đánh giá
                                                </button>
                                            </c:if>
                                            <div class="modal " id="review-${counter.count}" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered mo" >
                                                    <form action="sendFeedBack" method="post">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Review</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body px-4" style="text-align: start">
                                                                <input type="hidden" name="Oid" value="${order.order_id}">
                                                                <input type="hidden" name="Pid" value="${pro.getNameById(i.product_id).product_id}">
                                                                <div class="row">
                                                                    <div class="col-4" >
                                                                        <label>Tên</label>
                                                                    </div>
                                                                    <div class="col-6" style="text-align: start">
                                                                        <input type="text" readonly="" name="cusName" value="${ship.getName()}">
                                                                    </div>
                                                                </div>
                                                                <br>
                                                                <div class="row">
                                                                    <div class="col-4">
                                                                        <label>Sản phẩm</label>
                                                                    </div>
                                                                    <div class="col-6" style="text-align: start">
                                                                        <input type="text"  readonly="" name="proName" value="${pro.getNameById(i.product_id).product_name}">
                                                                    </div>
                                                                </div>
                                                                <br>
                                                                <div class="row">
                                                                    <div class="col-4">
                                                                        <label class="form-label">Đánh giá</label>
                                                                    </div>
                                                                    <div class="col-6" style="text-align: start">
                                                                        <select id="stars" class="form-select" name="stars">
                                                                            <option value="5">5</option>
                                                                            <option value="4">4</option>
                                                                            <option value="3">3</option>
                                                                            <option value="2">2</option>
                                                                            <option value="1">1</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <br>
                                                                <div class="row">
                                                                    <div class="col-4">
                                                                        <label for="form7" class="text-black">Mô tả</label>
                                                                    </div>
                                                                    <textarea required name="description" id="form7" class="form-control" rows="3"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                                                <button type="submit" class="btn btn-success">Gửi</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>                        
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-6" style="text-align: center">
                                <h5 >Tổng đơn: </h5><!-- End .summary-title -->
                            </div>
                            <div class="col-6" style="text-align: center;padding-left: 0">
                                <h5 style="color: red">${convert.convertToVietnameseDong(order.totalPrice)}</h5><!-- End .summary-title -->
                            </div>
                        </div>

                        <hr>
                        <div class="row">
                            <div class="col-12" style="text-align: center;padding-left: 0">
                                <c:if test="${requestScope.ERROR != null}">
                                    <h3 class="text-danger" style="color: green">${requestScope.ERROR}</h3>
                                </c:if>
                                <c:if test="${param.ERRO != null}">
                                    <h5  style="color: green">PHẢN HỒI THÀNH CÔNG</h5>
                                </c:if>
                            </div>
                        </div>
                        <c:if test="${order.status==0}">
                            <div style="text-align: center" >
                                <form action="OrderPage" method="post">
                                    <input type="hidden" name="id" value="${order.order_id}">
                                    <input type="submit" name="order" value="Hủy" class="btn btn-danger">            
                                </form>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-lg-4" style=" border-radius: 10px; margin-bottom: 15px">
                        <form action="OrderDetail" method="post">
                            <div  style="margin-bottom: 10px">
                                <h5>Tiếp nhận thông tin</h5>
                                <br>
                                <input type="hidden" name="id" value="${order.order_id}">
                                <input style="width: 100%; padding: 10px" type="text" name="name" value="${ship.getName()}" placeholder="Tên của bạn" id="check" disabled required>
                                <hr>
                                <input style="width: 100%; padding: 10px" type="tel"  name="phone" value="${ship.getPhone()}" pattern="^(09|05|08|03)[0-9]{8}" title="Please enter valid phone number" placeholder="Số điện thoại của bạn" id="check" disabled required >
                                <hr>
                                <select style="width: 100%; padding: 10px" id="city" name="city" disabled required>
                                    <option value="${address[3]}" selected>${address[3]}</option>           
                                </select>
                                <hr>
                                <select style="width: 100%; padding: 10px" id="district" name="district" disabled required >
                                    <option value="${address[2]}" selected>${address[2]}</option>
                                </select>
                                <hr>
                                <select style="width: 100%; padding: 10px" id="ward" name="ward" disabled required>
                                    <option value="${address[1]}" selected>${address[1]}</option>
                                </select>
                                <hr>
                                <input style="width: 100%; padding: 10px" type="text" name="address" value="${address[0]}" placeholder="Địa chỉ của bạn" id="check" disabled required>
                                <hr>
                                <textarea  style="width: 100%;  padding: 10px" name="note" rows="3" id="check" disabled placeholder="Ghi chú (tùy chọn)">${ship.getNote()}</textarea>
                            </div>
                            <div class="row">
                                <div class="col-5" style="padding: 7px;">
                                    <a href="OrderPage" style="font-size: 15px;margin-left: 10px" ><i class="fa fa-angle-double-left"></i> Quay lại </a><!-- End .summary-title -->
                                </div>
                                <c:if test="${order.status==0}">
                                    <div class="col-7">
                                        <input type="submit" name="order" value="Thay đổi" style="font-size: 15px;background-color: #177bb6; color: white; border: none; padding: 7px; border-radius: 7px">            
                                    </div>
                                </c:if>
                            </div>
                        </form>
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
            <script>
                const submitButton = document.querySelectorAll('#send');
                if (${order.status} == 3) {
                    for (let i = 0; i < submitButton.length; i++) {
                        submitButton[i].disabled = false;
                    }
                }
                const submitText = document.querySelectorAll('#check');
                const submitCity = document.querySelector('#city');
                const submitDistrict = document.querySelector('#district');
                const submitWard = document.querySelector('#ward');
                if (${order.status} == 0) {
                    for (let i = 0; i < submitText.length; i++) {
                        submitText[i].disabled = false;
                    }
                    submitCity.disabled = false;
                    submitDistrict.disabled = false;
                    submitWard.disabled = false;
                }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script>
                var citis = document.getElementById("city");
                var districts = document.getElementById("district");
                var wards = document.getElementById("ward");
                var Parameter = {
                    url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                    method: "GET",
                    responseType: "application/json",
                };
                var promise = axios(Parameter);
                promise.then(function (result) {
                    renderCity(result.data);
                });

                function renderCity(data) {
                    for (const x of data) {
                        citis.options[citis.options.length] = new Option(x.Name, x.Name);
                    }
                    citis.onchange = function () {
                        district.length = 1;
                        ward.length = 1;
                        district.options[0] = new Option("", "");
                        ward.options[0] = new Option("", "");
                        if (this.value != "") {
                            const result = data.filter(n => n.Name === this.value);

                            for (const k of result[0].Districts) {
                                district.options[district.options.length] = new Option(k.Name, k.Name);
                            }
                        }
                    };
                    district.onchange = function () {
                        ward.length = 1;
                        const dataCity = data.filter((n) => n.Name === citis.value);
                        if (this.value != "") {
                            const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

                            for (const w of dataWards) {
                                wards.options[wards.options.length] = new Option(w.Name, w.Name);
                            }
                        }
                    };
                }
        </script>
    </body>

</html>
