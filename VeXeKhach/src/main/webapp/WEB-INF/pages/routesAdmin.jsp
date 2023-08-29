<%-- 
    Document   : routes
    Created on : Aug 25, 2023, 11:40:08 PM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/routesAdmin" var="action" />
<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH TUYẾN XE</h1>
    <div >
        <a href="<c:url value="/routes" />" class="btn btn-info">Thêm tuyến xe</a>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên tuyến xe</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${routes}" var="r">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.routeName}</td>
                    <td>
                        <div>
                            <c:url value="/routes/${r.id}" var="api" />
                            <a href="${api}" class="btn btn-info">Cập nhật</a>
                            <button class="btn btn-danger" onclick="deleteRoute('${api}')">Xóa</button>
                        </div>                  
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/main.js" />"></script>