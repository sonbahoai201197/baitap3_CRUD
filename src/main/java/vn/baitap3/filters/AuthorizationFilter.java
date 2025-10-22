package vn.baitap3.filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.baitap3.models.User;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        
        String url = req.getRequestURI();
        
        // Cho phép truy cập các resource static và một số trang công khai
        if (isPublicResource(url)) {
            chain.doFilter(request, response);
            return;
        }

        // Kiểm tra đăng nhập
        if (session == null || session.getAttribute("account") == null) {
            // Nếu chưa đăng nhập và cố truy cập trang admin hoặc trang user
            if (url.startsWith(req.getContextPath() + "/admin") || 
                url.startsWith(req.getContextPath() + "/home")) {
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            // Cho phép truy cập trang login và register
            chain.doFilter(request, response);
            return;
        }

        // Đã đăng nhập, kiểm tra role
        User user = (User) session.getAttribute("account");
        
        // Nếu là admin (roleid = 1)
        if (user.getRoleid() == 1) {
            // Admin có thể truy cập mọi trang
            chain.doFilter(request, response);
            return;
        }
        
        // Nếu là user thường (roleid = 3) cố truy cập trang admin
        if (user.getRoleid() == 3 && url.startsWith(req.getContextPath() + "/admin")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        // Cho phép các trường hợp còn lại
        chain.doFilter(request, response);
    }

    private boolean isPublicResource(String url) {
        return url.endsWith(".css") || 
               url.endsWith(".js") || 
               url.endsWith(".jpg") || 
               url.endsWith(".png") ||
               url.endsWith(".ico") ||
               url.contains("/login") ||
               url.contains("/register") ||
               url.contains("/logout");
    }

    @Override
    public void destroy() {
    }
}