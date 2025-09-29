<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body { background: #f8f9fa; }
        .home-container {
            max-width: 600px;
            margin: 100px auto;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }
    </style>
</head>
<body>
<div class="home-container">
    <h1 class="mb-4 text-primary">🌟 Chào mừng bạn đến với Bình nguyên vô tận 🌟</h1>
    <p class="lead mb-4">Vui lòng đăng nhập hoặc đăng ký để tiếp tục</p>

    <div class="d-flex justify-content-center gap-3">
        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-lg">🔑 Đăng nhập</a>
        <a href="${pageContext.request.contextPath}/register" class="btn btn-success btn-lg">📝 Đăng ký</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
