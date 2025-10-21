<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Đăng nhập</title>

<style>
    .login-box {
        max-width: 400px;
        width: 100%;
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
</style>

<div class="login-box">
    <h2 class="text-center mb-4">Đăng nhập</h2>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger">${alert}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label class="form-label">Tên đăng nhập hoặc Email</label>
            <input type="text" class="form-control" name="username" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" name="password" required>
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="remember" value="on" id="remember">
            <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>
    <div class="text-center mt-3">
        <p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký</a></p>
    </div>
</div>