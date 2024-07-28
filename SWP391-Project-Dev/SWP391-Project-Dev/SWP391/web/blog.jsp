<%-- 
    Document   : blog
    Created on : Jan 10, 2024, 7:42:32 PM
    Author     : Dell
--%>

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
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/logo_2.png"/>
        <title>SMART TECH WEBSITE    </title>
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
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="HomePage">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="Product">Sản phẩm</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="Blog">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="About">Về chúng tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OrderPage">Đơn hàng</a>
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
                        <h1>SMART TECH Website</h1>
                        <span>Tin tức mỗi ngày</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-services">
            <div class="container">
                <div class="row">
                    <div class="col-md-8"  style="margin-bottom: 20px;">
                        <c:forEach items="${requestScope.newlist}" var="list">
                            <article id='${list.getNews_id()}' style="margin-bottom: 25px">
                                <a href="NewDetail?id=${list.getNews_id()}">
                                    <img src="images/${img.getNewsImgURLById(list.getImg_id())}" alt="" style="width: 100%; margin-bottom: 10px">
                                </a>
                                <div >
                                    <h4><a href="NewDetail?id=${list.getNews_id()}" style="color: #177BB6">[${list.getTitle()}]</a></h4>
                                </div>
                                <br>
                                <div >
                                    <span>${account.getAccNameById(list.getCreatedBy())} &nbsp;|&nbsp; <fmt:formatDate pattern = "dd-MM-yyyy" value = "${list.getCreatedDate()}" /> &nbsp;|&nbsp; ${comment.countComment(list.news_id)} Bình luận</span>
                                </div>
                                <div style="margin-top: 10px">
                                    <a href="NewDetail?id=${list.getNews_id()}" class="filled-button">Tiếp tục đọc</a>
                                </div>
                            </article>
                            <hr>
                        </c:forEach>
                        <div class="row">
                            <div class="col-11">
                                <c:set var="pagination_url" value="${pageContext.request.contextPath}/Blog?"></c:set>
                                    <nav class="d-flex justify-content-center">
                                        <ul class="pagination">
                                        <c:if test="${requestScope.paging.getTotalPage()==0}">
                                            <h3 style="color: red">Không có kết quả phù hợp !!!</h3>
                                        </c:if>
                                        <c:if test="${requestScope.paging.getTotalPage()!=0}">
                                            <c:if test="${requestScope.paging.page != 1}">
                                                <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}&search=${param.search}&type=${param.type}&num=${paging.pageSize}">Trang trước</a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&search=${param.search}&type=${param.type}&num=${paging.pageSize}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${requestScope.paging.page != requestScope.paging.getTotalPage() }">
                                                <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}&search=${param.search}&type=${param.type}&num=${paging.pageSize}">Trang sau</a></li>
                                                </c:if>
                                            </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4" style="margin-bottom: 20px;">
                        <div class="row" style="display: flex; padding-bottom: 10px">
                            <div class="col-6">
                                <h5 style="color: #177BB6 " >Tin tức/Trang</h5>
                            </div>
                            <div class="col-6" style="text-align: end">
                                <form action="Blog" method="get" style="width: 100%" id="selectPage" >
                                    <input type="hidden" name="search" value="${param.search}">
                                    <input type="hidden" name="type" value="${param.type}">
                                    <select name="num" id="formSelect" >             
                                        <option value="3" ${paging.pageSize==3?"selected":""}>3</option>
                                        <option value="5" ${paging.pageSize==5?"selected":""}>5</option>
                                        <option value="10" ${paging.pageSize==10?"selected":""}>10</option>
                                        <option value="20" ${paging.pageSize==20?"selected":""}>20</option>
                                    </select>
                                </form>
                            </div>
                        </div>
                        <form  method="GET" action="Blog" id="searchForm">
                            <input type="hidden" name="num" value="${paging.pageSize}" style="width: 100%" min="1" />
                            <div class="row">
                                <div class="col-9" style="padding-right: 0">
                                    <input type="text" name="search" style="width: 100%" value="${param.search}">
                                </div>
                                <div class="col-3" style="padding-right: 0">
                                    <input type="submit" value="Search">
                                </div>
                            </div>
                            <h5 style="color: #177BB6; padding-top: 10px " >Loại tin tức</h5>
                            <c:forEach items="${requestScope.types}" var="t">
                                <input type="radio" id="sradio" name="type" value="${t.getType_name()}" ${param.type.equals(t.getType_name())?"checked":""} >${t.getType_name()}</br>
                            </c:forEach>
                        </form>
                        <br>
                        <h5 style="color: #177BB6 ">Bài viết gần đây</h5>
                        <c:forEach items="${requestScope.threelist}" var="list">
                            <hr>
                            <div class="row">
                                <div class="col-4">
                                    <a href="NewDetail?id=${list.getNews_id()}">
                                        <img style="max-width: 100%;" src="images/${img.getNewsImgURLById(list.getImg_id())}" />
                                    </a>
                                </div>
                                <div class="col-8">
                                    <p style="margin-bottom:10px;"><a href="NewDetail?id=${list.getNews_id()}">[${list.getTitle()}]</a></p>
                                </div>
                            </div>
                            <small><i class="fa fa-user"></i> ${account.getAccNameById(list.getCreatedBy())} &nbsp;|&nbsp; <i class="fa fa-calendar"></i> <fmt:formatDate pattern = "dd-MM-yyyy" value = "${list.getCreatedDate()}" /></small>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Starts Here -->
        <jsp:include page="component/footer.jsp"></jsp:include>
        <button type="button" style="position: fixed; z-index: 99; bottom: 30px; right: 30px;background-color: #177BB6; color: white; border:2px white solid; border-radius: 5px; width: 30px;height: 30px" id="but"><i class="fa fa-angle-double-up"></i></button>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/accordions.js"></script>

        <script language = "text/Javascript">
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
            document.getElementById("formSelect").addEventListener("change", function () {
                document.getElementById("selectPage").submit();
            });
        </script>
        <script>
            const submitButton = document.querySelectorAll('#sradio');
            for (let i = 0; i < submitButton.length; i++) {
                submitButton[i].addEventListener("click", function () {
                    document.getElementById("searchForm").submit();
                });
            }
        </script>
        <script>
            document.getElementById("but").addEventListener("click", () => {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            });
            document.body.appendChild(btn);
        </script>
    </body>
</html>
