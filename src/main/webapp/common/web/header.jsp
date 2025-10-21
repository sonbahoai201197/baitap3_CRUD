<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<header class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">
            <i class="fa-solid fa-database me-2"></i> Baitap3 Project
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Giới thiệu (Ví dụ)</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sản phẩm (Ví dụ)</a>
                </li>
            </ul>
            <div class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user-circle me-1"></i>
                                Xin chào, ${sessionScope.account.fullname != null ? sessionScope.account.fullname : sessionScope.account.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/hello">Thông tin tài khoản</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/list">Đi đến Admin</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-sm me-2">Đăng nhập</a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-light btn-sm">Đăng ký</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>