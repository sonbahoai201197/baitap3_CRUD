<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>Login</title></head>
<body>
<h2>Login</h2>
<c:if test="${not empty alert}">
  <p style="color:red">${alert}</p>
</c:if>
<form action="${pageContext.request.contextPath}/login" method="post">
  Username or Email: <input type="text" name="username"/><br/>
  Password: <input type="password" name="password"/><br/>
  Remember: <input type="checkbox" name="remember" value="on"/><br/>
  <button type="submit">Login</button>
</form>
</body></html>
