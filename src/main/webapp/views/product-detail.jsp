<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container py-4">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/product/category/${product.categoryId}">
                    <c:forEach items="${categories}" var="category">
                        <c:if test="${category.cateId eq product.categoryId}">
                            ${category.cateName}
                        </c:if>
                    </c:forEach>
                </a>
            </li>
            <li class="breadcrumb-item active">${product.name}</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-md-5 mb-4">
            <div class="card border-0">
                <c:choose>
                    <c:when test="${not empty product.image}">
                        <img src="${pageContext.request.contextPath}/uploads/${product.image}" 
                             alt="${product.name}" 
                             class="card-img-top rounded shadow-sm">
                    </c:when>
                    <c:otherwise>
                        <div class="card-img-top bg-light rounded text-center p-5">
                            <i class="bi bi-image text-secondary" style="font-size: 5rem;"></i>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="col-md-7 mb-4">
            <h1 class="h2 mb-3">${product.name}</h1>

            <div class="mb-4">
                <span class="fs-4 text-primary fw-bold">
                    ${String.format("%,.0f", product.price)}đ
                </span>
            </div>

            <div class="mb-4">
                <h5>Mô tả sản phẩm</h5>
                <p class="text-muted">
                    ${not empty product.description ? product.description : 'Chưa có mô tả cho sản phẩm này'}
                </p>
            </div>

            <div class="mb-4">
                <h5>Thông tin thêm</h5>
                <table class="table table-borderless">
                    <tr>
                        <th style="width: 150px">Danh mục:</th>
                        <td>
                            <a href="${pageContext.request.contextPath}/product/category/${product.categoryId}">
                                <c:forEach items="${categories}" var="category">
                                    <c:if test="${category.cateId eq product.categoryId}">
                                        ${category.cateName}
                                    </c:if>
                                </c:forEach>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <th>Trạng thái:</th>
                        <td>
                            <span class="badge ${product.status eq 1 ? 'bg-success' : 'bg-danger'}">
                                ${product.status eq 1 ? 'Còn hàng' : 'Hết hàng'}
                            </span>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg me-md-2" ${product.status eq 0 ? 'disabled' : ''}>
                    <i class="bi bi-cart-plus me-1"></i>Thêm vào giỏ hàng
                </button>
                <button type="button" class="btn btn-success btn-lg" ${product.status eq 0 ? 'disabled' : ''}>
                    <i class="bi bi-lightning me-1"></i>Mua ngay
                </button>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <h3 class="mb-4">Sản phẩm liên quan</h3>
            
            <div class="row row-cols-2 row-cols-md-4 g-4">
                <c:forEach items="${relatedProducts}" var="relatedProduct">
                    <div class="col">
                        <div class="card h-100 border-0 shadow-sm">
                            <c:choose>
                                <c:when test="${not empty relatedProduct.image}">
                                    <img src="${pageContext.request.contextPath}/uploads/${relatedProduct.image}" 
                                         class="card-img-top" alt="${relatedProduct.name}">
                                </c:when>
                                <c:otherwise>
                                    <div class="card-img-top bg-light text-center p-3">
                                        <i class="bi bi-image text-secondary" style="font-size: 3rem;"></i>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            
                            <div class="card-body">
                                <h5 class="card-title mb-3">
                                    <a href="${pageContext.request.contextPath}/product/detail/${relatedProduct.id}" 
                                       class="text-decoration-none text-dark stretched-link">
                                        ${relatedProduct.name}
                                    </a>
                                </h5>
                                <p class="card-text text-primary fw-bold mb-0">
                                    ${String.format("%,.0f", relatedProduct.price)}đ
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>