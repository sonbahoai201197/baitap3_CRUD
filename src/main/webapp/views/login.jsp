<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Đăng nhập - Baitap3 CRUD</title>

<style>
    .login-section {
        min-height: calc(100vh - 56px);
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        padding: 80px 0;
    }

    .login-card {
        max-width: 400px;
        margin: 0 auto;
        background: white;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .login-header {
        background: #0d6efd;
        color: white;
        padding: 20px;
        text-align: center;
    }

    .login-header i {
        font-size: 3rem;
        margin-bottom: 10px;
    }

    .login-body {
        padding: 30px;
    }

    .form-floating > .form-control {
        padding: 1rem 0.75rem;
    }

    .form-floating > label {
        padding: 1rem 0.75rem;
    }

    .alert {
        border-radius: 10px;
    }
</style>

<section class="login-section">
    <div class="container">
        <div class="login-card">
            <div class="login-header">
                <i class="bi bi-person-circle"></i>
                <h2 class="mb-0">Đăng nhập</h2>
            </div>
            
            <div class="login-body">
                <c:if test="${not empty alert}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${alert}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="username" name="username" 
                               value="${username}" placeholder="Tên đăng nhập" required>
                        <label for="username"><i class="bi bi-person me-1"></i>Tên đăng nhập</label>
                    </div>

                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" id="password" name="password" 
                               placeholder="Mật khẩu" required>
                        <label for="password"><i class="bi bi-lock me-1"></i>Mật khẩu</label>
                    </div>

                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="remember" name="remember" 
                                   value="on" ${remember eq 'on' ? 'checked' : ''}>
                            <label class="form-check-label" for="remember">
                                Ghi nhớ đăng nhập
                            </label>
                        </div>
                        <a href="#" class="text-primary text-decoration-none">Quên mật khẩu?</a>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Đăng nhập
                        </button>
                    </div>
                </form>

                <div class="text-center mt-4">
                    <p class="mb-0">Chưa có tài khoản? 
                        <a href="${pageContext.request.contextPath}/register" class="text-primary text-decoration-none">
                            Đăng ký ngay
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>