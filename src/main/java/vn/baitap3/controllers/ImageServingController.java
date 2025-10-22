package vn.baitap3.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.baitap3.utils.Constant;

@WebServlet("/uploads/products/*")
public class ImageServingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Lấy tên file từ URL
        String fileName = pathInfo.substring(1);
        
        // Tạo đường dẫn đến file
        String uploadPath = getServletContext().getRealPath("") + File.separator + Constant.UPLOAD_DIR;
        File file = new File(uploadPath + File.separator + fileName);
        
        // Kiểm tra file tồn tại
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Xác định content type
        String contentType = getServletContext().getMimeType(file.getName());
        if (contentType == null || !contentType.startsWith("image/")) {
            response.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
            return;
        }
        
        // Thiết lập response headers
        response.setContentType(contentType);
        response.setContentLengthLong(file.length());
        
        // Cache control - cache trong 1 ngày
        response.setHeader("Cache-Control", "public, max-age=86400");
        
        // Ghi file vào response
        Files.copy(file.toPath(), response.getOutputStream());
    }
}