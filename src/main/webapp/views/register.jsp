<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
    <h2>Tạo tài khoản mới</h2>
    <c:if test="${not empty error}">
        <h3 style="color:red">${error}</h3>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <label>Email: <input type="email" name="email" required></label><br>
        <label>Tài khoản: <input type="text" name="username" required></label><br>
        <label>Mật khẩu: <input type="password" name="password" required></label><br>
        <label>Họ tên: <input type="text" name="fullname"></label><br>
        <label>SĐT: <input type="text" name="phone"></label><br>
        <button type="submit">Đăng ký</button>
    </form>
</body>
</html>
