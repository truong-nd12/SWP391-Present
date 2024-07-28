
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                                        <a href="AdminPage" class="dropdown-item">Quay lại</a>
                                    </c:if>
                                    <a href="LogOut" class="dropdown-item">Đăng xuất</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <!-- Sale & Revenue Start -->
                    <div class="container pt-4 px-4">
                        <div class="row g-4 mt-10">
                            <form id="filterForm" action="ManagerNew" method="get">
                                <input type="hidden" name="num" value="${paging.pageSize}" style="width: 100%" min="1" />
                                <div class="row" >
                                    <div class="col-5" >
                                        <div class="form-group">
                                            <label>Tên tin tức</label>
                                            <input class="form-control" type="text" name="search" value="${param.search}">
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <div class="form-group">
                                            <label>Loại tin tức</label>
                                            <select name="type" class="form-select" >
                                                <option value="${param.type}" selected="">${param.type}</option>
                                                <c:forEach items="${requestScope.types}" var="b">
                                                    <option value="${b.type_name}">${b.type_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-2" style="display: flex">
                                        <div class="form-group mt-4 ">
                                            <button type="submit" name="sub"  style="background-color: #177BB6; border: none; border-radius: 5px; color: white; padding: 5px; font-size: 14px">Tìm kiếm</button>
                                            <button type="button"  style="background-color: #177BB6;border: none; border-radius: 5px; padding: 5px; font-size: 14px" ><a href="ManagerNew" style="color: white">Cài lại</a></button>
                                        </div>
                                    </div>

                                </div>
                            </form>
                            <div class="row" style="text-align: center; margin: 20px 0px">
                                <a href="AddNews"><button style="background-color: #177BB6; border: none; border-radius: 5px; color: white; padding: 5px; font-size: 14px">Thêm tin tức</button></a>
                            </div>
                            <div class="row">
                                <div class="col-6" style="text-align: start">
                                    <p >Tất cả tin tức:</p>
                                </div>
                                <div class="col-6" style="text-align: end">
                                    <form action="ManagerNew" method="get" style="width: 100%" id="selectPage" >
                                        <input type="hidden" name="search" value="${param.search}">
                                        <input type="hidden" name="type" value="${param.type}">
                                        <select name="num" id="formSelect" >             
                                            <option value="5" ${paging.pageSize==5?"selected":""}>5</option>
                                            <option value="25" ${paging.pageSize==25?"selected":""}>25</option>
                                            <option value="50" ${paging.pageSize==50?"selected":""}>50</option>
                                            <option value="1000" ${paging.pageSize==1000?"selected":""}>Tất cả</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                            <div class="row" style="text-align: center;overflow-x: auto">
                                <table  class="table table-striped table-bordered px-4">
                                    <thead>
                                        <tr style="background-color: #177BB6; color: white">
                                            <th class="text-center" style="width: 5%">Mã</th>
                                            <th class="text-center" style="width: 30%">Tiêu đề</th>
                                            <th class="text-center" style="width: 17%">Ngày tạo</th>
                                            <th class="text-center" style="width: 10%">Người tạo</th>
                                            <th class="text-center" style="width: 18%">Ngày sửa</th>
                                            <th class="text-center" style="width: 10%">Ảnh</th>
                                            <th class="text-center" style="width: 10%">Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${requestScope.News.size() > 0}">
                                        <tbody>
                                            <c:forEach items="${requestScope.News}" var="p">
                                                <tr>
                                                    <td>${p.getNews_id()}</td>
                                                    <td>${p.getTitle()}</td>
                                                    <td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${p.getCreatedDate()}" /></td>
                                                    <td>${account.getAccNameById(p.getCreatedBy())}</td>
                                                    <td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${p.getModifiedDate()}" /></td>
                                                    <td><img src="images/${img.getNewsImgURLById(p.getImg_id())}" alt="alt" style="width: 100px"/></td>
                                                    <td style="text-align: ">
                                                        <c:choose>
                                                            <c:when test="${p.isIsDel() == 1}">
                                                                <a  href="DeleteNew?id=${p.getNews_id()}&status=0"><button style="margin: 1px; border-radius: 3px; border: 1px red solid;background-color: red; color: white">Xóa</button></a>
                                                            </c:when>
                                                            <c:when test="${p.isIsDel() == 2}">
                                                                <a  href="DeleteNew?id=${p.getNews_id()}&status=0"><button style="margin: 1px; border-radius: 3px; border: 1px #177BB6 solid;background-color: #177BB6; color: white">Đang chờ</button></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="DeleteNew?id=${p.getNews_id()}&status=1"><button style="margin: 1px; border-radius: 3px; border: 1px #20cb55 solid;background-color: #20cb55; color: white" >Đã xác nhận </button></a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <a href="AddNews?id=${p.getNews_id()}"><button style="margin: 1px; border-radius: 3px; border: 1px #177BB6 solid;background-color: #177BB6; color: white">Cập nhật</button></a>
                                                    </td>
                                                </c:forEach>
                                        </tbody>
                                    </c:if>
                                </table>
                            </div>
                            <div class="row">
                                <c:if test="${requestScope.paging.pageSize!=1000}">
                                    <c:set var="pagination_url" value="${pageContext.request.contextPath}/ManagerNew?"></c:set>
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
                                </c:if>
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
        <script>
            document.getElementById("formSelect").addEventListener("change", function () {
                document.getElementById("selectPage").submit();
            });
        </script>
    </body>

</html>
