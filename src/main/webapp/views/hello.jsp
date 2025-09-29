<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty sessionScope.account}">
    <c:redirect url="${pageContext.request.contextPath}/login"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xin chào</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body { background: #f8f9fa; }
        .dashboard {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="dashboard">
    <h2 class="mb-4 text-primary">
        Chào mừng, ${sessionScope.account.fullname != null ? sessionScope.account.fullname : sessionScope.account.username} 🎉
    </h2>

    <p><strong>Email:</strong> ${sessionScope.account.email}</p>

    <hr>

    <div class="d-flex gap-2">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">🏠 Về Home</a>
        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-outline-success">📂 Quản lý Category</a>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">🚪 Đăng xuất</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
