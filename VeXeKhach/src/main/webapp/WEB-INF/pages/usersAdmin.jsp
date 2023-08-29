<%-- 
    Document   : usersAdmin
    Created on : Aug 29, 2023, 6:56:33 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/userAdmin" var="action" />
<section class="container">
    <h1 class="text-center text-info mt-1">DANH SÁCH THÀNH VIÊN</h1>
    <div >
        <form class="d-flex" action="${action}">
            <input class="form-control me-2" type="text" name="kw" placeholder="Nhập tên thành viên">
            <button class="btn btn-primary" type="submit">Tìm</button>
        </form>
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
