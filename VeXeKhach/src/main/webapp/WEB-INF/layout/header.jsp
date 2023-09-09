<%-- 
    Document   : header
    Created on : Jul 30, 2023, 8:58:53 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/" var="action" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-info" style="font-size: 40px;" href="${action}">
            &#128652;FutaBusLine-Website
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" style="font-size: 20px;" href="${action}">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <form class="nav-link" action="${action}" id="routeForm">
                        <select name="routeId" class="form-select" onchange="this.form.submit()">
                            <option value="${r.id}" selected>Danh mục tuyến xe</option>
                            <c:forEach items="${routes}" var="r">
                                <option value="${r.id}">${r.routeName}</option>
                            </c:forEach>
                        </select>
                    </form>
                </li>
               
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a class="nav-link text-info" style="font-size: 25px;" href="<c:url value="/" />">Chào ${pageContext.request.userPrincipal.name}!</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="<c:url value="/logout" />">Đăng xuất</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="<c:url value="/login" />">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="<c:url value="/register" />">Đăng ký</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <form class="d-flex" action="${action}">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa...">
                <button class="btn btn-primary" type="submit">Tìm</button>
            </form>
        </div>
    </div>
</nav>


