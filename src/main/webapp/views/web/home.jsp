<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Trang chủ - Baitap3 CRUD</title>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 mb-4">Chào mừng đến với Baitap3 CRUD</h1>
            <p class="lead mb-4">
                Một ứng dụng web đơn giản sử dụng JSP/Servlet và Bootstrap 
                để thực hiện các chức năng CRUD cơ bản.
            </p>
            
            <c:choose>
                <c:when test="${empty sessionScope.account}">
                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-lg px-4">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Đăng nhập
                        </a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-primary btn-lg px-4">
                            <i class="bi bi-person-plus me-2"></i>Đăng ký
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-success d-inline-flex align-items-center px-4 py-3" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i>
                        <div>
                            Bạn đã đăng nhập với tài khoản 
                            <strong>${sessionScope.account.fullname != null ? sessionScope.account.fullname : sessionScope.account.username}</strong>
                        </div>
                    </div>
                    <div class="mt-4">
                        <c:if test="${sessionScope.account.roleid == 1}">
                            <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-primary btn-lg me-2">
                                <i class="bi bi-speedometer2 me-2"></i>Vào trang quản trị
                            </a>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/hello" class="btn btn-outline-primary btn-lg">
                            <i class="bi bi-person-circle me-2"></i>Xem thông tin tài khoản
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-md-4">
            <div class="text-center">
                <div class="p-3 rounded-circle bg-primary bg-opacity-10 d-inline-flex mb-3">
                    <i class="bi bi-shield-check text-primary fs-3"></i>
                </div>
                <h4>Bảo mật</h4>
                <p class="text-muted">Hệ thống xác thực và phân quyền người dùng.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="text-center">
                <div class="p-3 rounded-circle bg-success bg-opacity-10 d-inline-flex mb-3">
                    <i class="bi bi-speedometer2 text-success fs-3"></i>
                </div>
                <h4>Quản lý</h4>
                <p class="text-muted">Quản lý danh mục và sản phẩm dễ dàng.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="text-center">
                <div class="p-3 rounded-circle bg-info bg-opacity-10 d-inline-flex mb-3">
                    <i class="bi bi-bootstrap text-info fs-3"></i>
                </div>
                <h4>Bootstrap 5</h4>
                <p class="text-muted">Giao diện hiện đại với Bootstrap 5.</p>
            </div>
        </div>
    </div>
</div>