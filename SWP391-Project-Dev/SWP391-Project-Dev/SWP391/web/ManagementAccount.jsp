
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="assets/images/logo_2.png"/>
        <title>SMART TECH - AdminPage</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <!-- Main CSS File -->
        <jsp:include page="component/admin/head.jsp"></jsp:include>
        </head>
    <jsp:include page="component/admin/header.jsp"></jsp:include>
        <body>
            <div class="container-fluid position-relative bg-white d-flex p-0">
            <jsp:include page="component/admin/slidebar.jsp"></jsp:include>
                <!-- Content Start -->
                <div class="content">
                    <div class="container-xxl">
                    <jsp:include page="component/admin/navbar.jsp"></jsp:include>
                        <!-- Sale & Revenue Start -->
                        <form action="AdminPage" method="get">
                            <input type="hidden" name="page" value="${requestScope.paging.page}">
                        <input type="hidden" name="num" value="${paging.pageSize}" style="width: 100%" min="1" />
                        <div class="row" >
                            <div class="col-4" >
                                <div class="form-group mt-4 " style="text-align: end; color: #177BB6">
                                    <p style="padding:  5px; margin: 0">Tìm kiếm tên:</p>
                                </div>
                            </div>
                            <div class="col-4" >
                                <div class="form-group mt-4 ">
                                    <input class="form-control" type="text" name="search" value="${param.search}">
                                </div>
                            </div>
                            <div class="col-4" style="display: flex">
                                <div class="form-group mt-4 ">
                                    <button type="submit" name="sub"  style="background-color: #177BB6; border: none; border-radius: 5px; color: white; padding: 5px; font-size: 14px">Tìm kiếm</button>
                                    <button type="button"  style="background-color: #177BB6;border: none; border-radius: 5px; padding: 5px; font-size: 14px" ><a href="AdminPage" style="color: white">Cài lại</a></button>
                                    <a href="AddAccount"><button type="button" style="background-color: #177BB6; border: none; border-radius: 5px; color: white; padding: 5px; font-size: 14px">Thêm tài khoản</button></a>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="manger">
                        <ul class="nav nav-pills justify-content-center" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="product-desc-link" data-toggle="tab" href="#customer" role="tab" aria-controls="product-desc-tab" aria-selected="true">Khách hàng (${count}) </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" id="product-review-link" data-toggle="tab" href="#manager" role="tab" aria-controls="product-review-tab" aria-selected="false">Quản lý (${adlist.size()})</a>
                            </li>
                        </ul>
                            <div class="tab-content" style="padding: 20px">
                            <div class="tab-pane fade show active" id="customer" role="tabpanel" aria-labelledby="product-review-link">
                                <div class="row"  >
                                    <div class="col-6" style="text-align: start">
                                        <p>Tất cả tài khoản:</p>
                                    </div>
                                    <div class="col-6" style="text-align: end">
                                        <form action="AdminPage" method="get" id="selectPage" >
                                            <input type="hidden" name="search" value="${param.search}">
                                            <select name="num" id="formSelect" >             
                                                <option value="5" ${paging.pageSize==5?"selected":""}>5</option>
                                                <option value="25" ${paging.pageSize==25?"selected":""}>25</option>
                                                <option value="50" ${paging.pageSize==50?"selected":""}>50</option>
                                                <option value="1000" ${paging.pageSize==1000?"selected":""}>Tất cả</option>
                                            </select>
                                        </form>
                                    </div>
                                </div>
                                <div class="row" style="overflow-x: auto;text-align: center;">
                                    <table class="table table-striped table-bordered px-4">
                                        <thead style="background-color: #177BB6; color: white;">
                                            <tr>
                                                <td>Mã</td>
                                                <td>Tên người dùng</td>
                                                <td>Hoạt động</td>
                                                <td>Trạng thái </td>
                                                <td>Hồ sơ</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${cuslist}" var="a">
                                                <tr>
                                                    <td>${a.getCustomer_id()}</td>
                                                    <td>${a.getCus_name()}</td>
                                                    <td>${a.isActive()?"Yes":"No"}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${a.isActive()}">
                                                                <a href="AdminPage?id=${a.getCustomer_id()}&ban=1&num=${paging.pageSize}&search=${param.search}"><button style="margin: 1px" class="btn btn-success" >Đang hoạt động </button></a>
                                                            </c:when>
                                                            <c:when test="${!a.isActive()}">
                                                                <a href="AdminPage?id=${a.getCustomer_id()}&unban=1&num=${paging.pageSize}&search=${param.search}"><button style="margin: 1px" class="btn btn-danger">Ngừng hoạt động</button></a>
                                                            </c:when>
                                                        </c:choose>  
                                                    </td>
                                                    <td>
                                                        <a href="AccountProfile?id=${a.getCustomer_id()}"><button style="margin: 1px" class="btn btn-primary">Xem</button></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <c:if test="${requestScope.paging.pageSize!=1000}">
                                        <c:set var="pagination_url" value="${pageContext.request.contextPath}/AdminPage?"></c:set>
                                            <nav class="d-flex justify-content-center">
                                                <ul class="pagination">
                                                <c:if test="${requestScope.paging.getTotalPage()==0}">
                                                    <h3 style="color: red">Không có kết quẩ phù hợp !!!</h3>
                                                </c:if>
                                                <c:if test="${requestScope.paging.getTotalPage()!=0}">
                                                    <c:if test="${requestScope.paging.page != 1}">
                                                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}&search=${param.search}&num=${paging.pageSize}">Trang trước</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                        <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&search=${param.search}&num=${paging.pageSize}">${i}</a></li>
                                                        </c:forEach>
                                                        <c:if test="${requestScope.paging.page != requestScope.paging.getTotalPage() }">
                                                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}&search=${param.search}&num=${paging.pageSize}">Trang sau</a></li>
                                                        </c:if>
                                                    </c:if>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div>
                            </div><!-- .End .tab-pane -->
                            <div class="tab-pane fade " id="manager" role="tabpanel" aria-labelledby="product-desc-link" style="overflow-x: auto">
                                <table  class="table table-striped table-bordered px-4">
                                    <thead style="background-color: #177BB6; color: white;">
                                        <tr>
                                            <td>Mã</td>
                                            <td>Tên</td>
                                            <td>Vai trò</td>
                                            <td>Hoạt động</td>
                                            <td>Trạng thái</td>
                                            <td>Hồ sơ</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${adlist}" var="a">
                                            <tr>
                                                <td>${a.getAccount_id()}</td>
                                                <td>${a.getAcc_name()}</td>
                                                <td>${a.getRole_id()==1?"Admin":"Sales"}</td>
                                                <td>${a.isActivate()?"Yes":"No"}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${a.getRole_id()==1}">
                                                            <button style="margin: 1px" class="btn btn-success"  disabled>Đang hoạt động</button>
                                                        </c:when>
                                                        <c:when test="${a.isActivate()}">
                                                            <a href="AdminPage?id=${a.getAccount_id()}&ban=1"><button style="margin: 1px" class="btn btn-success">Đang hoạt động </button></a>
                                                        </c:when>
                                                        <c:when test="${!a.isActivate()}">
                                                            <a href="AdminPage?id=${a.getAccount_id()}&unban=1"> <button style="margin: 1px" class="btn btn-danger">Ngừng hoạt động</button></a>
                                                        </c:when>
                                                    </c:choose>  
                                                </td>
                                                <td><a href="AccountProfile?id=${a.getAccount_id()}&role=${a.getRole_id()}"><button style="margin: 1px" class="btn btn-primary">Xem</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${adlist.size()==0}">
                                    <h3 style="color: red; text-align: center">Không có kết quả phù hợp !!!</h3>
                                </c:if>
                            </div><!-- .End .tab-pane -->
                        </div><!-- End .tab-content -->
                    </div>
                    <!-- Sale & Revenue End -->

                </div>
                <!-- Footer Start -->
                <jsp:include page="component/admin/footer.jsp"></jsp:include>
                <!-- Footer End -->
                <script src="asset/js/jquery.min.js"></script>
                <script src="asset/js/bootstrap.bundle.min.js"></script>
                <script src="asset/js/jquery.hoverIntent.min.js"></script>
                <script src="asset/js/jquery.waypoints.min.js"></script>
                <script src="asset/js/superfish.min.js"></script>
                <script>
                    document.getElementById("formSelect").addEventListener("change", function () {
                        document.getElementById("selectPage").submit();
                    });
                </script>
            </div>
        </div>
    </body>
</html>