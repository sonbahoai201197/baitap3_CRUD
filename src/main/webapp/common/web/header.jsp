<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/home">
            <i class="bi bi-database-fill me-2 text-primary"></i>
            <span class="fw-semibold">Baitap3 CRUD</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#webNavbar" aria-controls="webNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="webNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/home">
                        <i class="bi bi-house-door me-1"></i>Trang chủ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/product">
                        <i class="bi bi-box-seam me-1"></i>Sản phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about">
                        <i class="bi bi-info-circle me-1"></i>Giới thiệu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">
                        <i class="bi bi-envelope me-1"></i>Liên hệ
                    </a>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <li class="nav-item dropdown me-3">
                            <a class="nav-link dropdown-toggle d-flex align-items-center" id="navbarDropdown" href="#" role="button" 
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-person-circle fs-5 me-2"></i>
                                <span class="d-none d-md-inline">${sessionScope.account.fullname != null ? sessionScope.account.fullname : sessionScope.account.username}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/hello">
                                        <i class="bi bi-person me-2"></i>Thông tin tài khoản
                                    </a>
                                </li>
                                <c:if test="${sessionScope.account.roleid == 1}">
                                    <li>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/list">
                                            <i class="bi bi-speedometer2 me-2"></i>Quản trị hệ thống
                                        </a>
                                    </li>
                                </c:if>
                                <li><hr class="dropdown-divider" /></li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                                        <i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Thêm nút Đăng xuất -->
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="${pageContext.request.contextPath}/logout">
                                <i class="bi bi-box-arrow-right me-1"></i>
                                <span class="d-none d-sm-inline">Đăng xuất</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">
                                <i class="bi bi-box-arrow-in-right me-1"></i>Đăng nhập
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/register">
                                <i class="bi bi-person-plus me-1"></i>Đăng ký
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- Add spacing after fixed navbar -->
<div style="margin-top: 56px;"></div>