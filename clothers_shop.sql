-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 03, 2023 lúc 08:41 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `clothers_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `ID` bigint(20) NOT NULL,
  `RE_LOGIN_TOKEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALIDATE_TOKEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  `STATUS_ID` bigint(20) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`ID`, `RE_LOGIN_TOKEN`, `VALIDATE_TOKEN`, `LAST_NAME`, `FIRST_NAME`, `PHONE`, `EMAIL`, `ADDRESS`, `USER_NAME`, `PASSWORD`, `ROLE_ID`, `STATUS_ID`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, NULL, NULL, 'Lương Hữu', 'Luân', '1215943200', 'admin1@gmail.com', NULL, 'admin1', 'e00cf25ad42683b3df678c61f42c6bda', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(2, NULL, NULL, 'Nguyễn Dũy', 'Long', '1325943200', 'admin2@gmail.com', NULL, 'admin2', 'c84258e9c39059a89ab77d846ddab909', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(3, NULL, NULL, 'Nguyễn Công', 'Phúc', '3455943200', 'admin3@gmail.com', NULL, 'admin3', '32cacb2f994f6b42183a1300d9a3e8d6', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(4, NULL, NULL, 'Nguyễn Văn', 'A', '1826384619', 'khachhang1@gmail.com', NULL, 'khachhang1', '32cacb2f994f6b42183a1300d9a3e8d6', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`ID`, `CODE`, `NAME`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 'NIKE', 'NIKE', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(2, 'FAKE', 'FAKE', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(3, 'LOCAL-BRAND', 'LOCAL BRAND', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(4, 'GUUCI', 'GUCCI', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(5, 'LV', 'LV', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `ID` bigint(20) NOT NULL,
  `ACCOUNT_ID` bigint(20) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `CART_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `COLOR_ID` bigint(20) DEFAULT NULL,
  `SIZE_ID` bigint(20) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`ID`, `CODE`, `NAME`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 'AO-KHOAT', 'ÁO KHOÁT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(2, 'QUAN-TAY', 'QUẦN TÂY', '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`ID`, `CODE`, `NAME`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 'DEN', 'ĐEN', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(2, 'TRANG', 'TRẮNG', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(3, 'DO', 'ĐỎ', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(4, 'XAM', 'XÁM', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(5, 'BAC', 'BẠC', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(6, 'XANH', 'XANH', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(7, 'XANH-REU', 'XANH RÊU', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(8, 'XANH-DEN', 'XANH ĐEN', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(9, 'BO', 'BÓ', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(10, 'BE', 'BE', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(11, 'NAU', 'NÂU', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `ID` bigint(20) NOT NULL,
  `ACCOUNT_ID` bigint(20) DEFAULT NULL,
  `RECIPIENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERS_PHONE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERS_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` bigint(20) DEFAULT 4,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `COLOR_ID` bigint(20) DEFAULT NULL,
  `SIZE_ID` bigint(20) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT 1,
  `PRICE` double DEFAULT NULL,
  `DISCOUNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photo`
--

CREATE TABLE `photo` (
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `PHOTO_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `photo`
--

INSERT INTO `photo` (`PRODUCT_ID`, `PHOTO_URL`) VALUES
(1, '/assets/imgs/product-imgs/ak_den_1_1.jpg'),
(1, '/assets/imgs/product-imgs/ak_den_1_2.jpg'),
(1, '/assets/imgs/product-imgs/ak_den_1_3.png'),
(1, '/assets/imgs/product-imgs/ak_den_1_4.jpg'),
(1, '/assets/imgs/product-imgs/ak_do_1_1.jpg'),
(1, '/assets/imgs/product-imgs/ak_do_1_2.jpg'),
(1, '/assets/imgs/product-imgs/ak_do_1_3.jpg'),
(1, '/assets/imgs/product-imgs/ak_do_1_4.jpg'),
(1, '/assets/imgs/product-imgs/ak_trang_1_1.jpg'),
(2, '/assets/imgs/product-imgs/ak_den_2_1.png'),
(2, '/assets/imgs/product-imgs/ak_den_2_2.png'),
(2, '/assets/imgs/product-imgs/ak_den_2_3.png'),
(2, '/assets/imgs/product-imgs/ak_den_2_4.png'),
(2, '/assets/imgs/product-imgs/ak_den_2_5.png'),
(2, '/assets/imgs/product-imgs/ak_den_2_6.png'),
(2, '/assets/imgs/product-imgs/ak_reu_2_1.png'),
(2, '/assets/imgs/product-imgs/ak_reu_2_2.png'),
(2, '/assets/imgs/product-imgs/ak_reu_2_3.png'),
(2, '/assets/imgs/product-imgs/ak_reu_2_4.png'),
(2, '/assets/imgs/product-imgs/ak_reu_2_5.png'),
(2, '/assets/imgs/product-imgs/ak_reu_2_6.png'),
(2, '/assets/imgs/product-imgs/ak_xam_2_1.png'),
(2, '/assets/imgs/product-imgs/ak_xam_2_2.png'),
(2, '/assets/imgs/product-imgs/ak_xam_2_3.png'),
(2, '/assets/imgs/product-imgs/ak_xam_2_4.png'),
(2, '/assets/imgs/product-imgs/ak_xam_2_5.png'),
(2, '/assets/imgs/product-imgs/ak_xam_2_6.png'),
(3, '/assets/imgs/product-imgs/ak_bo_3_1.png'),
(3, '/assets/imgs/product-imgs/ak_bo_3_2.png'),
(3, '/assets/imgs/product-imgs/ak_bo_3_3.png'),
(3, '/assets/imgs/product-imgs/ak_bo_3_4.jpg'),
(3, '/assets/imgs/product-imgs/ak_reu_3_1.png'),
(3, '/assets/imgs/product-imgs/ak_reu_3_2.png'),
(3, '/assets/imgs/product-imgs/ak_reu_3_3.png'),
(3, '/assets/imgs/product-imgs/ak_reu_3_4.png'),
(3, '/assets/imgs/product-imgs/ak_reu_3_5.png'),
(3, '/assets/imgs/product-imgs/ak_reu_3_6.jpg'),
(4, '/assets/imgs/product-imgs/ak_den_4_1.png'),
(4, '/assets/imgs/product-imgs/ak_den_4_2.png'),
(4, '/assets/imgs/product-imgs/ak_den_4_3.png'),
(4, '/assets/imgs/product-imgs/ak_xam_4_1.png'),
(4, '/assets/imgs/product-imgs/ak_xam_4_2.png'),
(4, '/assets/imgs/product-imgs/ak_xam_4_3.png'),
(4, '/assets/imgs/product-imgs/ak_xam_4_4.png'),
(5, '/assets/imgs/product-imgs/ak_den_5_1.png'),
(5, '/assets/imgs/product-imgs/ak_den_5_2.png'),
(5, '/assets/imgs/product-imgs/ak_den_5_3.png'),
(5, '/assets/imgs/product-imgs/ak_reu_5_1.png'),
(5, '/assets/imgs/product-imgs/ak_reu_5_2.png'),
(5, '/assets/imgs/product-imgs/ak_reu_5_3.png'),
(6, '/assets/imgs/product-imgs/ak_be_6_1.jpg'),
(6, '/assets/imgs/product-imgs/ak_be_6_2.jpg'),
(6, '/assets/imgs/product-imgs/ak_be_6_3.jpg'),
(6, '/assets/imgs/product-imgs/ak_be_6_4.jpg'),
(6, '/assets/imgs/product-imgs/ak_be_6_5.jpg'),
(6, '/assets/imgs/product-imgs/ak_den_6_1.jpg'),
(6, '/assets/imgs/product-imgs/ak_den_6_2.jpg'),
(6, '/assets/imgs/product-imgs/ak_den_6_3.jpg'),
(6, '/assets/imgs/product-imgs/ak_den_6_4.jpg'),
(6, '/assets/imgs/product-imgs/ak_den_6_5.jpg'),
(6, '/assets/imgs/product-imgs/ak_xanh_6_1.jpg'),
(6, '/assets/imgs/product-imgs/ak_xanh_6_2.jpg'),
(6, '/assets/imgs/product-imgs/ak_xanh_6_3.jpg'),
(6, '/assets/imgs/product-imgs/ak_xanh_6_4.jpg'),
(6, '/assets/imgs/product-imgs/ak_xanh_6_5.jpg'),
(7, '/assets/imgs/product-imgs/ak_bo_7_1.png'),
(7, '/assets/imgs/product-imgs/ak_bo_7_2.png'),
(7, '/assets/imgs/product-imgs/ak_bo_7_3.png'),
(7, '/assets/imgs/product-imgs/ak_bo_7_4.png'),
(7, '/assets/imgs/product-imgs/ak_bo_7_5.png'),
(7, '/assets/imgs/product-imgs/ak_den_7_1.png'),
(7, '/assets/imgs/product-imgs/ak_den_7_2.png'),
(7, '/assets/imgs/product-imgs/ak_den_7_3.png'),
(7, '/assets/imgs/product-imgs/ak_den_7_4.png'),
(7, '/assets/imgs/product-imgs/ak_xam_7_1.png'),
(7, '/assets/imgs/product-imgs/ak_xam_7_2.png'),
(7, '/assets/imgs/product-imgs/ak_xam_7_3.png'),
(7, '/assets/imgs/product-imgs/ak_xam_7_4.png'),
(8, '/assets/imgs/product-imgs/ak_den_8_1.png'),
(8, '/assets/imgs/product-imgs/ak_den_8_2.png'),
(8, '/assets/imgs/product-imgs/ak_den_8_3.jpg'),
(8, '/assets/imgs/product-imgs/ak_den_8_4.png'),
(8, '/assets/imgs/product-imgs/ak_den_8_5.png'),
(8, '/assets/imgs/product-imgs/ak_nau_8_1.png'),
(8, '/assets/imgs/product-imgs/ak_nau_8_2.png'),
(8, '/assets/imgs/product-imgs/ak_nau_8_3.jpg'),
(8, '/assets/imgs/product-imgs/ak_nau_8_4.png'),
(8, '/assets/imgs/product-imgs/ak_nau_8_5.png'),
(8, '/assets/imgs/product-imgs/ak_trang_8_1.png'),
(8, '/assets/imgs/product-imgs/ak_trang_8_2.png'),
(8, '/assets/imgs/product-imgs/ak_trang_8_3.png'),
(8, '/assets/imgs/product-imgs/ak_trang_8_4.png'),
(8, '/assets/imgs/product-imgs/ak_xam_8_1.png'),
(8, '/assets/imgs/product-imgs/ak_xam_8_2.png'),
(8, '/assets/imgs/product-imgs/ak_xam_8_3.jpg'),
(8, '/assets/imgs/product-imgs/ak_xam_8_4.png'),
(8, '/assets/imgs/product-imgs/ak_xam_8_5.png'),
(9, '/assets/imgs/product-imgs/ak_nau_9_1.jpg'),
(9, '/assets/imgs/product-imgs/ak_nau_9_2.jpg'),
(9, '/assets/imgs/product-imgs/ak_nau_9_3.jpg'),
(9, '/assets/imgs/product-imgs/ak_nau_9_4.jpg'),
(9, '/assets/imgs/product-imgs/ak_nau_9_5.jpg'),
(9, '/assets/imgs/product-imgs/ak_xam_9_1.jpg'),
(9, '/assets/imgs/product-imgs/ak_xam_9_2.jpg'),
(9, '/assets/imgs/product-imgs/ak_xam_9_3.jpg'),
(9, '/assets/imgs/product-imgs/ak_xam_9_4.jpg'),
(9, '/assets/imgs/product-imgs/ak_xam_9_5.jpg'),
(10, '/assets/imgs/product-imgs/ak_bo_10_1.jpg'),
(10, '/assets/imgs/product-imgs/ak_bo_10_2.jpg'),
(10, '/assets/imgs/product-imgs/ak_bo_10_3.jpg'),
(10, '/assets/imgs/product-imgs/ak_bo_10_4.jpg'),
(10, '/assets/imgs/product-imgs/ak_bo_10_5.jpg'),
(10, '/assets/imgs/product-imgs/ak_den_10_1.jpg'),
(10, '/assets/imgs/product-imgs/ak_den_10_2.jpg'),
(10, '/assets/imgs/product-imgs/ak_den_10_3.jpg'),
(10, '/assets/imgs/product-imgs/ak_den_10_4.jpg'),
(10, '/assets/imgs/product-imgs/ak_den_10_5.jpg'),
(10, '/assets/imgs/product-imgs/ak_xam_10_1.jpg'),
(10, '/assets/imgs/product-imgs/ak_xam_10_2.jpg'),
(10, '/assets/imgs/product-imgs/ak_xam_10_3.jpg'),
(10, '/assets/imgs/product-imgs/ak_xam_10_4.jpg'),
(10, '/assets/imgs/product-imgs/ak_xam_10_5.jpg'),
(11, '/assets/imgs/product-imgs/ak_den_11_1.png'),
(11, '/assets/imgs/product-imgs/ak_den_11_2.png'),
(11, '/assets/imgs/product-imgs/ak_den_11_3.png'),
(11, '/assets/imgs/product-imgs/ak_den_11_4.png'),
(11, '/assets/imgs/product-imgs/ak_den_11_5.png'),
(11, '/assets/imgs/product-imgs/ak_xanh_11_1.png'),
(11, '/assets/imgs/product-imgs/ak_xanh_11_2.png'),
(11, '/assets/imgs/product-imgs/ak_xanh_11_3.png'),
(11, '/assets/imgs/product-imgs/ak_xanh_11_4.png'),
(11, '/assets/imgs/product-imgs/ak_xanh_11_5.png'),
(12, '/assets/imgs/product-imgs/ak_den_12_1.png'),
(12, '/assets/imgs/product-imgs/ak_den_12_2.png'),
(12, '/assets/imgs/product-imgs/ak_den_12_3.png'),
(12, '/assets/imgs/product-imgs/ak_den_12_4.png'),
(12, '/assets/imgs/product-imgs/ak_den_12_5.png'),
(12, '/assets/imgs/product-imgs/ak_xanh_12_1.png'),
(12, '/assets/imgs/product-imgs/ak_xanh_12_2.png'),
(12, '/assets/imgs/product-imgs/ak_xanh_12_3.png'),
(12, '/assets/imgs/product-imgs/ak_xanh_12_4.png'),
(12, '/assets/imgs/product-imgs/ak_xanh_12_5.png'),
(12, '/assets/imgs/product-imgs/ak_xanh_12_6.png'),
(13, '/assets/imgs/product-imgs/ak_trang_13_1.png'),
(13, '/assets/imgs/product-imgs/ak_trang_13_2.png'),
(13, '/assets/imgs/product-imgs/ak_trang_13_3.png'),
(13, '/assets/imgs/product-imgs/ak_trang_13_4.png'),
(13, '/assets/imgs/product-imgs/ak_trang_13_5.png'),
(13, '/assets/imgs/product-imgs/ak_trang_13_6.png'),
(13, '/assets/imgs/product-imgs/ak_xanh_13_1.png'),
(13, '/assets/imgs/product-imgs/ak_xanh_13_2.png'),
(13, '/assets/imgs/product-imgs/ak_xanh_13_3.png'),
(13, '/assets/imgs/product-imgs/ak_xanh_13_4.png'),
(13, '/assets/imgs/product-imgs/ak_xanh_13_5.png'),
(13, '/assets/imgs/product-imgs/ak_xanh_13_6.png'),
(14, '/assets/imgs/product-imgs/ak_den_14_1.jpg'),
(14, '/assets/imgs/product-imgs/ak_den_14_2.jpg'),
(14, '/assets/imgs/product-imgs/ak_den_14_3.jfif'),
(14, '/assets/imgs/product-imgs/ak_den_14_4.jpg'),
(14, '/assets/imgs/product-imgs/ak_den_14_5.jpg'),
(14, '/assets/imgs/product-imgs/ak_reu_14_1.jpg'),
(14, '/assets/imgs/product-imgs/ak_reu_14_2.jpg'),
(14, '/assets/imgs/product-imgs/ak_reu_14_3.jpg'),
(14, '/assets/imgs/product-imgs/ak_reu_14_4.jpg'),
(14, '/assets/imgs/product-imgs/ak_reu_14_5.jpg'),
(14, '/assets/imgs/product-imgs/ak_reu_14_6.jpg'),
(15, '/assets/imgs/product-imgs/ak_den_15_1.jpg'),
(15, '/assets/imgs/product-imgs/ak_den_15_2.jpg'),
(15, '/assets/imgs/product-imgs/ak_den_15_3.jpg'),
(15, '/assets/imgs/product-imgs/ak_den_15_4.jpg'),
(15, '/assets/imgs/product-imgs/ak_den_15_5.jpg'),
(16, '/assets/imgs/product-imgs/ak_bo_16_1.jpg'),
(16, '/assets/imgs/product-imgs/ak_bo_16_2.jpg'),
(16, '/assets/imgs/product-imgs/ak_bo_16_3.jpg'),
(16, '/assets/imgs/product-imgs/ak_bo_16_4.jpg'),
(16, '/assets/imgs/product-imgs/ak_bo_16_5.jpg'),
(16, '/assets/imgs/product-imgs/ak_den_16_1.jpg'),
(16, '/assets/imgs/product-imgs/ak_den_16_2.jpg'),
(16, '/assets/imgs/product-imgs/ak_den_16_3.jpg'),
(16, '/assets/imgs/product-imgs/ak_den_16_4.jpg'),
(16, '/assets/imgs/product-imgs/ak_den_16_5.jpg'),
(17, '/assets/imgs/product-imgs/ak_den_17_1.png'),
(17, '/assets/imgs/product-imgs/ak_den_17_2.png'),
(17, '/assets/imgs/product-imgs/ak_den_17_3.png'),
(17, '/assets/imgs/product-imgs/ak_den_17_4.png'),
(17, '/assets/imgs/product-imgs/ak_den_17_5.png'),
(17, '/assets/imgs/product-imgs/ak_xam_17_1.png'),
(17, '/assets/imgs/product-imgs/ak_xam_17_2.png'),
(17, '/assets/imgs/product-imgs/ak_xam_17_3.png'),
(17, '/assets/imgs/product-imgs/ak_xam_17_4.png'),
(17, '/assets/imgs/product-imgs/ak_xam_17_5.png'),
(17, '/assets/imgs/product-imgs/ak_xanh_17_1.png'),
(17, '/assets/imgs/product-imgs/ak_xanh_17_2.png'),
(17, '/assets/imgs/product-imgs/ak_xanh_17_3.png'),
(17, '/assets/imgs/product-imgs/ak_xanh_17_4.png'),
(17, '/assets/imgs/product-imgs/ak_xanh_17_5.png'),
(18, '/assets/imgs/product-imgs/qt_den_18_1.png'),
(18, '/assets/imgs/product-imgs/qt_den_18_2.png'),
(18, '/assets/imgs/product-imgs/qt_den_18_3.png'),
(18, '/assets/imgs/product-imgs/qt_den_18_4.png'),
(18, '/assets/imgs/product-imgs/qt_den_18_5.png'),
(18, '/assets/imgs/product-imgs/qt_den_18_6.png'),
(18, '/assets/imgs/product-imgs/qt_den_18_7.png'),
(18, '/assets/imgs/product-imgs/qt_nau_18_1.png'),
(18, '/assets/imgs/product-imgs/qt_nau_18_2.png'),
(18, '/assets/imgs/product-imgs/qt_nau_18_3.png'),
(18, '/assets/imgs/product-imgs/qt_nau_18_4.png'),
(18, '/assets/imgs/product-imgs/qt_nau_18_5.png'),
(18, '/assets/imgs/product-imgs/qt_nau_18_6.png'),
(19, '/assets/imgs/product-imgs/qt_den_19_1.jpg'),
(19, '/assets/imgs/product-imgs/qt_den_19_2.jpg'),
(19, '/assets/imgs/product-imgs/qt_den_19_3.jpg'),
(19, '/assets/imgs/product-imgs/qt_den_19_4.jpg'),
(19, '/assets/imgs/product-imgs/qt_nau_19_1.jpg'),
(19, '/assets/imgs/product-imgs/qt_nau_19_2.jpg'),
(19, '/assets/imgs/product-imgs/qt_nau_19_3.jpg'),
(19, '/assets/imgs/product-imgs/qt_nau_19_4.jpg'),
(20, '/assets/imgs/product-imgs/qt_den_20_1.png'),
(20, '/assets/imgs/product-imgs/qt_den_20_2.png'),
(20, '/assets/imgs/product-imgs/qt_den_20_3.png'),
(20, '/assets/imgs/product-imgs/qt_den_20_4.png'),
(20, '/assets/imgs/product-imgs/qt_den_20_5.png'),
(21, '/assets/imgs/product-imgs/qt_xanh_21_1.png'),
(21, '/assets/imgs/product-imgs/qt_xanh_21_2.png'),
(21, '/assets/imgs/product-imgs/qt_xanh_21_3.png'),
(21, '/assets/imgs/product-imgs/qt_xanh_21_4.png'),
(21, '/assets/imgs/product-imgs/qt_xanh_21_5.png'),
(22, '/assets/imgs/product-imgs/qt_xam_22_1.png'),
(22, '/assets/imgs/product-imgs/qt_xam_22_2.png'),
(22, '/assets/imgs/product-imgs/qt_xam_22_3.png'),
(22, '/assets/imgs/product-imgs/qt_xam_22_4.png'),
(23, '/assets/imgs/product-imgs/qt_xam_23_1.png'),
(23, '/assets/imgs/product-imgs/qt_xam_23_2.png'),
(23, '/assets/imgs/product-imgs/qt_xam_23_3.png'),
(23, '/assets/imgs/product-imgs/qt_xam_23_4.png'),
(24, '/assets/imgs/product-imgs/qt_xam_24_1.png'),
(24, '/assets/imgs/product-imgs/qt_xam_24_2.png'),
(24, '/assets/imgs/product-imgs/qt_xam_24_3.png'),
(24, '/assets/imgs/product-imgs/qt_xam_24_4.png'),
(24, '/assets/imgs/product-imgs/qt_xam_24_5.png'),
(25, '/assets/imgs/product-imgs/qt_den_25_1.png'),
(25, '/assets/imgs/product-imgs/qt_den_25_2.png'),
(25, '/assets/imgs/product-imgs/qt_den_25_3.png'),
(25, '/assets/imgs/product-imgs/qt_den_25_4.png'),
(25, '/assets/imgs/product-imgs/qt_den_25_5.png'),
(25, '/assets/imgs/product-imgs/qt_xam_25_1.png'),
(25, '/assets/imgs/product-imgs/qt_xam_25_2.png'),
(25, '/assets/imgs/product-imgs/qt_xam_25_3.png'),
(25, '/assets/imgs/product-imgs/qt_xam_25_4.png'),
(25, '/assets/imgs/product-imgs/qt_xam_25_5.png'),
(26, '/assets/imgs/product-imgs/qt_den_26_1.png'),
(26, '/assets/imgs/product-imgs/qt_den_26_2.png'),
(26, '/assets/imgs/product-imgs/qt_den_26_3.png'),
(26, '/assets/imgs/product-imgs/qt_den_26_4.png'),
(26, '/assets/imgs/product-imgs/qt_den_26_5.png'),
(26, '/assets/imgs/product-imgs/qt_xam_26_1.png'),
(26, '/assets/imgs/product-imgs/qt_xam_26_2.png'),
(26, '/assets/imgs/product-imgs/qt_xam_26_3.png'),
(26, '/assets/imgs/product-imgs/qt_xam_26_4.png'),
(26, '/assets/imgs/product-imgs/qt_xam_26_5.png'),
(27, '/assets/imgs/product-imgs/qt_xam_27_1.png'),
(27, '/assets/imgs/product-imgs/qt_xam_27_2.png'),
(27, '/assets/imgs/product-imgs/qt_xam_27_3.png'),
(27, '/assets/imgs/product-imgs/qt_xam_27_4.png'),
(27, '/assets/imgs/product-imgs/qt_xam_27_5.png'),
(28, '/assets/imgs/product-imgs/qt_den_28_1.png'),
(28, '/assets/imgs/product-imgs/qt_den_28_2.png'),
(28, '/assets/imgs/product-imgs/qt_den_28_3.png'),
(28, '/assets/imgs/product-imgs/qt_den_28_4.png'),
(28, '/assets/imgs/product-imgs/qt_den_28_5.png'),
(28, '/assets/imgs/product-imgs/qt_xanh_28_1.png'),
(28, '/assets/imgs/product-imgs/qt_xanh_28_2.png'),
(28, '/assets/imgs/product-imgs/qt_xanh_28_3.png'),
(28, '/assets/imgs/product-imgs/qt_xanh_28_4.png'),
(28, '/assets/imgs/product-imgs/qt_xanh_28_5.png'),
(29, '/assets/imgs/product-imgs/qt_den_29_1.png'),
(29, '/assets/imgs/product-imgs/qt_den_29_2.png'),
(29, '/assets/imgs/product-imgs/qt_den_29_3.png'),
(29, '/assets/imgs/product-imgs/qt_den_29_4.png'),
(29, '/assets/imgs/product-imgs/qt_den_29_5.png'),
(29, '/assets/imgs/product-imgs/qt_xanh_29_1.png'),
(29, '/assets/imgs/product-imgs/qt_xanh_29_2.png'),
(29, '/assets/imgs/product-imgs/qt_xanh_29_3.png'),
(29, '/assets/imgs/product-imgs/qt_xanh_29_4.png'),
(29, '/assets/imgs/product-imgs/qt_xanh_29_5.png'),
(30, '/assets/imgs/product-imgs/qt_den_30_1.png'),
(30, '/assets/imgs/product-imgs/qt_den_30_2.png'),
(30, '/assets/imgs/product-imgs/qt_den_30_3.png'),
(30, '/assets/imgs/product-imgs/qt_den_30_4.png'),
(30, '/assets/imgs/product-imgs/qt_den_30_5.png'),
(30, '/assets/imgs/product-imgs/qt_xam_30_1.png'),
(30, '/assets/imgs/product-imgs/qt_xam_30_2.png'),
(30, '/assets/imgs/product-imgs/qt_xam_30_3.png'),
(30, '/assets/imgs/product-imgs/qt_xam_30_4.png'),
(30, '/assets/imgs/product-imgs/qt_xam_30_5.png'),
(31, '/assets/imgs/product-imgs/qt_den_31_1.png'),
(31, '/assets/imgs/product-imgs/qt_den_31_2.png'),
(31, '/assets/imgs/product-imgs/qt_den_31_3.png'),
(31, '/assets/imgs/product-imgs/qt_den_31_4.png'),
(31, '/assets/imgs/product-imgs/qt_den_31_5.png'),
(32, '/assets/imgs/product-imgs/qt_den_32_1.png'),
(32, '/assets/imgs/product-imgs/qt_den_32_2.png'),
(32, '/assets/imgs/product-imgs/qt_den_32_3.png'),
(32, '/assets/imgs/product-imgs/qt_den_32_4.png'),
(32, '/assets/imgs/product-imgs/qt_den_32_5.png'),
(33, '/assets/imgs/product-imgs/qt_den_33_1.png'),
(33, '/assets/imgs/product-imgs/qt_den_33_2.png'),
(33, '/assets/imgs/product-imgs/qt_den_33_3.png'),
(33, '/assets/imgs/product-imgs/qt_den_33_4.png'),
(33, '/assets/imgs/product-imgs/qt_den_33_5.png'),
(34, '/assets/imgs/product-imgs/qt_den_34_1.png'),
(34, '/assets/imgs/product-imgs/qt_den_34_2.png'),
(34, '/assets/imgs/product-imgs/qt_den_34_3.png'),
(34, '/assets/imgs/product-imgs/qt_den_34_4.png'),
(34, '/assets/imgs/product-imgs/qt_den_34_5.png'),
(34, '/assets/imgs/product-imgs/qt_xam_34_1.png'),
(34, '/assets/imgs/product-imgs/qt_xam_34_2.png'),
(34, '/assets/imgs/product-imgs/qt_xam_34_3.png'),
(34, '/assets/imgs/product-imgs/qt_xam_34_4.png'),
(34, '/assets/imgs/product-imgs/qt_xam_34_5.png'),
(35, '/assets/imgs/product-imgs/qt_den_35_1.png'),
(35, '/assets/imgs/product-imgs/qt_den_35_2.png'),
(35, '/assets/imgs/product-imgs/qt_den_35_3.png'),
(35, '/assets/imgs/product-imgs/qt_den_35_4.png'),
(35, '/assets/imgs/product-imgs/qt_den_35_5.png'),
(35, '/assets/imgs/product-imgs/qt_xam_35_1.png'),
(35, '/assets/imgs/product-imgs/qt_xam_35_2.png'),
(35, '/assets/imgs/product-imgs/qt_xam_35_3.png'),
(35, '/assets/imgs/product-imgs/qt_xam_35_4.png'),
(35, '/assets/imgs/product-imgs/qt_xam_35_5.png'),
(36, '/assets/imgs/product-imgs/qt_xam_36_1.png'),
(36, '/assets/imgs/product-imgs/qt_xam_36_2.png'),
(36, '/assets/imgs/product-imgs/qt_xam_36_3.png'),
(36, '/assets/imgs/product-imgs/qt_xam_36_4.png'),
(36, '/assets/imgs/product-imgs/qt_xam_36_5.png'),
(37, '/assets/imgs/product-imgs/qt_den_37_1.png'),
(37, '/assets/imgs/product-imgs/qt_den_37_2.png'),
(37, '/assets/imgs/product-imgs/qt_den_37_3.png'),
(37, '/assets/imgs/product-imgs/qt_den_37_4.png'),
(37, '/assets/imgs/product-imgs/qt_den_37_5.png'),
(37, '/assets/imgs/product-imgs/qt_xam_37_1.png'),
(37, '/assets/imgs/product-imgs/qt_xam_37_2.png'),
(37, '/assets/imgs/product-imgs/qt_xam_37_3.png'),
(37, '/assets/imgs/product-imgs/qt_xam_37_4.png'),
(37, '/assets/imgs/product-imgs/qt_xam_37_5.png'),
(38, '/assets/imgs/product-imgs/qt_den_38_1.png'),
(38, '/assets/imgs/product-imgs/qt_den_38_2.png'),
(38, '/assets/imgs/product-imgs/qt_den_38_3.png'),
(38, '/assets/imgs/product-imgs/qt_den_38_4.png'),
(38, '/assets/imgs/product-imgs/qt_trang_38_1.png'),
(38, '/assets/imgs/product-imgs/qt_trang_38_2.png'),
(38, '/assets/imgs/product-imgs/qt_trang_38_3.png'),
(38, '/assets/imgs/product-imgs/qt_trang_38_4.png'),
(38, '/assets/imgs/product-imgs/qt_trang_38_5.png'),
(38, '/assets/imgs/product-imgs/qt_xanh_38_1.png'),
(38, '/assets/imgs/product-imgs/qt_xanh_38_2.png'),
(38, '/assets/imgs/product-imgs/qt_xanh_38_3.png'),
(38, '/assets/imgs/product-imgs/qt_xanh_38_4.png'),
(38, '/assets/imgs/product-imgs/qt_xanh_38_5.png'),
(39, '/assets/imgs/product-imgs/qt_den_39_1.png'),
(39, '/assets/imgs/product-imgs/qt_den_39_2.png'),
(39, '/assets/imgs/product-imgs/qt_den_39_3.png'),
(39, '/assets/imgs/product-imgs/qt_den_39_4.png'),
(40, '/assets/imgs/product-imgs/qt_den_40_1.png'),
(40, '/assets/imgs/product-imgs/qt_den_40_2.png'),
(40, '/assets/imgs/product-imgs/qt_den_40_3.png'),
(40, '/assets/imgs/product-imgs/qt_den_40_4.png'),
(40, '/assets/imgs/product-imgs/qt_den_40_5.png'),
(41, '/assets/imgs/product-imgs/qt_den_41_1.jpg'),
(41, '/assets/imgs/product-imgs/qt_den_41_2.jpg'),
(41, '/assets/imgs/product-imgs/qt_den_41_3.jpg'),
(41, '/assets/imgs/product-imgs/qt_den_41_4.jpg'),
(41, '/assets/imgs/product-imgs/qt_den_41_5.jpg'),
(41, '/assets/imgs/product-imgs/qt_xam_41_1.jpg'),
(41, '/assets/imgs/product-imgs/qt_xam_41_2.jpg'),
(41, '/assets/imgs/product-imgs/qt_xam_41_3.jpg'),
(41, '/assets/imgs/product-imgs/qt_xam_41_4.jpg'),
(41, '/assets/imgs/product-imgs/qt_xam_41_5.jpg'),
(42, '/assets/imgs/product-imgs/qt_den_42_1.jpg'),
(42, '/assets/imgs/product-imgs/qt_den_42_2.jpg'),
(42, '/assets/imgs/product-imgs/qt_den_42_3.jpg'),
(42, '/assets/imgs/product-imgs/qt_den_42_4.jpg'),
(42, '/assets/imgs/product-imgs/qt_den_42_5.jpg'),
(42, '/assets/imgs/product-imgs/qt_xam_42_1.jpg'),
(42, '/assets/imgs/product-imgs/qt_xam_42_2.jpg'),
(42, '/assets/imgs/product-imgs/qt_xam_42_3.jpg'),
(42, '/assets/imgs/product-imgs/qt_xam_42_4.jpg'),
(42, '/assets/imgs/product-imgs/qt_xam_42_5.jpg'),
(43, '/assets/imgs/product-imgs/qt_den_43_1.jpg'),
(43, '/assets/imgs/product-imgs/qt_den_43_2.jpg'),
(43, '/assets/imgs/product-imgs/qt_den_43_3.jpg'),
(43, '/assets/imgs/product-imgs/qt_den_43_4.jpg'),
(43, '/assets/imgs/product-imgs/qt_den_43_5.jpg'),
(43, '/assets/imgs/product-imgs/qt_den_43_6.jpg'),
(43, '/assets/imgs/product-imgs/qt_xam_43_1.jpg'),
(43, '/assets/imgs/product-imgs/qt_xam_43_2.jpg'),
(43, '/assets/imgs/product-imgs/qt_xam_43_3.jpg'),
(43, '/assets/imgs/product-imgs/qt_xam_43_4.jpg'),
(43, '/assets/imgs/product-imgs/qt_xam_43_5.jpg'),
(43, '/assets/imgs/product-imgs/qt_xanh_43_1.jpg'),
(43, '/assets/imgs/product-imgs/qt_xanh_43_2.jpg'),
(43, '/assets/imgs/product-imgs/qt_xanh_43_3.jpg'),
(43, '/assets/imgs/product-imgs/qt_xanh_43_4.jpg'),
(43, '/assets/imgs/product-imgs/qt_xanh_43_5.jpg'),
(43, '/assets/imgs/product-imgs/qt_xanh_43_6.jpg'),
(44, '/assets/imgs/product-imgs/qt_do_44_1.jpg'),
(44, '/assets/imgs/product-imgs/qt_do_44_2.jpg'),
(44, '/assets/imgs/product-imgs/qt_do_44_3.jpg'),
(44, '/assets/imgs/product-imgs/qt_do_44_4.jpg'),
(45, '/assets/imgs/product-imgs/qt_xam_45_1.jpg'),
(45, '/assets/imgs/product-imgs/qt_xam_45_2.jpg'),
(45, '/assets/imgs/product-imgs/qt_xam_45_3.jpg'),
(45, '/assets/imgs/product-imgs/qt_xam_45_4.jpg'),
(45, '/assets/imgs/product-imgs/qt_xam_45_5.jpg'),
(46, '/assets/imgs/product-imgs/qt_den_46_1.jpg'),
(46, '/assets/imgs/product-imgs/qt_den_46_2.jpg'),
(46, '/assets/imgs/product-imgs/qt_den_46_3.jpg'),
(46, '/assets/imgs/product-imgs/qt_den_46_4.jpg'),
(46, '/assets/imgs/product-imgs/qt_den_46_5.jpg'),
(46, '/assets/imgs/product-imgs/qt_xanh_46_1.jpg'),
(46, '/assets/imgs/product-imgs/qt_xanh_46_2.jpg'),
(46, '/assets/imgs/product-imgs/qt_xanh_46_3.jpg'),
(46, '/assets/imgs/product-imgs/qt_xanh_46_4.jpg'),
(46, '/assets/imgs/product-imgs/qt_xanh_46_5.jpg'),
(47, '/assets/imgs/product-imgs/qt_den_47_1.jpg'),
(47, '/assets/imgs/product-imgs/qt_den_47_2.jpg'),
(47, '/assets/imgs/product-imgs/qt_den_47_3.jpg'),
(47, '/assets/imgs/product-imgs/qt_trang_47_1.jpg'),
(47, '/assets/imgs/product-imgs/qt_trang_47_2.jpg'),
(47, '/assets/imgs/product-imgs/qt_trang_47_3.jpg'),
(47, '/assets/imgs/product-imgs/qt_trang_47_4.jpg'),
(48, '/assets/imgs/product-imgs/qt_xam_48_1.jpg'),
(48, '/assets/imgs/product-imgs/qt_xam_48_2.jpg'),
(49, '/assets/imgs/product-imgs/qt_den_49_1.jpg'),
(49, '/assets/imgs/product-imgs/qt_den_49_2.jpg'),
(49, '/assets/imgs/product-imgs/qt_do_49_1.jpg'),
(49, '/assets/imgs/product-imgs/qt_do_49_2.jpg'),
(49, '/assets/imgs/product-imgs/qt_do_49_3.jpg'),
(50, '/assets/imgs/product-imgs/qt_den_50_1.jpg'),
(50, '/assets/imgs/product-imgs/qt_den_50_2.jpg'),
(50, '/assets/imgs/product-imgs/qt_den_50_3.jpg'),
(50, '/assets/imgs/product-imgs/qt_xanh_50_1.jpg'),
(50, '/assets/imgs/product-imgs/qt_xanh_50_2.jpg'),
(50, '/assets/imgs/product-imgs/qt_xanh_50_3.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BRAND_ID` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `DISCOUNT` int(11) DEFAULT 0,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `THUMBNAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOTAL_REVIEW` int(11) DEFAULT 0,
  `TOTAL_STAR` int(11) DEFAULT 0,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ID`, `CODE`, `NAME`, `BRAND_ID`, `CATEGORY_ID`, `PRICE`, `DISCOUNT`, `DESCRIPTION`, `THUMBNAIL`, `TOTAL_REVIEW`, `TOTAL_STAR`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 'SP1', 'ÁO KHOÁT DÙ TRƠN MÀU ĐEN AKO20', 3, 1, 315000, 0, NULL, '/assets/imgs/product-imgs/ak_den_1_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(2, 'SP2', 'ÁO KHOÁT DÙ TRƠN NÓN RỜI AK019', 3, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_2_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(3, 'SP3', 'ÁO KHOÁT KAKI BASIC AK018', 3, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_3_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(4, 'SP4', 'ÁO KHOÁT NẸP BẤM NÚT AK010', 3, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_den_4_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(5, 'SP5', 'ÁO KHOÁT NỈ TRƠN AK013', 3, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_den_5_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(6, 'SP6', 'ÁO HOODIE BELIEVE AK012', 1, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_be_6_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(7, 'SP7', 'ÁO KHOÁT KAKI TÚI ĐẮP AK017', 1, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_7_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(8, 'SP8', 'ÁO KHOÁT DA LỘN LIMITED AK016', 1, 1, 645000, 0, NULL, '/assets/imgs/product-imgs/ak_den_8_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(9, 'SP9', 'ÁO KHOÁT DA LỘN AK015', 1, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_nau_9_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(10, 'SP10', 'ÁO HOODIE SPORTS ELEGANT AK011', 1, 1, 315000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_10_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(11, 'SP11', 'ÁO KHOÁT DÙ TAY PHỐI TÚI AK008', 2, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_11_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(12, 'SP12', 'ÁO KHOÁT DÙ TÚI HỘP AK009', 2, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_12_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(13, 'SP13', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK007', 2, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_trang_13_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(14, 'SP14', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK001', 2, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_den_14_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(15, 'SP15', 'ÁO KHOÁT KAKI AK266', 2, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_den_15_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(16, 'SP16', 'ÁO KHOÁT MANGTO DẠ AK267', 4, 1, 1750000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_16_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(17, 'SP17', 'ÁO KHOÁT JEAN AK263', 4, 1, 515000, 0, NULL, '/assets/imgs/product-imgs/ak_den_17_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(18, 'SP18', 'QUẦN TÂY TRƠN QT024', 4, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_18_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(19, 'SP19', 'QUẦN TÂY TRƠN REGULAR QT026', 4, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_19_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(20, 'SP20', 'QUẦN TÂY PHỐI SỌC QT023', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_20_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(21, 'SP21', 'QUẦN TÂY NAZAFU QT006', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xanh_21_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(22, 'SP22', 'QUẦN TÂY NAZAFU QT005', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_22_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(23, 'SP23', 'QUẦN TÂY NAZAFU QT003', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_23_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(24, 'SP24', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT020', 5, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_24_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(25, 'SP25', 'QUẦN TÂY TÚI SAU PHỐI D Y DỆT QT022', 5, 2, 445000, 0, NULL, '/assets/imgs/product-imgs/qt_den_25_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL),
(26, 'SP26', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT021', 1, 2, 445000, 0, NULL, '/assets/imgs/product-imgs/qt_den_26_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(27, 'SP27', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT019', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_27_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(28, 'SP28', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT018', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_28_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(29, 'SP29', 'QUẦN TÂY TÚI SAU PHỐI D Y DỆT QT017', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_29_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(30, 'SP30', 'QUẦN TÂY LƯNG SAU PHỐI D Y DỆT QT016', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_30_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(31, 'SP31', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT015', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_31_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(32, 'SP32', 'QUẦN TÂY PHỐI D Y DỆT QT014', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_32_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(33, 'SP33', 'QUẦN TÂY PHỐI D Y DỆT QT013', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_33_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(34, 'SP34', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT012', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_34_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(35, 'SP35', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT011', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_35_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(36, 'SP36', 'QUẦN TÂY KẺ CARO FORM SLIMFIT QT010', 3, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_36_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(37, 'SP37', 'QUẦN TÂY XẾP LY FORM SLIMFIT QT007', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_37_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(38, 'SP38', 'QUẦN TÂY LINEN LƯNG THUN QT008', 3, 2, 375000, 0, NULL, '/assets/imgs/product-imgs/qt_den_38_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL),
(39, 'SP39', 'QUẦN TÂY LINEN FORM LOOSE-CROPPED QT002', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_39_1.png', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(40, 'SP40', 'QUẦN TÂY GẮN NHÃN QT001', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_40_1.png', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(41, 'SP41', 'QUẦN TÂY FORM REGULAR QT155', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_41_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(42, 'SP42', 'QUẦN TÂY FORM REGULAR QT154', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_42_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(43, 'SP43', 'QUẦN TÂY SỌC SLIM-CROPPED LAI LƠ VÊ QT153', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_43_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(44, 'SP44', 'QUẦN TÂY ĐỎ ĐÔ QT110', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_do_44_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(45, 'SP45', 'QUẦN TÂY XÁM CHUỘT ĐẬM QT141', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_45_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(46, 'SP46', 'QUẦN TÂY NAZAFU XANH ĐEN QT1128', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_46_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(47, 'SP47', 'QUẦN TÂY NAZAFU SỌC TRẮNG KEM QT1123', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_47_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(48, 'SP48', 'QUẦN TÂY XÁM QT1120', 5, 2, 395000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_48_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(49, 'SP49', 'QUẦN TÂY NAZAFU ĐỎ ĐÔ QT1113', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_49_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(50, 'SP50', 'QUẦN TÂY NAZAFU ĐEN QT1109', 5, 2, 525000, 0, NULL, '/assets/imgs/product-imgs/qt_den_50_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `ID` bigint(20) NOT NULL,
  `ACCOUNT_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAR` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`ID`, `CODE`, `NAME`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 'VT1', 'ADMIN', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(2, 'VT2', 'USER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sign`
--

CREATE TABLE `sign` (
  `ID` bigint(20) NOT NULL,
  `ACCOUNT_ID` bigint(20) DEFAULT NULL,
  `SIGN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEY_SIZE` int(11) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`ID`, `CODE`, `NAME`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 'S', 'SMALL', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(2, 'M', 'MEDIUM', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL),
(3, 'L', 'LARGE', '2023-01-03 14:40:01', NULL, '2023-01-03 14:40:01', NULL),
(4, 'XL', 'EXTRA LARGE', '2023-01-03 14:40:01', NULL, '2023-01-03 14:40:01', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `ID` bigint(20) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_GROUP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`ID`, `CODE`, `NAME`, `DESCRIPTION`, `STATUS_GROUP`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 'UNVALIDATE', 'UNVALIDATE', NULL, 'ACCOUNT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(2, 'ACTIVE', 'ACTIVE', NULL, 'ACCOUNT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(3, 'BLOCK', 'BLOCK', NULL, 'ACCOUNT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(4, 'WAIT', 'WAIT', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(5, 'VERIFY', 'VERIFY', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(6, 'PACKING', 'PACKING', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(7, 'DELIVERING', 'DELIVERING', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(8, 'DONE', 'DONE', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL),
(9, 'CANCEL', 'CANCEL', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `verification`
--

CREATE TABLE `verification` (
  `ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `HASH_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGN_ID` bigint(20) DEFAULT NULL,
  `IS_OK` tinyint(1) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse`
--

CREATE TABLE `warehouse` (
  `ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SIZE_ID` bigint(20) DEFAULT NULL,
  `COLOR_ID` bigint(20) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT 0,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehouse`
--

INSERT INTO `warehouse` (`ID`, `PRODUCT_ID`, `SIZE_ID`, `COLOR_ID`, `AMOUNT`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 1, 1, 1, 1, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(2, 1, 2, 1, 1, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(3, 1, 3, 1, 1, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(4, 1, 4, 1, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(5, 1, 1, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(6, 1, 2, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(7, 1, 3, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(8, 1, 4, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(9, 1, 1, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(10, 1, 2, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(11, 1, 3, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(12, 1, 4, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(13, 2, 1, 1, 83, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(14, 2, 2, 1, 93, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(15, 2, 3, 1, 48, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(16, 2, 4, 1, 55, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(17, 2, 1, 2, 30, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(18, 2, 2, 2, 15, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(19, 2, 3, 2, 88, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(20, 2, 4, 2, 64, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(21, 2, 1, 3, 83, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(22, 2, 2, 3, 94, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(23, 2, 3, 3, 35, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(24, 2, 4, 3, 78, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(25, 3, 1, 1, 74, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(26, 3, 2, 1, 71, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL),
(27, 3, 3, 1, 11, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(28, 3, 4, 1, 83, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(29, 3, 1, 2, 63, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(30, 3, 2, 2, 15, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(31, 3, 3, 2, 87, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(32, 3, 4, 2, 46, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(33, 3, 1, 3, 58, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(34, 3, 2, 3, 72, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(35, 3, 3, 3, 82, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(36, 3, 4, 3, 77, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(37, 4, 1, 1, 59, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(38, 4, 2, 1, 14, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(39, 4, 3, 1, 20, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(40, 4, 4, 1, 36, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(41, 4, 1, 2, 93, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(42, 4, 2, 2, 7, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(43, 4, 3, 2, 96, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(44, 4, 4, 2, 48, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(45, 4, 1, 3, 40, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(46, 4, 2, 3, 40, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(47, 4, 3, 3, 84, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(48, 4, 4, 3, 67, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL),
(49, 5, 1, 1, 42, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(50, 5, 2, 1, 45, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(51, 5, 3, 1, 74, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(52, 5, 4, 1, 27, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(53, 5, 1, 2, 23, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(54, 5, 2, 2, 44, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(55, 5, 3, 2, 76, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(56, 5, 4, 2, 22, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(57, 5, 1, 3, 33, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(58, 5, 2, 3, 25, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(59, 5, 3, 3, 10, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(60, 5, 4, 3, 86, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(61, 6, 1, 1, 51, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(62, 6, 2, 1, 45, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(63, 6, 3, 1, 81, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(64, 6, 4, 1, 15, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(65, 6, 1, 2, 26, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(66, 6, 2, 2, 89, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(67, 6, 3, 2, 47, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(68, 6, 4, 2, 30, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(69, 6, 1, 3, 63, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(70, 6, 2, 3, 2, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(71, 6, 3, 3, 7, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(72, 6, 4, 3, 59, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(73, 7, 1, 1, 24, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(74, 7, 2, 1, 23, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(75, 7, 3, 1, 75, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(76, 7, 4, 1, 71, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(77, 7, 1, 2, 9, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(78, 7, 2, 2, 87, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(79, 7, 3, 2, 96, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL),
(80, 7, 4, 2, 64, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(81, 7, 1, 3, 35, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(82, 7, 2, 3, 82, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(83, 7, 3, 3, 59, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(84, 7, 4, 3, 19, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(85, 8, 1, 1, 75, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(86, 8, 2, 1, 78, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(87, 8, 3, 1, 5, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(88, 8, 4, 1, 69, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(89, 8, 1, 2, 34, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(90, 8, 2, 2, 83, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(91, 8, 3, 2, 90, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(92, 8, 4, 2, 30, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(93, 8, 1, 3, 13, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(94, 8, 2, 3, 36, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(95, 8, 3, 3, 47, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(96, 8, 4, 3, 30, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(97, 9, 1, 1, 25, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(98, 9, 2, 1, 70, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(99, 9, 3, 1, 30, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL),
(100, 9, 4, 1, 89, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(101, 9, 1, 2, 57, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(102, 9, 2, 2, 56, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(103, 9, 3, 2, 11, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(104, 9, 4, 2, 35, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(105, 9, 1, 3, 87, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(106, 9, 2, 3, 20, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(107, 9, 3, 3, 97, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(108, 9, 4, 3, 5, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(109, 10, 1, 1, 90, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(110, 10, 2, 1, 48, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(111, 10, 3, 1, 55, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(112, 10, 4, 1, 39, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(113, 10, 1, 2, 36, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(114, 10, 2, 2, 40, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(115, 10, 3, 2, 81, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(116, 10, 4, 2, 67, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(117, 10, 1, 3, 37, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(118, 10, 2, 3, 1, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL),
(119, 10, 3, 3, 66, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(120, 10, 4, 3, 75, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(121, 11, 1, 1, 28, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(122, 11, 2, 1, 36, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(123, 11, 3, 1, 27, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(124, 11, 4, 1, 91, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(125, 11, 1, 2, 18, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(126, 11, 2, 2, 33, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(127, 11, 3, 2, 88, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL),
(128, 11, 4, 2, 2, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(129, 11, 1, 3, 34, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(130, 11, 2, 3, 34, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(131, 11, 3, 3, 39, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(132, 11, 4, 3, 23, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(133, 12, 1, 1, 22, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(134, 12, 2, 1, 36, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(135, 12, 3, 1, 95, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(136, 12, 4, 1, 87, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(137, 12, 1, 2, 21, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(138, 12, 2, 2, 58, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(139, 12, 3, 2, 57, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(140, 12, 4, 2, 30, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(141, 12, 1, 3, 58, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(142, 12, 2, 3, 78, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(143, 12, 3, 3, 45, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(144, 12, 4, 3, 60, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL),
(145, 13, 1, 1, 74, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(146, 13, 2, 1, 4, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(147, 13, 3, 1, 90, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(148, 13, 4, 1, 67, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(149, 13, 1, 2, 71, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(150, 13, 2, 2, 60, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(151, 13, 3, 2, 92, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(152, 13, 4, 2, 55, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(153, 13, 1, 3, 59, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(154, 13, 2, 3, 88, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(155, 13, 3, 3, 85, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(156, 13, 4, 3, 69, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(157, 14, 1, 1, 16, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(158, 14, 2, 1, 60, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(159, 14, 3, 1, 89, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(160, 14, 4, 1, 21, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(161, 14, 1, 2, 29, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(162, 14, 2, 2, 75, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(163, 14, 3, 2, 65, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(164, 14, 4, 2, 59, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(165, 14, 1, 3, 39, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(166, 14, 2, 3, 11, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL),
(167, 14, 3, 3, 4, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(168, 14, 4, 3, 100, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(169, 15, 1, 1, 35, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(170, 15, 2, 1, 64, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(171, 15, 3, 1, 53, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(172, 15, 4, 1, 27, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(173, 15, 1, 2, 43, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(174, 15, 2, 2, 22, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(175, 15, 3, 2, 83, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(176, 15, 4, 2, 99, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(177, 15, 1, 3, 24, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(178, 15, 2, 3, 78, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(179, 15, 3, 3, 98, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(180, 15, 4, 3, 60, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(181, 16, 1, 1, 34, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(182, 16, 2, 1, 80, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL),
(183, 16, 3, 1, 94, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(184, 16, 4, 1, 2, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(185, 16, 1, 2, 40, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(186, 16, 2, 2, 90, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(187, 16, 3, 2, 59, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(188, 16, 4, 2, 81, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(189, 16, 1, 3, 16, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(190, 16, 2, 3, 72, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(191, 16, 3, 3, 8, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(192, 16, 4, 3, 56, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(193, 17, 1, 1, 76, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(194, 17, 2, 1, 67, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(195, 17, 3, 1, 61, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(196, 17, 4, 1, 76, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(197, 17, 1, 2, 34, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(198, 17, 2, 2, 24, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(199, 17, 3, 2, 56, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(200, 17, 4, 2, 26, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(201, 17, 1, 3, 20, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(202, 17, 2, 3, 8, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(203, 17, 3, 3, 75, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(204, 17, 4, 3, 26, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(205, 18, 1, 1, 92, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(206, 18, 2, 1, 50, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL),
(207, 18, 3, 1, 16, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(208, 18, 4, 1, 47, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(209, 18, 1, 2, 39, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(210, 18, 2, 2, 10, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(211, 18, 3, 2, 39, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(212, 18, 4, 2, 52, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(213, 18, 1, 3, 31, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(214, 18, 2, 3, 76, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(215, 18, 3, 3, 89, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(216, 18, 4, 3, 4, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(217, 19, 1, 1, 63, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(218, 19, 2, 1, 40, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(219, 19, 3, 1, 6, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(220, 19, 4, 1, 5, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(221, 19, 1, 2, 87, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(222, 19, 2, 2, 77, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(223, 19, 3, 2, 68, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(224, 19, 4, 2, 18, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(225, 19, 1, 3, 72, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(226, 19, 2, 3, 51, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(227, 19, 3, 3, 43, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(228, 19, 4, 3, 68, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(229, 20, 1, 1, 49, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(230, 20, 2, 1, 8, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(231, 20, 3, 1, 90, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL),
(232, 20, 4, 1, 17, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(233, 20, 1, 2, 33, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(234, 20, 2, 2, 100, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(235, 20, 3, 2, 48, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(236, 20, 4, 2, 37, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(237, 20, 1, 3, 1, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(238, 20, 2, 3, 54, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(239, 20, 3, 3, 28, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(240, 20, 4, 3, 96, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(241, 21, 1, 1, 19, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(242, 21, 2, 1, 15, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(243, 21, 3, 1, 87, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(244, 21, 4, 1, 73, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(245, 21, 1, 2, 8, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(246, 21, 2, 2, 52, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(247, 21, 3, 2, 67, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(248, 21, 4, 2, 80, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(249, 21, 1, 3, 47, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(250, 21, 2, 3, 44, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(251, 21, 3, 3, 78, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(252, 21, 4, 3, 71, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(253, 22, 1, 1, 39, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(254, 22, 2, 1, 95, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(255, 22, 3, 1, 37, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(256, 22, 4, 1, 68, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(257, 22, 1, 2, 27, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(258, 22, 2, 2, 60, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(259, 22, 3, 2, 95, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL),
(260, 22, 4, 2, 71, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(261, 22, 1, 3, 6, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(262, 22, 2, 3, 14, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(263, 22, 3, 3, 90, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(264, 22, 4, 3, 52, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(265, 23, 1, 1, 46, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(266, 23, 2, 1, 58, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(267, 23, 3, 1, 36, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(268, 23, 4, 1, 55, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(269, 23, 1, 2, 46, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(270, 23, 2, 2, 40, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(271, 23, 3, 2, 3, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(272, 23, 4, 2, 24, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(273, 23, 1, 3, 99, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(274, 23, 2, 3, 67, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(275, 23, 3, 3, 51, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(276, 23, 4, 3, 1, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(277, 24, 1, 1, 71, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(278, 24, 2, 1, 57, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(279, 24, 3, 1, 54, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(280, 24, 4, 1, 95, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL),
(281, 24, 1, 2, 65, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(282, 24, 2, 2, 91, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(283, 24, 3, 2, 75, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(284, 24, 4, 2, 82, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(285, 24, 1, 3, 21, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(286, 24, 2, 3, 39, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(287, 24, 3, 3, 76, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(288, 24, 4, 3, 42, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(289, 25, 1, 1, 89, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(290, 25, 2, 1, 100, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(291, 25, 3, 1, 73, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(292, 25, 4, 1, 31, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(293, 25, 1, 2, 39, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(294, 25, 2, 2, 95, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(295, 25, 3, 2, 4, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(296, 25, 4, 2, 55, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(297, 25, 1, 3, 30, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(298, 25, 2, 3, 60, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(299, 25, 3, 3, 42, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(300, 25, 4, 3, 92, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(301, 26, 1, 1, 55, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(302, 26, 2, 1, 27, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(303, 26, 3, 1, 90, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL),
(304, 26, 4, 1, 61, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(305, 26, 1, 2, 31, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(306, 26, 2, 2, 21, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(307, 26, 3, 2, 59, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(308, 26, 4, 2, 46, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(309, 26, 1, 3, 47, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(310, 26, 2, 3, 14, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(311, 26, 3, 3, 17, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(312, 26, 4, 3, 24, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(313, 27, 1, 1, 20, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(314, 27, 2, 1, 49, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(315, 27, 3, 1, 32, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(316, 27, 4, 1, 70, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(317, 27, 1, 2, 34, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(318, 27, 2, 2, 77, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(319, 27, 3, 2, 47, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(320, 27, 4, 2, 79, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(321, 27, 1, 3, 57, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(322, 27, 2, 3, 76, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(323, 27, 3, 3, 72, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(324, 27, 4, 3, 21, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(325, 28, 1, 1, 42, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL),
(326, 28, 2, 1, 61, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(327, 28, 3, 1, 25, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(328, 28, 4, 1, 96, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(329, 28, 1, 2, 57, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(330, 28, 2, 2, 71, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(331, 28, 3, 2, 88, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(332, 28, 4, 2, 96, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(333, 28, 1, 3, 92, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(334, 28, 2, 3, 68, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(335, 28, 3, 3, 100, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(336, 28, 4, 3, 31, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(337, 29, 1, 1, 28, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(338, 29, 2, 1, 24, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(339, 29, 3, 1, 83, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(340, 29, 4, 1, 91, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(341, 29, 1, 2, 11, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(342, 29, 2, 2, 36, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(343, 29, 3, 2, 45, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(344, 29, 4, 2, 45, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(345, 29, 1, 3, 53, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(346, 29, 2, 3, 62, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(347, 29, 3, 3, 2, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(348, 29, 4, 3, 7, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL),
(349, 30, 1, 1, 84, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(350, 30, 2, 1, 20, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(351, 30, 3, 1, 21, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(352, 30, 4, 1, 40, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(353, 30, 1, 2, 44, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(354, 30, 2, 2, 4, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(355, 30, 3, 2, 73, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(356, 30, 4, 2, 50, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(357, 30, 1, 3, 37, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(358, 30, 2, 3, 87, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(359, 30, 3, 3, 56, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(360, 30, 4, 3, 17, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(361, 31, 1, 1, 32, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(362, 31, 2, 1, 35, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(363, 31, 3, 1, 16, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(364, 31, 4, 1, 31, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(365, 31, 1, 2, 93, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL),
(366, 31, 2, 2, 29, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(367, 31, 3, 2, 33, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(368, 31, 4, 2, 88, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(369, 31, 1, 3, 54, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(370, 31, 2, 3, 69, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(371, 31, 3, 3, 98, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(372, 31, 4, 3, 36, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(373, 32, 1, 1, 21, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(374, 32, 2, 1, 50, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(375, 32, 3, 1, 92, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(376, 32, 4, 1, 35, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(377, 32, 1, 2, 75, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(378, 32, 2, 2, 66, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(379, 32, 3, 2, 37, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(380, 32, 4, 2, 94, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(381, 32, 1, 3, 97, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(382, 32, 2, 3, 100, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(383, 32, 3, 3, 23, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(384, 32, 4, 3, 9, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(385, 33, 1, 1, 29, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(386, 33, 2, 1, 23, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(387, 33, 3, 1, 8, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL),
(388, 33, 4, 1, 21, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(389, 33, 1, 2, 79, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(390, 33, 2, 2, 79, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(391, 33, 3, 2, 5, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(392, 33, 4, 2, 63, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(393, 33, 1, 3, 31, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(394, 33, 2, 3, 12, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(395, 33, 3, 3, 83, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(396, 33, 4, 3, 50, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(397, 34, 1, 1, 98, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(398, 34, 2, 1, 2, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(399, 34, 3, 1, 42, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(400, 34, 4, 1, 90, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(401, 34, 1, 2, 36, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(402, 34, 2, 2, 53, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(403, 34, 3, 2, 78, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(404, 34, 4, 2, 18, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(405, 34, 1, 3, 67, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(406, 34, 2, 3, 52, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(407, 34, 3, 3, 96, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(408, 34, 4, 3, 9, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(409, 35, 1, 1, 51, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(410, 35, 2, 1, 25, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL),
(411, 35, 3, 1, 53, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(412, 35, 4, 1, 1, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(413, 35, 1, 2, 92, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(414, 35, 2, 2, 18, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(415, 35, 3, 2, 71, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(416, 35, 4, 2, 29, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(417, 35, 1, 3, 45, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(418, 35, 2, 3, 99, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(419, 35, 3, 3, 60, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(420, 35, 4, 3, 34, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(421, 36, 1, 1, 39, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(422, 36, 2, 1, 9, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(423, 36, 3, 1, 61, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(424, 36, 4, 1, 41, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(425, 36, 1, 2, 85, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(426, 36, 2, 2, 74, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL),
(427, 36, 3, 2, 81, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(428, 36, 4, 2, 31, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(429, 36, 1, 3, 83, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(430, 36, 2, 3, 50, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(431, 36, 3, 3, 82, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(432, 36, 4, 3, 33, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(433, 37, 1, 1, 98, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(434, 37, 2, 1, 98, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(435, 37, 3, 1, 41, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(436, 37, 4, 1, 15, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(437, 37, 1, 2, 7, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(438, 37, 2, 2, 35, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(439, 37, 3, 2, 41, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(440, 37, 4, 2, 29, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(441, 37, 1, 3, 13, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(442, 37, 2, 3, 19, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(443, 37, 3, 3, 46, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(444, 37, 4, 3, 34, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(445, 38, 1, 1, 20, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(446, 38, 2, 1, 21, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(447, 38, 3, 1, 40, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(448, 38, 4, 1, 53, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(449, 38, 1, 2, 72, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(450, 38, 2, 2, 35, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL),
(451, 38, 3, 2, 83, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(452, 38, 4, 2, 85, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(453, 38, 1, 3, 75, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(454, 38, 2, 3, 49, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(455, 38, 3, 3, 87, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(456, 38, 4, 3, 72, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(457, 39, 1, 1, 75, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(458, 39, 2, 1, 80, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(459, 39, 3, 1, 37, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(460, 39, 4, 1, 64, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(461, 39, 1, 2, 8, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(462, 39, 2, 2, 17, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(463, 39, 3, 2, 93, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(464, 39, 4, 2, 63, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(465, 39, 1, 3, 54, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(466, 39, 2, 3, 25, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(467, 39, 3, 3, 7, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(468, 39, 4, 3, 85, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(469, 40, 1, 1, 40, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(470, 40, 2, 1, 82, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(471, 40, 3, 1, 69, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(472, 40, 4, 1, 76, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL),
(473, 40, 1, 2, 7, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(474, 40, 2, 2, 4, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(475, 40, 3, 2, 59, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(476, 40, 4, 2, 48, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(477, 40, 1, 3, 27, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(478, 40, 2, 3, 9, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(479, 40, 3, 3, 86, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(480, 40, 4, 3, 41, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(481, 41, 1, 1, 57, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(482, 41, 2, 1, 2, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(483, 41, 3, 1, 43, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(484, 41, 4, 1, 66, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(485, 41, 1, 2, 46, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(486, 41, 2, 2, 76, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(487, 41, 3, 2, 51, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(488, 41, 4, 2, 16, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(489, 41, 1, 3, 100, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(490, 41, 2, 3, 44, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(491, 41, 3, 3, 100, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(492, 41, 4, 3, 84, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(493, 42, 1, 1, 1, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(494, 42, 2, 1, 12, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL),
(495, 42, 3, 1, 19, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(496, 42, 4, 1, 34, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(497, 42, 1, 2, 85, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(498, 42, 2, 2, 38, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(499, 42, 3, 2, 82, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(500, 42, 4, 2, 43, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(501, 42, 1, 3, 58, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(502, 42, 2, 3, 42, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(503, 42, 3, 3, 22, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(504, 42, 4, 3, 18, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(505, 43, 1, 1, 84, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(506, 43, 2, 1, 79, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(507, 43, 3, 1, 73, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(508, 43, 4, 1, 7, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(509, 43, 1, 2, 59, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(510, 43, 2, 2, 27, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(511, 43, 3, 2, 93, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(512, 43, 4, 2, 80, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(513, 43, 1, 3, 96, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(514, 43, 2, 3, 94, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(515, 43, 3, 3, 97, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(516, 43, 4, 3, 54, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(517, 44, 1, 1, 16, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(518, 44, 2, 1, 85, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(519, 44, 3, 1, 38, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL),
(520, 44, 4, 1, 48, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(521, 44, 1, 2, 28, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(522, 44, 2, 2, 49, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(523, 44, 3, 2, 54, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(524, 44, 4, 2, 7, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(525, 44, 1, 3, 94, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(526, 44, 2, 3, 34, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(527, 44, 3, 3, 13, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(528, 44, 4, 3, 62, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(529, 45, 1, 1, 97, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(530, 45, 2, 1, 73, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(531, 45, 3, 1, 32, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(532, 45, 4, 1, 5, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(533, 45, 1, 2, 80, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(534, 45, 2, 2, 22, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(535, 45, 3, 2, 23, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(536, 45, 4, 2, 78, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(537, 45, 1, 3, 22, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(538, 45, 2, 3, 26, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(539, 45, 3, 3, 60, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(540, 45, 4, 3, 75, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(541, 46, 1, 1, 62, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(542, 46, 2, 1, 78, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(543, 46, 3, 1, 50, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(544, 46, 4, 1, 91, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(545, 46, 1, 2, 90, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(546, 46, 2, 2, 1, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(547, 46, 3, 2, 29, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL),
(548, 46, 4, 2, 51, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(549, 46, 1, 3, 24, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(550, 46, 2, 3, 1, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(551, 46, 3, 3, 30, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(552, 46, 4, 3, 21, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(553, 47, 1, 1, 9, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(554, 47, 2, 1, 10, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(555, 47, 3, 1, 71, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(556, 47, 4, 1, 29, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(557, 47, 1, 2, 31, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(558, 47, 2, 2, 95, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(559, 47, 3, 2, 62, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(560, 47, 4, 2, 29, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(561, 47, 1, 3, 62, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(562, 47, 2, 3, 82, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(563, 47, 3, 3, 87, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(564, 47, 4, 3, 95, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(565, 48, 1, 1, 32, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(566, 48, 2, 1, 2, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(567, 48, 3, 1, 16, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(568, 48, 4, 1, 53, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(569, 48, 1, 2, 25, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(570, 48, 2, 2, 3, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(571, 48, 3, 2, 24, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(572, 48, 4, 2, 92, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(573, 48, 1, 3, 11, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL),
(574, 48, 2, 3, 67, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(575, 48, 3, 3, 48, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(576, 48, 4, 3, 2, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(577, 49, 1, 1, 50, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(578, 49, 2, 1, 48, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(579, 49, 3, 1, 34, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(580, 49, 4, 1, 19, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(581, 49, 1, 2, 24, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(582, 49, 2, 2, 75, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(583, 49, 3, 2, 21, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(584, 49, 4, 2, 51, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(585, 49, 1, 3, 16, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(586, 49, 2, 3, 16, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(587, 49, 3, 3, 27, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(588, 49, 4, 3, 15, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(589, 50, 1, 1, 49, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(590, 50, 2, 1, 44, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(591, 50, 3, 1, 74, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(592, 50, 4, 1, 57, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(593, 50, 1, 2, 79, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(594, 50, 2, 2, 48, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(595, 50, 3, 2, 56, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(596, 50, 4, 2, 53, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL),
(597, 50, 1, 3, 89, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL),
(598, 50, 2, 3, 35, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL),
(599, 50, 3, 3, 26, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL),
(600, 50, 4, 3, 30, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_receipt`
--

CREATE TABLE `warehouse_receipt` (
  `ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SIZE_ID` bigint(20) DEFAULT NULL,
  `COLOR_ID` bigint(20) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT 0,
  `PRICE` double DEFAULT 0,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT current_timestamp(),
  `MODIFIED_BY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehouse_receipt`
--

INSERT INTO `warehouse_receipt` (`ID`, `PRODUCT_ID`, `SIZE_ID`, `COLOR_ID`, `AMOUNT`, `PRICE`, `CREATED_DATE`, `CREATED_BY`, `MODIFIED_DATE`, `MODIFIED_BY`) VALUES
(1, 1, 1, 1, 1, 0, '2023-01-03 14:40:18', NULL, '2023-01-03 14:40:18', NULL),
(2, 1, 2, 1, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(3, 1, 3, 1, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(4, 1, 4, 1, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(5, 1, 1, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(6, 1, 2, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(7, 1, 3, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(8, 1, 4, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(9, 1, 1, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(10, 1, 2, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(11, 1, 3, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL),
(12, 1, 4, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCOUNT_ROLE` (`ROLE_ID`),
  ADD KEY `ACCOUNT_STATUS` (`STATUS_ID`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CART_ACCOUNT` (`ACCOUNT_ID`);

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD KEY `CART_DETAIL_CART` (`CART_ID`),
  ADD KEY `CART_DETAIL_PRODUCT` (`PRODUCT_ID`),
  ADD KEY `CART_DETAIL_COLOR` (`COLOR_ID`),
  ADD KEY `CART_DETAIL_SIZE` (`SIZE_ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ORDER_ACCOUNT` (`ACCOUNT_ID`),
  ADD KEY `ORDER_STATUS` (`STATUS_ID`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD KEY `ORDER_DETAIL_ORDER` (`ORDER_ID`),
  ADD KEY `ORDER_DETAIL_PRODUCT` (`PRODUCT_ID`),
  ADD KEY `ORDER_DETAIL_COLOR` (`COLOR_ID`),
  ADD KEY `ORDER_DETAIL_SIZE` (`SIZE_ID`);

--
-- Chỉ mục cho bảng `photo`
--
ALTER TABLE `photo`
  ADD KEY `PHOTO_PRODUCT` (`PRODUCT_ID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PRODUCT_BRAND` (`BRAND_ID`),
  ADD KEY `PRODUCT_CATEGORY` (`CATEGORY_ID`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `REVIEW_ACCOUNT` (`ACCOUNT_ID`),
  ADD KEY `REVIEW_PRODUCT` (`PRODUCT_ID`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `sign`
--
ALTER TABLE `sign`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SIGN_ACCOUNT` (`ACCOUNT_ID`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `verification`
--
ALTER TABLE `verification`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `VERIFICATION_ORDER` (`ORDER_ID`),
  ADD KEY `VERIFICATION_SIGN` (`SIGN_ID`);

--
-- Chỉ mục cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `WAREHOUSE_PRODUCT` (`PRODUCT_ID`),
  ADD KEY `WAREHOUSE_SIZE` (`SIZE_ID`),
  ADD KEY `WAREHOUSE_COLOR` (`COLOR_ID`);

--
-- Chỉ mục cho bảng `warehouse_receipt`
--
ALTER TABLE `warehouse_receipt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `WAREHOUSE_RECEIPT_PRODUCT` (`PRODUCT_ID`),
  ADD KEY `WAREHOUSE_RECEIPT_SIZE` (`SIZE_ID`),
  ADD KEY `WAREHOUSE_RECEIPT_COLOR` (`COLOR_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sign`
--
ALTER TABLE `sign`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `verification`
--
ALTER TABLE `verification`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT cho bảng `warehouse_receipt`
--
ALTER TABLE `warehouse_receipt`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `ACCOUNT_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  ADD CONSTRAINT `ACCOUNT_STATUS` FOREIGN KEY (`STATUS_ID`) REFERENCES `status` (`ID`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `CART_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`);

--
-- Các ràng buộc cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `CART_DETAIL_CART` FOREIGN KEY (`CART_ID`) REFERENCES `cart` (`ID`),
  ADD CONSTRAINT `CART_DETAIL_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`),
  ADD CONSTRAINT `CART_DETAIL_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `CART_DETAIL_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `ORDER_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `ORDER_STATUS` FOREIGN KEY (`STATUS_ID`) REFERENCES `status` (`ID`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `ORDER_DETAIL_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`),
  ADD CONSTRAINT `ORDER_DETAIL_ORDER` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`),
  ADD CONSTRAINT `ORDER_DETAIL_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `ORDER_DETAIL_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`);

--
-- Các ràng buộc cho bảng `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `PHOTO_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `PRODUCT_BRAND` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`),
  ADD CONSTRAINT `PRODUCT_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`);

--
-- Các ràng buộc cho bảng `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `REVIEW_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `REVIEW_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`);

--
-- Các ràng buộc cho bảng `sign`
--
ALTER TABLE `sign`
  ADD CONSTRAINT `SIGN_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`);

--
-- Các ràng buộc cho bảng `verification`
--
ALTER TABLE `verification`
  ADD CONSTRAINT `VERIFICATION_ORDER` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`),
  ADD CONSTRAINT `VERIFICATION_SIGN` FOREIGN KEY (`SIGN_ID`) REFERENCES `sign` (`ID`);

--
-- Các ràng buộc cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `WAREHOUSE_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`),
  ADD CONSTRAINT `WAREHOUSE_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `WAREHOUSE_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`);

--
-- Các ràng buộc cho bảng `warehouse_receipt`
--
ALTER TABLE `warehouse_receipt`
  ADD CONSTRAINT `WAREHOUSE_RECEIPT_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`),
  ADD CONSTRAINT `WAREHOUSE_RECEIPT_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `WAREHOUSE_RECEIPT_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
