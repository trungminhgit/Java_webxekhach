<%-- 
    Document   : routes
    Created on : Aug 26, 2023, 10:09:01 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/routes" var="action" />
<form:form modelAttribute="route" action="${action}" method="post" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="id" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="routeName" id="routeName" placeholder="Tên tuyến xe" name="routeName" />
        <label for="name">Tên tuyến xe</label>
        <form:errors path="routeName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <button type="submit" class="btn btn-info">
            <c:choose>
                <c:when test="${route.id != null}">Cập nhật tuyến xe</c:when>
                <c:otherwise>Thêm tuyến xe</c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value="/routesAdmin" />" class="btn btn-info">Hủy</a>
    </div>
</form:form>
