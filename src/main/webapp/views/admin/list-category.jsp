<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Category</title>
</head>
<body>
    <h2>Danh sách Category</h2>
    <a href="${pageContext.request.contextPath}/admin/category/add">+ Thêm mới</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Icon</th>
            <th>Hành động</th>
        </tr>
        <c:forEach items="${cateList}" var="c">
            <tr>
                <td>${c.cateId}</td>
                <td>${c.cateName}</td>
                <td>${c.icons}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${c.cateId}">Sửa</a> |
                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${c.cateId}" onclick="return confirm('Xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
