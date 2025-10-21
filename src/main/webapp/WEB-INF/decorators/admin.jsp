<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Admin - <decorator:title default="Dashboard"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        body { font-size: .875rem; }
        .sidebar { position: fixed; top: 0; bottom: 0; left: 0; z-index: 100; padding: 48px 0 0; box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1); }
        .sidebar-sticky { position: relative; top: 0; height: calc(100vh - 48px); padding-top: .5rem; overflow-x: hidden; overflow-y: auto; }
        .nav-link { font-weight: 500; color: #333; }
        .nav-link .fas { margin-right: 8px; }
        .nav-link.active { color: #007bff; }
    </style>
    <decorator:head/>
</head>
<body>

    <jsp:include page="/common/admin/header.jsp" />

    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/common/admin/sidebar.jsp" />

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 pt-4">
                <decorator:body/>
                
                <jsp:include page="/common/admin/footer.jsp" />
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>