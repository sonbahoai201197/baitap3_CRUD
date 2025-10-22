<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Quản lý sản phẩm</h1>
    
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/home">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/product">Sản phẩm</a></li>
        <li class="breadcrumb-item active">Chỉnh sửa</li>
    </ol>
    
    <div class="card mb-4">
        <div class="card-header">
            <i class="bi bi-pencil-square me-1"></i>
            Chỉnh sửa sản phẩm
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/product/edit" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${product.id}">
                <input type="hidden" name="currentImage" value="${product.image}">
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
                            <input type="text" class="form-control ${not empty nameError ? 'is-invalid' : ''}" 
                                   id="name" name="name" value="${product.name}" required>
                            <c:if test="${not empty nameError}">
                                <div class="invalid-feedback">${nameError}</div>
                            </c:if>
                        </div>
                        
                        <div class="mb-3">
                            <label for="description" class="form-label">Mô tả</label>
                            <textarea class="form-control" id="description" name="description" rows="3">${product.description}</textarea>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="categoryId" class="form-label">Danh mục <span class="text-danger">*</span></label>
                                    <select class="form-select ${not empty categoryIdError ? 'is-invalid' : ''}" 
                                            id="categoryId" name="categoryId" required>
                                        <option value="">Chọn danh mục</option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.cateId}" ${product.categoryId eq category.cateId ? 'selected' : ''}>
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
                                           id="price" name="price" value="${product.price}" min="0" required>
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
                            <div class="form-text">
                                Cho phép các định dạng: .jpg, .jpeg, .png, .gif<br>
                                Để trống nếu không muốn thay đổi hình ảnh
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="status" name="status" value="1" 
                                       ${product.status eq 1 ? 'checked' : ''}>
                                <label class="form-check-label" for="status">Hiển thị sản phẩm</label>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary me-2">
                                <i class="bi bi-save me-1"></i> Lưu thay đổi
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/product" class="btn btn-secondary">
                                <i class="bi bi-x-circle me-1"></i> Hủy
                            </a>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">Hình ảnh hiện tại</label>
                            <div class="border rounded p-2">
                                <c:choose>
                                    <c:when test="${not empty product.image}">
                                        <img src="${pageContext.request.contextPath}/uploads/${product.image}" 
                                             alt="${product.name}"
                                             class="img-fluid mb-2"
                                             id="currentImage">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="removeImage" name="removeImage" value="1">
                                            <label class="form-check-label" for="removeImage">Xóa hình ảnh</label>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="text-muted text-center py-5">
                                            <i class="bi bi-image"></i><br>
                                            Chưa có hình ảnh
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Xem trước hình ảnh mới</label>
                            <div class="border rounded p-2">
                                <img id="imagePreview" src="#" alt="Preview" class="img-fluid d-none">
                                <div id="noImagePreview" class="text-muted text-center py-5">
                                    <i class="bi bi-image"></i><br>
                                    Chưa chọn hình ảnh mới
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
    
    // Xử lý checkbox xóa ảnh
    const removeImageCheckbox = document.getElementById('removeImage');
    if (removeImageCheckbox) {
        removeImageCheckbox.onchange = function() {
            const currentImage = document.getElementById('currentImage');
            if (this.checked) {
                currentImage.style.opacity = '0.3';
            } else {
                currentImage.style.opacity = '1';
            }
        }
    }
</script>