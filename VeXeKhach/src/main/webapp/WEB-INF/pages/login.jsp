<%-- 
    Document   : login
    Created on : Aug 25, 2023, 11:26:36 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger mt-3">
        Bạn không có quyền truy cập
    </div>
</c:if>
<c:url value="/login" var="action"/>
<h1 class="text-center text-info mt-4 mb-3">ĐĂNG NHẬP</h1>
<form method="post" action="${action}">
    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="name" placeholder="Tên đăng nhập" name="username">
        <label for="name">Tên đăng nhập</label>
    </div>

    <div class="form-floating mt-3 mb-3">
        <input type="password" class="form-control" id="password" placeholder="Mật khẩu" name="password">
        <label for="password">Mật khẩu</label>
    </div>
    <div class="form-floating mt-3 mb-3">
        <input type="submit" value="Đăng nhập" class="btn btn-info"/>
    </div>
</form>
