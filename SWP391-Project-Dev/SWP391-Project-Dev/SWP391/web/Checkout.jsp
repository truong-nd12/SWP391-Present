<%-- 
    Document   : Checkout
    Created on : Jan 26, 2024, 9:42:41 PM
    Author     : Dell
--%>
<jsp:useBean id="convert" class="helper.Convert"/>
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
                        <h1>SMART TECH Website Cart</h1>
                        <span>GIỎ HÀNG</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-services" style="margin: 40px;">
            <div class="container">
                <form action="CheckOut" method="post" id="frmCreateOrder">
                    <div class="row">
                        <div class="col-lg-4" style=" border-radius: 10px; margin-bottom: 15px">
                            <div  style="margin-bottom: 10px">
                                <h5><i class="fa fa-info"></i> Tiếp nhận thông tin</h5>
                                <br>
                                <input style="width: 100%; padding: 10px" type="text" id="name" name="name" placeholder="Tên của bạn" required>
                                <hr>
                                <input style="width: 100%; padding: 10px" type="tel" id="phone"  name="phone" pattern="^(09|05|08|03)[0-9]{8}" title="Vui lòng số điện thoại hợp lệ" placeholder="Số điện thoại của bạn" required >
                                <hr>
                                <select style="width: 100%; padding: 10px" id="city" name="city" required>
                                    <option value="" selected>Chọn tỉnh thành</option>           
                                </select>
                                <hr>
                                <select style="width: 100%; padding: 10px" id="district" name="district" required >
                                    <option value="" selected>Chọn huyện</option>
                                </select>
                                <hr>
                                <select style="width: 100%; padding: 10px" id="ward" name="ward" required>
                                    <option value="" selected>Chọn  xã</option>
                                </select>
                                <hr>
                                <input style="width: 100%; padding: 10px" value="${test}" type="text" name="address" placeholder="Địa chỉ của bạn" required>
                                <hr>
                                <textarea  style="width: 100%;  padding: 10px" name="note" rows="3" placeholder="Ghi chú (tùy chọn)"></textarea>
                            </div>
                        </div>
                        <div class="col-lg-4" style="border-radius: 10px; margin-bottom: 20px">
                            <div>
                                <h5><i class="fa fa-truck"></i> Vận chuyển</h5>
                            </div>
                            <br>
                            <div style="padding: 10px;border: 1px #869791 solid; border-radius: 2px">
                                <div class="row">
                                    <div class="col-1" >
                                        <input type="radio" id="ship" name="ship" value="" style="accent-color:#177bb6;" checked="">
                                    </div>
                                    <div class="col-7" style="padding-right: 0" >
                                        <div style="color: #177bb6">
                                            <label for="ship" >Giao hàng tận nhà</label>
                                        </div>
                                    </div> 
                                    <div class="col-3" style="padding-right: 0;  ">
                                        <p style="color: red">${convert.convertToVietnameseDong(30000)}</p>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div  style="margin-bottom: 10px">
                                <h5><i class="fa fa-credit-card"></i> Phương thức thanh toán </h5>
                            </div>
                            <div style="padding: 10px; border: 1px #869791 solid; border-radius: 2px">
                                <div class="row">
                                    <div class="col-1" >
                                        <div style="color: #177bb6">
                                            <input type="radio" id="cash2" name="cash" value="COD" onclick="showhidediv(this);" style ="accent-color:#177bb6;" >
                                        </div>
                                    </div> 
                                    <div class="col-8" >
                                        <div style="color: #177bb6">
                                            <label for="cash2" >Thanh toán khi giao hàng (COD)</label>
                                        </div>
                                    </div> 
                                    <div class="col-2" style=" color: #177bb6">
                                        <h5><i class="fa fa-money"></i></h5>
                                    </div>
                                </div>
                                <div id="one" style="padding: 20px; display: none">
                                    <p>Nhận hàng, kiểm tra rồi thanh toán cho nhân viên giao hàng.</p>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-1" >
                                        <input type="radio" id="cash1" name="cash" value="VNPay" onclick="showhidediv(this);" style ="accent-color:#177bb6;" required>
                                    </div> 
                                    <div class="col-8" >
                                        <div style="color: #177bb6">
                                            <label for="cash1" >Thanh toán qua Ví điệnt tử (VNPay)</label>
                                        </div>
                                    </div> 
                                    <div class="col-2" style=" color: #177bb6">
                                        <h5><i class="fa fa-money"></i></h5>
                                    </div>
                                </div>
                                <div id="two" style="padding: 20px; display: none" >
                                    <p>Thanh toán chuyển tiền vào tài khoản Ví điện tử(VNPay) <br> Sau đó nhấn nút Đặt hàng bên dưới để hoàn tất, nhân viên sẽ gọi lại xác nhận đơn hàng.</p>
                                </div>
                            </div>
                        </div>
                        <input type="radio" id="bankCode" name="bankCode" value="VNBANK" hidden>
                        <input type="text"  name="amount" value="${convert.convertToInt(sessionScope.cart.getTotalMoney())*100+30000*100}" hidden="" >
                        <input type="radio" id="language" name="language" value="en" checked="" hidden>
                        <aside class="col-lg-4" ">
                            <h5>Đơn hàng của bạn</h5>
                            <div style="padding: 10px;">
                                <hr>
                                <c:forEach items="${sessionScope.cart.getItems()}" var="i">
                                    <div class="row" >
                                        <div class="col-2" style="padding-right: 0">
                                            <img style="max-width: 100%;" src="product_image/${i.getProduct().getImg_list().get(0).getUrl()}" />
                                        </div>
                                        <div class="col-4" style="text-align: start">
                                            <p>${i.getProduct().getProduct_name()}</p>
                                        </div>
                                        <div class="col-1" style="text-align: start">
                                            <p>${i.getQuality()}</p>
                                        </div>
                                        <div class="col-4" style="padding: 0; text-align: end; ">
                                            <p style="color: red">${convert.convertToVietnameseDong(i.getPrice()*i.getQuality())}</p>
                                        </div>
                                    </div>
                                    <hr>
                                </c:forEach>
                            </div>

                            <div class="row">
                                <div class="col-6" style="padding-right: 0">
                                    <h5 >Tổng tiền đơn hàng </h5><!-- End .summary-title -->
                                </div>
                                <div class="col-6" style="text-align: end;padding-left: 0">
                                    <h5 style="color: red">${convert.convertToVietnameseDong(sessionScope.cart.getTotalMoney()+30000)}</h5><!-- End .summary-title -->
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-5" style="padding: 7px;">
                                    <a href="CartPage" style="font-size: 15px;margin-left: 10px" ><i class="fa fa-angle-double-left"></i>  Giỏ hàng <i class="fa fa-cart-plus"></i></a><!-- End .summary-title -->
                                </div>
                                <div class="col-7">
                                    <input type="submit" name="order" value="Thanh toán" style="font-size: 15px;background-color: #177bb6; color: white; border: none; padding: 7px; border-radius: 7px">            
                                </div>
                            </div>
                        </aside>
                    </div>
                </form>
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
            function showhidediv(rad) {
                var rads = document.getElementsByName(rad.name);
                document.getElementById('one').style.display = (rads[0].checked) ? 'block' : 'none';
                document.getElementById('two').style.display = (rads[1].checked) ? 'block' : 'none';
            }
        </script>
        <script>
            const submitButton = document.querySelector('input[type="submit"]');
            function checkValue() {
                if (document.getElementById("cash1").checked) {
                    document.getElementById("frmCreateOrder").action = "vnpayajax";                    
                } else {
                    document.getElementById("frmCreateOrder").action = "CheckOut";
                }
            }
            submitButton.addEventListener("click", checkValue);
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
            function showhidediv(rad) {
                var rads = document.getElementsByName(rad.name);
                document.getElementById('one').style.display = (rads[0].checked) ? 'block' : 'none';
                document.getElementById('two').style.display = (rads[1].checked) ? 'block' : 'none';
                document.getElementById('three').style.display = (rads[2].checked) ? 'block' : 'none';
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
