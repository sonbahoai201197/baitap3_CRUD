<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Trang chủ - Baitap3 CRUD</title>

<style>
    .hero-section {
        background: linear-gradient(135deg, #6B73FF 0%, #000DFF 100%);
        color: white;
        padding: 100px 0 80px;
        margin-top: -56px;
    }
    
    .feature-icon {
        font-size: 2.5rem;
        color: #4e73df;
        margin-bottom: 1rem;
    }
    
    .feature-card {
        transition: transform 0.3s ease;
        border: none;
        border-radius: 15px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    
    .feature-card:hover {
        transform: translateY(-5px);
    }
</style>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 text-center text-lg-start">
                <h1 class="display-4 fw-bold mb-4">Chào mừng đến với Baitap3 CRUD</h1>
                <p class="lead mb-4">Hệ thống quản lý danh mục hiện đại, đơn giản và dễ sử dụng</p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <c:choose>
                        <c:when test="${empty sessionScope.account}">
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-lg px-4 me-md-2">
                                <i class="bi bi-box-arrow-in-right"></i> Đăng nhập
                            </a>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-light btn-lg px-4">
                                <i class="bi bi-person-plus"></i> Đăng ký
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-light btn-lg px-4">
                                <i class="bi bi-grid"></i> Quản lý danh mục
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-lg-6 d-none d-lg-block text-center">
                <i class="bi bi-database-fill-gear" style="font-size: 200px; opacity: 0.8;"></i>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5">Tính năng nổi bật</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 feature-card">
                    <div class="card-body text-center p-4">
                        <i class="bi bi-shield-check feature-icon"></i>
                        <h4>Bảo mật</h4>
                        <p class="text-muted">Hệ thống xác thực và phân quyền chặt chẽ</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 feature-card">
                    <div class="card-body text-center p-4">
                        <i class="bi bi-lightning feature-icon"></i>
                        <h4>Hiệu suất cao</h4>
                        <p class="text-muted">Tối ưu hóa để đảm bảo tốc độ xử lý nhanh</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 feature-card">
                    <div class="card-body text-center p-4">
                        <i class="bi bi-phone feature-icon"></i>
                        <h4>Responsive</h4>
                        <p class="text-muted">Giao diện tương thích mọi thiết bị</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>