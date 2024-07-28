
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar" >
    <div class="row container-fluid">
        <div class="col-4">
            <a href="ManagerNew">
                <h3 class="text-primary"><img src="assets/images/logo_S.jpg" width="200" height="35"></h3>
            </a>
        </div>
        <div class="col-8" style="text-align: right;" >
            
            <c:choose>
                <c:when test="${sessionScope.cus!=null}">
                    <a >
                        <span id="avatar" style="color:#177bb6; margin-left: 20px;"><i class="fas fa-user-alt fa-lg"></i>
                            ${sessionScope.acc.getAcc_name()}</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <span id="avatar" style="color:#177bb6; margin-left: 20px;"><i class="fas fa-user-alt fa-lg"></i>
                        ${sessionScope.acc.getAcc_name()}</span>
                    </c:otherwise>
                </c:choose>
                <c:if test="${sessionScope.acc!=null}">
                <a href="LogOut" style="margin-left: 12px">
                    <button  style="background-color: #177bb6; color: white;border: 1px #177bb6 solid; border-radius: 5px" >Đăng xuất</button>
                </a>
            </c:if>    
        </div>
    </div>
</nav>

