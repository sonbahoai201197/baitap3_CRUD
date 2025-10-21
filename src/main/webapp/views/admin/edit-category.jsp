<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa Category</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

    <h2 class="mb-4">Sửa Danh mục</h2>

    <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${category.cateId}" />

        <div class="mb-3">
            <label class="form-label">Tên Danh mục</label>
            <input type="text" class="form-control" name="name" value="${category.cateName}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Icon hiện tại</label><br>
            <c:if test="${not empty category.icons}">
                <img src="${pageContext.request.contextPath}/${category.icons}" width="100" alt="icon"/>
            </c:if>
        </div>

        <div class="mb-3">
            <label class="form-label">Chọn Icon mới (nếu muốn thay đổi)</label>
            <input type="file" class="form-control" name="icon">
        </div>


        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Quay lại</a>
    </form>

</body>
</html>
