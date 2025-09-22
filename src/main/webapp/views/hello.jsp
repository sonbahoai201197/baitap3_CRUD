<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.baitap3.models.User" %>
<%
    User u = (User) session.getAttribute("user");
    if (u == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/></head>
<body>
<h2>Welcome, <%= u.getFullname() != null ? u.getFullname() : u.getUsername() %></h2>
<p>Email: <%= u.getEmail() %></p>
<p><a href="<%= request.getContextPath() %>/logout">Logout</a></p>
</body>
</html>