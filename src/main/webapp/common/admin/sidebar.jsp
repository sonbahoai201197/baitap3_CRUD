<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">
                    <i class="fas fa-tachometer-alt fa-fw"></i>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/category/list">
                    <i class="fas fa-list fa-fw"></i>
                    Quản lý Danh mục
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-users fa-fw"></i>
                    Quản lý Người dùng (Ví dụ)
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-box fa-fw"></i>
                    Quản lý Sản phẩm (Ví dụ)
                </a>
            </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
            <span>Báo cáo (Ví dụ)</span>
            <a class="link-secondary" href="#" aria-label="Add a new report">
                <i class="fas fa-plus-circle"></i>
            </a>
        </h6>
        <ul class="nav flex-column mb-2">
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-chart-line fa-fw"></i>
                    Doanh thu tháng
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-chart-bar fa-fw"></i>
                    Người dùng mới
                </a>
            </li>
        </ul>
    </div>
</nav>