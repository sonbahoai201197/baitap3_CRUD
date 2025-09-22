<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category List</title>
</head>
<body>
<h2>Danh sách Category</h2>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Mô tả</th>
    </tr>
    <c:forEach var="cat" items="${listCategory}">
        <tr>
            <td>${cat.id}</td>
            <td>${cat.name}</td>
            <td>${cat.description}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
