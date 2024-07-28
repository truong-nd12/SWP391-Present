
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
                    <div class="container pt-4 px-4">
                        <div class="row">
                            <c:if test="${requestScope.MSG != null}">
                                <h3 class="text-danger">${requestScope.MSG}</h3>
                            </c:if>
                            <c:if test="${requestScope.ERROR != null}">
                                <h3 class="text-danger">${requestScope.ERROR}</h3>
                            </c:if>
                        </div>
                        <br>
                        <div class="row g-4 mt-10">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div>
                                    <h3 class="d-inline">Quản lý bảo hành</h3>
                                </div>
                                <div style="text-align: center">
                                    <a href="AddGuaranteeAdmin" class="btn btn-primary" style="background-color: #177BB6">Thêm bảo hành mới</a>

                                </div>

                                <form action="ManagernentGuarantee" method="get">
                                    <div style="display: flex; align-items: center;">
                                        <input style="padding: 8px; border-radius: 5px; border: 1px solid #ccc; width: 200px;" type="text" name="search" placeholder="Tìm kiếm mã thẻ dịch vụ" value="${requestScope.search}">
                                        <button type="submit" style="padding: 8px; border-radius: 5px; background-color: #177BB6; color: white; border: none; cursor: pointer; margin-left: 5px;">Tìm kiếm</button>
                                        <a type="reset" href="ManagernentGuarantee" style="padding: 8px; border-radius: 5px; background-color: #177BB6; color: white; border: none; cursor: pointer; margin-left: 5px;" value="Reset">Cài lại</a>
                                    </div>
                                </form>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Mã thẻ dịch vụ</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Ngày</th>
                                        <th>Ảnh</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày kết thúc</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.lst}" var="p" varStatus="counter">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${p.service_tag}</td>
                                            <td>${p.order_id}</td>
                                            <td>${p.g_date}</td>
                                            <td>
                                                <img style="border-radius: 5px" width="100px" height="100px" src="guarantee_image/${p.image}??timestamp=<%= System.currentTimeMillis() %>" alt="alt"/>
                                            </td>
                                            <td class="font-weight-bold" style="text-transform: capitalize">   
                                                <c:choose>
                                                    <c:when test="${p.status == 1}">
                                                        <p class="text-secondary font-weight-bold">Đợi</p>
                                                    </c:when>
                                                    <c:when test="${p.status == 2}">
                                                        <p class="text-success font-weight-bold">Xác nhận</p>
                                                    </c:when>
                                                    <c:when test="${p.status == 3}">
                                                        <p class="text-success font-weight-bold">Hoàn thành</p>
                                                    </c:when>
                                                    <c:when test="${p.status == 4}">
                                                        <p class="text-danger font-weight-bold">Hủy</p>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td><c:if test="${p.return_date == null}">
                                                    Chưa
                                                </c:if>
                                                <c:if test="${p.return_date != null}">
                                                    ${p.return_date}
                                                </c:if>

                                            </td>
                                            <td>
                                                <c:if test="${p.status == 1}">
                                                    <a href="detail-guarantee?guaranteeId=${p.record_id}&creatorId=${sessionScope.acc.getAccount_id()}" style="background-color: #177BB6; color: white; padding: 7px; border-radius: 5px;width: 100%">Xem thông tin</a>
                                                    <hr>
                                                    <a href="update-guarantee?guaranteeId=${p.record_id}&status=4&dateReturn=" style="background-color: red; color: white; padding: 5px; border-radius: 5px;">Hủy</a>
                                                </c:if>
                                                <c:if test="${p.status != 1}">
                                                    <a href="detail-guarantee?guaranteeId=${p.record_id}&creatorId=${sessionScope.acc.getAccount_id()}" style="background-color: #177BB6; color: white; padding: 7px; border-radius: 5px; " >Xem thông tin</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
