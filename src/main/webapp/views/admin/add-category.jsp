<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Category</title>
</head>
<body>

<h2>Thêm Category</h2>
<form action="${pageContext.request.contextPath}/admin/category/add" method="post">
    <label>Tên:</label>
    <input type="text" name="cate_name" required><br>
    <label>Icon:</label>
    <input type="text" name="icons"><br>
    <button type="submit">Lưu</button>
</form>
<a href="${pageContext.request.contextPath}/admin/category/list">Quay lại</a>
</body>