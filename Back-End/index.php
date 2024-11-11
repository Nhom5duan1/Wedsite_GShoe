<?php 
session_start();
// Require file Common
require_once './commons/env.php'; // Khai báo biến môi trường
require_once './commons/function.php'; // Hàm hỗ trợ
// Route
$act = $_GET['act'] ?? '/';
match ($act) {
    // Trang chủ
    '/' => (header("Location: " . BASE_URL_ADMIN ))
};