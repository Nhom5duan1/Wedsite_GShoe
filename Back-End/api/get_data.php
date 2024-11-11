<?php
// Thiết lập các header CORS trước mọi nội dung khác
header('Access-Control-Allow-Origin: http://127.0.0.1:5501'); // Chỉ cho phép từ FE
header('Access-Control-Allow-Methods: GET, POST, OPTIONS'); // Cho phép các phương thức
header('Access-Control-Allow-Headers: Content-Type, Authorization'); // Cho phép các header cần thiết

// Xử lý yêu cầu OPTIONS (preflight)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(204);
    exit();
}

// Import file env.php để kết nối DB
require_once __DIR__ . '/../commons/env.php';

// Kết nối đến database
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME, DB_PORT);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Truy vấn SQL để lấy dữ liệu sản phẩm kèm đường dẫn ảnh tuyệt đối
$sql = "SELECT id, ten_san_pham, gia_san_pham, so_luong, 
        CONCAT('http://localhost/Wedsite_GShoe/Back-End/', hinh_anh) AS hinh_anh 
        FROM san_phams";
$result = $conn->query($sql);

// Thiết lập header trả về JSON
header('Content-Type: application/json');

// Chuyển dữ liệu thành JSON
if ($result->num_rows > 0) {
    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
} else {
    echo json_encode([], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
}

// Đóng kết nối
$conn->close();
// http://localhost/Wedsite_GShoe/Back-End/api/get_data.php đường dẫn api 