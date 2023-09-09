<%-- 
    Document   : headUsersAdmin
    Created on : Aug 30, 2023, 4:04:04 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/" var="action" />
<c:url value="/usersAdmin" var="actionUsers" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-info" style="font-size: 40px;" href="${action}">&#128652;FutaBusLine-Website</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${action}">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <form class="nav-link" action="${actionUsers}" id="roleForm">
                        <select name="roleId" class="form-select" onchange="this.form.submit()">
                            <option value="${u.id}" selected>Danh mục quyền</option>
                            <c:forEach items="${roles}" var="r">
                                <option value="${r.id}">${r.roleName}</option>
                            </c:forEach>
                        </select>
                    </form>
                </li>
            </ul>
            <form class="d-flex" action="${actionUsers}">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhập tên thành viên ...">
                <button class="btn btn-primary" type="submit">Tìm</button>
            </form>
        </div>
    </div>
</nav>
