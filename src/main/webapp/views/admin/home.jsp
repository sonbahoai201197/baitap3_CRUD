<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Trang quản trị - Baitap3 CRUD</title>

<div class="container py-4">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h2 class="mb-0">
            <i class="bi bi-speedometer2 me-2"></i>Bảng điều khiển
        </h2>
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/home" class="text-decoration-none">Admin</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
    </div>

    <div class="row g-4">
        <!-- Category Card -->
        <div class="col-md-6 col-xl-3">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="flex-shrink-0 me-3">
                            <div class="p-3 rounded-3 bg-primary bg-opacity-10">
                                <i class="bi bi-folder text-primary fs-3"></i>
                            </div>
                        </div>
                        <div>
                            <h6 class="mb-1">Quản lý danh mục</h6>
                            <p class="mb-0 text-muted small">Quản lý các danh mục sản phẩm</p>
                        </div>
                    </div>
                    <div class="mt-3">
                        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-primary w-100">
                            <i class="bi bi-arrow-right me-2"></i>Truy cập
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Card -->
        <div class="col-md-6 col-xl-3">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="flex-shrink-0 me-3">
                            <div class="p-3 rounded-3 bg-success bg-opacity-10">
                                <i class="bi bi-box text-success fs-3"></i>
                            </div>
                        </div>
                        <div>
                            <h6 class="mb-1">Quản lý sản phẩm</h6>
                            <p class="mb-0 text-muted small">Quản lý các sản phẩm trong hệ thống</p>
                        </div>
                    </div>
                    <div class="mt-3">
                        <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-success w-100">
                            <i class="bi bi-arrow-right me-2"></i>Truy cập
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-lightning me-2"></i>Thao tác nhanh
                    </h5>
                </div>
                <div class="card-body">
                    <div class="d-flex flex-wrap gap-2">
                        <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-outline-primary">
                            <i class="bi bi-plus-circle me-2"></i>Thêm danh mục mới
                        </a>
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
                            <i class="bi bi-house me-2"></i>Về trang chủ
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>