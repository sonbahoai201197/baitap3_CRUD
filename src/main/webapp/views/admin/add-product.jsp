<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Quản lý sản phẩm</h1>
    
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/home">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/product">Sản phẩm</a></li>
        <li class="breadcrumb-item active">Thêm mới</li>
    </ol>
    
    <div class="card mb-4">
        <div class="card-header">
            <i class="bi bi-plus-circle me-1"></i>
            Thêm sản phẩm mới
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/product/add" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-8">
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
                            <input type="text" class="form-control ${not empty nameError ? 'is-invalid' : ''}" 
                                   id="name" name="name" value="${param.name}" required>
                            <c:if test="${not empty nameError}">
                                <div class="invalid-feedback">${nameError}</div>
                            </c:if>
                        </div>
                        
                        <div class="mb-3">
                            <label for="description" class="form-label">Mô tả</label>
                            <textarea class="form-control" id="description" name="description" rows="3">${param.description}</textarea>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="categoryId" class="form-label">Danh mục <span class="text-danger">*</span></label>
                                    <select class="form-select ${not empty categoryIdError ? 'is-invalid' : ''}" 
                                            id="categoryId" name="categoryId" required>
                                        <option value="">Chọn danh mục</option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.cateId}" ${param.categoryId eq category.cateId ? 'selected' : ''}>
                                                ${category.cateName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <c:if test="${not empty categoryIdError}">
                                        <div class="invalid-feedback">${categoryIdError}</div>
                                    </c:if>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="price" class="form-label">Giá <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control ${not empty priceError ? 'is-invalid' : ''}" 
                                           id="price" name="price" value="${param.price}" min="0" required>
                                    <c:if test="${not empty priceError}">
                                        <div class="invalid-feedback">${priceError}</div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="image" class="form-label">Hình ảnh</label>
                            <input type="file" class="form-control ${not empty imageError ? 'is-invalid' : ''}" 
                                   id="image" name="image" accept="image/*">
                            <c:if test="${not empty imageError}">
                                <div class="invalid-feedback">${imageError}</div>
                            </c:if>
                            <div class="form-text">Cho phép các định dạng: .jpg, .jpeg, .png, .gif</div>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="status" name="status" value="1" checked>
                                <label class="form-check-label" for="status">Hiển thị sản phẩm</label>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary me-2">
                                <i class="bi bi-save me-1"></i> Lưu
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/product" class="btn btn-secondary">
                                <i class="bi bi-x-circle me-1"></i> Hủy
                            </a>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">Xem trước hình ảnh</label>
                            <div class="border rounded p-2">
                                <img id="imagePreview" src="#" alt="Preview" class="img-fluid d-none">
                                <div id="noImagePreview" class="text-muted text-center py-5">
                                    <i class="bi bi-image"></i><br>
                                    Chưa có hình ảnh
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.getElementById('image').onchange = function(evt) {
        const preview = document.getElementById('imagePreview');
        const noPreview = document.getElementById('noImagePreview');
        const file = evt.target.files[0];
        
        if (file) {
            preview.src = URL.createObjectURL(file);
            preview.classList.remove('d-none');
            noPreview.classList.add('d-none');
        } else {
            preview.classList.add('d-none');
            noPreview.classList.remove('d-none');
        }
    }
</script>