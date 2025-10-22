<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Quản lý sản phẩm</h1>
    
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/home">Dashboard</a></li>
        <li class="breadcrumb-item active">Sản phẩm</li>
    </ol>
    
    <div class="card mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
            <div>
                <i class="bi bi-table me-1"></i>
                Danh sách sản phẩm
            </div>
            <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-primary btn-sm">
                <i class="bi bi-plus-circle me-1"></i>Thêm mới
            </a>
        </div>
        <div class="card-body">
            <c:if test="${param.message eq 'add_success'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    Thêm sản phẩm thành công!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${param.message eq 'edit_success'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    Cập nhật sản phẩm thành công!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${param.message eq 'delete_success'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    Xóa sản phẩm thành công!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-light">
                        <tr>
                            <th style="width: 60px">ID</th>
                            <th style="width: 100px">Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Danh mục</th>
                            <th style="width: 120px">Giá</th>
                            <th style="width: 100px">Trạng thái</th>
                            <th style="width: 120px">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td class="text-center">${product.id}</td>
                                <td class="text-center">
                                    <c:if test="${not empty product.image}">
                                        <img src="${pageContext.request.contextPath}/uploads/${product.image}" 
                                             alt="${product.name}"
                                             class="img-thumbnail"
                                             style="max-height: 50px">
                                    </c:if>
                                </td>
                                <td>
                                    <div class="fw-medium">${product.name}</div>
                                    <div class="small text-muted">${product.description}</div>
                                </td>
                                <td>
                                    <c:forEach items="${categories}" var="category">
                                        <c:if test="${category.cateId eq product.categoryId}">
                                            ${category.cateName}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td class="text-end">${String.format("%,.0f", product.price)}đ</td>
                                <td class="text-center">
                                    <span class="badge ${product.status eq 1 ? 'bg-success' : 'bg-danger'}">
                                        ${product.status eq 1 ? 'Hiển thị' : 'Ẩn'}
                                    </span>
                                </td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/product/edit?id=${product.id}" 
                                       class="btn btn-sm btn-primary me-1" title="Sửa">
                                        <i class="bi bi-pencil-square"></i>
                                    </a>
                                    <a href="#" onclick="confirmDelete(${product.id})"
                                       class="btn btn-sm btn-danger" title="Xóa">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <c:if test="${totalPages > 1}">
                <nav aria-label="Page navigation" class="mt-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}&pageSize=${pageSize}">
                                <i class="bi bi-chevron-left"></i>
                            </a>
                        </li>
                        
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage eq i ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}&pageSize=${pageSize}">${i}</a>
                            </li>
                        </c:forEach>
                        
                        <li class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage + 1}&pageSize=${pageSize}">
                                <i class="bi bi-chevron-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>
        </div>
    </div>
</div>

<!-- Confirm Delete Modal -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xác nhận xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xóa sản phẩm này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <a href="#" id="confirmDeleteButton" class="btn btn-danger">Xóa</a>
            </div>
        </div>
    </div>
</div>

<script>
    function confirmDelete(id) {
        var modal = new bootstrap.Modal(document.getElementById('confirmDeleteModal'));
        document.getElementById('confirmDeleteButton').href = '${pageContext.request.contextPath}/admin/product/delete?id=' + id;
        modal.show();
    }
</script>