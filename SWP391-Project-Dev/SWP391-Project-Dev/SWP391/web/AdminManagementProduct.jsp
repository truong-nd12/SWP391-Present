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
                    <div class="container">
                    <jsp:include page="component/manager/navbar.jsp"></jsp:include>
                        <!-- Sale & Revenue Start -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="row">

                                        </div>

                                        <form id="filterForm" action="search" method="get">
                                            <input type="text" value="1" name="ep" hidden="hidden">
                                            <div class="row">
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <label>Tên sản phẩm</label>
                                                            <input class="form-control" type="text" name="name"  value="${name}">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label>Thương hiệu sản phẩm </label>
                                                            <select name="brand_id" class="form-select" aria-label="Default select example">
                                                                <option value="0">Tất cả thương hiệu</option>
                                                                <c:forEach items="${listB}" var="b">
                                                                    <option value="${b.brand_id}">${b.brand_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label>Loại sản phẩm</label>
                                                            <select name="type_id" class="form-select" aria-label="Default select example">
                                                                <option value="0" selected="">Tất cả các loại</option>
                                                                <c:forEach items="${listT}" var="t">
                                                                    <option value="${t.type_id}">${t.type_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label>Phân trang</label>
                                                            <select name="num" class="form-select" aria-label="Default select example">          
                                                                <option value="9" >9</option>
                                                                <option value="50" >50</option>
                                                                <option value="100" >100</option>
                                                                <option value="10000" >Tất cả</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <label for="minValue">Giá trị nhỏ nhất:</label>
                                                        <input type="text" value="${pricemin}" class="form-control" id="numberInput" name="pricemin" oninput="formatNumber(this)">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="maxValue">Giá trị lớn nhất:</label>
                                                        <input oninput="formatNumber(this)" type="text" value="${pricemax}" class="form-control" id="pricemax" name="pricemax">
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="row justify-content-center">
                                                    <div class="form-group mt-4 text-center">
                                                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                                    </div>
                                                </div>
                                                <div class="row justify-content-center text-center">
                                                    <div class="form-group mt-4 text-center">
                                                        <a type="button" class="btn btn-secondary"  href="managementproduct"> Cài lại</a>
                                                    </div>
                                                </div>
                                                <c:if test="${ep != null}">
                                                <div class="row justify-content-center">
                                                    <div class="form-group mt-4 text-center">
                                                        <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/ExportExcelProduct?name=${name}&brand_id=${brand_id}&type_id=${type_id}&pricemax=${pricemax}&pricemin=${pricemin}&listP=null&listP2=def">Xuất tệp</a>
                                                    </div>
                                                </div>
                                                </c:if>
                                                <c:if test="${ep == null}">
                                                <div class="row justify-content-center">
                                                    <div class="form-group mt-4 text-center">
                                                        <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/ExportExcelProduct?name=null&brand_id=0&type_id=0&pricemax=null&pricemin=null&listP2=abc&listP=null">Xuất tệp</a>
                                                    </div>
                                                </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <a class="btn btn-primary" href="addproduct">Thêm sản phẩm</a>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Mã</th>
                                                        <th scope="col">Tên</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Thương hiệu</th>
                                                        <th scope="col">Loại</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listP}" var="P" >
                                                        <tr>
                                                            <td>${P.product_id}</td>
                                                            <td>${P.product_name}</td>
                                                            <td>${helper.convertToVietnameseDong(P.price)}</td>
                                                            <td>${P.quantity}</td>
                                                            <td>
                                                                <c:forEach items="${listB}" var="B">
                                                                    <c:if test="${B.brand_id eq P.brand}">
                                                                        ${B.brand_name}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td>
                                                                <c:forEach items="${listT}" var="T">
                                                                    <c:if test="${T.type_id eq P.type}">
                                                                        ${T.type_name}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td>${P.status}</td>
                                                            <td>
                                                                <a href="update?pid=${P.product_id}"><button style="margin: 0.5px; padding: 5px 10px; font-size: 12px;" class="btn btn-primar">Cập nhập</button></a>
                                                                <c:choose>
                                                                    <c:when test="${P.status == 'true'}">
                                                                        <a href="delete?id=${P.product_id}&status=0"><button type="button" style="margin: 0.5px; padding: 5px 10px; font-size: 12px" class="btn btn-danger">Xóa</button></a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a href="delete?id=${P.product_id}&status=1"><button type="button" style="margin: 0.5px; padding: 5px 10px; font-size: 12px" class="btn btn-success">Hoạt động</button></a>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <c:if test="${tag!=null}">
                                        <div class="text-center mt-5">
                                            <ul class="pagination">
                                                <c:if test="${tag != 1}">
                                                    <li class="page-item"><a href="managementproduct?index=${tag-1 }">Previous</a></li>
                                                    </c:if> 	
                                                    <c:forEach begin="1" end="${endPage }" var="i">
                                                    <li class="${tag==i?"page-item active":"" }"><a href="managementproduct?index=${i }" class="page-link">${i }</a></li>  
                                                    </c:forEach>
                                                    <c:if test="${tag != endPage}">
                                                    <li class="page-item"><a href="managementproduct?index=${tag+1 }" class="page-link">Next</a></li>
                                                    </c:if> 
                                            </ul>
                                        </div>
                                    </c:if>



                                    <c:if test="${tag1!=null}">
                                        <div class="text-center mt-5">
                                            <ul class="pagination">
                                                <c:if test="${tag1 != 1}">
                                                    <li class="page-item"><a href="search?index=${tag1-1 }&name=${name}&brand_id=${brand_id}&type_id=${type_id}&num=${num}&pricemax=${pricemax}&pricemin=${pricemin}">Previous</a></li>
                                                    </c:if> 	
                                                    <c:forEach begin="1" end="${endPage1 }" var="i">
                                                    <li class="${tag1==i?"page-item active":"" }"><a href="search?index=${i }&name=${name}&brand_id=${brand_id}&type_id=${type_id}&num=${num}&pricemax=${pricemax}&pricemin=${pricemin}" class="page-link">${i }</a></li>  
                                                    </c:forEach>
                                                    <c:if test="${tag1 != endPage1}">
                                                    <li class="page-item"><a href="search?index=${tag1+1 }&name=${name}&brand_id=${brand_id}&type_id=${type_id}&num=${num}&pricemax=${pricemax}&pricemin=${pricemin}" class="page-link">Next</a></li>
                                                    </c:if> 
                                            </ul>
                                        </div>
                                    </c:if>

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

    <script>
        function formatNumber(input) {
            // Remove existing dots and non-numeric characters from the input value
            var value = input.value.replace(/\D/g, '');

            // Add dots as thousands separators
            var formattedValue = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');

            // Update the input value with the formatted value
            input.value = formattedValue;
        }
    </script>
</html>



