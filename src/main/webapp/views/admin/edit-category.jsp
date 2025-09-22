<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Category</title>
</head>
<body>


<h2>Sửa Category</h2>
<form action="${pageContext.request.contextPath}/admin/category/edit" method="post">
    <input type="hidden" name="cate_id" value="${cate.cateId}">
    <label>Tên:</label>
    <input type="text" name="cate_name" value="${cate.cateName}" required><br>
    <label>Icon:</label>
    <input type="text" name="icons" value="${cate.icons}"><br>
    <button type="submit">Cập nhật</button>
</form>
<a href="${pageContext.request.contextPath}/admin/category/list">Quay lại</a>
</body>