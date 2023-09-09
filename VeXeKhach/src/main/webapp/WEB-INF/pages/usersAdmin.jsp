<%-- 
    Document   : usersAdmin
    Created on : Aug 29, 2023, 6:56:33 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/usersAdmin" var="action" />
<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH THÀNH VIÊN</h1>
    <a href="<c:url value="/register" />" class="btn btn-info">Thêm thành viên</a>
    <div>
        <c:if test="${counter > 1}">
            <ul class="pagination mt-1">
                <li class="page-item"><a class="page-link" href="${action}">Tất cả</a></li>
                    <c:forEach begin="1" end="${counter}" var="i">
                        <c:url value="/usersAdmin" var="pageUrl">
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
                <th>Họ</th>
                <th>Tên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="u">
                <tr>
                    <td>
                        <img src="${u.avatar}" alt="${u.firstName}" width="120" height="120    " />
                    </td>
                    <td>${u.lastName}</td>
                    <td>${u.firstName}</td>
                    <td>${u.email}</td>
                    <td>${u.phone}</td>
                    <td>
                        <div>
                            <c:url value="/users/${u.id}" var="api" />
                            <a href="${api}" class="btn btn-info">Cập nhật</a>
                            <button class="btn btn-danger" onclick="deleteUser('${api}')">Xóa</button>
                        </div>                  
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/main.js" />"></script>
