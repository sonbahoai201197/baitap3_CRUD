<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Danh sách Danh mục</title>

<style>
    .thumb { width:120px; height:80px; object-fit:cover; border-radius:6px; }
    .empty-placeholder { width:120px;height:80px;background:#f0f0f0; display:flex;align-items:center;justify-content:center;color:#888;border-radius:6px; }
</style>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
    <h1 class="h2">Danh sách Danh mục</h1>
    <div class="btn-toolbar mb-2 mb-md-0">
        <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-success">+ Thêm mới</a>
    </div>
</div>

<div class="card shadow-sm">
    <div class="card-body p-0">
        <table class="table table-bordered table-hover mb-0">
            <thead class="table-light text-center">
                <tr>
                    <th style="width:80px">ID</th>
                    <th>Tên Danh mục</th>
                    <th style="width:150px">Hình ảnh</th>
                    <th style="width:170px">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty cateList}">
                        <c:forEach items="${cateList}" var="c">
                            <tr>
                                <td class="text-center">${c.cateId}</td>
                                <td>${c.cateName}</td>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${not empty c.icons}">
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
                                <td class="text-center">
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