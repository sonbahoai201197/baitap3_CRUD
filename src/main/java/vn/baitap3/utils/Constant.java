package vn.baitap3.utils;

public class Constant {
    // Đường dẫn thư mục upload
    public static final String UPLOAD_PRODUCT_DIR = "uploads/products";
    public static final String UPLOAD_CATEGORY_DIR = "uploads/categories";
    
    // Định dạng file ảnh cho phép
    public static final String[] ALLOWED_IMAGE_TYPES = {
        "image/jpeg",
        "image/png",
        "image/gif"
    };
    
    // Kích thước tối đa cho file upload (10MB)
    public static final long MAX_FILE_SIZE = 10 * 1024 * 1024;
    
    // Định dạng tên file: timestamp_tên-gốc.đuôi
    public static String generateFileName(String originalFileName) {
        String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
        return System.currentTimeMillis() + "_" + originalFileName.substring(0, originalFileName.lastIndexOf('.'))
                .toLowerCase()
                .replaceAll("[^a-z0-9]", "-") 
                + extension;
    }
    
    // Kiểm tra định dạng file
    public static boolean isImageFile(String contentType) {
        for (String type : ALLOWED_IMAGE_TYPES) {
            if (type.equals(contentType)) {
                return true;
            }
        }
        return false;
    }
}
