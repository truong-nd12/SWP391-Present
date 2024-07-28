<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header class="header header-intro-clearance header-3">
    <div class="header-top">
        <div class="container">
            <div class="header-left">
                <a href="tel:#"><i class="icon-phone"></i>Call: +0123 456 789</a>
            </div><!-- End .header-left -->

            <div class="header-right">

                <ul class="top-menu">
                    <li>
                        <a href="#">Links</a>

                        <c:choose>
                            <c:when test="${sessionScope.cus != null}">
                                <ul>
                                    <li>
                                        <div class="row">
                                            <div class="col-auto">
                                                <a href="profileDetail" class="d-flex align-items-center">
                                                    <span id="avatar" style="color: white;">
                                                        <i class="fas fa-user-alt fa-lg"></i>
                                                        Chào mừng, ${sessionScope.acc.getAcc_name()}
                                                    </span>
                                                    <span>
                                                        <img width="50px" height="50px" src="img/${sessionScope.cus.avatar}" alt="#">
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="logOutServlet" style="margin-left: 12px">
                                            <button type="button" id="btnSignIn" onmouseout="hoverOutSignIn()" onmouseover="hoverSignIn()" class="btn btn-danger">Log out</button>
                                        </a></li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <ul>
                                    <li><a href="LoginPage2.jsp">Đăng nhập  / Đăng kí</a></li>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul><!-- End .top-menu -->

            </div><!-- End .header-right -->

        </div><!-- End .container -->
    </div><!-- End .header-top -->

    <div class="header-middle">
        <div class="container">
            <div class="header-left">
                <button class="mobile-menu-toggler">
                    <span class="sr-only">Toggle mobile menu</span>
                    <i class="icon-bars"></i>
                </button>

                <a href="index.html" class="logo">
                    <img src="assets/images/demos/demo-3/logo.png" alt="Molla Logo" width="105" height="25">
                </a>
            </div><!-- End .header-left -->

            <div class="header-center">
                <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                    <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                    <form action="ClientPage" method="get">
                        <div class="header-search-wrapper search-wrapper-wide">
                            <label for="q" class="sr-only">Search</label>
                            <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                            <input type="search" class="form-control" name="search" value="${param.search}" id="q" placeholder="Search product ..." required>
                        </div><!-- End .header-search-wrapper -->
                    </form>
                </div><!-- End .header-search -->
            </div>

            <div class="header-right">
                <div class="dropdown cart-dropdown">
                    <a href="Cart"  class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-display="static">
                        <div class="icon">
                            <i class="icon-shopping-cart"></i>
                        </div>
                        <p>Cart</p>
                    </a>
                </div><!-- End .header-right -->
            </div><!-- End .container -->
        </div><!-- End .header-middle -->

        <div class="header-bottom sticky-header">
            <div class="container">
                <div class="header-left">
                    <div class="dropdown category-dropdown">
                        <a href="#"  class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Browse Categories">
                            Browse Categories <i class="icon-angle-down"></i>
                        </a>

                        <div class="dropdown-menu">
                            <nav class="side-nav">
                                <ul class="menu-vertical sf-arrows">
                                    <li class="item-lead"><a href="#" >Daily offers</a></li>
                                    <li class="item-lead"><a href="#">Gift Ideas</a></li>
                                        <c:forEach var="b" items="${sessionScope.brands}">
                                        <li><a href="ClientPage?brand=${b.getBrand_name()}">${b.getBrand_name()}</a></li>
                                        </c:forEach>
                                </ul><!-- End .menu-vertical -->
                            </nav><!-- End .side-nav -->
                        </div><!-- End .dropdown-menu -->
                    </div><!-- End .category-dropdown -->
                </div><!-- End .header-left -->

                <div class="header-center">
                    <nav class="main-nav">
                        <ul class="menu">
                            <li class="megamenu-container">
                                <a href="HomeController" class="">Home</a>
                            </li>
                            <li>
                                <a href="ClientPage" class="">Shop</a>
                            </li>
                            <li>
                                <a href="NewsList" class="">Blog</a>
                            </li>  
                            <li>
                                <a href="ViewOrderUser" class="">Order</a>
                            </li> 
                            
                            <li>
                                <a href="ViewGuarantee" class="">View Guarantee</a>
                            </li> 
                            
                        </ul><!-- End .menu -->
                    </nav><!-- End .main-nav -->
                </div><!-- End .header-center -->
                <div class="header-right">
                    <i class="la la-lightbulb-o"></i><p>Clearance<span class="highlight">&nbsp;Up to 30% Off</span></p>
                </div>
            </div><!-- End .container -->
        </div><!-- End .header-bottom -->
</header><!-- End .header -->