

<jsp:useBean id="helper" class="helper.helper"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Trang quản lý -SMART TECH</title>
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
                                        <a href="AdminPage" class="dropdown-item">Quay lại</a>
                                    </c:if>
                                    <a href="LogOut" class="dropdown-item">Đăng xuất</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <!-- Sale & Revenue Start -->
                    <div class="container pt-4 px-4">
                        <div class="card">
                            <div class="card-body">
                                <a class="btn btn-primary" href="AddTypePage.jsp">Thêm kiểu</a>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Tên</th>
                                            <th>Trạng thái</th>
                                            <th class="text-content">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.types}" var="p" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${p.getType_name()}</td>
                                                <td> <c:choose>
                                                        <c:when test="${p.isStatus() == 'true'}">
                                                            <p style="color: green">Có sẵn</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p style="color: red">Chưa có sẵn</p>
                                                        </c:otherwise>
                                                    </c:choose></td>
                                                <td class="text-content">
                                                    <c:choose>
                                                        <c:when test="${p.isStatus() == 'true'}">
                                                            <a href="UpdateStatus?id=${p.getType_id()}&status=0"><button style="margin: 1px" class="btn btn-danger">Không hoạt động</button></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="UpdateStatus?id=${p.getType_id()}&status=1"><button style="margin: 1px" class="btn btn-success">Hoạt động</button></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="UpdateType?id=${p.getType_id()}"><button style="margin: 1px" class="btn btn-primary">Cập nhật</button></a>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

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
