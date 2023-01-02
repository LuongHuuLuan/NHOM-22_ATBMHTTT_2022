-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 02, 2023 lúc 03:11 PM
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
(1, NULL, NULL, 'Lương Hữu', 'Luân', '1215943200', 'admin1@gmail.com', NULL, 'admin1', 'e00cf25ad42683b3df678c61f42c6bda', 1, 2, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(2, NULL, NULL, 'Nguyễn Dũy', 'Long', '1325943200', 'admin2@gmail.com', NULL, 'admin2', 'c84258e9c39059a89ab77d846ddab909', 1, 2, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(3, NULL, NULL, 'Nguyễn Công', 'Phúc', '3455943200', 'admin3@gmail.com', NULL, 'admin3', '32cacb2f994f6b42183a1300d9a3e8d6', 1, 2, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(4, NULL, NULL, 'Nguyễn Văn', 'A', '1826384619', 'khachhang1@gmail.com', NULL, 'khachhang1', '32cacb2f994f6b42183a1300d9a3e8d6', 1, 2, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL);

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
(1, 'NIKE', 'NIKE', '2023-01-02 21:10:20', NULL, '2023-01-02 21:10:20', NULL),
(2, 'FAKE', 'FAKE', '2023-01-02 21:10:20', NULL, '2023-01-02 21:10:20', NULL),
(3, 'LOCAL-BRAND', 'LOCAL BRAND', '2023-01-02 21:10:20', NULL, '2023-01-02 21:10:20', NULL),
(4, 'GUUCI', 'GUCCI', '2023-01-02 21:10:20', NULL, '2023-01-02 21:10:20', NULL),
(5, 'LV', 'LV', '2023-01-02 21:10:20', NULL, '2023-01-02 21:10:20', NULL);

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
(1, 'AO-KHOAT', 'ÁO KHOÁT', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(2, 'QUAN-TAY', 'QUẦN TÂY', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL);

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
(1, 'DEN', 'ĐEN', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(2, 'TRANG', 'TRẮNG', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(3, 'DO', 'ĐỎ', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(4, 'XAM', 'XÁM', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(5, 'BAC', 'BẠC', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(6, 'XANH', 'XANH', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(7, 'XANH-REU', 'XANH RÊU', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(8, 'XANH-DEN', 'XANH ĐEN', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(9, 'BO', 'BÓ', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(10, 'BE', 'BE', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(11, 'NAU', 'NÂU', '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL);

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
(1, 'SP1', 'ÁO KHOÁT DÙ TRƠN MÀU ĐEN AKO20', 3, 1, 315000, 0, NULL, '/assets/imgs/product-imgs/ak_den_1_1.jpg', 0, 0, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(2, 'SP2', 'ÁO KHOÁT DÙ TRƠN NÓN RỜI AK019', 3, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_2_1.png', 0, 0, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(3, 'SP3', 'ÁO KHOÁT KAKI BASIC AK018', 3, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_3_1.png', 0, 0, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(4, 'SP4', 'ÁO KHOÁT NẸP BẤM NÚT AK010', 3, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_den_4_1.png', 0, 0, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(5, 'SP5', 'ÁO KHOÁT NỈ TRƠN AK013', 3, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_den_5_1.png', 0, 0, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(6, 'SP6', 'ÁO HOODIE BELIEVE AK012', 1, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_be_6_1.jpg', 0, 0, '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(7, 'SP7', 'ÁO KHOÁT KAKI TÚI ĐẮP AK017', 1, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_7_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(8, 'SP8', 'ÁO KHOÁT DA LỘN LIMITED AK016', 1, 1, 645000, 0, NULL, '/assets/imgs/product-imgs/ak_den_8_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(9, 'SP9', 'ÁO KHOÁT DA LỘN AK015', 1, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_nau_9_1.jpg', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(10, 'SP10', 'ÁO HOODIE SPORTS ELEGANT AK011', 1, 1, 315000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_10_1.jpg', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(11, 'SP11', 'ÁO KHOÁT DÙ TAY PHỐI TÚI AK008', 2, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_11_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(12, 'SP12', 'ÁO KHOÁT DÙ TÚI HỘP AK009', 2, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_12_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(13, 'SP13', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK007', 2, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_trang_13_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(14, 'SP14', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK001', 2, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_den_14_1.jpg', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(15, 'SP15', 'ÁO KHOÁT KAKI AK266', 2, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_den_15_1.jpg', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(16, 'SP16', 'ÁO KHOÁT MANGTO DẠ AK267', 4, 1, 1750000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_16_1.jpg', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(17, 'SP17', 'ÁO KHOÁT JEAN AK263', 4, 1, 515000, 0, NULL, '/assets/imgs/product-imgs/ak_den_17_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(18, 'SP18', 'QUẦN TÂY TRƠN QT024', 4, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_18_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(19, 'SP19', 'QUẦN TÂY TRƠN REGULAR QT026', 4, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_19_1.jpg', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(20, 'SP20', 'QUẦN TÂY PHỐI SỌC QT023', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_20_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(21, 'SP21', 'QUẦN TÂY NAZAFU QT006', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xanh_21_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(22, 'SP22', 'QUẦN TÂY NAZAFU QT005', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_22_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(23, 'SP23', 'QUẦN TÂY NAZAFU QT003', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_23_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(24, 'SP24', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT020', 5, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_24_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(25, 'SP25', 'QUẦN TÂY TÚI SAU PHỐI D Y DỆT QT022', 5, 2, 445000, 0, NULL, '/assets/imgs/product-imgs/qt_den_25_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(26, 'SP26', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT021', 1, 2, 445000, 0, NULL, '/assets/imgs/product-imgs/qt_den_26_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(27, 'SP27', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT019', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_27_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(28, 'SP28', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT018', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_28_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(29, 'SP29', 'QUẦN TÂY TÚI SAU PHỐI D Y DỆT QT017', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_29_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(30, 'SP30', 'QUẦN TÂY LƯNG SAU PHỐI D Y DỆT QT016', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_30_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(31, 'SP31', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT015', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_31_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(32, 'SP32', 'QUẦN TÂY PHỐI D Y DỆT QT014', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_32_1.png', 0, 0, '2023-01-02 21:10:22', NULL, '2023-01-02 21:10:22', NULL),
(33, 'SP33', 'QUẦN TÂY PHỐI D Y DỆT QT013', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_33_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(34, 'SP34', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT012', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_34_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(35, 'SP35', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT011', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_35_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(36, 'SP36', 'QUẦN TÂY KẺ CARO FORM SLIMFIT QT010', 3, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_36_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(37, 'SP37', 'QUẦN TÂY XẾP LY FORM SLIMFIT QT007', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_37_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(38, 'SP38', 'QUẦN TÂY LINEN LƯNG THUN QT008', 3, 2, 375000, 0, NULL, '/assets/imgs/product-imgs/qt_den_38_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(39, 'SP39', 'QUẦN TÂY LINEN FORM LOOSE-CROPPED QT002', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_39_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(40, 'SP40', 'QUẦN TÂY GẮN NHÃN QT001', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_40_1.png', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(41, 'SP41', 'QUẦN TÂY FORM REGULAR QT155', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_41_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(42, 'SP42', 'QUẦN TÂY FORM REGULAR QT154', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_42_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(43, 'SP43', 'QUẦN TÂY SỌC SLIM-CROPPED LAI LƠ VÊ QT153', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_43_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(44, 'SP44', 'QUẦN TÂY ĐỎ ĐÔ QT110', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_do_44_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(45, 'SP45', 'QUẦN TÂY XÁM CHUỘT ĐẬM QT141', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_45_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(46, 'SP46', 'QUẦN TÂY NAZAFU XANH ĐEN QT1128', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_46_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(47, 'SP47', 'QUẦN TÂY NAZAFU SỌC TRẮNG KEM QT1123', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_47_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(48, 'SP48', 'QUẦN TÂY XÁM QT1120', 5, 2, 395000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_48_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(49, 'SP49', 'QUẦN TÂY NAZAFU ĐỎ ĐÔ QT1113', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_49_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL),
(50, 'SP50', 'QUẦN TÂY NAZAFU ĐEN QT1109', 5, 2, 525000, 0, NULL, '/assets/imgs/product-imgs/qt_den_50_1.jpg', 0, 0, '2023-01-02 21:10:23', NULL, '2023-01-02 21:10:23', NULL);

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
(1, 'VT1', 'ADMIN', '2023-01-02 21:10:20', NULL, '2023-01-02 21:10:20', NULL),
(2, 'VT2', 'USER', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sign`
--

CREATE TABLE `sign` (
  `ID` bigint(20) NOT NULL,
  `ACCOUNT_ID` bigint(20) DEFAULT NULL,
  `SIGN` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
(1, 'S', 'SMALL', '2023-01-02 21:10:24', NULL, '2023-01-02 21:10:24', NULL),
(2, 'M', 'MEDIUM', '2023-01-02 21:10:24', NULL, '2023-01-02 21:10:24', NULL),
(3, 'L', 'LARGE', '2023-01-02 21:10:24', NULL, '2023-01-02 21:10:24', NULL),
(4, 'XL', 'EXTRA LARGE', '2023-01-02 21:10:24', NULL, '2023-01-02 21:10:24', NULL);

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
(1, 'UNVALIDATE', 'UNVALIDATE', NULL, 'ACCOUNT', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(2, 'ACTIVE', 'ACTIVE', NULL, 'ACCOUNT', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(3, 'BLOCK', 'BLOCK', NULL, 'ACCOUNT', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(4, 'WAIT', 'WAIT', NULL, 'ORDER', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(5, 'DONE', 'DONE', NULL, 'ORDER', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL),
(6, 'CANCEL', 'CANCEL', NULL, 'ORDER', '2023-01-02 21:10:21', NULL, '2023-01-02 21:10:21', NULL);

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
(1, 1, 1, 1, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(2, 1, 2, 1, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(3, 1, 3, 1, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(4, 1, 4, 1, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(5, 1, 1, 2, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(6, 1, 2, 2, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(7, 1, 3, 2, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(8, 1, 4, 2, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(9, 1, 1, 3, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(10, 1, 2, 3, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(11, 1, 3, 3, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL),
(12, 1, 4, 3, 1, '2023-01-02 21:10:43', NULL, '2023-01-02 21:10:43', NULL);

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
(1, 1, 1, 1, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(2, 1, 2, 1, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(3, 1, 3, 1, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(4, 1, 4, 1, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(5, 1, 1, 2, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(6, 1, 2, 2, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(7, 1, 3, 2, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(8, 1, 4, 2, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(9, 1, 1, 3, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(10, 1, 2, 3, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(11, 1, 3, 3, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL),
(12, 1, 4, 3, 1, 0, '2023-01-02 21:10:42', NULL, '2023-01-02 21:10:42', NULL);

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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `verification`
--
ALTER TABLE `verification`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
