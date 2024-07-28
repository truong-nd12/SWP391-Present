<%-- 
    Document   : AddAccount
    Created on : Jan 25, 2024, 9:21:22 PM
    Author     : Dell
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Trang quản lý </title>
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
                                        <div>
                                            <h3 style="color: #177BB6; text-align: center; margin: 0">Thêm tài khoản</h3>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-3">
                                            </div>
                                            <div class="col-6">
                                                <form action="AddAccount" method="post">
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Tài khoản:</p>
                                                        </div>
                                                        <div class="col-8" >
                                                            <select name="account" class="form-control" >
                                                                <option value="customer">Khách hàng</option>
                                                                <option value="manager">Quản lý</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Tên người dùng:</p>
                                                        </div>
                                                        <div class="col-8">
                                                            <input class="form-control" type="text" name="name" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Email:</p>
                                                        </div>
                                                        <div class="col-8">
                                                            <input required="" class="form-control" type="email" name="email" value="" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Format: abc@gmail.com">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Số điện thoại:</p>
                                                        </div>
                                                        <div class="col-8">
                                                            <input required="" class="form-control" pattern="[0-9]{10}" minlength="10" maxlength="10" title="Please enter ten number" type="tel" name="phone" value="">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <p>Địa chỉ:</p>
                                                        </div>
                                                        <div class="col-8">
                                                            <input class="form-control" type="text" name="address" value="">
                                                        </div>
                                                    </div>
                                                    <div style="text-align: center;" >
                                                        <input type="submit" style="margin: 1px" class="btn btn-primary" value="Thêm">
                                                        <a href="AdminPage"><button type="button" style="margin: 1px" class="btn btn-primary">Quay lại</button></a>
                                                    </div>
                                                    <div style="text-align: center;" >
                                                        <p style="color: green; margin: 10px">${success}</p>
                                                        <p style="color: red; margin: 10px">${err}</p>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-3">
                                        </div>
                                    </div>
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
