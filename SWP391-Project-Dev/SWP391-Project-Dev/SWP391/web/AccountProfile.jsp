<%-- 
    Document   : AccountProfile
    Created on : Jan 25, 2024, 3:35:16 PM
    Author     : Dell
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Trang quản lý</title>
        <link rel="shortcut icon" type="image/png" href="assets/images/logo_2.png"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

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
                        <div class="container pt-4 px-4">
                            <div class="row g-4 mt-10">
                                <!-- Button trigger modal -->
                                <div class="card">
                                    <div class="card-body">
                                    <c:if test="${admin!=null}">
                                        <div>
                                            <h3 style="color: #177BB6; text-align: center; margin: 0">Hồ sơ quản lý</h3>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-3">
                                            </div>
                                            <div class="col-6">
                                                <form  action="AccountProfile" enctype="multipart/form-data" method="post">
                                                    <div  style="text-align: center; margin-bottom: 5px">
                                                        <img src="images/${admin.getAvatar()}" alt="avatar" class="rounded-circle img-fluid" style="width: 150px; height:150px ">
                                                    </div>
                                                    <div style="text-align: center;">
                                                        <input type="file" accept="image/*" class="form-change" name="photo" style="border: 1px #000 solid" >
                                                        <p style="color: red">${err}</p>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Tên người dùng:</p>
                                                        </div>
                                                        <div class="col-8">
                                                            <input class="form-control" type="hidden" name="id" value="${admin.getAccount_id()}">
                                                            <input class="form-control" type="text" name="name" value="${admin.getAcc_name()}" required>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Email:</p>
                                                        </div>
                                                        <div class="col-8">
                                                            <input class="form-control" type="email" name="email" value="${admin.getEmail()}" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Format: abc@gmail.com">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Số điện thoại:</p>
                                                        </div>
                                                        <div class="col-8">
                                                            <input class="form-control" pattern="[0-9]{10}" minlength="10" maxlength="10" title="Please enter ten number" type="tel" name="phone" value="${admin.getPhone()}">
                                                        </div>
                                                    </div>
                                                    <div class="row" style="text-align: center; display: flex" >
                                                        <div class="col-3">
                                                        </div>
                                                        <div class="col-3">
                                                            <button type="submit" style="margin: 1px" class="btn btn-primary">Cập nhật</button>
                                                        </div>
                                                        <div class="col-2">
                                                            <a href="AdminPage"><button type="button" style="margin: 1px" class="btn btn-primary">Trở lại</button></a>
                                                        </div>
.                                                        <div class="col-4">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="col-3">
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${account!=null}">
                                        <div>
                                            <h3 style="color: #177BB6; text-align: center; margin: 10px"> Hồ sơ khách hàng</h3>
                                        </div>
                                        <div class="row align-items-center justify-content-center">
                                            <img src="images/${account.getAvatar()}" alt="avatar" class="rounded-circle img-fluid" style="width: 170px; height:150px ">
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-3">
                                            </div>
                                            <div class="col-6">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <p>Tên người dùng:</p>
                                                    </div>
                                                    <div class="col-8">
                                                        <input class="form-control" type="text" name="customerName" value="${account.getCus_name()}" readonly>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <p>Email:</p>
                                                    </div>
                                                    <div class="col-8">
                                                        <input class="form-control" type="text" name="customerName" value="${account.getEmail()}" readonly>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <p>Số điện thoại:</p>
                                                    </div>
                                                    <div class="col-8">
                                                        <input class="form-control" type="text" name="customerName" value="${account.getPhone()}" readonly>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <p>Địa chỉ:</p>
                                                    </div>
                                                    <div class="col-8">
                                                        <input class="form-control" type="text" name="customerName" value="${account.getAddress()}" readonly>
                                                    </div>
                                                </div>
                                                <div class="row" style="text-align: center">
                                                    <a href="AdminPage"><button style="margin: 1px" class="btn btn-primary">Trở lại</button></a>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                            </div>
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

</html>
