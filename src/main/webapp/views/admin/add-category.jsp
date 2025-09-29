<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Danh mục</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="container mt-4">

    <h2 class="mb-4">Thêm Danh mục mới</h2>

    <form action="${pageContext.request.contextPath}/admin/category/add" 
          method="post" enctype="multipart/form-data">

        <div class="mb-3">
            <label class="form-label">Tên Danh mục</label>
            <input type="text" class="form-control" name="name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Chọn Icon</label>
            <input type="file" class="form-control" name="icon" accept="image/*">
        </div>
        
        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="text" class="form-control" name="price" required>
        </div>

        <button type="submit" class="btn btn-success">Lưu</button>
        <a href="${pageContext.request.contextPath}/admin/category/list" 
           class="btn btn-secondary">Hủy</a>
    </form>

</body>
</html>
