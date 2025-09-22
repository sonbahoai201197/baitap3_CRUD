<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Danh mục</title>

    <!-- Bootstrap CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        body { padding: 30px; background:#fff; }
        h1.title { text-align:center; margin-bottom:30px; font-weight:700; }
        .table thead th { vertical-align: middle; text-align:center; }
        .table td, .table th { vertical-align: middle; }
        .thumb { width:120px; height:80px; object-fit:cover; border-radius:6px; }
        .action-btns a { margin-right:8px; }
        .empty-placeholder {
            width:120px;height:80px;background:#f0f0f0;border:1px dashed #ddd;
            display:flex;align-items:center;justify-content:center;color:#888;border-radius:6px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="title">Danh sách Danh mục</h1>

    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-success">+ Thêm mới</a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-bordered mb-0">
                <thead class="table-light">
                    <tr>
                        <th style="width:80px">ID</th>
                        <th>Tên Danh mục</th>
                        <th style="width:150px">Icon</th>
                        <th style="width:170px">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty cateList}">
                            <c:forEach items="${cateList}" var="c" varStatus="st">
                                <tr>
                                    <td class="text-center">${c.cateId}</td>
                                    <td>${c.cateName}</td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${not empty c.icons}">
                                                <!-- build URL to image servlet -->
                                                <c:url value="/image" var="imgUrl">
                                                    <c:param name="fname" value="${c.icons}" />
                                                </c:url>
                                                <img src="${imgUrl}" alt="icon" class="thumb img-thumbnail" />
                                            </c:when>
                                            <c:otherwise>
                                                <div class="empty-placeholder">No image</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center action-btns">
                                        <a href="${pageContext.request.contextPath}/admin/category/edit?id=${c.cateId}" class="btn btn-primary btn-sm">Sửa</a>
                                        <a href="${pageContext.request.contextPath}/admin/category/delete?id=${c.cateId}"
                                           class="btn btn-danger btn-sm"
                                           onclick="return confirm('Bạn có chắc muốn xóa danh mục này?');">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4" class="text-center py-4">Chưa có danh mục nào.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
