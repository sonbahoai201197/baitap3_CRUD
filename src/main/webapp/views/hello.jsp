<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- Redirect nếu chưa đăng nhập --%>
<c:if test="${empty sessionScope.account}">
    <c:redirect url="${pageContext.request.contextPath}/login"/>
</c:if>

<%-- Sitemesh sẽ lấy thẻ title này --%>
<title>Xin chào</title>

<%-- Sitemesh sẽ lấy thẻ style này vào <head> --%>
<style>
    .dashboard {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
</style>

<%-- Nội dung chính sẽ được Sitemesh đặt vào <decorator:body/> --%>
<div class="dashboard">
    <h2 class="mb-4 text-primary">
        Chào mừng, ${sessionScope.account.fullname != null ? sessionScope.account.fullname : sessionScope.account.username} 🎉
    </h2>

    <p><strong>Email:</strong> ${sessionScope.account.email}</p>

    <hr>

    <div class="d-flex flex-wrap gap-2">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">🏠 Về Home</a>
        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-outline-success">📂 Quản lý Category</a>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">🚪 Đăng xuất</a>
    </div>
</div>
<%-- Kết thúc nội dung chính --%>