<%-- 
    Document   : ManagerOrderDatail
    Created on : Feb 24, 2024, 2:43:08 PM
    Author     : Dell
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="convert" class="helper.Convert"/>

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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        </head>
    <jsp:include page="component/manager/header.jsp"></jsp:include>
        <body onload="autoClickButton()">
        <c:set var = "total" value = "${0.00}"/>
        <c:set var = "totalOd" value = "${0}"/>
        <c:set var = "totalToday" value = "${0.00}"/>
        <c:set var = "totalOdToday" value = "${0}"/>

        <c:forEach items="${requestScope.ordertotal}" var="o">
            <c:if test="${o.status!=4}">
                <c:set var="total" value="${total + o.getTotalPrice()}" />
            </c:if>
            <c:set var="totalOd" value="${totalOd + 1}" />

            <c:if test="${convert.convertDateToString(o.getOrder_date()).equals(convert.getCurrentDateAsString())}">
                <c:if test="${o.status!=4}">
                    <c:set var="totalToday" value="${totalToday + o.getTotalPrice()}" />
                </c:if>
                <c:set var="totalOdToday" value="${totalOdToday + 1}" />
            </c:if>
        </c:forEach>
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
                        <div class="row" >
                            <div class="col-lg-8" style="overflow-x: auto">

                                <div class="row">
                                    <div class="col-6">
                                        <h5>Thông tin đặt hàng</h5>
                                    </div>
                                    <div class="col-6">
                                        <a href="ManagerExportPdf?orderid=${order.order_id}"> Xuất tệp PDF</a>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <p>Mã đơn hàng: ${order.order_id}</p>
                                    </div>
                                    <div class="col-6">
                                        <p>Ngày đặt hàng: <fmt:formatDate pattern = "dd-MM-yyyy" value = "${order.order_date}" /></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6" style="display: flex">
                                        <p>Trạng thái thanh toán: </p>
                                        <c:choose>
                                            <c:when test="${order.payment_status==1}">
                                                <button type="button" style="height: 60%; color: white; background-color:#008000; font-size: 12px; border: none; border-radius: 3px" disabled="">Đã thanh toán</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button id="pstatus" type="button" onclick="window.location.href = 'ManagerOrderDetail?id=${order.order_id}&status=1'"  style="height: 60%; color: white; background-color:#da2828; font-size: 12px; border: none; border-radius: 3px" disabled="">Xác nhận thanh toán</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-6">
                                        <p>Phương thức thanh toán : ${order.payment_method}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6" style="display: flex">
                                        <p>Ngày giao hàng: <fmt:formatDate pattern = "dd-MM-yyyy" value = "${ship.getDelivery_date()}" /></p>
                                    </div>
                                    <div class="col-6" style="display: flex">
                                        <p>Ngày nhận hàng: <fmt:formatDate pattern = "dd-MM-yyyy" value = "${ship.getReceiving_date()}" /></p>
                                    </div>
                                </div>
                                <table class="table table-striped table-bordered px-4">
                                    <thead>
                                        <tr style="background-color: #177BB6; color: white">
                                            <th class="text-center" style="width: 15%">Sản phẩm</th>
                                            <th class="text-center" style="width: 30%">Tên</th>
                                            <th class="text-center" style="width: 25%">Đơn giá </th>
                                            <th class="text-center" style="width: 5%">Số lượng</th>
                                            <th class="text-center" style="width: 25%">Tổng tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orderdetail}" var="i" varStatus="counter">
                                            <tr>
                                                <td class="text-center">                                        
                                                    <img style="max-width: 100%;" src="product_image/${pro.getNameById(i.product_id).getImg_list().get(0).getUrl()}" />
                                                </td>
                                                <td class="text-center">${pro.getNameById(i.product_id).product_name}</td>
                                                <td class="text-center" style="color: red">${convert.convertToVietnameseDong(i.price)}</td>
                                                <td class="text-center">${i.quantity}</td>
                                                <td class="text-center" style="color: red">${convert.convertToVietnameseDong(i.price*i.quantity)}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-6" style="text-align: center">
                                        <h5 >Tổng đơn hàng: </h5><!-- End .summary-title -->
                                    </div>
                                    <div class="col-6" style="text-align: center;padding-left: 0">
                                        <h5 style="color: red">${convert.convertToVietnameseDong(order.totalPrice)}</h5><!-- End .summary-title -->
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-2" style="padding: 7px;">
                                        <a href="ManagerPage" style="font-size: 15px;margin-left: 10px" ><i class="fa fa-angle-double-left"></i> Quay lại </a><!-- End .summary-title -->
                                    </div>
                                    <div class="col-10" style="text-align: center" >
                                        <form action="ManagerOrderDetail" method="post">
                                            <input id="orderinvoice" type="hidden" name="id" value="${order.order_id}">
                                            <c:choose>
                                                <c:when test="${order.status==0}">
                                                    <input type="submit" name="corder" value="Đã hủy" class="btn btn-danger">            
                                                    <input type="submit" id="conorder" name="conorder" value="Xác nhận" class="btn btn-primary" disabled>            
                                                </c:when>
                                                <c:when test="${order.status==1}">
                                                    <input type="button" id="myButton" value="Thêm bảo hành" class="btn btn-danger" data-toggle="modal" data-target="#myModal" disabled>            
                                                    <input type="submit" id="shipping" name="sorder" value="Vận chuyển" class="btn btn-primary" disabled>            
                                                </c:when>
                                                <c:when test="${order.status==2}">
                                                    <input type="button" name="rorder" value="Quay lại" class="btn btn-danger" data-toggle="modal" data-target="#myModal1">            
                                                    <input type="submit" id="comorder" name="comorder" value="Hoàn thành" class="btn btn-primary" disabled="">            
                                                    <div class="modal" id="myModal1" tabindex="-1" role="dialog"  aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered mo">
                                                            <!-- Modal content-->
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title">Xác nhận lại</h4>
                                                                    <button type="button" style="color: white; background-color: #da2828; border: none" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <p>Bạn có muốn cập nhật lại trạng thái đơn hàng không?</p>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal" >Đóng</button>
                                                                    <input type="submit" name="rorder" value="Ok" class="btn btn-success">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${order.status==3}">
                                                    <input type="submit"  value="Đã hoàn thành" class="btn btn-success" disabled="">            
                                                </c:when>
                                                <c:when test="${order.status==4}">
                                                    <input type="submit"  value="Đã hủy" class="btn btn-danger" disabled="">            
                                                </c:when>
                                                <c:when test="${order.status==5}">
                                                    <input type="submit"  value="Quay lại" class="btn btn-danger" disabled="">            
                                                </c:when>
                                            </c:choose>
                                        </form>
                                        <div class="modal" id="myModal" tabindex="-1" role="dialog"  aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered mo">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <form action="ManagerOrderDetail" method="get" onsubmit="return validateForm(this)">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Thêm bảo hành</h4>
                                                            <input type="hidden" name="id" value="${order.order_id}">
                                                            <button type="button" style="color: white; background-color: #da2828; border: none" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body" style="text-align: start">
                                                            <c:forEach items="${orderdetail}" var="i" varStatus="counter">
                                                                <h5>${pro.getNameById(i.product_id).product_name} (${i.product_id})</h5>
                                                                <c:set var="stag" value="${pro.getServiceTagById(order.order_id,i.product_id)}" />
                                                                <c:forEach begin="1" end="${i.quantity}" varStatus="con">
                                                                    <div style="display: flex">
                                                                        <p>${i.product_id}_(${con.count}) : </p>
                                                                        <c:set var="sta" value="a_${i.product_id}_${con.count}" />
                                                                        <input type="text" name="a_${i.product_id}_${con.count}" value="${stag.size()==0? param[sta]:stag.get(con.count-1).service_tag}" style="height: 50%" required>
                                                                    </div>
                                                                </c:forEach>
                                                            </c:forEach>
                                                            <p style="color: red">${err}</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button"  class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                                            <input type="submit" name="addtag" value="Thêm" class="btn btn-success">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4" style=" border-radius: 10px; margin-bottom: 15px">
                                <div  style="margin-bottom: 10px">
                                    <h5>Tiếp nhận thông tin</h5>
                                    <br>
                                    <input type="hidden" name="id" value="${order.order_id}">
                                    <input style="width: 100%; padding: 10px" type="text" name="name" value="${ship.getName()}" placeholder="Tên của bạn" id="check" disabled required>
                                    <hr>
                                    <input style="width: 100%; padding: 10px" type="tel"  name="phone" value="${ship.getPhone()}" pattern="^(09|05|08|03)[0-9]{8}" title="Please enter valid phone number" placeholder="Số điện thoại của bạn" id="check" disabled required >
                                    <hr>
                                    <select style="width: 100%; padding: 10px" id="city" name="city" disabled required>
                                        <option value="${address[3]}" selected>${address[3]}</option>           
                                    </select>
                                    <hr>
                                    <select style="width: 100%; padding: 10px" id="district" name="district" disabled required >
                                        <option value="${address[2]}" selected>${address[2]}</option>
                                    </select>
                                    <hr>
                                    <select style="width: 100%; padding: 10px" id="ward" name="ward" disabled required>
                                        <option value="${address[1]}" selected>${address[1]}</option>
                                    </select>
                                    <hr>
                                    <input style="width: 100%; padding: 10px" type="text" name="address" value="${address[0]}" placeholder="Địa chỉ của bạn" id="check" disabled required>
                                    <hr>
                                    <textarea  style="width: 100%;  padding: 10px" name="note" rows="3" id="check" disabled placeholder="Ghi chú (tùy chọn)">${ship.getNote()}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sale & Revenue End -->
                </div>
                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                &copy; <a href="#">Smart Tech</a>. 
                            </div>
                            <div class="col-12 col-sm-6 text-center text-sm-end">

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer End -->
            </div>
        </div>
        <script>
            if (${pro.getServiceTagById(order.order_id,orderdetail.get(0).product_id).size()==0}) {
                document.getElementById('shipping').disabled = true;
                document.getElementById('myButton').disabled = false;
            } else {
                document.getElementById('shipping').disabled = false;
                document.getElementById('myButton').disabled = true;
            }
            function autoClickButton() {
                if (${err!=null}) {
                    document.getElementById('myButton').click();
                }
            }
            function validateForm(form) {
                const inputFields = form.querySelectorAll('input[type="text"]');
                const fieldValues = Array.from(inputFields).map(field => field.value);

                if (hasDuplicates(fieldValues)) {
                    alert("Please ensure all fields have different values.");
                    return false;
                }
                return true;
            }

            function hasDuplicates(arr) {
                const uniqueValues = new Set(arr);
                return uniqueValues.size !== arr.length;
            }
        </script>
        <script>
            document.getElementById("formSelect").addEventListener("change", function () {
                document.getElementById("selectPage").submit();
            });
        </script>
        <script>
            if (${order.payment_status==2}||(${order.payment_status==0}&&${order.payment_method.equals("VNPay")})) {
                document.getElementById("conorder").disabled = true;
            } else {
                document.getElementById("conorder").disabled = false;
            }

        </script>
        <script>
            if (${order.payment_status==1}) {
                document.getElementById("comorder").disabled = false;
            } else {
                document.getElementById("comorder").disabled = true;
            }

        </script>
        <script>
            if (${order.payment_status==2}) {
                if (${order.status==0} ||${order.status==4}) {
                    document.getElementById("pstatus").disabled = false;
                } else {
                    document.getElementById("pstatus").disabled = true;
                }
            } else {
                if (${order.status==2}) {
                    document.getElementById("pstatus").disabled = false;
                } else {
                    document.getElementById("pstatus").disabled = true;
                }
            }
        </script>
        <script>
            var citis = document.getElementById("city");
            var districts = document.getElementById("district");
            var wards = document.getElementById("ward");
            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };
            var promise = axios(Parameter);
            promise.then(function (result) {
                renderCity(result.data);
            });

            function renderCity(data) {
                for (const x of data) {
                    citis.options[citis.options.length] = new Option(x.Name, x.Name);
                }
                citis.onchange = function () {
                    district.length = 1;
                    ward.length = 1;
                    district.options[0] = new Option("", "");
                    ward.options[0] = new Option("", "");
                    if (this.value != "") {
                        const result = data.filter(n => n.Name === this.value);

                        for (const k of result[0].Districts) {
                            district.options[district.options.length] = new Option(k.Name, k.Name);
                        }
                    }
                };
                district.onchange = function () {
                    ward.length = 1;
                    const dataCity = data.filter((n) => n.Name === citis.value);
                    if (this.value != "") {
                        const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

                        for (const w of dataWards) {
                            wards.options[wards.options.length] = new Option(w.Name, w.Name);
                        }
                    }
                };
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const myLineChart = new Chart("myChart", {
                type: "line",
                data: {
                    labels: [50, 60, 70, 80, 90, 100, 10, 120, 130, 140, 150],
                    datasets: [
                        {
                            label: '(VND)',
                            backgroundColor: "white",
                            borderColor: "#177bb6",
                            data: [7, 8, 8, 9, 9, 9, 3, 11, 14, 14, 15],
                        },
                    ],
                },
                options: {
                    // Customize chart options here
                },
            });
            var a = 25;
            const myBarChart1 = new Chart("myChart1", {
                type: "bar",
                data: {
                    labels: ["Italy", "France", "Spain", "USA", "Argentina"],
                    datasets: [
                        {
                            label: "(VND)",
                            backgroundColor: "#177bb6",
                            data: [a, 49, 44, 24, 60],
                        },
                    ],
                },
                options: {
                },
            });
        </script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="component/manager/js/main.js"></script>
    </body>

</html>
