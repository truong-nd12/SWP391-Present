<%-- 
    Document   : ManagerOrder
    Created on : Feb 22, 2024, 10:39:59 AM
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
        <body>
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
                        <div class="row g-4 mt-10">
                            <div class="row g-4">
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-line fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Đơn hàng hôm nay</p>
                                            <h6 class="mb-0">${totalOdToday}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng đơn hàng</p>
                                            <h6 class="mb-0">${totalOd}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-area fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Doanh thu hôm nay</p>
                                            <h6 class="mb-0">${convert.convertToVietnameseDong(totalToday)}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng doanh thu</p>
                                            <h6 class="mb-0">${convert.convertToVietnameseDong(total)}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4">
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light text-center rounded p-4">
                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                            <h6 class="mb-0">Doanh thu tháng</h6>
                                            <select id="year" name="year">
                                                <script>
                                                    var date = new Date();
                                                    var year = date.getFullYear();
                                                    for (var i = year - 3; i <= year; i++) {
                                                        var option = document.createElement("option");
                                                        option.value = option.innerHTML = i;
                                                        if (i === year)
                                                            option.selected = true;
                                                        document.getElementById("year").appendChild(option);
                                                    }
                                                </script>
                                            </select>
                                        </div>
                                        <div id="set1_">
                                            <canvas id="myChart1" style="width: 100%; max-width: 700px;"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light text-center rounded p-4" >
                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                            <h6 class="mb-0">Doanh thu ngày</h6>
                                            <select id="month" name="month">
                                            </select>
                                        </div>
                                        <div id="set_">
                                            <canvas id="myChart" style="width: 100%; max-width: 700px;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="text-align: center; margin: 20px 0px;">
                                <button style="background-color: #177BB6; border: none; border-radius: 5px; color: white; padding: 5px; font-size: 14px"><a style="color: white" id="link" href="ManagerExport?year=${param.month}&month=${param.year}"> Xuất tệp Excel</a></button>
                            </div>
                            <div class="row g-4" >
                                <div class="bg-light text-center rounded p-4">
                                    <form action="ManagerPage" method="get">
                                        <div class="row" style="text-align: start">
                                            <div class="col-2">
                                                <label>Tên người dùng</label>
                                                <input class="form-control" type="text" name="cusname" value="${param.cusname}">
                                            </div>
                                            <div class="col-3">
                                                <label>Ngày đặt hàng</label>
                                                <input class="form-control" type="date" name="date" value="${param.date}">
                                            </div>
                                            <div class="col-3">
                                                <label>Tổng giá </label>
                                                <select name="price" id="price" class="form-select" >
                                                    <option value="" selected></option>
                                                    <c:forEach items="${sessionScope.orderPrice}" var="b" varStatus="counter">
                                                        <option value="${counter.count-1}">${b}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-2">
                                                <label>Tình trạng đơn hàng</label>
                                                <select name="status" id="status" class="form-select" >
                                                    <option value="" selected></option>
                                                    <c:forEach items="${sessionScope.orderStatus}" var="b" varStatus="counter">
                                                        <option value="${counter.count-1}">${b}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-2">
                                                <div class="form-group mt-4 ">
                                                    <button type="submit" name="sub"  style="background-color: #177BB6; border: none; border-radius: 3px; color: white; padding: 5px; font-size: 14px">Tìm kiếm</button>
                                                    <button type="button"  style="background-color: #177BB6;border: none; border-radius: 3px; padding: 5px; font-size: 14px" ><a href="ManagerPage" style="color: white">Cài lại</a></button>
                                                </div>        
                                            </div>        
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row pt-4 px-4">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">Bán hàng gần đây </h6>
                                        <a href="ManagerPage?action=all">Xem tất cả</a>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered px-4" >
                                            <thead>
                                                <tr style="background-color: #177BB6; color: white">
                                                    <th class="text-center" style="width: 12%">Mã đơn hàng</th>
                                                    <th class="text-center" style="width: 15%">Ngày đặt hàng</th>
                                                    <th class="text-center" style="width: 17%">Tổng giá</th>
                                                    <th class="text-center" style="width: 18%">Tình trạng thanh toán</th>
                                                    <th class="text-center" style="width: 18%">Trạng thái đơn hàng</th>
                                                    <th class="text-center" style="width: 20%">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${order}" var="od">
                                                    <tr>
                                                        <td class="text-center">${od.order_id}</td>
                                                        <td class="text-center"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${od.order_date}" /></td>
                                                        <td class="text-center">${convert.convertToVietnameseDong(od.totalPrice)}</td>
                                                        <td class="text-center">${od.getPayment_status()==0?"Đang thanh toán":od.getPayment_status()==2?"Đợi...(VNPay)":"Đã thanh toán"}</td>
                                                        <td class="text-center">
                                                            <c:if test="${od.status==0}">
                                                                <p style="color: #177BB6">Xác nhận</p>
                                                            </c:if>
                                                            <c:if test="${od.getStatus()==1}">
                                                                <p style="color: #177BB6">Đang vận chuyển</p>
                                                            </c:if>
                                                            <c:if test="${od.status==2}">
                                                                <p style="color: #177BB6">Đã nhận hàng</p>
                                                            </c:if>
                                                            <c:if test="${od.status==3}">
                                                                <p style="color: green">Hoàn thành</p>
                                                            </c:if>
                                                            <c:if test="${od.status==4}">
                                                                <p style="color: red">Đã hủy</p>
                                                            </c:if>
                                                            <c:if test="${od.status==5}">
                                                                <p>Đang vận chuyển</p>
                                                            </c:if>
                                                        </td>
                                                        <td class="text-center">
                                                            <button class="btn btn-primary" style="background-color: #177BB6"><a href="ManagerOrderDetail?id=${od.order_id}" style="color: white;">Xem thông tin</a></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:set var="pagination_url" value="${pageContext.request.contextPath}/ManagerPage?"></c:set>
                                    <nav class="d-flex justify-content-center">
                                        <ul class="pagination">
                                        <c:if test="${requestScope.paging.getTotalPage()==0}">
                                            <h3 style="color: red">Không có kết quả phù hợp !!!</h3>
                                        </c:if>
                                        <c:if test="${requestScope.paging.getTotalPage()!=0&&requestScope.paging.getTotalPage()!=null}">
                                            <c:if test="${requestScope.paging.page != 1}">
                                                <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}&cusname=${param.cusname}&date=${param.date}&price=${param.price}&status=${param.status}">Trang trước</a></li>
                                                </c:if>
                                                <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                                                <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&cusname=${param.cusname}&date=${param.date}&price=${param.price}&status=${param.status}">${i}</a></li>
                                                </c:forEach>
                                                <c:if test="${requestScope.paging.page != requestScope.paging.getTotalPage() }">
                                                <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}&cusname=${param.cusname}&date=${param.date}&price=${param.price}&status=${param.status}">Trang sau</a></li>
                                                </c:if>
                                            </c:if>
                                    </ul>
                                </nav>
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
            document.getElementById("formSelect").addEventListener("change", function () {
                document.getElementById("selectPage").submit();
            });
        </script>
        <script>
            document.getElementById('price').value = '${param.price}';
        </script>
        <script>
            document.getElementById('status').value = '${param.status}';
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            var select = document.getElementById("year");
            function doSomething() {
                var totals = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                var sday = "${sday}";
                var snumber = "${snumber}";
                var data1 = sday.split(",");
                var data2 = snumber.split(",");
                for (var i = 0; i < data1.length; i++) {
                    var date = data1[i];
                    var number = data2[i];
                    var parsedDate = new Date(date);
                    var day = parsedDate.getDate();
                    var month = parsedDate.getMonth();
                    var year = parsedDate.getFullYear();
                    var key = month;
                    if (year == select.value) {
                        if (totals[key]) {
                            totals[key] += Number(number);
                        } else {
                            totals[key] = Number(number);
                        }
                    }
                }
                const myBarChart1 = new Chart("myChart1", {
                    type: "bar",
                    data: {
                        labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
                        datasets: [
                            {
                                label: "(VND)",
                                backgroundColor: "#177bb6",
                                data: [totals[0], totals[1], totals[2], totals[3], totals[4], totals[5], totals[6], totals[7], totals[8], totals[9], totals[10], totals[11]],
                            },
                        ],
                    }
                });
                var date = new Date();
                var month;
                if (date.getFullYear() == select.value) {
                    month = date.getMonth() + 1;
                } else {
                    month = 12;
                }
//                document.getElementById("month").empty();
                let selecte = $("#month");
                selecte.empty()
                for (var i = 1; i <= month; i++) {
                    var option = document.createElement("option");
                    option.value = option.innerHTML = i;
                    if (i === date.getMonth() + 1)
                        option.selected = true;
                    selecte.append(option);
                }

            }
            function reMove() {
                var canvas = document.getElementById("myChart1");
                canvas.remove();
                var div = document.getElementById("set1_");
                div.innerHTML = "<canvas id=\"myChart1\" style=\"width: 100%; max-width: 700px;\"></canvas>";
            }
            doSomething();
            select.addEventListener("change", reMove);
            select.addEventListener("change", doSomething);
            select.addEventListener("change", reMove2);
            select.addEventListener("change", doSomething2);
            var selectday = document.getElementById("month");
            function doSomething2() {
                var totals = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                var sday = "${sday}";
                var snumber = "${snumber}";
                var data1 = sday.split(",");
                var data2 = snumber.split(",");
                for (var i = 0; i < data1.length; i++) {
                    var date1 = data1[i];
                    var number = data2[i];
                    var parsedDate = new Date(date1);
                    var day = parsedDate.getDate();
                    var month = parsedDate.getMonth();
                    var year = parsedDate.getFullYear();
                    var key = day;
                    if (year == select.value && month + 1 == selectday.value) {
                        if (totals[key - 1]) {
                            totals[key - 1] += Number(number);
                        } else {
                            totals[key - 1] = Number(number);
                        }
                    }
                }
                let date = new Date(select.value, selectday.value, 1);
                date.setMonth(date.getMonth());
                date.setDate(date.getDate() - 1);
                var labels = [];
                for (let i = 1; i <= date.getDate(); i++) {
                    labels.push(i);
                }
                var data = [];
                for (let i = 1; i <= date.getDate(); i++) {
                    data.push(totals[i - 1]);
                }
                var existingChart = window.chart;
                if (existingChart) {
                    existingChart.destroy();
                }
                existingChart = new Chart("myChart", {
                    type: "line",
                    data: {
                        labels: labels,
                        datasets: [
                            {
                                label: '(VND)',
                                backgroundColor: "white",
                                borderColor: "#177bb6",
                                data: data,
                            },
                        ],
                    }
                });

            }
            function  reMove2() {
                var canvas = document.getElementById("myChart");
                canvas.remove();
                var div = document.getElementById("set_");
                div.innerHTML = "<canvas id=\"myChart\" style=\"width: 100%; max-width: 700px;\"></canvas>";
            }
            doSomething2();
            selectday.addEventListener("change", reMove2);
            selectday.addEventListener("change", doSomething2);
        </script>
        <script src="component/manager/js/main.js"></script>
        <script>
            var selectlink = document.getElementById("year");
            var selectdaylink = document.getElementById("month");
            selectday.addEventListener("change", setlinkfun);
            selectdaylink.addEventListener("change", setlinkfun);
            function  setlinkfun() {
                const ayear = document.getElementById('year').value;
                const amonth = document.getElementById('month').value;
                var setlink = "ManagerExport?year=" + ayear + "&month=" + amonth;
                document.getElementById('link').href = setlink;
            }
            setlinkfun();
        </script>
    </body>

</html>
