<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Quản lý Danh mục</title>

<style>
    .thumb {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .empty-placeholder {
        width: 80px;
        height: 80px;
        background: #f8f9fa;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #6c757d;
        border-radius: 8px;
        border: 2px dashed #dee2e6;
    }
    .card {
        border: none;
        box-shadow: 0 0.125rem 0.25rem rgba(0,0,0,0.075);
    }
    .search-box {
        max-width: 300px;
    }
    .btn-icon {
        padding: 0.375rem 0.75rem;
        line-height: 1.5;
    }
    .category-actions .btn {
        margin: 0 0.25rem;
    }
    .table > :not(caption) > * > * {
        padding: 1rem 0.75rem;
    }
</style>

<!-- Page Header -->
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3">
    <div>
        <h1 class="h2 mb-2">Quản lý Danh mục</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/home">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Danh mục</li>
            </ol>
        </nav>
    </div>
    <div class="d-flex gap-2">
        <div class="search-box">
            <input type="search" class="form-control" placeholder="Tìm kiếm danh mục..." id="searchCategory">
        </div>
        <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-primary">
            <i class="bi bi-plus-lg"></i> Thêm danh mục
        </a>
    </div>
</div>

<!-- Main Content -->
<div class="card">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light">
                    <tr>
                        <th style="width: 80px" class="text-center">ID</th>
                        <th>Tên Danh mục</th>
                        <th style="width: 100px" class="text-center">Hình ảnh</th>
                        <th style="width: 150px" class="text-center">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty cateList}">
                            <c:forEach items="${cateList}" var="c">
                                <tr>
                                    <td class="text-center fw-bold text-muted">#${c.cateId}</td>
                                    <td>
                                        <div class="fw-semibold">${c.cateName}</div>
                                    </td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${not empty c.icons}">
                                                <c:url value="/image" var="imgUrl">
                                                    <c:param name="fname" value="${c.icons}" />
                                                </c:url>
                                                <img src="${imgUrl}" alt="${c.cateName}" class="thumb" />
                                            </c:when>
                                            <c:otherwise>
                                                <div class="empty-placeholder">
                                                    <i class="bi bi-image text-muted"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="category-actions text-center">
                                            <a href="${pageContext.request.contextPath}/admin/category/edit?id=${c.cateId}" 
                                               class="btn btn-outline-primary btn-icon" 
                                               data-bs-toggle="tooltip" 
                                               title="Chỉnh sửa">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a href="#" 
                                               class="btn btn-outline-danger btn-icon"
                                               data-bs-toggle="tooltip" 
                                               title="Xóa"
                                               onclick="deleteCategory(<c:out value="${c.cateId}"/>, '<c:out value="${c.cateName}"/>'); return false;">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4" class="text-center py-5">
                                    <div class="text-muted">
                                        <i class="bi bi-inbox display-6"></i>
                                        <p class="mt-3">Chưa có danh mục nào.</p>
                                        <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-primary btn-sm">
                                            <i class="bi bi-plus-lg"></i> Thêm danh mục mới
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xóa danh mục "<span id="categoryName"></span>"?
                <p class="text-danger mb-0 mt-2"><small><i class="bi bi-exclamation-triangle-fill"></i> Hành động này không thể hoàn tác!</small></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                <a href="#" id="confirmDelete" class="btn btn-danger">Xóa danh mục</a>
            </div>
        </div>
    </div>
</div>

<!-- Initialize tooltips and handle delete -->
<script>
    // Initialize tooltips
    document.addEventListener('DOMContentLoaded', function() {
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });

    // Handle search
    document.getElementById('searchCategory').addEventListener('keyup', function() {
        var input = this.value.toLowerCase();
        var rows = document.querySelectorAll('tbody tr');
        
        rows.forEach(function(row) {
            var text = row.textContent.toLowerCase();
            row.style.display = text.includes(input) ? '' : 'none';
        });
    });

    // Handle delete
    function deleteCategory(id, name) {
        var modal = new bootstrap.Modal(document.getElementById('deleteModal'));
        document.getElementById('categoryName').textContent = name;
        document.getElementById('confirmDelete').href = '${pageContext.request.contextPath}/admin/category/delete?id=' + id;
        modal.show();
    }
</script>