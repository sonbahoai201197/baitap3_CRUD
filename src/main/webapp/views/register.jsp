<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký - Baitap3 CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet"/>
    <style>
        body { 
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .register-card {
            max-width: 500px;
            margin: 40px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .register-header {
            background: #198754;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .register-header i {
            font-size: 3rem;
            margin-bottom: 10px;
        }
        .register-body {
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
</head>
<body>

<div class="container">
    <div class="register-card">
        <div class="register-header">
            <i class="bi bi-person-plus-fill"></i>
            <h2 class="mb-0">Tạo tài khoản mới</h2>
        </div>
        
        <div class="register-body">
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Tài khoản" required>
                    <label for="username"><i class="bi bi-person me-1"></i>Tài khoản</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                    <label for="email"><i class="bi bi-envelope me-1"></i>Email</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                    <label for="password"><i class="bi bi-lock me-1"></i>Mật khẩu</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Họ tên">
                    <label for="fullname"><i class="bi bi-person-badge me-1"></i>Họ tên</label>
                </div>

                <div class="form-floating mb-4">
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Số điện thoại">
                    <label for="phone"><i class="bi bi-telephone me-1"></i>Số điện thoại</label>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-success btn-lg">
                        <i class="bi bi-person-check me-2"></i>Đăng ký
                    </button>
                </div>
            </form>

            <div class="text-center mt-4">
                <p class="mb-0">Đã có tài khoản? 
                    <a href="${pageContext.request.contextPath}/login" class="text-success text-decoration-none">
                        Đăng nhập ngay
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
