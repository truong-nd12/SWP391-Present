

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
                            <!-- Button trigger modal -->
                            <div class="card">
                                <div class="card-body">
                                    <form action="update-guarantee" method="get">
                                        <div class="row text-center">
                                            <h1 >Bảo hành</h1>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4>Thông tin khách hàng</h4>
                                                <c:if test="${guarantee_record.creator_id > 0}">
                                                    <label style="color: #177bb6">Người tạo</label>
                                                    <input class="form-control" type="text" value="${guaranteeDAO.getCreatorNameById(guarantee_record.creator_id)}" readonly=""/>
                                                </c:if>
                                                </h6>
                                                <c:if test="${requestScope.guarantee_record.status == 1}">
                                                    <input type="hidden" name ="creatorId" value="${creatorId}"/>
                                                    <input type="hidden" name="customerId" value="${requestScope.customer.customer_id}">
                                                </c:if>
                                                <div class="form-group">
                                                    <label style="color: #177bb6">Tên</label>
                                                    <input class="form-control" type="text" name="customerName" value="${requestScope.customer.cus_name}" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label style="color: #177bb6">Số điện thoại</label>
                                                    <input class="form-control" type="tel" name="customerPhone" value="${requestScope.customer.phone}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <h4>Thời hạn bảo hành</h4>
                                                <input type="hidden" name="customerId" value="${requestScope.customer.customer_id}">
                                                <div class="form-group">
                                                    <label style="color: #177bb6">Ngày bắt đầu</label>
                                                    <input class="form-control" required="" type="date" name="startDate" value="${requestScope.order.order_date}" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label style="color: #177bb6">Ghi chú</label>
                                                    <input class="form-control" type="text" name="note" value="${requestScope.guarantee_record.note}" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <c:if test="${requestScope.guarantee_record.status == 2}">
                                                        <label style="color: #177bb6">Ngày kết thúc</label>
                                                        <input class="form-control" type="date" required="" id="dateInput" name="dateReturn" onchange="validateDate(this)"  value="${requestScope.guarantee_record.return_date}"/>
                                                        <script>
                                                            const today = new Date().toISOString().split('T')[0];
                                                            document.getElementById('dateInput').setAttribute('min', today);
                                                        </script>
                                                    </c:if>
                                                    <c:if test="${requestScope.guarantee_record.status == 3}">
                                                        <label style="color: #177bb6">Ngày kết thúc</label>
                                                        <input class="form-control" type="date" readonly="" name="dateReturn"  value="${requestScope.guarantee_record.return_date}"/>
                                                    </c:if>
                                                    <c:if test="${requestScope.guarantee_record.status == 1}">
                                                        <input class="form-control" type="hidden" name="dateReturn" value="0"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <table class="table table-striped"> 
                                                <thead>
                                                    <tr style="color: #177bb6">
                                                        <th>#</th>
                                                        <th>Mã sản phẩm</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th> Ảnh</th>
                                                        <th>Trạng thái </th>
                                                        <th>Hạn bảo hành</th>
                                                        <th>Lỗi</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>${requestScope.product.product_id}</td>
                                                        <td>${requestScope.product.product_name}</td>
                                                        <td>
                                                            <img width="50px" height="50px" src="guarantee_image/${requestScope.guarantee_record.image}" alt="alt"/>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${requestScope.guarantee_record.status == 1}">
                                                                    <p class="text-secondary font-weight-bold">Đợi</p>
                                                                </c:when>
                                                                <c:when test="${requestScope.guarantee_record.status == 2}">
                                                                    <p class="text-success">Xác nhận</p>
                                                                </c:when>
                                                                <c:when test="${requestScope.guarantee_record.status == 3}">
                                                                    <p class="text-success">Hoàn thành</p>
                                                                </c:when>
                                                                <c:when test="${requestScope.guarantee_record.status == 4}">
                                                                    <p class="text-danger">Hủy</p>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>${requestScope.remain} tháng</td>

                                                        <td>
                                                            <c:if test="${requestScope.guarantee_record.status == 1}">
                                                                <div class="form-group">
                                                                    <select required name="type" id="type" class="form-control">
                                                                        <option value="" selected disabled>Chọn loại lỗi</option>
                                                                        <option value="Lỗi của nhà sản xuất">Lỗi của nhà sản xuất</option>
                                                                        <option value="Lỗi do người dùng">Lỗi do người dùng</option>
                                                                    </select>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${requestScope.guarantee_record.status != 1}">
                                                                ${requestScope.guarantee_record.type}
                                                            </c:if>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                            </div>
                                            <div class="col-md-8">
                                                <div id="userErrorForm" style="display: none;text-align: center;">
                                                    <h5 style="color: #177bb6">Tạo đơn hàng mới:</h5>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <input placeholder="Product Name" name="name"  type="text" id="addPrNa" class="form-control" />
                                                        </div>
                                                        <div class="col-md-3" style="text-align: end">
                                                            <input placeholder="Quantity" name="quantity" type="number" min="1"  id="addPrQu" class="form-control"  />
                                                        </div>
                                                        <div class="col-md-5" style="text-align: end" >
                                                            <input id="addpro" class="btn btn-primary" style="background-color: #177BB6" type="button" value="Add Product" disabled="" />
                                                            <button style="background-color: #177BB6" class="btn btn-primary"><a href="detail-guarantee?guaranteeId=${requestScope.guarantee_record.record_id}&creatorId=${creatorId}" style="color: white">Cài lại</a></button>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <p id="error" style="color: red"></p>
                                                    </div>
                                                    <hr>
                                                    <div>
                                                        <table style="width: 100%">
                                                            <thead>
                                                                <tr style="background-color: #177BB6; color: white">
                                                                    <th class="text-center" style="width: 40%">Tên sản phẩm</th>
                                                                    <th class="text-center" style="width: 20%">Số lượng</th>
                                                                    <th class="text-center" style="width: 40%">Giá</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tableBody">

                                                            </tbody>
                                                        </table> 
                                                    </div>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <input type="hidden" name="guaranteeId" value="${requestScope.guarantee_record.record_id}">
                                            <c:if test="${requestScope.guarantee_record.status == 1}">
                                                <input class="btn btn-primary" name="status" type="hidden" value="2" />
                                                <input id="myButton" class="btn btn-primary" style="background-color: #177BB6" type="submit" value="Confirm request" disabled="" />
                                            </c:if>
                                            <c:if test="${requestScope.guarantee_record.status == 2}">
                                                <input class="btn btn-primary" name="status" type="hidden" value="3" />
                                                <input class="btn btn-primary" style="background-color: #177BB6" type="submit" value="Complete"/>
                                            </c:if>
                                            <c:if test="${requestScope.guarantee_record.status == 3}">
                                                <a class="btn btn-primary" style="background-color: #177BB6" href="ExportPDF?guaranteeId=${requestScope.guarantee_record.record_id}&creatorId=${creatorId}"> Xuất tệp PDF</a>
                                            </c:if>

                                        </div>
                                    </form>
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

        <script>
            var dropdown = document.getElementById('type');
            var userErrorForm = document.getElementById('userErrorForm');

            // Add an event listener to the dropdown
            dropdown.addEventListener('change', function () {
                if (dropdown.value == 'User errors') {
                    userErrorForm.style.display = 'block';
                } else {
                    userErrorForm.style.display = 'none';
                }
            });
        </script>
        <script>
            function formatCurrency(number) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
            }
            var productNameInput = document.getElementById('addPrNa');
            var quantityInput = document.getElementById('addPrQu');
            var addButton = document.getElementById('addpro');
            var tableBody = document.getElementById('tableBody');
            var myButton = document.getElementById('myButton');
            var dropdown = document.getElementById('type');
            var userErrorForm = document.getElementById('userErrorForm');
            dropdown.addEventListener('change', function () {
                if (dropdown.value == 'User errors') {
                    userErrorForm.style.display = 'block';
                    myButton.disabled = true;
                } else {
                    userErrorForm.style.display = 'none';
                    myButton.disabled = false;
                }
            });
            myButton.disabled = false;
            productNameInput.addEventListener('input', validateInputs);
            quantityInput.addEventListener('input', validateInputs);
            // Function to validate the input fields
            function validateInputs() {
                if (productNameInput.value.trim() !== '' && quantityInput.value.trim() !== '') {
                    addButton.disabled = false; // Enable the button
                } else {
                    addButton.disabled = true; // Disable the button
                }
            }
            addButton.addEventListener('click', function () {
                const newRow = document.createElement('tr');
                const productNameCell = document.createElement('td');
                const quantityCell = document.createElement('td');
                const priceCell = document.createElement('td');

                var dataToSend = {
                    key1: productNameInput.value,
                    key2: quantityInput.value
                };
                var url = 'detail-guarantee';
                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(dataToSend)
                })
                        .then(function (response) {
                            if (response.ok) {
                                return response.json();
                            } else {
                                throw new Error('Error sending data: ' + response.status);
                            }
                        })
                        .then(function (data) {
                            if (data.key1 == "") {
                                document.getElementById('error').innerHTML = 'Please check product name, quantity or add new product ' + productNameInput.value;
                            } else {
                                var key1 = data.key1;
                                var key2 = data.key2;
                                var key3 = data.key3;
                                productNameCell.textContent = key1;
                                quantityCell.textContent = key2;
                                priceCell.textContent = formatCurrency(key3);
                                priceCell.style.color = 'red';
                                newRow.appendChild(productNameCell);
                                newRow.appendChild(quantityCell);
                                newRow.appendChild(priceCell);
                                tableBody.appendChild(newRow);
                                myButton.disabled = false;
                                document.getElementById('error').innerHTML = '';
                            }
                        })
                        .catch(function (error) {
                            console.error('Error sending data:', error);
                        });
            });
        </script>
    </body>

</html>
