<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container py-4">
    <!-- Title & Filter section -->
    <div class="row align-items-center mb-4">
        <div class="col">
            <h1 class="h3 mb-0">Sản phẩm</h1>
        </div>
        <div class="col-auto">
            <select class="form-select" id="categoryFilter" onchange="filterByCategory(this.value)">
                <option value="">Tất cả danh mục</option>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.cateId}" ${param.categoryId eq category.cateId ? 'selected' : ''}>
                        ${category.cateName}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>

    <!-- Products grid -->
    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-4">
        <c:forEach items="${products}" var="product">
            <div class="col">
                <div class="card h-100 border-0 shadow-sm product-card">
                    <!-- Product image -->
                    <div class="ratio ratio-1x1">
                        <c:choose>
                            <c:when test="${not empty product.image}">
                                <img src="${pageContext.request.contextPath}/uploads/${product.image}" 
                                     class="card-img-top" alt="${product.name}"
                                     style="object-fit: cover;">
                            </c:when>
                            <c:otherwise>
                                <div class="bg-light d-flex align-items-center justify-content-center">
                                    <i class="bi bi-image text-secondary" style="font-size: 3rem;"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <!-- Product info -->
                    <div class="card-body">
                        <h5 class="card-title">
                            <a href="${pageContext.request.contextPath}/product/detail/${product.id}" 
                               class="text-decoration-none text-dark product-name">
                                ${product.name}
                            </a>
                        </h5>
                        <p class="text-primary fw-bold h5 mb-2">
                            ${String.format("%,.0f", product.price)}đ
                        </p>
                        <p class="card-text text-muted small mb-0">
                            <c:forEach items="${categories}" var="category">
                                <c:if test="${category.cateId eq product.categoryId}">
                                    ${category.cateName}
                                </c:if>
                            </c:forEach>
                        </p>
                    </div>
                    
                    <!-- Hover overlay -->
                    <div class="card-overlay">
                        <a href="${pageContext.request.contextPath}/product/detail/${product.id}" 
                           class="btn btn-primary">
                            <i class="bi bi-eye me-1"></i>Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination -->
    <c:if test="${totalPages > 1}">
        <nav aria-label="Page navigation" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${currentPage - 1}&categoryId=${param.categoryId}">
                        <i class="bi bi-chevron-left"></i>
                    </a>
                </li>
                
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${currentPage eq i ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&categoryId=${param.categoryId}">${i}</a>
                    </li>
                </c:forEach>
                
                <li class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${currentPage + 1}&categoryId=${param.categoryId}">
                        <i class="bi bi-chevron-right"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </c:if>
</div>

<style>
.product-card {
    transition: all 0.3s ease;
    position: relative;
}

.product-card:hover {
    transform: translateY(-5px);
}

.product-name {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    height: 2.5rem;
}

.card-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255,255,255,0.9);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: all 0.3s ease;
}

.product-card:hover .card-overlay {
    opacity: 1;
}
</style>

<script>
function filterByCategory(categoryId) {
    const url = new URL(window.location.href);
    if (categoryId) {
        url.searchParams.set('categoryId', categoryId);
    } else {
        url.searchParams.delete('categoryId');
    }
    url.searchParams.set('page', '1');
    window.location.href = url.toString();
}
</script>