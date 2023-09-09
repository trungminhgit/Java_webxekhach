<%-- 
    Document   : index
    Created on : Jul 30, 2023, 9:03:43 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/" var="action" />
<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH CHUYẾN XE</h1>
    <security:authorize access="hasRole('ROLE_ADMIN')">
        <div>
            <a href="<c:url value="/trips" />" class="btn btn-info">Thêm chuyến xe</a>
            <a href="<c:url value="/routesAdmin"/>"class="btn btn-info">Quản lí tuyến xe</a>
            <a href="<c:url value="/usersAdmin"/>"class="btn btn-info">Quản lí thành viên</a>
        </div>
    </security:authorize>

    <div>
        <c:if test="${counter > 1}">
            <ul class="pagination mt-1">
                <li class="page-item"><a class="page-link" href="${action}">Tất cả</a></li>
                    <c:forEach begin="1" end="${counter}" var="i">
                        <c:url value="/" var="pageUrl">
                            <c:param name="page" value="${i}" />
                        </c:url>
                    <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                    </c:forEach>
            </ul>
        </c:if>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th></th>
                <th>Tên chuyến xe</th>
                <th>Giá chuyến xe</th>
                <th>Nơi xuất phát</th>
                <th>Giờ xuất phát</th>
                <th>Tuyến xe</th>
                <th>Tài xế</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${trips}" var="t">
                <tr>
                    <td>
                        <img src="${t.vehicleImage}" alt="${t.tripName}" width="120" height="120    " />
                    </td>
                    <td>${t.tripName}</td>
                    <td>${t.price} VND</td>
                    <td>${t.departurePlace}</td>
                    <td>${t.startTime}</td>
                    <td>${t.routeId.routeName}</td>
                    <td>${t.driverId.firstName}</td>
                    <td>
                        <security:authorize access="hasRole('ROLE_ADMIN')">
                            <div>
                                <c:url value="/trips/${t.id}" var="api" />
                                <a href="${api}" class="btn btn-info">Cập nhật</a>
                                <button class="btn btn-danger" onclick="deleteTrip('${api}')">Xóa</button>
                            </div>
                        </security:authorize>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/main.js" />"></script>
