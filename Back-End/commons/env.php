<?php 
// Biến môi trường, dùng chung toàn hệ thống
// Khai báo dưới dạng HẰNG SỐ để không phải dùng $GLOBALS
define('BASE_URL'       , 'http://localhost/Wedsite_GShoe/Back-End/');
define('BASE_URL_ADMIN'       , 'http://localhost/Wedsite_GShoe/Back-End/admin/'); // Đường dẫn vào phần admin
define('DB_HOST'    , 'localhost');
define('DB_PORT'    , 3306);
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME'    , 'db_wedsite_GShoe');  // Tên database
define('PATH_ROOT'    , __DIR__ . '/../');