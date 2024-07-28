
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center col-md-6 mt-5" style="margin-left: 40%">
    <nav class="text-center" aria-label="Page navigation example">
        <c:choose>          
            <c:when test="${requestScope.paging.getTotalPage() < 2}">
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </c:when>
            <c:when test="${requestScope.paging.page < 2}">
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">                               
                        <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}">Tiếp</a></li>
                    </ul>
                </nav>
            </c:when>
            <c:when test="${requestScope.paging.page+1 > requestScope.paging.getTotalPage()}">
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}">Trước</a></li>
                            <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </c:when>
            <c:otherwise>
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page-1}">Trước</a></li>
                            <c:forEach begin="1" end="${requestScope.paging.getTotalPage()}" var="i">
                            <li class="page-item ${i == requestScope.paging.page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${requestScope.paging.page+1}">Tiếp</a></li>
                    </ul>
                </nav>
            </c:otherwise>
        </c:choose>
    </nav>
</div>






