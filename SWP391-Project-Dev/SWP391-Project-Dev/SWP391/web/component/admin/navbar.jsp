<!-- Navbar Start -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                <a href="ManagerPage" class="dropdown-item">Quản lí sản phẩm</a>
                <a href="LogOut" class="dropdown-item">Đăng xuất</a>
            </div>
        </div>
    </div>
</nav>
<c:if test="${sessionScope.acc == null}">
    <c:redirect url="HomePage"></c:redirect>
</c:if>

<!-- Navbar End -->