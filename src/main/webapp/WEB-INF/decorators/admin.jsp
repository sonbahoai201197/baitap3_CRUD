<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>  

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Admin</title>
    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
 
    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Layout styling */
        .admin-layout {
            flex: 1;
            display: flex;
            margin-top: 56px;
        }

        /* Sidebar styling */
        .sidebar {
            width: 280px;
            background-color: #f8f9fa;
            border-right: 1px solid rgba(0, 0, 0, .1);
            position: fixed;
            height: calc(100vh - 56px);
            overflow-y: auto;
        }

        /* Main content area */
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 20px;
            background-color: #f5f6f8;
            min-height: calc(100vh - 56px);
        }

        /* Card and table styling */
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
            .admin-layout {
                flex-direction: column;
            }
        }

        /* Navigation styling */
        .nav-link {
            color: #495057;
            padding: .8rem 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .nav-link:hover {
            background-color: #e9ecef;
            color: #0d6efd;
        }
        
        .nav-link.active {
            color: #0d6efd;
            background-color: #e7f1ff;
        }
        
        .nav-link i {
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <%@ include file="/common/admin/header.jsp"%>

    <!-- Admin Layout -->
    <div class="admin-layout">
        <!-- Sidebar -->
        <%@ include file="/common/admin/sidebar.jsp"%>
        
        <!-- Main Content -->
        <main class="main-content">
            <div class="container-fluid">
                <sitemesh:write property='body'/>
            </div>
        </main>
    </div>

    <!-- Footer -->
    <%@ include file="/common/footer.jsp"%>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Active nav link -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const currentPath = window.location.pathname;
            document.querySelectorAll('.nav-link').forEach(link => {
                if (link.getAttribute('href') === currentPath) {
                    link.classList.add('active');
                }
            });
        });
    </script>
</body>
</html>