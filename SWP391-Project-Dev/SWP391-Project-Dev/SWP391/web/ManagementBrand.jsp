
<jsp:useBean id="helper" class="helper.helper"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Trang quản lý-SMART TECH</title>
        <link rel="shortcut icon" type="image/png" href="assets/images/logo_2.png"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <jsp:include page="component/manager/head.jsp"></jsp:include>
        </head>
    <jsp:include page="component/manager/header.jsp"></jsp:include>
        <body>
            <div class="container-fluid position-relative bg-white d-flex p-0">
            <jsp:include page="component/manager/slidebar.jsp"></jsp:include>
                <!-- Content Start -->
                <div class="content">
                    <div class="container-xxl">
                        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                            </a>
                            <a href="#" class="sidebar-toggler flex-shrink-0">
                                <i class="fa fa-bars"></i>
                            </a>
                            <div class="navbar-nav align-items-center ms-auto">
                                <div class="nav-item dropdown  ml-3">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <span class="d-none d-lg-inline-flex">${sessionScope.acc.getAcc_name()}</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                    <c:if test="${sessionScope.acc.getRole_id()==1}">
                                        <a href="AdminPage" class="dropdown-item">Quay lại </a>
                                    </c:if>
                                    <a href="LogOut" class="dropdown-item">Đăng xuất</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <!-- Sale & Revenue Start -->
                    <div class="container pt-4 px-4">
                        <div class="card" >
                            <div class="card-body">
                                <a class="btn btn-primary" href="UpdateBrand">Thêm thương hiệu</a>
                                <table class="table table-striped">
                                    <thead>
                                        <tr style="text-align: center">
                                            <th>#</th>
                                            <th>Tên</th>
                                            <th>Ảnh</th>
                                            <th>Trạng thái</th>
                                            <th class="text-content">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.brands}" var="p" varStatus="counter">
                                            <tr style="text-align: center">
                                                <td>${counter.count}</td>
                                                <td>${p.getBrand_name()}</td>
                                                <td>
                                                    <img style="border-radius: 5px" width="100px" height="100px" src="brand_image/${p.getImage()}" alt="alt"/>
                                                </td>

                                                <td> <c:choose>
                                                        <c:when test="${p.isStatus() == 'true'}">
                                                            <p style="color: green">Có sẵn</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p style="color: red">Không có sẵn</p>
                                                        </c:otherwise>
                                                    </c:choose></td>
                                                <td class="text-content">
                                                    <c:choose>
                                                        <c:when test="${p.isStatus() == 'true'}">
                                                            <a href="DeleteBrand?id=${p.getBrand_id()}&status=0"><button style="margin: 1px" class="btn btn-danger">Hủy kích hoạt</button></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="DeleteBrand?id=${p.getBrand_id()}&status=1"><button style="margin: 1px" class="btn btn-success">Kích hoạt</button></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="UpdateBrand?id=${p.getBrand_id()}"><button style="margin: 1px" class="btn btn-primary">Cập nhật</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:set var="pagination_url" value="${pageContext.request.contextPath}/ManagementBrand?" scope="request"></c:set>
                                    <div class="text-center mt-5">
                                        <nav class="text-center" aria-label="Page navigation example">
                                        <c:choose>          
                                            <c:when test="${requestScope.paging.getTotalPage() < 2}">
                                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                                    <ul class="pagination">
                                                        <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&search=${param.search}&brand=${param.brand}&type=${param.type}">${i}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </nav>
                                            </c:when>
                                            <c:when test="${requestScope.paging.page < 2}">
                                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                                    <ul class="pagination">                               
                                                        <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&search=${param.search}&brand=${param.brand}&type=${param.type}">${i}</a></li>
                                                            </c:forEach>
                                                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}&search=${param.search}&brand=${param.brand}&type=${param.type}">Trang sau</a></li>
                                                    </ul>
                                                </nav>
                                            </c:when>
                                            <c:when test="${requestScope.paging.page+1 > requestScope.paging.getTotalPage()}">
                                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                                    <ul class="pagination">
                                                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}&search=${param.search}&brand=${param.brand}&type=${param.type}">Trang trước </a></li>
                                                            <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&search=${param.search}&brand=${param.brand}&type=${param.type}">${i}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </nav>
                                            </c:when>
                                            <c:otherwise>
                                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                                    <ul class="pagination">
                                                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}&search=${param.search}&brand=${param.brand}&type=${param.type}">Trang truớc </a></li>
                                                            <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&search=${param.search}&brand=${param.brand}&type=${param.type}">${i}</a></li>
                                                            </c:forEach>
                                                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}&search=${param.search}&brand=${param.brand}&type=${param.type}">Trang sau</a></li>
                                                    </ul>
                                                </nav>
                                            </c:otherwise>
                                        </c:choose>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sale & Revenue End -->
                </div>
                <!-- Footer Start -->
                <jsp:include page="component/manager/footer.jsp"></jsp:include>
                <!-- Footer End -->
            </div>
        </div>
    </body>

</html>
