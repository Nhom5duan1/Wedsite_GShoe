-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2024 at 03:04 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xuong_db_wedsite-thu-cung`
--

-- --------------------------------------------------------

--
-- Table structure for table `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `noi_dung` text NOT NULL,
  `ngay_dang` date NOT NULL,
  `trang_thai` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `binh_luans`
--

INSERT INTO `binh_luans` (`id`, `san_pham_id`, `tai_khoan_id`, `noi_dung`, `ngay_dang`, `trang_thai`) VALUES
(1, 2, 5, 'Sản phẩm tuyệt vời', '2024-07-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hangs`
--

CREATE TABLE `chi_tiet_don_hangs` (
  `id` int NOT NULL,
  `don_hang_id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `don_gia` decimal(10,2) NOT NULL,
  `so_luong` int NOT NULL,
  `thanh_tien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chi_tiet_don_hangs`
--

INSERT INTO `chi_tiet_don_hangs` (`id`, `don_hang_id`, `san_pham_id`, `don_gia`, `so_luong`, `thanh_tien`) VALUES
(1, 1, 2, '9000000.00', 12, '9000000.00'),
(2, 2, 2, '10000000.00', 1, '10000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_gio_hangs`
--

CREATE TABLE `chi_tiet_gio_hangs` (
  `id` int NOT NULL,
  `gio_hang_id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `so_luong` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chuc_vus`
--

CREATE TABLE `chuc_vus` (
  `id` int NOT NULL,
  `ten_chuc_vu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chuc_vus`
--

INSERT INTO `chuc_vus` (`id`, `ten_chuc_vu`) VALUES
(1, 'admin'),
(2, 'khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `danh_mucs`
--

CREATE TABLE `danh_mucs` (
  `id` int NOT NULL,
  `ten_danh_muc` varchar(255) NOT NULL,
  `mo_ta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `danh_mucs`
--

INSERT INTO `danh_mucs` (`id`, `ten_danh_muc`, `mo_ta`) VALUES
(1, 'Chó ( Dog )', 'Các loại giống chó'),
(2, 'Mèo ( Cat )', 'Các loại giống mèo'),
(3, 'Chuột hamster', 'Chuột Hamster là loại thú cưng nhỏ nhắn được yêu thích bởi chiếc má phúng phính'),
(4, 'Rồng đất – Iguana', 'Rồng Nam Mỹ'),
(5, 'Sóc', 'Sóc bay Úc hay sóc bay Sugar Glider là một phân loài của loài thú có túi Petaurus breviceps có nguồn gốc từ bờ biển đông bắc nước Úc.'),
(6, 'Thỏ', 'Thỏ là động vật có vú nhỏ được xếp vào họ Leporidue thuộc bộ Lagomorpha');

-- --------------------------------------------------------

--
-- Table structure for table `don_hangs`
--

CREATE TABLE `don_hangs` (
  `id` int NOT NULL,
  `ma_don_hang` varchar(50) NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `ten_nguoi_nhan` varchar(255) NOT NULL,
  `email_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sdt_nguoi_nhan` varchar(15) NOT NULL,
  `dia_chi_nguoi_nhan` text NOT NULL,
  `ngay_dat` date NOT NULL,
  `tong_tien` decimal(10,2) NOT NULL,
  `ghi_chu` text,
  `phuong_thuc_thanh_toan_id` int NOT NULL,
  `trang_thai_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `don_hangs`
--

INSERT INTO `don_hangs` (`id`, `ma_don_hang`, `tai_khoan_id`, `ten_nguoi_nhan`, `email_nguoi_nhan`, `sdt_nguoi_nhan`, `dia_chi_nguoi_nhan`, `ngay_dat`, `tong_tien`, `ghi_chu`, `phuong_thuc_thanh_toan_id`, `trang_thai_id`) VALUES
(1, 'DH-1', 5, 'Nguyễn Văn A', 'Nguyenvana@gmail.com', '0987654321', '13 Trịnh Văn Bô, Hà Nội', '2024-08-01', '9000000.00', 'Chú ý hàng dễ ', 1, 2),
(2, 'DH-2', 7, 'Dương Thị Mai', 'Duongthimai@gmail.com', '0123456789', 'Nam Từ Liêm, Hà Nội', '2024-08-02', '10000000.00', 'Chú ý hàng là cần bảo quản ', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `gio_hangs`
--

CREATE TABLE `gio_hangs` (
  `id` int NOT NULL,
  `tai_khoan_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hinh_anh_san_phams`
--

CREATE TABLE `hinh_anh_san_phams` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `link_hinh_anh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hinh_anh_san_phams`
--

INSERT INTO `hinh_anh_san_phams` (`id`, `san_pham_id`, `link_hinh_anh`) VALUES
(5, 2, './uploads/1722238976tải xuống (5).jpg'),
(6, 2, './uploads/1722238976tải xuống (6).jpg'),
(7, 2, './uploads/1722238976tải xuống (7).jpg'),
(8, 3, './uploads/1723475525tải xuống (4).jpg'),
(9, 3, './uploads/1723475529tải xuống (3).jpg'),
(10, 3, './uploads/1723394215pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(11, 4, './uploads/1723394290pngtree-cartoon-cat-cute-cat-hand-painted-cat-cat-cute-pet-png-image_449977.jpg'),
(12, 4, './uploads/1723394290pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(13, 4, './uploads/1723394290pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(14, 5, './uploads/1723394333pngtree-cartoon-cat-cute-cat-hand-painted-cat-cat-cute-pet-png-image_449977.jpg'),
(15, 5, './uploads/1723394333pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(16, 5, './uploads/1723394333pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(17, 6, './uploads/1723394490pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(18, 6, './uploads/1723394490pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(19, 6, './uploads/1723394490tải xuống (1).jpg'),
(20, 2, './uploads/1723477028Logo maker project.png'),
(21, 2, './uploads/1723477036pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(22, 2, './uploads/1723477046Logo maker project (3).png'),
(23, 7, './uploads/1723482105anh.jpg'),
(24, 7, './uploads/1723482105Logo maker project (3).png'),
(25, 7, './uploads/1723482105Logo maker project.png'),
(26, 7, './uploads/1723482105pngtree-cartoon-cat-cute-cat-hand-painted-cat-cat-cute-pet-png-image_449977.jpg'),
(27, 7, './uploads/1723482105pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(28, 7, './uploads/1723482105pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(29, 7, './uploads/1723482105tải xuống (1).jpg'),
(30, 7, './uploads/1723482105tải xuống (2).jpg'),
(31, 7, './uploads/1723482105tải xuống (3).jpg'),
(32, 7, './uploads/1723482105tải xuống (4).jpg'),
(33, 7, './uploads/1723482105tải xuống (5).jpg'),
(34, 8, './uploads/1723558922pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(35, 8, './uploads/1723558922pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(36, 8, './uploads/1723558922tải xuống (1).jpg'),
(37, 8, './uploads/1723558922tải xuống (2).jpg'),
(38, 8, './uploads/1723558922tải xuống (3).jpg'),
(39, 8, './uploads/1723558922tải xuống (4).jpg'),
(40, 8, './uploads/1723558922tải xuống (5).jpg'),
(41, 9, './uploads/1723558946pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(42, 9, './uploads/1723558946pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(43, 9, './uploads/1723558946tải xuống (1).jpg'),
(44, 9, './uploads/1723558946tải xuống (2).jpg'),
(45, 9, './uploads/1723558946tải xuống (3).jpg'),
(46, 9, './uploads/1723558946tải xuống (4).jpg'),
(47, 9, './uploads/1723558946tải xuống (5).jpg'),
(48, 10, './uploads/1723558971pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png'),
(49, 10, './uploads/1723558971pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png'),
(50, 10, './uploads/1723558971tải xuống (1).jpg'),
(51, 10, './uploads/1723558971tải xuống (2).jpg'),
(52, 10, './uploads/1723558971tải xuống (3).jpg'),
(53, 10, './uploads/1723558971tải xuống (4).jpg'),
(54, 10, './uploads/1723558971tải xuống (5).jpg'),
(55, 11, './uploads/1723558997pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png');

-- --------------------------------------------------------

--
-- Table structure for table `phuong_thuc_thanh_toans`
--

CREATE TABLE `phuong_thuc_thanh_toans` (
  `id` int NOT NULL,
  `ten_phuong_thuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phuong_thuc_thanh_toans`
--

INSERT INTO `phuong_thuc_thanh_toans` (`id`, `ten_phuong_thuc`) VALUES
(1, 'COD(Thanh toán khi nhận hàng)'),
(2, 'Thanh toán online');

-- --------------------------------------------------------

--
-- Table structure for table `san_phams`
--

CREATE TABLE `san_phams` (
  `id` int NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `gia_san_pham` decimal(10,2) NOT NULL,
  `gia_khuyen_mai` decimal(10,2) DEFAULT NULL,
  `hinh_anh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `so_luong` int NOT NULL,
  `luot_xem` int DEFAULT '0',
  `ngay_nhap` date NOT NULL,
  `mo_ta` text,
  `danh_muc_id` int NOT NULL,
  `trang_thai` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `san_phams`
--

INSERT INTO `san_phams` (`id`, `ten_san_pham`, `gia_san_pham`, `gia_khuyen_mai`, `hinh_anh`, `so_luong`, `luot_xem`, `ngay_nhap`, `mo_ta`, `danh_muc_id`, `trang_thai`) VALUES
(2, 'Chó lông dài', '11000000.00', '9000000.00', './uploads/1723395353Ảnh chụp màn hình 2024-07-25 234110.png', 1, 8, '2024-07-02', 'Mèo anh', 1, 1),
(3, 'Chó cỏ', '1000000.00', '8000000.00', './uploads/1723481984anh.jpg', 1, 9, '2024-08-11', 'chó cỏ giống chó giữ nhà ', 1, 1),
(4, 'Mèo anh', '2000000.00', NULL, './uploads/1723394290pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263 (1).png', 2, 5, '2024-08-12', '', 2, 1),
(5, 'Chó Phú Quốc', '3000000.00', '1000000.00', './uploads/1723394333Logo maker project (3).png', 3, 6, '2024-08-06', '', 1, 1),
(6, 'Chó Bug', '12313.00', NULL, './uploads/1723394490pngtree-cartoon-cat-cute-cat-hand-painted-cat-cat-cute-pet-png-image_449977.jpg', 123213, 10, '2024-08-09', '', 1, 1),
(7, 'chó phốc', '12341242.00', '12242.00', './uploads/1723482105tải xuống (4).jpg', 12, 7, '2024-08-13', 'chó phốcchó phốcchó phốcchó phốcchó phốcchó phốc', 1, 1),
(8, 'sdds', '2414.00', '124124.00', './uploads/1723558922Logo maker project (3).png', 1, 12, '2024-08-13', '', 2, 1),
(9, '123', '1232.00', '1232.00', './uploads/1723558946tải xuống (2).jpg', 123, 123, '2024-08-28', '', 1, 1),
(10, '123', '123.00', '12323.00', './uploads/1723558971anh.jpg', 123, 123, '2024-08-13', '', 4, 1),
(11, '23123', '12323.00', '123213.00', './uploads/1723558997pngtree-favorite-cat-pet-shop-logo-cat-hand-drawn-graphics-png-image_4569263.png', 123, 1231, '2024-08-29', 'https://www.youtube.com/watch?v=TI-EBIc7fnE&list=PLuegt8mCyPRtC6eMIckpjIqlfkSRT9z41&index=1&t=5s', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoans`
--

CREATE TABLE `tai_khoans` (
  `id` int NOT NULL,
  `ho_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gioi_tinh` tinyint(1) DEFAULT '1',
  `dia_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `chuc_vu_id` int NOT NULL,
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tai_khoans`
--

INSERT INTO `tai_khoans` (`id`, `ho_ten`, `anh_dai_dien`, `ngay_sinh`, `email`, `so_dien_thoai`, `gioi_tinh`, `dia_chi`, `mat_khau`, `chuc_vu_id`, `trang_thai`) VALUES
(4, 'admin', NULL, NULL, 'admin@fpt.edu.vn', '0987654321', 1, NULL, '123456', 1, 1),
(5, 'Nguyễn Văn A', NULL, '2024-09-01', 'nguyenvana@gmail.com', '0123456789', 1, 'Số 1 Ba Đình ', '$2y$10$eWR2UeWYgsDppvSiGVjMAuk0xlNuGlj8hLL6wCg3PSsOF6BeiSmAG', 2, 1),
(7, 'Nguyễn Thị B', NULL, NULL, 'nguyenthib@gmail.com', '0123443210', 2, 'Hà Nội', '$2y$10$WegmWQsuO7nM/tHqrsvoY.tx6gRNQiV1WRSCED3NhGWRlFrFOVVFa', 2, 2),
(8, 'Admin2', NULL, NULL, 'admin2@gmail.com', '0999256387', 1, NULL, '123', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trang_thai_don_hangs`
--

CREATE TABLE `trang_thai_don_hangs` (
  `id` int NOT NULL,
  `ten_trang_thai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trang_thai_don_hangs`
--

INSERT INTO `trang_thai_don_hangs` (`id`, `ten_trang_thai`) VALUES
(1, 'Chưa xác nhận'),
(2, 'Chưa thanh toán'),
(3, 'Đang chuẩn bị hàng'),
(4, 'Đang giao'),
(5, 'Đã xác nhận'),
(6, 'Đã thanh toán'),
(7, 'Đã giao'),
(8, 'Đã nhận'),
(9, 'Thành công'),
(10, 'Hoàn hàng'),
(11, 'Hủy đơn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chuc_vus`
--
ALTER TABLE `chuc_vus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danh_mucs`
--
ALTER TABLE `danh_mucs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chuc_vus`
--
ALTER TABLE `chuc_vus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danh_mucs`
--
ALTER TABLE `danh_mucs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `don_hangs`
--
ALTER TABLE `don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tai_khoans`
--
ALTER TABLE `tai_khoans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
