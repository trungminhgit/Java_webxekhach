<%-- 
    Document   : trips
    Created on : Aug 2, 2023, 9:19:57 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-info mt-1">QUẢN LÝ CHUYẾN XE</h1>

<c:url value="/trips" var="action" />
<form:form modelAttribute="trip" action="${action}" method="post" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="id" />
    <form:hidden path="vehicleImage" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="tripName" id="tripName" placeholder="Tên chuyến xe" name="tripName" />
        <label for="name">Tên chuyến xe</label>
        <form:errors path="tripName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="departurePlace" id="departurePlace" placeholder="Nơi xuất phát" name="departurePlace" />
        <label for="name">Nơi xuất phát</label>
        <form:errors path="departurePlace" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" path="price" id="price" placeholder="Giá chuyến xe" name="price" />
        <label for="name">Giá chuyến xe</label>
        <form:errors path="price" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" path="seats" id="seats" placeholder="Số ghế" name="seats" />
        <label for="name">Số ghế</label>
        <form:errors path="seats" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="vehicleName" id="vehicleName" placeholder="Tên phương tiện" name="vehicleName" />
        <label for="name">Tên phương tiện</label>
        <form:errors path="vehicleName" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="startTime" id="startTime" placeholder="Giờ xuất phát" name="startTime" />
        <label for="name">Giờ xuất phát (HH:mm:ss)</label>
        <form:errors path="startTime" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="driver" name="driver" path="driverId">
            <c:forEach items="${users}" var="u">
                <c:if test="${u.roleId.id == 4}">
                    <option value="${u.id}" ${u.id == trip.driverId.id ? 'selected' : ''}>${u.firstName}</option>
                </c:if>
            </c:forEach>
        </form:select>
        <label for="driver" class="form-label">Danh mục tài xế</label>
    </div>
    <div class="form-floating mt-3">
        <form:select class="form-select" id="route" name="route" path="routeId">
            <c:forEach items="${routes}" var="r">
                <c:choose>
                    <c:when test="${r.id == trip.routeId.id}"><option value="${r.id}" selected>${r.routeName}</option></c:when>
                    <c:otherwise><option value="${r.id}">${r.routeName}</option></c:otherwise>
                </c:choose>

            </c:forEach>
        </form:select>
        <label for="route" class="form-label">Danh mục tuyến xe</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" path="file" id="file"  />
        <label for="file">Ảnh chuyến xe</label>
        <form:errors path="vehicleImage" element="div" cssClass="text-danger" />
        <c:if test="${trip.vehicleImage != null}">
            <img src="${trip.vehicleImage}" width="120" />
        </c:if>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button type="submit" class="btn btn-info">
            <c:choose>
                <c:when test="${trip.id != null}">Cập nhật chuyến xe</c:when>
                <c:otherwise>Thêm chuyến xe</c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value="/" />" class="btn btn-info">Hủy</a>
    </div>
</form:form>
