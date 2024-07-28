<%-- 
    Document   : newdetail
    Created on : Jan 19, 2024, 12:51:13 PM
    Author     : Dell
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    </button><div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="HomePage">Trang Chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="Product">Sản Phẩm</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="Blog">Tin Tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="About">Về Chúng Tôi</a>
                                
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OrderPage">Đặt Hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Guarantee">Bảo Hành</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CartPage"><i class="fa fa-shopping-cart"></i> Giỏ Hàng (${sessionScope.cart.getItems().size()==null?"0":sessionScope.cart.getItems().size()})</a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.acc != null}">
                                    <li class="nav-item dropdown">
                                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                            <img class="rounded-circle me-lg-2" src="images/${sessionScope.acc.getAvatar()}" alt="" style="width: 20px; height: 20px;">
                                            ${sessionScope.acc.getCus_name()}</a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="Profile">Thông Tin Cá Nhân</a>
                                            <a class="dropdown-item" href="LogOut">Đăng Xuất</a>
                                        </div>
                                    </li>

                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item">
                                        <a class="nav-link" href="LoginPage">Đăng Nhập</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </nav></header>
        <!-- Page Content -->
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Blog Trang Web Điện Thoại SMART TECH</h1>
                        <span>Tin Tức & Những Điều Tuyệt Vời</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-services">
            <div class="container">
                <div class="row">
                    <div class="col-md-8"  style="margin-bottom: 20px; ">
                        <img src="images/${img.getNewsImgURLById(news.getImg_id())}" alt="" style="width: 100%; margin-bottom: 10px">
                        <div >
                            <h4>[${news.getTitle()}]</h4>
                        </div>
                        <br>
                        <div >
                            <span>${account.getAccNameById(news.getCreatedBy())} &nbsp;|&nbsp; <fmt:formatDate pattern = "dd-MM-yyyy" value = "${news.getCreatedDate()}" /> &nbsp;|&nbsp; ${comment.countComment(news.news_id)} bình luận</span>
                        </div>
                        <div style="overflow-x: auto">
                            <p>${news.getContent()}</p>
                        </div>
                        <hr>
                        <div >
                            <span>Thẻ:</span> <a style="color: #177BB6 " href="Blog?type=${typeName.getNewsNameById(news.getNews_type())}">${typeName.getNewsNameById(news.getNews_type())}</a>
                        </div>
                        <hr>
                        <div>
                            <h5 style="color: #177BB6 ">Bình Luận</h5>
                            <c:forEach items="${requestScope.comment.getAllComment(param.id)}" var="cm">
                                <hr>
                                <div class="row">
                                    <div class="col-3" style="display: flex">
                                        <img class="rounded-circle" src="images/${cus.getCusId(cm.cus_id).avatar}" alt="" style="width: 20px; height: 20px;">
                                        <p>${cus.getCusId(cm.cus_id).cus_name}:</p>
                                    </div>
                                    <div class="col-9">
                                        <p>${cm.content}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <hr>
                        <div>
                            <h5 style="color: #177BB6 ">Để Lại Bình Luận</h5>
                            <form action="NewDetail?id=${param.id}" method="post">
                                <c:if test="${sessionScope.acc != null}"><input type="text" name="comment" style="width: 100%; margin-bottom: 10px" required>
                                    <input type="submit" value="Gửi Bình Luận" style="background-color: #177BB6; border: none; color: white">
                                </c:if>
                                <c:if test="${sessionScope.acc == null}">
                                    <input type="text" name="comment" style="width: 100%; margin-bottom: 10px">
                                    <input type="button" value="Gửi Bình Luận" style="background-color: #177BB6; border: none; color: white" data-toggle="modal" data-target="#myModal">
                                </c:if>
                                <div class="modal" id="myModal" tabindex="-1" role="dialog"  aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered mo">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Gửi Bình Luận</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Bạn cần đăng nhập để gửi bình luận</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                                <input type="submit" value="Đăng Nhập" class="btn btn-success">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                        <hr>
                        <div >
                            <h5 style="color: #177BB6 ">Bài Viết Liên Quan</h5>
                            <div class="row">
                                <c:forEach items="${requestScope.relatelist}" var="list">
                                    <div class="col-4">
                                        <a href="NewDetail?id=${list.getNews_id()}">
                                            <img style="max-width: 100%;" src="images/${img.getNewsImgURLById(list.getImg_id())}" />
                                        </a>
                                        <p style="margin-bottom:10px;"><a href="NewDetail?id=${list.getNews_id()}">[${list.getTitle()}]</a></p>
                                    </div>
                                </c:forEach>
                            </div></div>
                    </div>

                    <div class="col-md-4" style="margin-bottom: 20px;">
                        <form  method="GET" action="Blog" id="searchForm">
                            <h5 style="color: #177BB6 " >Tìm kiếm</h5>
                            <input type="text" name="search"  style="width: 70%" value="${param.search}">
                            <input type="submit" value="Tìm Kiếm">
                            <h5 style="color: #177BB6 " >Loại tin tức</h5>
                            <c:forEach items="${requestScope.types}" var="t">
                                <input type="radio" id="sradio" name="type" value="${t.getType_name()}" ${param.type.equals(t.getType_name())?"checked":""} >${t.getType_name()}</br>
                            </c:forEach>
                        </form>
                        <br>
                        <h5 style="color: #177BB6 ">Bài Viết Gần Đây</h5>
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
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each fieldfunction clearField(t) {                   //declaring the array outside of the
                if (!cleared[t.id]) {                      // function makes it static and global
                    cleared[t.id] = 1;  // you could use true and false, but that's more typing
                    t.value = '';         // with more chance of typos
                    t.style.color = '#fff';
                }
            }
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