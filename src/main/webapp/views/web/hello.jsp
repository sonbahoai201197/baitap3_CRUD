<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${empty sessionScope.account}">
    <c:redirect url="${pageContext.request.contextPath}/login"/>
</c:if>

<title>Dashboard - Baitap3 CRUD</title>

<style>
    .dashboard-section {
        min-height: calc(100vh - 56px);
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        padding: 40px 0;
    }
    
    .welcome-card {
        background: white;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        margin-bottom: 30px;
    }
    
    .welcome-header {
        background: #0d6efd;
        color: white;
        padding: 30px;
        position: relative;
        overflow: hidden;
    }
    
    .welcome-header::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -50%;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.1);
        transform: rotate(45deg);
    }
    
    .user-info {
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
    }
    
    .quick-actions {
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    
    .stat-card {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        transition: transform 0.2s;
    }
    
    .stat-card:hover {
        transform: translateY(-5px);
    }
</style>

<section class="dashboard-section">
    <div class="container">
        <div class="welcome-card">
            <div class="welcome-header">
                <div class="d-flex align-items-center">
                    <i class="bi bi-person-circle display-4 me-3"></i>
                    <div>
                        <h1 class="mb-2">Xin chào, ${sessionScope.account.fullname != null ? sessionScope.account.fullname : sessionScope.account.username}!</h1>
                        <p class="mb-0 opacity-75">Chúc bạn một ngày làm việc hiệu quả</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="stat-card text-center">
                    <i class="bi bi-person-badge text-primary display-4"></i>
                    <h5 class="mt-3 mb-0">Thông tin tài khoản</h5>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card text-center">
                    <i class="bi bi-folder2 text-success display-4"></i>
                    <h5 class="mt-3 mb-0">Danh mục</h5>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card text-center">
                    <i class="bi bi-gear text-warning display-4"></i>
                    <h5 class="mt-3 mb-0">Cài đặt</h5>
                </div>
            </div>
        </div>

        <div class="user-info">
            <h4 class="mb-4"><i class="bi bi-person-vcard me-2"></i>Thông tin cá nhân</h4>
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-3">
                        <i class="bi bi-person me-2 text-primary"></i>
                        <strong>Họ tên:</strong> ${sessionScope.account.fullname != null ? sessionScope.account.fullname : "Chưa cập nhật"}
                    </p>
                    <p class="mb-3">
                        <i class="bi bi-envelope me-2 text-primary"></i>
                        <strong>Email:</strong> ${sessionScope.account.email}
                    </p>
                </div>
                <div class="col-md-6">
                    <p class="mb-3">
                        <i class="bi bi-person-badge me-2 text-primary"></i>
                        <strong>Username:</strong> ${sessionScope.account.username}
                    </p>
                    <p class="mb-3">
                        <i class="bi bi-telephone me-2 text-primary"></i>
                        <strong>SĐT:</strong> ${sessionScope.account.phone != null ? sessionScope.account.phone : "Chưa cập nhật"}
                    </p>
                </div>
            </div>
        </div>

        <div class="quick-actions">
            <h4 class="mb-4"><i class="bi bi-lightning me-2"></i>Thao tác nhanh</h4>
            <div class="d-flex flex-wrap gap-3">
                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-primary btn-lg">
                    <i class="bi bi-house me-2"></i>Trang chủ
                </a>
                <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-outline-success btn-lg">
                    <i class="bi bi-folder2 me-2"></i>Quản lý Category
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-lg">
                    <i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
                </a>
            </div>
        </div>
    </div>
</section>