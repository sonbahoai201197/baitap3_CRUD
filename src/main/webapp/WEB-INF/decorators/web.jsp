<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>  



<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home page</title>
<!-- Bootstrap CSS & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<style>
/* Thiết lập chung */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    line-height: 1.6;
    background-color: #f4f4f4;
    color: #333;
}

.container {
    width: 80%;
    margin: auto;
    overflow: hidden;
}

/* Kiểu cho phần header (đầu trang) */
header {
    background: #333;
    color: #fff;
    padding-top: 30px;
    min-height: 70px;
    border-bottom: #77aaff 3px solid;
    text-align: center;
}

header h1 {
    margin: 0;
    font-size: 2em;
}

header nav ul {
    padding: 0;
    margin: 0;
    list-style: none;
    display: flex;
    justify-content: center;
}

header nav ul li {
    padding: 0 15px 0 15px;
}

header nav a {
    color: #fff;
    text-decoration: none;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: bold;
}

header a:hover {
    color: #77aaff;
}

/* Kiểu cho phần main content (nội dung chính) */
main {
    padding: 20px 0;
}

.hero-section {
    background: #fff;
    padding: 40px;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.hero-section h2 {
    font-size: 2.5em;
    margin-bottom: 10px;
    color: #007bff;
}

.hero-section p {
    font-size: 1.2em;
    margin-bottom: 20px;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    background: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s;
}

.btn:hover {
    background: #0056b3;
}

/* Kiểu cho phần footer (chân trang) */
footer {
    background: #333;
    color: #fff;
    text-align: center;
    padding: 20px 0;
    margin-top: 20px;
}
</style>

</head>
<body>
 
<%@ include file="/common/web/header.jsp"%>
   <div class="container">
   		
   		
   		
   		<hr>
   		<div class="row">
   		
   		<sitemesh:write property="body"/>
   		
   		</div>
   		
   		<div class="row">
   		
   			
   		
   		</div>
   </div>
   
   <%@ include file="/common/footer.jsp"%>
   
    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>