<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="sidebar">
    <div class="p-3">
        <!-- Admin Info -->
        <div class="d-flex align-items-center mb-4 px-2">
            <div class="flex-shrink-0">
                <div class="bg-primary text-white rounded-circle p-2" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                    <i class="bi bi-person"></i>
                </div>
            </div>
            <div class="flex-grow-1 ms-3">
                <h6 class="mb-0">Admin</h6>
                <small class="text-muted">Quản trị viên</small>
            </div>
        </div>

        <!-- Search -->
        <div class="input-group mb-4">
            <span class="input-group-text bg-white border-end-0">
                <i class="bi bi-search text-muted"></i>
            </span>
            <input type="text" class="form-control border-start-0 ps-0" placeholder="Tìm kiếm...">
        </div>

        <!-- Navigation -->
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link rounded" href="${pageContext.request.contextPath}/admin/home">
                    <i class="bi bi-house-door"></i>
                    <span>Trang chủ</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link rounded" href="${pageContext.request.contextPath}/admin/category/list">
                    <i class="bi bi-grid"></i>
                    <span>Quản lý danh mục</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link rounded" href="${pageContext.request.contextPath}/admin/product/list">
                    <i class="bi bi-box"></i>
                    <span>Sản phẩm</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link rounded" href="${pageContext.request.contextPath}/admin/order/list">
                    <i class="bi bi-cart"></i>
                    <span>Đơn hàng</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link rounded" href="${pageContext.request.contextPath}/admin/user/list">
                    <i class="bi bi-people"></i>
                    <span>Người dùng</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link rounded" href="${pageContext.request.contextPath}/admin/article/list">
                    <i class="bi bi-file-text"></i>
                    <span>Bài viết</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link rounded" href="#">
                    <i class="bi bi-gear"></i>
                    <span>Cài đặt hệ thống</span>
                </a>
            </li>
        </ul>
    </div>
</aside>