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
// Truy vấn SQL để lấy dữ liệu bảng binh_luans
$sql_binh_luans = "SELECT * FROM binh_luans";
$result_binh_luans = $conn->query($sql_binh_luans);

// Lưu dữ liệu bảng binh_luans
$binh_luans = [];
if ($result_binh_luans->num_rows > 0) {
    while ($row = $result_binh_luans->fetch_assoc()) {
        $binh_luans[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng danh_mucs
$sql_danh_mucs = "SELECT * FROM danh_mucs";
$result_danh_mucs = $conn->query($sql_danh_mucs);

// Lưu dữ liệu bảng danh_mucs
$danh_mucs = [];
if ($result_danh_mucs->num_rows > 0) {
    while ($row = $result_danh_mucs->fetch_assoc()) {
        $danh_mucs[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng san_phams kèm đường dẫn ảnh tuyệt đối
$sql_san_phams = "SELECT id, ten_san_pham, gia_san_pham, gia_khuyen_mai, so_luong, luot_xem, mo_ta, ngay_nhap, danh_muc_id, trang_thai, 
                  CONCAT('http://localhost/Wedsite_GShoe/Back-End/', hinh_anh) AS hinh_anh 
                  FROM san_phams";
$result_san_phams = $conn->query($sql_san_phams);

// Lưu dữ liệu bảng san_phams
$san_phams = [];
if ($result_san_phams->num_rows > 0) {
    while ($row = $result_san_phams->fetch_assoc()) {
        $san_phams[] = $row;
    }
}

// Thiết lập header trả về JSON
header('Content-Type: application/json');

// Tạo mảng kết quả kết hợp dữ liệu từ cả hai bảng
$data = [
    "binh_luans" => $binh_luans,
    "danh_mucs" => $danh_mucs,
    "san_phams" => $san_phams
];

// Trả về dữ liệu dưới dạng JSON
echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

// Đóng kết nối
$conn->close();
?>
