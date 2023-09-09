<%-- 
    Document   : register
    Created on : Aug 29, 2023, 4:50:57 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/register" var="action"/>

<h1 class="text-center text-info mt-4 mb-3">ĐĂNG KÝ THÀNH VIÊN</h1>

<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<c:if test="${success}">
    <div class="alert alert-danger mt-3">
        "${success}"
    </div>
</c:if>
<form:form method="post" modelAttribute="user" enctype="multipart/form-data" action="${action}" id="registerForm">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="id" />
    <form:hidden path="avatar" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Họ" name="lastName" value="${param.lastName}"/>
        <label for="name">Họ</label>
        <form:errors path="lastName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Tên" name="firstName" value="${param.firstName}"/>
        <label for="name">Tên</label>
        <form:errors path="firstName" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="userName" id="userName" placeholder="Tên đăng nhập" name="userName" value="${param.userName}" />
        <label for="name">Tên đăng nhập</label>
        <form:errors path="userName" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="password" class="form-control" path="password" id="password" placeholder="Mật khẩu" name="password" />
        <label for="name">Mật khẩu</label>
        <form:errors path="password" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="password" class="form-control" id="confirmPassword" placeholder="Nhập lại mật khẩu" name="confirmPassword">
        <label for="name">Nhập lại mật khẩu</label>
        <div id="passwordError" class="invalid-feedback"></div>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="email" class="form-control" path="email" id="email" placeholder="Email" name="email" value="${param.email}"/>
        <label for="name">Email</label>
        <form:errors path="email" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="phone" id="phone" placeholder="Số điện thoại" name="phone" value="${param.phone}" pattern="[0-9]*"/>
        <label for="name">Số điện thoại</label>
        <form:errors path="phone" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="file" class="form-control" path="file" id="file" placeholder="Ảnh đại diện" name="file" value="${param.avatar}">
        <label for="name">Ảnh đại diện</label>
    </div>

    <div class="form-floating mt-3 mb-3">
        <input type="submit" value="Đăng ký" class="btn btn-info"/>
    </div>
</form:form>
<script src="<c:url value="/js/main.js" />"></script>


