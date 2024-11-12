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

// Truy vấn SQL để lấy dữ liệu bảng chi_tiet_don_hangs
$sql_chi_tiet_don_hangs = "SELECT * FROM chi_tiet_don_hangs";
$result_chi_tiet_don_hangs = $conn->query($sql_chi_tiet_don_hangs);
// Lưu dữ liệu bảng chi_tiet_don_hangs
$chi_tiet_don_hangs = [];
if ($result_chi_tiet_don_hangs->num_rows > 0) {
    while ($row = $result_chi_tiet_don_hangs->fetch_assoc()) {
        $chi_tiet_don_hangs[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng chi_tiet_gio_hangs
$sql_chi_tiet_gio_hangs = "SELECT * FROM chi_tiet_gio_hangs";
$result_chi_tiet_gio_hangs = $conn->query($sql_chi_tiet_gio_hangs);
// Lưu dữ liệu bảng chi_tiet_gio_hangs
$chi_tiet_gio_hangs = [];
if ($result_chi_tiet_gio_hangs->num_rows > 0) {
    while ($row = $result_chi_tiet_gio_hangs->fetch_assoc()) {
        $chi_tiet_gio_hangs[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng chuc_vus
$sql_chuc_vus = "SELECT * FROM chuc_vus";
$result_chuc_vus = $conn->query($sql_chuc_vus);
// Lưu dữ liệu bảng chuc_vus
$chuc_vus = [];
if ($result_chuc_vus->num_rows > 0) {
    while ($row = $result_chuc_vus->fetch_assoc()) {
        $chuc_vus[] = $row;
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

// Truy vấn SQL để lấy dữ liệu bảng don_hangs
$sql_don_hangs = "SELECT * FROM don_hangs";
$result_don_hangs = $conn->query($sql_don_hangs);
// Lưu dữ liệu bảng don_hangs
$don_hangs = [];
if ($result_don_hangs->num_rows > 0) {
    while ($row = $result_don_hangs->fetch_assoc()) {
        $don_hangs[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng gio_hangs
$sql_gio_hangs = "SELECT * FROM gio_hangs";
$result_gio_hangs = $conn->query($sql_gio_hangs);
// Lưu dữ liệu bảng gio_hangs
$gio_hangs = [];
if ($result_gio_hangs->num_rows > 0) {
    while ($row = $result_gio_hangs->fetch_assoc()) {
        $gio_hangs[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng hinh_anh_san_phams
$sql_hinh_anh_san_phams = "SELECT * FROM hinh_anh_san_phams";
$result_hinh_anh_san_phams = $conn->query($sql_hinh_anh_san_phams);
// Lưu dữ liệu bảng hinh_anh_san_phams
$hinh_anh_san_phams = [];
if ($result_hinh_anh_san_phams->num_rows > 0) {
    while ($row = $result_hinh_anh_san_phams->fetch_assoc()) {
        $hinh_anh_san_phams[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng phuong_thuc_thanh_toans
$sql_phuong_thuc_thanh_toans = "SELECT * FROM phuong_thuc_thanh_toans";
$result_phuong_thuc_thanh_toans = $conn->query($sql_phuong_thuc_thanh_toans);
// Lưu dữ liệu bảng phuong_thuc_thanh_toans
$phuong_thuc_thanh_toans = [];
if ($result_phuong_thuc_thanh_toans->num_rows > 0) {
    while ($row = $result_phuong_thuc_thanh_toans->fetch_assoc()) {
        $phuong_thuc_thanh_toans[] = $row;
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

// Truy vấn SQL để lấy dữ liệu bảng tai_khoans
$sql_tai_khoans = "SELECT * FROM tai_khoans";
$result_tai_khoans = $conn->query($sql_tai_khoans);
// Lưu dữ liệu bảng tai_khoans
$tai_khoans = [];
if ($result_tai_khoans->num_rows > 0) {
    while ($row = $result_tai_khoans->fetch_assoc()) {
        $tai_khoans[] = $row;
    }
}

// Truy vấn SQL để lấy dữ liệu bảng trang_thai_don_hangs
$sql_trang_thai_don_hangs = "SELECT * FROM trang_thai_don_hangs";
$result_trang_thai_don_hangs = $conn->query($sql_trang_thai_don_hangs);
// Lưu dữ liệu bảng trang_thai_don_hangs
$trang_thai_don_hangs = [];
if ($result_trang_thai_don_hangs->num_rows > 0) {
    while ($row = $result_trang_thai_don_hangs->fetch_assoc()) {
        $trang_thai_don_hangs[] = $row;
    }
}

// Thiết lập header trả về JSON
header('Content-Type: application/json');

// Tạo mảng kết quả kết hợp dữ liệu từ cả hai bảng
$data = [
    "binh_luans" => $binh_luans,
    "chi_tiet_don_hangs" => $chi_tiet_don_hangs,
    "chi_tiet_gio_hangs" => $chi_tiet_gio_hangs,
    "chuc_vus" => $chuc_vus,
    "danh_mucs" => $danh_mucs,
    "don_hangs" => $don_hangs,
    "gio_hangs" => $gio_hangs,
    "hinh_anh_san_phams" => $hinh_anh_san_phams,
    "phuong_thuc_thanh_toans" => $phuong_thuc_thanh_toans,
    "san_phams" => $san_phams,
    "tai_khoans" => $tai_khoans,
    "trang_thai_don_hangs" => $trang_thai_don_hangs,
];

// Trả về dữ liệu dưới dạng JSON
echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

// Đóng kết nối
$conn->close();
?>
