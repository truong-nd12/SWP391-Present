<%-- 
    Document   : Products
    Created on : Jan 10, 2024, 2:09:10 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="helper.helper"/>
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
                            <li class="nav-item active">
                                <a class="nav-link" href="Product">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Blog">Tin tức </a>
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
                        <h1>Sản phẩm</h1>
                        <span>SMART TECH｜Trang web uy tín hàng đầu Việt Nam .</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="single-services" style="margin: 20px 20px">
            <div class="container">
                <div style="text-align: center;">
                    <div class="section-heading" style="margin-bottom: 40px;">
                        <h2 style="">  <em> Sản Phẩm </em> </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3" style="margin-bottom: 20px">
                        <form action="Product" method="GET">
                            <div style="display: flex; justify-content: space-between" >
                                <h5>Bộ lọc:</h5>
                                <a href="Product" style="color: #177bb6">Xóa Tất Cả</a>
                            </div><!-- End .widget widget-clean -->
                            <br>
                            <div style="color: #177bb6 ;" >
                                <h5>Tên sản phẩm</h5>
                                <input type="text" value="${param.search}" name="search" style="width: 100%">
                            </div>
                            <br>
                            <div style="color: #177bb6">
                                <h5> Giá</h5>
                                <div style="color: black">
                                    <div>
                                        <input type="radio" name="price" value="price1" ${param.price.equals("price1")?"checked":""}>Dưới 5.000.000 đ
                                    </div>
                                    <div>
                                        <input type="radio" name="price" value="price2" ${param.price.equals("price2")?"checked":""} >5.000.000đ - 10.000.000 đ
                                    </div>
                                    <div>
                                        <input type="radio" name="price" value="price3" ${param.price.equals("price3")?"checked":""} >10.000.000đ - 20.000.000 đ
                                    </div>
                                    <div>
                                        <input type="radio" name="price" value="price4" ${param.price.equals("price4")?"checked":""}  >Trên 20.000.000đ 
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div style="color: #177bb6" >
                                <h5>Loại máy </h5>
                                <select name="brand" style="width: 100%; text-align: center;" >
                                    <option value="" >Tất cả</option>
                                    <c:forEach items="${brands}" var="o">
                                        <c:if test="${o.brand_name.equals(param.brand)}">
                                            <option value="${o.brand_name}"  selected> ${o.brand_name}</option>
                                        </c:if>
                                        <c:if test="${!o.brand_name.equals(param.brand)}">
                                            <option value="${o.brand_name}" > ${o.brand_name}</option>
                                        </c:if>

                                    </c:forEach>
                                </select>
                            </div>
                            <br>
                            <div style="color: #177bb6">
                                <h5>Kiểu máy</h5>
                                <select name="type" style="width: 100%; text-align: center;" >
                                    <option value="" >Tất cả</option>
                                    <c:forEach items="${types}" var="o">
                                        <c:if test="${o.type_name.equals(param.type)}">
                                            <option value="${o.type_name}"  selected> ${o.type_name}</option>
                                        </c:if>
                                        <c:if test="${!o.type_name.equals(param.type)}">
                                            <option value="${o.type_name}" > ${o.type_name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <br>
                            <div style="text-align: center">
                                <input type="submit" style="background-color: #177bb6; border-radius: 3px; color: white; border: none; padding: 5px" value="Tìm kiếm">
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-9"> 
                        <div class="row">
                            <c:forEach var="p" items="${requestScope.products}">
                                <div class="col-md-4" style="margin-bottom: 20px">
                                    <div class="service-item" style="text-align: center; ">
                                        <div>
                                            
                                        <a href="ProductDetail?id=${p.getProduct_id()}">
                                            <img src="product_image/${p.getImg_list().get(0).getUrl()}" style="height: 260px;">
                                        </a>
                                        </div>
                                        <div class="down-content" style="padding: 10px">
                                            <h4 style="margin: 0">${p.product_name}</h4>
                                            <div style="margin-bottom:10px;">
                                                <h4 class="mb-0"><span class="badge badge-primary badge-pill badge-news">Giảm ${p.getSale()}%</span></h4>
                                                <span style="color: red"> <small style="color: black"><del>${helper.convertToVietnameseDong(p.price)}</del></small> ${helper.convertToVietnameseDong(p.price-((p.price*p.sale)/100))} </span>
                                            </div>
                                            <div>
                                                <a href="ProductDetail?id=${p.product_id}" style="background-color: #177bb6; color: white; padding: 5px" >Thông tin</a>
                                                <a href="CartPage?id=${p.product_id}" style="background-color: #177bb6; color: white; padding: 5px" >Thêm <i class="fa fa-shopping-cart"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="text-center mt-5">
                            <nav>
                                <c:set var="pagination_url" value="${pageContext.request.contextPath}/Product?"></c:set>
                                    <nav class="d-flex justify-content-center">
                                        <ul class="pagination">
                                        <c:if test="${requestScope.paging.getTotalPage()==0}">
                                            <h3 style="color: red">Không có kết quả phù hợp !!!</h3>
                                        </c:if>
                                        <c:if test="${requestScope.paging.getTotalPage()!=0}">
                                            <c:if test="${requestScope.paging.page != 1}">
                                                <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}&search=${param.search}&price=${param.price}&brand=${param.brand}&type=${param.type}">Trang trước</a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&search=${param.search}&price=${param.price}&brand=${param.brand}&type=${param.type}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${requestScope.paging.page != requestScope.paging.getTotalPage() }">
                                                <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}&search=${param.search}&price=${param.price}&brand=${param.brand}&type=${param.type}">Trang sau</a></li>
                                                </c:if>
                                            </c:if>
                                    </ul>
                                </nav>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <br>

        <!-- Footer Starts Here -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 footer-item" style="text-align: center">
                        <h4>SMART TECH </h4>
                        <p>Các sản phẩm chất lượng <br>  Giá cả phải chăng <br> Nhiều ưu đãi hấp dẫn </p>
                       
                    </div>

                    <div class="col-md-6 footer-item" style="text-align: center">
                        <h4>Các trang bổ sung</h4>
                        <ul class="menu-list">
                            <li><a href="Product">Sản phẩm</a></li>
                            <li><a href="About">Về chúng tôi</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </footer>      
        <div class="sub-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>
                            © 2024 SMART TECH
                        </p>
                    </div>
                </div>
            </div>
        </div>

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

