<%-- 
    Document   : users
    Created on : Aug 30, 2023, 4:11:32 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-info mt-1">QUẢN LÝ THÀNH VIÊN</h1>

<c:url value="/users" var="action" />
<form:form modelAttribute="user" action="${action}" method="post" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="id" />
    <form:hidden path="avatar" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Họ" name="lastName" />
        <label for="name">Họ</label>
        <form:errors path="lastName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Tên" name="firstName" />
        <label for="name">Tên</label>
        <form:errors path="firstName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="userName" id="userName" placeholder="Tên đăng nhập" name="userName" />
        <label for="name">Tên đăng nhập</label>
        <form:errors path="userName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="password" class="form-control" path="password" id="password" placeholder="Mật khẩu" name="password" />
        <label for="name">Mật khẩu</label>
        <form:errors path="password" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="email" class="form-control" path="email" id="email" placeholder="Email" name="email" />
        <label for="name">Email</label>
        <form:errors path="email" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" path="phone" id="phone" placeholder="Số điện thoại" name="phone" />
        <label for="name">Số điện thoại</label>
        <form:errors path="phone" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mt-3">
        <form:select class="form-select" id="role" name="role" path="roleId">
            <c:forEach items="${roles}" var="r">
                <c:choose>
                    <c:when test="${r.id == user.roleId.id}"><option value="${r.id}" selected>${r.roleName}</option></c:when>
                    <c:otherwise><option value="${r.id}">${r.roleName}</option></c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <label for="route" class="form-label">Danh mục quyền</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" path="file" id="file"  />
        <label for="file">Ảnh đại diện</label>
        <form:errors path="file" element="div" cssClass="text-danger" />
        <c:if test="${user.avatar != null}">
            <img src="${user.avatar}" width="120" />
        </c:if>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button type="submit" class="btn btn-info">Cập nhật thành viên</button>
        <a href="<c:url value="/usersAdmin" />" class="btn btn-info">Hủy</a>
    </div>
</form:form>

