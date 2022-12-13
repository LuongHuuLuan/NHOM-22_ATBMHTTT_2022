-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 13, 2022 lúc 05:46 PM
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
-- Cơ sở dữ liệu: `webbanhang`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllItemCart` (IN `MA_GIO` INTEGER)   BEGIN
SELECT sp.HINH_NHO, c.KICH_THUOC, c.MAUSAC, c.SO_LUONG, c.MA_SP, sp.TEN_SP, sp.GIA FROM SANPHAM AS sp, CHITIETGIO AS c WHERE
 c.MA_SP=sp.MA_SP AND c.MA_GIO=MA_GIO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `layCacSanPham` (IN `VI_TRI` INT, IN `SO_LUONG` INT)   BEGIN
SELECT sp.MA_SP, sp.TEN_SP, nh.TEN_NHAN_HIEU, sp.GIA, sp.MO_TA, sp.HINH_NHO, sp.NGAY_THEM,  sp.TONG_DANH_GIA, sp.TONG_SAO, sp.SO_LUONG FROM SANPHAM AS sp, NHANHIEU AS nh WHERE sp.MA_NHAN_HIEU = nh.MA_NHAN_HIEU LIMIT VI_TRI, SO_LUONG;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `layDanhSachSanPham` ()   BEGIN
SELECT sp.MA_SP, sp.TEN_SP, nh.TEN_NHAN_HIEU, sp.GIA, sp.MO_TA, sp.HINH_NHO, sp.NGAY_THEM,  sp.TONG_DANH_GIA, sp.TONG_SAO, sp.SO_LUONG FROM SANPHAM AS sp, NHANHIEU AS nh WHERE sp.MA_NHAN_HIEU = nh.MA_NHAN_HIEU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `layDSHinh` (IN `MA_SP` VARCHAR(10))   BEGIN
SELECT ha.DUONG_DAN_ANH FROM HINHANH AS ha WHERE ha.MA_SP = MA_SP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `layDSKichThuoc` (IN `MA_SP` VARCHAR(10))   BEGIN
SELECT ctkt.TEN_KICH_THUOC FROM KICHTHUOC AS kt, CHITIETKICHTHUOC AS ctkt WHERE kt.MA_SP = MA_SP AND kt.MA_CT_KICH_THUOC = ctkt.MA_CT_KICH_THUOC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `layDSMau` (IN `MA_SP` VARCHAR(10))   BEGIN
SELECT ctm.TEN_MAU FROM MAU AS m, CHITIETMAU AS ctm WHERE m.MA_SP = MA_SP AND m.MA_CT_MAU = ctm.MA_CT_MAU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `layDSThe` (IN `MA_SP` VARCHAR(10))   BEGIN
SELECT ctt.TEN_THE FROM THE AS t, CHITIETTHE AS ctt WHERE t.MA_SP = MA_SP AND t.MA_CT_THE = ctt.MA_CT_THE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `laySanPham` (IN `MA_SP` VARCHAR(10))   BEGIN
SELECT sp.MA_SP, sp.TEN_SP, nh.TEN_NHAN_HIEU, sp.GIA, sp.MO_TA, sp.HINH_NHO, sp.NGAY_THEM,  sp.TONG_DANH_GIA, sp.TONG_SAO, sp.SO_LUONG FROM SANPHAM AS sp, NHANHIEU AS nh WHERE sp.MA_SP = MA_SP AND sp.MA_NHAN_HIEU = nh.MA_NHAN_HIEU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `layTaiKhoan` (IN `ten_TK` VARCHAR(50), IN `mat_Khau` VARCHAR(50))   SELECT tk.MA_TK, tk.HO, tk.TEN, tk.SDT, tk.EMAIL, tk.DIA_CHI, tk.TEN_TK, tk.MAT_KHAU, tk.NGAY_DK, vt.TEN_VAI_TRO 
FROM TAIKHOAN AS tk, VAITRO AS vt
WHERE tk.TEN_TK = ten_TK AND tk.MAT_KHAU = mat_Khau AND tk.MA_VAI_TRO = vt.MA_VAI_TRO$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themDangKy` (IN `MA_XAC_THUC` VARCHAR(255), IN `HO` VARCHAR(255), IN `TEN` VARCHAR(255), IN `SDT` VARCHAR(20), `EMAIL` VARCHAR(50), IN `TEN_TK` VARCHAR(50), IN `MAT_KHAU` VARCHAR(50))   INSERT INTO DANGKY(MA_XAC_THUC, HO, TEN, SDT, EMAIL, TEN_TK, MAT_KHAU) VALUES(MA_XAC_THUC, HO, TEN, SDT, EMAIL, TEN_TK, MAT_KHAU)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdanhgia`
--

CREATE TABLE `chitietdanhgia` (
  `MA_CT_DANH_GIA` int(11) NOT NULL,
  `BINH_LUAN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DANH_GIA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietgio`
--

CREATE TABLE `chitietgio` (
  `MA_GIO` int(11) NOT NULL,
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `KICH_THUOC` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MAUSAC` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `SO_LUONG` int(11) NOT NULL,
  `NGAY_THEM` datetime NOT NULL DEFAULT current_timestamp(),
  `NGAY_CAP_NHAT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietkichthuoc`
--

CREATE TABLE `chitietkichthuoc` (
  `MA_CT_KICH_THUOC` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TEN_KICH_THUOC` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NGUOI_THEM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGAY_THEM` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietkichthuoc`
--

INSERT INTO `chitietkichthuoc` (`MA_CT_KICH_THUOC`, `TEN_KICH_THUOC`, `NGUOI_THEM`, `NGAY_THEM`) VALUES
('L', 'L', NULL, '2022-12-13 23:45:45'),
('M', 'M', NULL, '2022-12-13 23:45:45'),
('S', 'S', NULL, '2022-12-13 23:45:44'),
('XL', 'XL', NULL, '2022-12-13 23:45:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietmau`
--

CREATE TABLE `chitietmau` (
  `MA_CT_MAU` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TEN_MAU` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NGUOI_THEM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGAY_THEM` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietmau`
--

INSERT INTO `chitietmau` (`MA_CT_MAU`, `TEN_MAU`, `NGUOI_THEM`, `NGAY_THEM`) VALUES
('BAC', 'BẠC', NULL, '2022-12-13 23:45:38'),
('BE', 'BE', NULL, '2022-12-13 23:45:38'),
('BO', 'BÓ', NULL, '2022-12-13 23:45:38'),
('DEN', 'ĐEN', NULL, '2022-12-13 23:45:38'),
('DO', 'ĐỎ', NULL, '2022-12-13 23:45:38'),
('NAU', 'NÂU', NULL, '2022-12-13 23:45:38'),
('TRANG', 'TRẮNG', NULL, '2022-12-13 23:45:38'),
('XAM', 'XÁM', NULL, '2022-12-13 23:45:38'),
('XANH', 'XANH', NULL, '2022-12-13 23:45:38'),
('XANH_DEN', 'XANH ĐEN', NULL, '2022-12-13 23:45:38'),
('XANH_REU', 'XANH RÊU', NULL, '2022-12-13 23:45:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietthe`
--

CREATE TABLE `chitietthe` (
  `MA_CT_THE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TEN_THE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MA_NHAN_HIEU` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGUOI_THEM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGAY_THEM` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietthe`
--

INSERT INTO `chitietthe` (`MA_CT_THE`, `TEN_THE`, `MA_NHAN_HIEU`, `NGUOI_THEM`, `NGAY_THEM`) VALUES
('AOKHOAT', 'ÁO KHOÁT', NULL, NULL, '2022-12-13 23:45:42'),
('QUANTAY', 'QUẦN TÂY', NULL, NULL, '2022-12-13 23:45:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cthd`
--

CREATE TABLE `cthd` (
  `MA_HOA_DON` int(11) NOT NULL,
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `KICH_THUOC` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MAU_SAC` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `SO_LUONG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctphieunhap`
--

CREATE TABLE `ctphieunhap` (
  `MA_PHIEU_NHAP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `SO_LUONG_NHAP` int(11) DEFAULT 0,
  `GIA_NHAP` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dangky`
--

CREATE TABLE `dangky` (
  `MA_DK` int(11) NOT NULL,
  `MA_XAC_THUC` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HO` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TEN_TK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MAT_KHAU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NGAY_DK` datetime NOT NULL DEFAULT current_timestamp(),
  `TRANG_THAI` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DANG_CHO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Bẫy `dangky`
--
DELIMITER $$
CREATE TRIGGER `tao_TK_Khi_DK_Thanh_Cong` AFTER UPDATE ON `dangky` FOR EACH ROW BEGIN
IF (NEW.TRANG_THAI =  'THANH_CONG') 
THEN
INSERT INTO TAIKHOAN(HO, TEN, SDT, EMAIL, TEN_TK, MAT_KHAU) 
SELECT HO, TEN, SDT, EMAIL, TEN_TK, MAT_KHAU FROM DANGKY WHERE MA_DK = NEW.MA_DK AND MA_XAC_THUC = NEW.MA_XAC_THUC;
END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MA_TK` int(11) NOT NULL,
  `MA_CT_DANH_GIA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio`
--

CREATE TABLE `gio` (
  `MA_GIO` int(11) NOT NULL,
  `MA_TK` int(11) DEFAULT NULL,
  `NGAY_THEM` datetime NOT NULL DEFAULT current_timestamp(),
  `NGAY_CAP_NHAT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `gio`
--

INSERT INTO `gio` (`MA_GIO`, `MA_TK`, `NGAY_THEM`, `NGAY_CAP_NHAT`) VALUES
(1, 1, '2022-12-13 23:45:36', NULL),
(2, 2, '2022-12-13 23:45:36', NULL),
(3, 3, '2022-12-13 23:45:36', NULL),
(4, 4, '2022-12-13 23:45:36', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanh`
--

CREATE TABLE `hinhanh` (
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MA_CT_MAU` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DUONG_DAN_ANH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanh`
--

INSERT INTO `hinhanh` (`MA_SP`, `MA_CT_MAU`, `DUONG_DAN_ANH`) VALUES
('SP1', 'DEN', '/assets/imgs/product-imgs/ak_den_1_1.jpg'),
('SP1', 'DEN', '/assets/imgs/product-imgs/ak_den_1_2.jpg'),
('SP1', 'DEN', '/assets/imgs/product-imgs/ak_den_1_3.png'),
('SP1', 'DEN', '/assets/imgs/product-imgs/ak_den_1_4.jpg'),
('SP1', 'DO', '/assets/imgs/product-imgs/ak_do_1_1.jpg'),
('SP1', 'DO', '/assets/imgs/product-imgs/ak_do_1_2.jpg'),
('SP1', 'DO', '/assets/imgs/product-imgs/ak_do_1_3.jpg'),
('SP1', 'DO', '/assets/imgs/product-imgs/ak_do_1_4.jpg'),
('SP1', 'TRANG', '/assets/imgs/product-imgs/ak_trang_1_1.jpg'),
('SP10', 'BO', '/assets/imgs/product-imgs/ak_bo_10_1.jpg'),
('SP10', 'BO', '/assets/imgs/product-imgs/ak_bo_10_2.jpg'),
('SP10', 'BO', '/assets/imgs/product-imgs/ak_bo_10_3.jpg'),
('SP10', 'BO', '/assets/imgs/product-imgs/ak_bo_10_4.jpg'),
('SP10', 'BO', '/assets/imgs/product-imgs/ak_bo_10_5.jpg'),
('SP10', 'DEN', '/assets/imgs/product-imgs/ak_den_10_1.jpg'),
('SP10', 'DEN', '/assets/imgs/product-imgs/ak_den_10_2.jpg'),
('SP10', 'DEN', '/assets/imgs/product-imgs/ak_den_10_3.jpg'),
('SP10', 'DEN', '/assets/imgs/product-imgs/ak_den_10_4.jpg'),
('SP10', 'DEN', '/assets/imgs/product-imgs/ak_den_10_5.jpg'),
('SP10', 'XAM', '/assets/imgs/product-imgs/ak_xam_10_1.jpg'),
('SP10', 'XAM', '/assets/imgs/product-imgs/ak_xam_10_2.jpg'),
('SP10', 'XAM', '/assets/imgs/product-imgs/ak_xam_10_3.jpg'),
('SP10', 'XAM', '/assets/imgs/product-imgs/ak_xam_10_4.jpg'),
('SP10', 'XAM', '/assets/imgs/product-imgs/ak_xam_10_5.jpg'),
('SP11', 'DEN', '/assets/imgs/product-imgs/ak_den_11_1.png'),
('SP11', 'DEN', '/assets/imgs/product-imgs/ak_den_11_2.png'),
('SP11', 'DEN', '/assets/imgs/product-imgs/ak_den_11_3.png'),
('SP11', 'DEN', '/assets/imgs/product-imgs/ak_den_11_4.png'),
('SP11', 'DEN', '/assets/imgs/product-imgs/ak_den_11_5.png'),
('SP11', 'XANH', '/assets/imgs/product-imgs/ak_xanh_11_1.png'),
('SP11', 'XANH', '/assets/imgs/product-imgs/ak_xanh_11_2.png'),
('SP11', 'XANH', '/assets/imgs/product-imgs/ak_xanh_11_3.png'),
('SP11', 'XANH', '/assets/imgs/product-imgs/ak_xanh_11_4.png'),
('SP11', 'XANH', '/assets/imgs/product-imgs/ak_xanh_11_5.png'),
('SP12', 'DEN', '/assets/imgs/product-imgs/ak_den_12_1.png'),
('SP12', 'DEN', '/assets/imgs/product-imgs/ak_den_12_2.png'),
('SP12', 'DEN', '/assets/imgs/product-imgs/ak_den_12_3.png'),
('SP12', 'DEN', '/assets/imgs/product-imgs/ak_den_12_4.png'),
('SP12', 'DEN', '/assets/imgs/product-imgs/ak_den_12_5.png'),
('SP12', 'XANH', '/assets/imgs/product-imgs/ak_xanh_12_1.png'),
('SP12', 'XANH', '/assets/imgs/product-imgs/ak_xanh_12_2.png'),
('SP12', 'XANH', '/assets/imgs/product-imgs/ak_xanh_12_3.png'),
('SP12', 'XANH', '/assets/imgs/product-imgs/ak_xanh_12_4.png'),
('SP12', 'XANH', '/assets/imgs/product-imgs/ak_xanh_12_5.png'),
('SP12', 'XANH', '/assets/imgs/product-imgs/ak_xanh_12_6.png'),
('SP13', 'TRANG', '/assets/imgs/product-imgs/ak_trang_13_1.png'),
('SP13', 'TRANG', '/assets/imgs/product-imgs/ak_trang_13_2.png'),
('SP13', 'TRANG', '/assets/imgs/product-imgs/ak_trang_13_3.png'),
('SP13', 'TRANG', '/assets/imgs/product-imgs/ak_trang_13_4.png'),
('SP13', 'TRANG', '/assets/imgs/product-imgs/ak_trang_13_5.png'),
('SP13', 'TRANG', '/assets/imgs/product-imgs/ak_trang_13_6.png'),
('SP13', 'XANH', '/assets/imgs/product-imgs/ak_xanh_13_1.png'),
('SP13', 'XANH', '/assets/imgs/product-imgs/ak_xanh_13_2.png'),
('SP13', 'XANH', '/assets/imgs/product-imgs/ak_xanh_13_3.png'),
('SP13', 'XANH', '/assets/imgs/product-imgs/ak_xanh_13_4.png'),
('SP13', 'XANH', '/assets/imgs/product-imgs/ak_xanh_13_5.png'),
('SP13', 'XANH', '/assets/imgs/product-imgs/ak_xanh_13_6.png'),
('SP14', 'DEN', '/assets/imgs/product-imgs/ak_den_14_1.jpg'),
('SP14', 'DEN', '/assets/imgs/product-imgs/ak_den_14_2.jpg'),
('SP14', 'DEN', '/assets/imgs/product-imgs/ak_den_14_3.jfif'),
('SP14', 'DEN', '/assets/imgs/product-imgs/ak_den_14_4.jpg'),
('SP14', 'DEN', '/assets/imgs/product-imgs/ak_den_14_5.jpg'),
('SP14', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_14_1.jpg'),
('SP14', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_14_2.jpg'),
('SP14', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_14_3.jpg'),
('SP14', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_14_4.jpg'),
('SP14', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_14_5.jpg'),
('SP14', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_14_6.jpg'),
('SP15', 'DEN', '/assets/imgs/product-imgs/ak_den_15_1.jpg'),
('SP15', 'DEN', '/assets/imgs/product-imgs/ak_den_15_2.jpg'),
('SP15', 'DEN', '/assets/imgs/product-imgs/ak_den_15_3.jpg'),
('SP15', 'DEN', '/assets/imgs/product-imgs/ak_den_15_4.jpg'),
('SP15', 'DEN', '/assets/imgs/product-imgs/ak_den_15_5.jpg'),
('SP16', 'BO', '/assets/imgs/product-imgs/ak_bo_16_1.jpg'),
('SP16', 'BO', '/assets/imgs/product-imgs/ak_bo_16_2.jpg'),
('SP16', 'BO', '/assets/imgs/product-imgs/ak_bo_16_3.jpg'),
('SP16', 'BO', '/assets/imgs/product-imgs/ak_bo_16_4.jpg'),
('SP16', 'BO', '/assets/imgs/product-imgs/ak_bo_16_5.jpg'),
('SP16', 'DEN', '/assets/imgs/product-imgs/ak_den_16_1.jpg'),
('SP16', 'DEN', '/assets/imgs/product-imgs/ak_den_16_2.jpg'),
('SP16', 'DEN', '/assets/imgs/product-imgs/ak_den_16_3.jpg'),
('SP16', 'DEN', '/assets/imgs/product-imgs/ak_den_16_4.jpg'),
('SP16', 'DEN', '/assets/imgs/product-imgs/ak_den_16_5.jpg'),
('SP17', 'DEN', '/assets/imgs/product-imgs/ak_den_17_1.png'),
('SP17', 'DEN', '/assets/imgs/product-imgs/ak_den_17_2.png'),
('SP17', 'DEN', '/assets/imgs/product-imgs/ak_den_17_3.png'),
('SP17', 'DEN', '/assets/imgs/product-imgs/ak_den_17_4.png'),
('SP17', 'DEN', '/assets/imgs/product-imgs/ak_den_17_5.png'),
('SP17', 'XAM', '/assets/imgs/product-imgs/ak_xam_17_1.png'),
('SP17', 'XAM', '/assets/imgs/product-imgs/ak_xam_17_2.png'),
('SP17', 'XAM', '/assets/imgs/product-imgs/ak_xam_17_3.png'),
('SP17', 'XAM', '/assets/imgs/product-imgs/ak_xam_17_4.png'),
('SP17', 'XAM', '/assets/imgs/product-imgs/ak_xam_17_5.png'),
('SP17', 'XANH', '/assets/imgs/product-imgs/ak_xanh_17_1.png'),
('SP17', 'XANH', '/assets/imgs/product-imgs/ak_xanh_17_2.png'),
('SP17', 'XANH', '/assets/imgs/product-imgs/ak_xanh_17_3.png'),
('SP17', 'XANH', '/assets/imgs/product-imgs/ak_xanh_17_4.png'),
('SP17', 'XANH', '/assets/imgs/product-imgs/ak_xanh_17_5.png'),
('SP18', 'DEN', '/assets/imgs/product-imgs/qt_den_18_1.png'),
('SP18', 'DEN', '/assets/imgs/product-imgs/qt_den_18_2.png'),
('SP18', 'DEN', '/assets/imgs/product-imgs/qt_den_18_3.png'),
('SP18', 'DEN', '/assets/imgs/product-imgs/qt_den_18_4.png'),
('SP18', 'DEN', '/assets/imgs/product-imgs/qt_den_18_5.png'),
('SP18', 'DEN', '/assets/imgs/product-imgs/qt_den_18_6.png'),
('SP18', 'DEN', '/assets/imgs/product-imgs/qt_den_18_7.png'),
('SP18', 'NAU', '/assets/imgs/product-imgs/qt_nau_18_1.png'),
('SP18', 'NAU', '/assets/imgs/product-imgs/qt_nau_18_2.png'),
('SP18', 'NAU', '/assets/imgs/product-imgs/qt_nau_18_3.png'),
('SP18', 'NAU', '/assets/imgs/product-imgs/qt_nau_18_4.png'),
('SP18', 'NAU', '/assets/imgs/product-imgs/qt_nau_18_5.png'),
('SP18', 'NAU', '/assets/imgs/product-imgs/qt_nau_18_6.png'),
('SP19', 'DEN', '/assets/imgs/product-imgs/qt_den_19_1.jpg'),
('SP19', 'DEN', '/assets/imgs/product-imgs/qt_den_19_2.jpg'),
('SP19', 'DEN', '/assets/imgs/product-imgs/qt_den_19_3.jpg'),
('SP19', 'DEN', '/assets/imgs/product-imgs/qt_den_19_4.jpg'),
('SP19', 'NAU', '/assets/imgs/product-imgs/qt_nau_19_1.jpg'),
('SP19', 'NAU', '/assets/imgs/product-imgs/qt_nau_19_2.jpg'),
('SP19', 'NAU', '/assets/imgs/product-imgs/qt_nau_19_3.jpg'),
('SP19', 'NAU', '/assets/imgs/product-imgs/qt_nau_19_4.jpg'),
('SP2', 'DEN', '/assets/imgs/product-imgs/ak_den_2_1.png'),
('SP2', 'DEN', '/assets/imgs/product-imgs/ak_den_2_2.png'),
('SP2', 'DEN', '/assets/imgs/product-imgs/ak_den_2_3.png'),
('SP2', 'DEN', '/assets/imgs/product-imgs/ak_den_2_4.png'),
('SP2', 'DEN', '/assets/imgs/product-imgs/ak_den_2_5.png'),
('SP2', 'DEN', '/assets/imgs/product-imgs/ak_den_2_6.png'),
('SP2', 'XAM', '/assets/imgs/product-imgs/ak_xam_2_1.png'),
('SP2', 'XAM', '/assets/imgs/product-imgs/ak_xam_2_2.png'),
('SP2', 'XAM', '/assets/imgs/product-imgs/ak_xam_2_3.png'),
('SP2', 'XAM', '/assets/imgs/product-imgs/ak_xam_2_4.png'),
('SP2', 'XAM', '/assets/imgs/product-imgs/ak_xam_2_5.png'),
('SP2', 'XAM', '/assets/imgs/product-imgs/ak_xam_2_6.png'),
('SP2', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_2_1.png'),
('SP2', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_2_2.png'),
('SP2', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_2_3.png'),
('SP2', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_2_4.png'),
('SP2', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_2_5.png'),
('SP2', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_2_6.png'),
('SP20', 'DEN', '/assets/imgs/product-imgs/qt_den_20_1.png'),
('SP20', 'DEN', '/assets/imgs/product-imgs/qt_den_20_2.png'),
('SP20', 'DEN', '/assets/imgs/product-imgs/qt_den_20_3.png'),
('SP20', 'DEN', '/assets/imgs/product-imgs/qt_den_20_4.png'),
('SP20', 'DEN', '/assets/imgs/product-imgs/qt_den_20_5.png'),
('SP21', 'XANH', '/assets/imgs/product-imgs/qt_xanh_21_1.png'),
('SP21', 'XANH', '/assets/imgs/product-imgs/qt_xanh_21_2.png'),
('SP21', 'XANH', '/assets/imgs/product-imgs/qt_xanh_21_3.png'),
('SP21', 'XANH', '/assets/imgs/product-imgs/qt_xanh_21_4.png'),
('SP21', 'XANH', '/assets/imgs/product-imgs/qt_xanh_21_5.png'),
('SP22', 'XAM', '/assets/imgs/product-imgs/qt_xam_22_1.png'),
('SP22', 'XAM', '/assets/imgs/product-imgs/qt_xam_22_2.png'),
('SP22', 'XAM', '/assets/imgs/product-imgs/qt_xam_22_3.png'),
('SP22', 'XAM', '/assets/imgs/product-imgs/qt_xam_22_4.png'),
('SP23', 'XAM', '/assets/imgs/product-imgs/qt_xam_23_1.png'),
('SP23', 'XAM', '/assets/imgs/product-imgs/qt_xam_23_2.png'),
('SP23', 'XAM', '/assets/imgs/product-imgs/qt_xam_23_3.png'),
('SP23', 'XAM', '/assets/imgs/product-imgs/qt_xam_23_4.png'),
('SP24', 'XAM', '/assets/imgs/product-imgs/qt_xam_24_1.png'),
('SP24', 'XAM', '/assets/imgs/product-imgs/qt_xam_24_2.png'),
('SP24', 'XAM', '/assets/imgs/product-imgs/qt_xam_24_3.png'),
('SP24', 'XAM', '/assets/imgs/product-imgs/qt_xam_24_4.png'),
('SP24', 'XAM', '/assets/imgs/product-imgs/qt_xam_24_5.png'),
('SP25', 'DEN', '/assets/imgs/product-imgs/qt_den_25_1.png'),
('SP25', 'DEN', '/assets/imgs/product-imgs/qt_den_25_2.png'),
('SP25', 'DEN', '/assets/imgs/product-imgs/qt_den_25_3.png'),
('SP25', 'DEN', '/assets/imgs/product-imgs/qt_den_25_4.png'),
('SP25', 'DEN', '/assets/imgs/product-imgs/qt_den_25_5.png'),
('SP25', 'XAM', '/assets/imgs/product-imgs/qt_xam_25_1.png'),
('SP25', 'XAM', '/assets/imgs/product-imgs/qt_xam_25_2.png'),
('SP25', 'XAM', '/assets/imgs/product-imgs/qt_xam_25_3.png'),
('SP25', 'XAM', '/assets/imgs/product-imgs/qt_xam_25_4.png'),
('SP25', 'XAM', '/assets/imgs/product-imgs/qt_xam_25_5.png'),
('SP26', 'DEN', '/assets/imgs/product-imgs/qt_den_26_1.png'),
('SP26', 'DEN', '/assets/imgs/product-imgs/qt_den_26_2.png'),
('SP26', 'DEN', '/assets/imgs/product-imgs/qt_den_26_3.png'),
('SP26', 'DEN', '/assets/imgs/product-imgs/qt_den_26_4.png'),
('SP26', 'DEN', '/assets/imgs/product-imgs/qt_den_26_5.png'),
('SP26', 'XAM', '/assets/imgs/product-imgs/qt_xam_26_1.png'),
('SP26', 'XAM', '/assets/imgs/product-imgs/qt_xam_26_2.png'),
('SP26', 'XAM', '/assets/imgs/product-imgs/qt_xam_26_3.png'),
('SP26', 'XAM', '/assets/imgs/product-imgs/qt_xam_26_4.png'),
('SP26', 'XAM', '/assets/imgs/product-imgs/qt_xam_26_5.png'),
('SP27', 'XAM', '/assets/imgs/product-imgs/qt_xam_27_1.png'),
('SP27', 'XAM', '/assets/imgs/product-imgs/qt_xam_27_2.png'),
('SP27', 'XAM', '/assets/imgs/product-imgs/qt_xam_27_3.png'),
('SP27', 'XAM', '/assets/imgs/product-imgs/qt_xam_27_4.png'),
('SP27', 'XAM', '/assets/imgs/product-imgs/qt_xam_27_5.png'),
('SP28', 'DEN', '/assets/imgs/product-imgs/qt_den_28_1.png'),
('SP28', 'DEN', '/assets/imgs/product-imgs/qt_den_28_2.png'),
('SP28', 'DEN', '/assets/imgs/product-imgs/qt_den_28_3.png'),
('SP28', 'DEN', '/assets/imgs/product-imgs/qt_den_28_4.png'),
('SP28', 'DEN', '/assets/imgs/product-imgs/qt_den_28_5.png'),
('SP28', 'XANH', '/assets/imgs/product-imgs/qt_xanh_28_1.png'),
('SP28', 'XANH', '/assets/imgs/product-imgs/qt_xanh_28_2.png'),
('SP28', 'XANH', '/assets/imgs/product-imgs/qt_xanh_28_3.png'),
('SP28', 'XANH', '/assets/imgs/product-imgs/qt_xanh_28_4.png'),
('SP28', 'XANH', '/assets/imgs/product-imgs/qt_xanh_28_5.png'),
('SP29', 'DEN', '/assets/imgs/product-imgs/qt_den_29_1.png'),
('SP29', 'DEN', '/assets/imgs/product-imgs/qt_den_29_2.png'),
('SP29', 'DEN', '/assets/imgs/product-imgs/qt_den_29_3.png'),
('SP29', 'DEN', '/assets/imgs/product-imgs/qt_den_29_4.png'),
('SP29', 'DEN', '/assets/imgs/product-imgs/qt_den_29_5.png'),
('SP29', 'XANH', '/assets/imgs/product-imgs/qt_xanh_29_1.png'),
('SP29', 'XANH', '/assets/imgs/product-imgs/qt_xanh_29_2.png'),
('SP29', 'XANH', '/assets/imgs/product-imgs/qt_xanh_29_3.png'),
('SP29', 'XANH', '/assets/imgs/product-imgs/qt_xanh_29_4.png'),
('SP29', 'XANH', '/assets/imgs/product-imgs/qt_xanh_29_5.png'),
('SP3', 'BO', '/assets/imgs/product-imgs/ak_bo_3_1.png'),
('SP3', 'BO', '/assets/imgs/product-imgs/ak_bo_3_2.png'),
('SP3', 'BO', '/assets/imgs/product-imgs/ak_bo_3_3.png'),
('SP3', 'BO', '/assets/imgs/product-imgs/ak_bo_3_4.jpg'),
('SP3', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_3_1.png'),
('SP3', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_3_2.png'),
('SP3', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_3_3.png'),
('SP3', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_3_4.png'),
('SP3', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_3_5.png'),
('SP3', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_3_6.jpg'),
('SP30', 'DEN', '/assets/imgs/product-imgs/qt_den_30_1.png'),
('SP30', 'DEN', '/assets/imgs/product-imgs/qt_den_30_2.png'),
('SP30', 'DEN', '/assets/imgs/product-imgs/qt_den_30_3.png'),
('SP30', 'DEN', '/assets/imgs/product-imgs/qt_den_30_4.png'),
('SP30', 'DEN', '/assets/imgs/product-imgs/qt_den_30_5.png'),
('SP30', 'XAM', '/assets/imgs/product-imgs/qt_xam_30_1.png'),
('SP30', 'XAM', '/assets/imgs/product-imgs/qt_xam_30_2.png'),
('SP30', 'XAM', '/assets/imgs/product-imgs/qt_xam_30_3.png'),
('SP30', 'XAM', '/assets/imgs/product-imgs/qt_xam_30_4.png'),
('SP30', 'XAM', '/assets/imgs/product-imgs/qt_xam_30_5.png'),
('SP31', 'DEN', '/assets/imgs/product-imgs/qt_den_31_1.png'),
('SP31', 'DEN', '/assets/imgs/product-imgs/qt_den_31_2.png'),
('SP31', 'DEN', '/assets/imgs/product-imgs/qt_den_31_3.png'),
('SP31', 'DEN', '/assets/imgs/product-imgs/qt_den_31_4.png'),
('SP31', 'DEN', '/assets/imgs/product-imgs/qt_den_31_5.png'),
('SP32', 'DEN', '/assets/imgs/product-imgs/qt_den_32_1.png'),
('SP32', 'DEN', '/assets/imgs/product-imgs/qt_den_32_2.png'),
('SP32', 'DEN', '/assets/imgs/product-imgs/qt_den_32_3.png'),
('SP32', 'DEN', '/assets/imgs/product-imgs/qt_den_32_4.png'),
('SP32', 'DEN', '/assets/imgs/product-imgs/qt_den_32_5.png'),
('SP33', 'DEN', '/assets/imgs/product-imgs/qt_den_33_1.png'),
('SP33', 'DEN', '/assets/imgs/product-imgs/qt_den_33_2.png'),
('SP33', 'DEN', '/assets/imgs/product-imgs/qt_den_33_3.png'),
('SP33', 'DEN', '/assets/imgs/product-imgs/qt_den_33_4.png'),
('SP33', 'DEN', '/assets/imgs/product-imgs/qt_den_33_5.png'),
('SP34', 'DEN', '/assets/imgs/product-imgs/qt_den_34_1.png'),
('SP34', 'DEN', '/assets/imgs/product-imgs/qt_den_34_2.png'),
('SP34', 'DEN', '/assets/imgs/product-imgs/qt_den_34_3.png'),
('SP34', 'DEN', '/assets/imgs/product-imgs/qt_den_34_4.png'),
('SP34', 'DEN', '/assets/imgs/product-imgs/qt_den_34_5.png'),
('SP34', 'XAM', '/assets/imgs/product-imgs/qt_xam_34_1.png'),
('SP34', 'XAM', '/assets/imgs/product-imgs/qt_xam_34_2.png'),
('SP34', 'XAM', '/assets/imgs/product-imgs/qt_xam_34_3.png'),
('SP34', 'XAM', '/assets/imgs/product-imgs/qt_xam_34_4.png'),
('SP34', 'XAM', '/assets/imgs/product-imgs/qt_xam_34_5.png'),
('SP35', 'DEN', '/assets/imgs/product-imgs/qt_den_35_1.png'),
('SP35', 'DEN', '/assets/imgs/product-imgs/qt_den_35_2.png'),
('SP35', 'DEN', '/assets/imgs/product-imgs/qt_den_35_3.png'),
('SP35', 'DEN', '/assets/imgs/product-imgs/qt_den_35_4.png'),
('SP35', 'DEN', '/assets/imgs/product-imgs/qt_den_35_5.png'),
('SP35', 'XAM', '/assets/imgs/product-imgs/qt_xam_35_1.png'),
('SP35', 'XAM', '/assets/imgs/product-imgs/qt_xam_35_2.png'),
('SP35', 'XAM', '/assets/imgs/product-imgs/qt_xam_35_3.png'),
('SP35', 'XAM', '/assets/imgs/product-imgs/qt_xam_35_4.png'),
('SP35', 'XAM', '/assets/imgs/product-imgs/qt_xam_35_5.png'),
('SP36', 'XAM', '/assets/imgs/product-imgs/qt_xam_36_1.png'),
('SP36', 'XAM', '/assets/imgs/product-imgs/qt_xam_36_2.png'),
('SP36', 'XAM', '/assets/imgs/product-imgs/qt_xam_36_3.png'),
('SP36', 'XAM', '/assets/imgs/product-imgs/qt_xam_36_4.png'),
('SP36', 'XAM', '/assets/imgs/product-imgs/qt_xam_36_5.png'),
('SP37', 'DEN', '/assets/imgs/product-imgs/qt_den_37_1.png'),
('SP37', 'DEN', '/assets/imgs/product-imgs/qt_den_37_2.png'),
('SP37', 'DEN', '/assets/imgs/product-imgs/qt_den_37_3.png'),
('SP37', 'DEN', '/assets/imgs/product-imgs/qt_den_37_4.png'),
('SP37', 'DEN', '/assets/imgs/product-imgs/qt_den_37_5.png'),
('SP37', 'XAM', '/assets/imgs/product-imgs/qt_xam_37_1.png'),
('SP37', 'XAM', '/assets/imgs/product-imgs/qt_xam_37_2.png'),
('SP37', 'XAM', '/assets/imgs/product-imgs/qt_xam_37_3.png'),
('SP37', 'XAM', '/assets/imgs/product-imgs/qt_xam_37_4.png'),
('SP37', 'XAM', '/assets/imgs/product-imgs/qt_xam_37_5.png'),
('SP38', 'DEN', '/assets/imgs/product-imgs/qt_den_38_1.png'),
('SP38', 'DEN', '/assets/imgs/product-imgs/qt_den_38_2.png'),
('SP38', 'DEN', '/assets/imgs/product-imgs/qt_den_38_3.png'),
('SP38', 'DEN', '/assets/imgs/product-imgs/qt_den_38_4.png'),
('SP38', 'TRANG', '/assets/imgs/product-imgs/qt_trang_38_1.png'),
('SP38', 'TRANG', '/assets/imgs/product-imgs/qt_trang_38_2.png'),
('SP38', 'TRANG', '/assets/imgs/product-imgs/qt_trang_38_3.png'),
('SP38', 'TRANG', '/assets/imgs/product-imgs/qt_trang_38_4.png'),
('SP38', 'TRANG', '/assets/imgs/product-imgs/qt_trang_38_5.png'),
('SP38', 'XANH', '/assets/imgs/product-imgs/qt_xanh_38_1.png'),
('SP38', 'XANH', '/assets/imgs/product-imgs/qt_xanh_38_2.png'),
('SP38', 'XANH', '/assets/imgs/product-imgs/qt_xanh_38_3.png'),
('SP38', 'XANH', '/assets/imgs/product-imgs/qt_xanh_38_4.png'),
('SP38', 'XANH', '/assets/imgs/product-imgs/qt_xanh_38_5.png'),
('SP39', 'DEN', '/assets/imgs/product-imgs/qt_den_39_1.png'),
('SP39', 'DEN', '/assets/imgs/product-imgs/qt_den_39_2.png'),
('SP39', 'DEN', '/assets/imgs/product-imgs/qt_den_39_3.png'),
('SP39', 'DEN', '/assets/imgs/product-imgs/qt_den_39_4.png'),
('SP4', 'DEN', '/assets/imgs/product-imgs/ak_den_4_1.png'),
('SP4', 'DEN', '/assets/imgs/product-imgs/ak_den_4_2.png'),
('SP4', 'DEN', '/assets/imgs/product-imgs/ak_den_4_3.png'),
('SP4', 'XAM', '/assets/imgs/product-imgs/ak_xam_4_1.png'),
('SP4', 'XAM', '/assets/imgs/product-imgs/ak_xam_4_2.png'),
('SP4', 'XAM', '/assets/imgs/product-imgs/ak_xam_4_3.png'),
('SP4', 'XAM', '/assets/imgs/product-imgs/ak_xam_4_4.png'),
('SP40', 'DEN', '/assets/imgs/product-imgs/qt_den_40_1.png'),
('SP40', 'DEN', '/assets/imgs/product-imgs/qt_den_40_2.png'),
('SP40', 'DEN', '/assets/imgs/product-imgs/qt_den_40_3.png'),
('SP40', 'DEN', '/assets/imgs/product-imgs/qt_den_40_4.png'),
('SP40', 'DEN', '/assets/imgs/product-imgs/qt_den_40_5.png'),
('SP41', 'DEN', '/assets/imgs/product-imgs/qt_den_41_1.jpg'),
('SP41', 'DEN', '/assets/imgs/product-imgs/qt_den_41_2.jpg'),
('SP41', 'DEN', '/assets/imgs/product-imgs/qt_den_41_3.jpg'),
('SP41', 'DEN', '/assets/imgs/product-imgs/qt_den_41_4.jpg'),
('SP41', 'DEN', '/assets/imgs/product-imgs/qt_den_41_5.jpg'),
('SP41', 'XAM', '/assets/imgs/product-imgs/qt_xam_41_1.jpg'),
('SP41', 'XAM', '/assets/imgs/product-imgs/qt_xam_41_2.jpg'),
('SP41', 'XAM', '/assets/imgs/product-imgs/qt_xam_41_3.jpg'),
('SP41', 'XAM', '/assets/imgs/product-imgs/qt_xam_41_4.jpg'),
('SP41', 'XAM', '/assets/imgs/product-imgs/qt_xam_41_5.jpg'),
('SP42', 'DEN', '/assets/imgs/product-imgs/qt_den_42_1.jpg'),
('SP42', 'DEN', '/assets/imgs/product-imgs/qt_den_42_2.jpg'),
('SP42', 'DEN', '/assets/imgs/product-imgs/qt_den_42_3.jpg'),
('SP42', 'DEN', '/assets/imgs/product-imgs/qt_den_42_4.jpg'),
('SP42', 'DEN', '/assets/imgs/product-imgs/qt_den_42_5.jpg'),
('SP42', 'XAM', '/assets/imgs/product-imgs/qt_xam_42_1.jpg'),
('SP42', 'XAM', '/assets/imgs/product-imgs/qt_xam_42_2.jpg'),
('SP42', 'XAM', '/assets/imgs/product-imgs/qt_xam_42_3.jpg'),
('SP42', 'XAM', '/assets/imgs/product-imgs/qt_xam_42_4.jpg'),
('SP42', 'XAM', '/assets/imgs/product-imgs/qt_xam_42_5.jpg'),
('SP43', 'DEN', '/assets/imgs/product-imgs/qt_den_43_1.jpg'),
('SP43', 'DEN', '/assets/imgs/product-imgs/qt_den_43_2.jpg'),
('SP43', 'DEN', '/assets/imgs/product-imgs/qt_den_43_3.jpg'),
('SP43', 'DEN', '/assets/imgs/product-imgs/qt_den_43_4.jpg'),
('SP43', 'DEN', '/assets/imgs/product-imgs/qt_den_43_5.jpg'),
('SP43', 'DEN', '/assets/imgs/product-imgs/qt_den_43_6.jpg'),
('SP43', 'XAM', '/assets/imgs/product-imgs/qt_xam_43_1.jpg'),
('SP43', 'XAM', '/assets/imgs/product-imgs/qt_xam_43_2.jpg'),
('SP43', 'XAM', '/assets/imgs/product-imgs/qt_xam_43_3.jpg'),
('SP43', 'XAM', '/assets/imgs/product-imgs/qt_xam_43_4.jpg'),
('SP43', 'XAM', '/assets/imgs/product-imgs/qt_xam_43_5.jpg'),
('SP43', 'XANH', '/assets/imgs/product-imgs/qt_xanh_43_1.jpg'),
('SP43', 'XANH', '/assets/imgs/product-imgs/qt_xanh_43_2.jpg'),
('SP43', 'XANH', '/assets/imgs/product-imgs/qt_xanh_43_3.jpg'),
('SP43', 'XANH', '/assets/imgs/product-imgs/qt_xanh_43_4.jpg'),
('SP43', 'XANH', '/assets/imgs/product-imgs/qt_xanh_43_5.jpg'),
('SP43', 'XANH', '/assets/imgs/product-imgs/qt_xanh_43_6.jpg'),
('SP44', 'DO', '/assets/imgs/product-imgs/qt_do_44_1.jpg'),
('SP44', 'DO', '/assets/imgs/product-imgs/qt_do_44_2.jpg'),
('SP44', 'DO', '/assets/imgs/product-imgs/qt_do_44_3.jpg'),
('SP44', 'DO', '/assets/imgs/product-imgs/qt_do_44_4.jpg'),
('SP45', 'XAM', '/assets/imgs/product-imgs/qt_xam_45_1.jpg'),
('SP45', 'XAM', '/assets/imgs/product-imgs/qt_xam_45_2.jpg'),
('SP45', 'XAM', '/assets/imgs/product-imgs/qt_xam_45_3.jpg'),
('SP45', 'XAM', '/assets/imgs/product-imgs/qt_xam_45_4.jpg'),
('SP45', 'XAM', '/assets/imgs/product-imgs/qt_xam_45_5.jpg'),
('SP46', 'DEN', '/assets/imgs/product-imgs/qt_den_46_1.jpg'),
('SP46', 'DEN', '/assets/imgs/product-imgs/qt_den_46_2.jpg'),
('SP46', 'DEN', '/assets/imgs/product-imgs/qt_den_46_3.jpg'),
('SP46', 'DEN', '/assets/imgs/product-imgs/qt_den_46_4.jpg'),
('SP46', 'DEN', '/assets/imgs/product-imgs/qt_den_46_5.jpg'),
('SP46', 'XANH', '/assets/imgs/product-imgs/qt_xanh_46_1.jpg'),
('SP46', 'XANH', '/assets/imgs/product-imgs/qt_xanh_46_2.jpg'),
('SP46', 'XANH', '/assets/imgs/product-imgs/qt_xanh_46_3.jpg'),
('SP46', 'XANH', '/assets/imgs/product-imgs/qt_xanh_46_4.jpg'),
('SP46', 'XANH', '/assets/imgs/product-imgs/qt_xanh_46_5.jpg'),
('SP47', 'DEN', '/assets/imgs/product-imgs/qt_den_47_1.jpg'),
('SP47', 'DEN', '/assets/imgs/product-imgs/qt_den_47_2.jpg'),
('SP47', 'DEN', '/assets/imgs/product-imgs/qt_den_47_3.jpg'),
('SP47', 'TRANG', '/assets/imgs/product-imgs/qt_trang_47_1.jpg'),
('SP47', 'TRANG', '/assets/imgs/product-imgs/qt_trang_47_2.jpg'),
('SP47', 'TRANG', '/assets/imgs/product-imgs/qt_trang_47_3.jpg'),
('SP47', 'TRANG', '/assets/imgs/product-imgs/qt_trang_47_4.jpg'),
('SP48', 'XAM', '/assets/imgs/product-imgs/qt_xam_48_1.jpg'),
('SP48', 'XAM', '/assets/imgs/product-imgs/qt_xam_48_2.jpg'),
('SP49', 'DEN', '/assets/imgs/product-imgs/qt_den_49_1.jpg'),
('SP49', 'DEN', '/assets/imgs/product-imgs/qt_den_49_2.jpg'),
('SP49', 'DO', '/assets/imgs/product-imgs/qt_do_49_1.jpg'),
('SP49', 'DO', '/assets/imgs/product-imgs/qt_do_49_2.jpg'),
('SP49', 'DO', '/assets/imgs/product-imgs/qt_do_49_3.jpg'),
('SP5', 'DEN', '/assets/imgs/product-imgs/ak_den_5_1.png'),
('SP5', 'DEN', '/assets/imgs/product-imgs/ak_den_5_2.png'),
('SP5', 'DEN', '/assets/imgs/product-imgs/ak_den_5_3.png'),
('SP5', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_5_1.png'),
('SP5', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_5_2.png'),
('SP5', 'XANH_REU', '/assets/imgs/product-imgs/ak_reu_5_3.png'),
('SP50', 'DEN', '/assets/imgs/product-imgs/qt_den_50_1.jpg'),
('SP50', 'DEN', '/assets/imgs/product-imgs/qt_den_50_2.jpg'),
('SP50', 'DEN', '/assets/imgs/product-imgs/qt_den_50_3.jpg'),
('SP50', 'XANH', '/assets/imgs/product-imgs/qt_xanh_50_1.jpg'),
('SP50', 'XANH', '/assets/imgs/product-imgs/qt_xanh_50_2.jpg'),
('SP50', 'XANH', '/assets/imgs/product-imgs/qt_xanh_50_3.jpg'),
('SP6', 'BE', '/assets/imgs/product-imgs/ak_be_6_1.jpg'),
('SP6', 'BE', '/assets/imgs/product-imgs/ak_be_6_2.jpg'),
('SP6', 'BE', '/assets/imgs/product-imgs/ak_be_6_3.jpg'),
('SP6', 'BE', '/assets/imgs/product-imgs/ak_be_6_4.jpg'),
('SP6', 'BE', '/assets/imgs/product-imgs/ak_be_6_5.jpg'),
('SP6', 'DEN', '/assets/imgs/product-imgs/ak_den_6_1.jpg'),
('SP6', 'DEN', '/assets/imgs/product-imgs/ak_den_6_2.jpg'),
('SP6', 'DEN', '/assets/imgs/product-imgs/ak_den_6_3.jpg'),
('SP6', 'DEN', '/assets/imgs/product-imgs/ak_den_6_4.jpg'),
('SP6', 'DEN', '/assets/imgs/product-imgs/ak_den_6_5.jpg'),
('SP6', 'XANH', '/assets/imgs/product-imgs/ak_xanh_6_1.jpg'),
('SP6', 'XANH', '/assets/imgs/product-imgs/ak_xanh_6_2.jpg'),
('SP6', 'XANH', '/assets/imgs/product-imgs/ak_xanh_6_3.jpg'),
('SP6', 'XANH', '/assets/imgs/product-imgs/ak_xanh_6_4.jpg'),
('SP6', 'XANH', '/assets/imgs/product-imgs/ak_xanh_6_5.jpg'),
('SP7', 'BO', '/assets/imgs/product-imgs/ak_bo_7_1.png'),
('SP7', 'BO', '/assets/imgs/product-imgs/ak_bo_7_2.png'),
('SP7', 'BO', '/assets/imgs/product-imgs/ak_bo_7_3.png'),
('SP7', 'BO', '/assets/imgs/product-imgs/ak_bo_7_4.png'),
('SP7', 'BO', '/assets/imgs/product-imgs/ak_bo_7_5.png'),
('SP7', 'DEN', '/assets/imgs/product-imgs/ak_den_7_1.png'),
('SP7', 'DEN', '/assets/imgs/product-imgs/ak_den_7_2.png'),
('SP7', 'DEN', '/assets/imgs/product-imgs/ak_den_7_3.png'),
('SP7', 'DEN', '/assets/imgs/product-imgs/ak_den_7_4.png'),
('SP7', 'XAM', '/assets/imgs/product-imgs/ak_xam_7_1.png'),
('SP7', 'XAM', '/assets/imgs/product-imgs/ak_xam_7_2.png'),
('SP7', 'XAM', '/assets/imgs/product-imgs/ak_xam_7_3.png'),
('SP7', 'XAM', '/assets/imgs/product-imgs/ak_xam_7_4.png'),
('SP8', 'DEN', '/assets/imgs/product-imgs/ak_den_8_1.png'),
('SP8', 'DEN', '/assets/imgs/product-imgs/ak_den_8_2.png'),
('SP8', 'DEN', '/assets/imgs/product-imgs/ak_den_8_3.jpg'),
('SP8', 'DEN', '/assets/imgs/product-imgs/ak_den_8_4.png'),
('SP8', 'DEN', '/assets/imgs/product-imgs/ak_den_8_5.png'),
('SP8', 'NAU', '/assets/imgs/product-imgs/ak_nau_8_1.png'),
('SP8', 'NAU', '/assets/imgs/product-imgs/ak_nau_8_2.png'),
('SP8', 'NAU', '/assets/imgs/product-imgs/ak_nau_8_3.jpg'),
('SP8', 'NAU', '/assets/imgs/product-imgs/ak_nau_8_4.png'),
('SP8', 'NAU', '/assets/imgs/product-imgs/ak_nau_8_5.png'),
('SP8', 'TRANG', '/assets/imgs/product-imgs/ak_trang_8_1.png'),
('SP8', 'TRANG', '/assets/imgs/product-imgs/ak_trang_8_2.png'),
('SP8', 'TRANG', '/assets/imgs/product-imgs/ak_trang_8_3.png'),
('SP8', 'TRANG', '/assets/imgs/product-imgs/ak_trang_8_4.png'),
('SP8', 'XAM', '/assets/imgs/product-imgs/ak_xam_8_1.png'),
('SP8', 'XAM', '/assets/imgs/product-imgs/ak_xam_8_2.png'),
('SP8', 'XAM', '/assets/imgs/product-imgs/ak_xam_8_3.jpg'),
('SP8', 'XAM', '/assets/imgs/product-imgs/ak_xam_8_4.png'),
('SP8', 'XAM', '/assets/imgs/product-imgs/ak_xam_8_5.png'),
('SP9', 'NAU', '/assets/imgs/product-imgs/ak_nau_9_1.jpg'),
('SP9', 'NAU', '/assets/imgs/product-imgs/ak_nau_9_2.jpg'),
('SP9', 'NAU', '/assets/imgs/product-imgs/ak_nau_9_3.jpg'),
('SP9', 'NAU', '/assets/imgs/product-imgs/ak_nau_9_4.jpg'),
('SP9', 'NAU', '/assets/imgs/product-imgs/ak_nau_9_5.jpg'),
('SP9', 'XAM', '/assets/imgs/product-imgs/ak_xam_9_1.jpg'),
('SP9', 'XAM', '/assets/imgs/product-imgs/ak_xam_9_2.jpg'),
('SP9', 'XAM', '/assets/imgs/product-imgs/ak_xam_9_3.jpg'),
('SP9', 'XAM', '/assets/imgs/product-imgs/ak_xam_9_4.jpg'),
('SP9', 'XAM', '/assets/imgs/product-imgs/ak_xam_9_5.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MA_HOA_DON` int(11) NOT NULL,
  `MA_TK` int(11) NOT NULL,
  `DIA_CHI_GH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `NGUOI_NHAN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NGAY_THEM` datetime NOT NULL DEFAULT current_timestamp(),
  `THANH_TIEN` double NOT NULL,
  `TRANG_THAI` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kichthuoc`
--

CREATE TABLE `kichthuoc` (
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MA_CT_KICH_THUOC` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `kichthuoc`
--

INSERT INTO `kichthuoc` (`MA_SP`, `MA_CT_KICH_THUOC`) VALUES
('SP1', 'L'),
('SP1', 'M'),
('SP1', 'S'),
('SP1', 'XL'),
('SP10', 'L'),
('SP10', 'M'),
('SP10', 'S'),
('SP10', 'XL'),
('SP11', 'L'),
('SP11', 'M'),
('SP11', 'S'),
('SP11', 'XL'),
('SP12', 'L'),
('SP12', 'M'),
('SP12', 'S'),
('SP12', 'XL'),
('SP13', 'L'),
('SP13', 'M'),
('SP13', 'S'),
('SP13', 'XL'),
('SP14', 'L'),
('SP14', 'M'),
('SP14', 'S'),
('SP14', 'XL'),
('SP15', 'L'),
('SP15', 'M'),
('SP15', 'S'),
('SP15', 'XL'),
('SP16', 'L'),
('SP16', 'M'),
('SP16', 'S'),
('SP16', 'XL'),
('SP17', 'L'),
('SP17', 'M'),
('SP17', 'S'),
('SP17', 'XL'),
('SP18', 'L'),
('SP18', 'M'),
('SP18', 'S'),
('SP18', 'XL'),
('SP19', 'L'),
('SP19', 'M'),
('SP19', 'S'),
('SP19', 'XL'),
('SP2', 'L'),
('SP2', 'M'),
('SP2', 'S'),
('SP2', 'XL'),
('SP20', 'L'),
('SP20', 'M'),
('SP20', 'S'),
('SP20', 'XL'),
('SP21', 'L'),
('SP21', 'M'),
('SP21', 'S'),
('SP21', 'XL'),
('SP22', 'L'),
('SP22', 'M'),
('SP22', 'S'),
('SP22', 'XL'),
('SP23', 'L'),
('SP23', 'M'),
('SP23', 'S'),
('SP23', 'XL'),
('SP24', 'L'),
('SP24', 'M'),
('SP24', 'S'),
('SP24', 'XL'),
('SP25', 'L'),
('SP25', 'M'),
('SP25', 'S'),
('SP25', 'XL'),
('SP26', 'L'),
('SP26', 'M'),
('SP26', 'S'),
('SP26', 'XL'),
('SP27', 'L'),
('SP27', 'M'),
('SP27', 'S'),
('SP27', 'XL'),
('SP28', 'L'),
('SP28', 'M'),
('SP28', 'S'),
('SP28', 'XL'),
('SP29', 'L'),
('SP29', 'M'),
('SP29', 'S'),
('SP29', 'XL'),
('SP3', 'L'),
('SP3', 'M'),
('SP3', 'S'),
('SP3', 'XL'),
('SP30', 'L'),
('SP30', 'M'),
('SP30', 'S'),
('SP30', 'XL'),
('SP31', 'L'),
('SP31', 'M'),
('SP31', 'S'),
('SP31', 'XL'),
('SP32', 'L'),
('SP32', 'M'),
('SP32', 'S'),
('SP32', 'XL'),
('SP33', 'L'),
('SP33', 'M'),
('SP33', 'S'),
('SP33', 'XL'),
('SP34', 'L'),
('SP34', 'M'),
('SP34', 'S'),
('SP34', 'XL'),
('SP35', 'L'),
('SP35', 'M'),
('SP35', 'S'),
('SP35', 'XL'),
('SP36', 'L'),
('SP36', 'M'),
('SP36', 'S'),
('SP36', 'XL'),
('SP37', 'L'),
('SP37', 'M'),
('SP37', 'S'),
('SP37', 'XL'),
('SP38', 'L'),
('SP38', 'M'),
('SP38', 'S'),
('SP38', 'XL'),
('SP39', 'L'),
('SP39', 'M'),
('SP39', 'S'),
('SP39', 'XL'),
('SP4', 'L'),
('SP4', 'M'),
('SP4', 'S'),
('SP4', 'XL'),
('SP40', 'L'),
('SP40', 'M'),
('SP40', 'S'),
('SP40', 'XL'),
('SP41', 'L'),
('SP41', 'M'),
('SP41', 'S'),
('SP41', 'XL'),
('SP42', 'L'),
('SP42', 'M'),
('SP42', 'S'),
('SP42', 'XL'),
('SP43', 'L'),
('SP43', 'M'),
('SP43', 'S'),
('SP43', 'XL'),
('SP44', 'L'),
('SP44', 'M'),
('SP44', 'S'),
('SP44', 'XL'),
('SP45', 'L'),
('SP45', 'M'),
('SP45', 'S'),
('SP45', 'XL'),
('SP46', 'L'),
('SP46', 'M'),
('SP46', 'S'),
('SP46', 'XL'),
('SP47', 'L'),
('SP47', 'M'),
('SP47', 'S'),
('SP47', 'XL'),
('SP48', 'L'),
('SP48', 'M'),
('SP48', 'S'),
('SP48', 'XL'),
('SP49', 'L'),
('SP49', 'M'),
('SP49', 'S'),
('SP49', 'XL'),
('SP5', 'L'),
('SP5', 'M'),
('SP5', 'S'),
('SP5', 'XL'),
('SP50', 'L'),
('SP50', 'M'),
('SP50', 'S'),
('SP50', 'XL'),
('SP6', 'L'),
('SP6', 'M'),
('SP6', 'S'),
('SP6', 'XL'),
('SP7', 'L'),
('SP7', 'M'),
('SP7', 'S'),
('SP7', 'XL'),
('SP8', 'L'),
('SP8', 'M'),
('SP8', 'S'),
('SP8', 'XL'),
('SP9', 'L'),
('SP9', 'M'),
('SP9', 'S'),
('SP9', 'XL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mau`
--

CREATE TABLE `mau` (
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MA_CT_MAU` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mau`
--

INSERT INTO `mau` (`MA_SP`, `MA_CT_MAU`) VALUES
('SP1', 'DEN'),
('SP1', 'DO'),
('SP1', 'TRANG'),
('SP10', 'BO'),
('SP10', 'DEN'),
('SP10', 'XAM'),
('SP11', 'DEN'),
('SP11', 'XANH'),
('SP12', 'DEN'),
('SP12', 'XANH'),
('SP13', 'TRANG'),
('SP13', 'XANH'),
('SP14', 'DEN'),
('SP14', 'XANH_REU'),
('SP15', 'DEN'),
('SP16', 'BO'),
('SP16', 'DEN'),
('SP17', 'DEN'),
('SP17', 'XAM'),
('SP17', 'XANH'),
('SP18', 'DEN'),
('SP18', 'NAU'),
('SP19', 'DEN'),
('SP19', 'NAU'),
('SP2', 'DEN'),
('SP2', 'XAM'),
('SP2', 'XANH_REU'),
('SP20', 'DEN'),
('SP21', 'XANH'),
('SP22', 'XAM'),
('SP23', 'XAM'),
('SP24', 'XAM'),
('SP25', 'DEN'),
('SP25', 'XAM'),
('SP26', 'DEN'),
('SP26', 'XAM'),
('SP27', 'XAM'),
('SP28', 'DEN'),
('SP28', 'XANH'),
('SP29', 'DEN'),
('SP29', 'XANH'),
('SP3', 'BO'),
('SP3', 'XANH_REU'),
('SP30', 'DEN'),
('SP30', 'XAM'),
('SP31', 'DEN'),
('SP32', 'DEN'),
('SP33', 'DEN'),
('SP34', 'DEN'),
('SP34', 'XAM'),
('SP35', 'DEN'),
('SP35', 'XAM'),
('SP36', 'XAM'),
('SP37', 'DEN'),
('SP37', 'XAM'),
('SP38', 'DEN'),
('SP38', 'TRANG'),
('SP38', 'XANH'),
('SP39', 'DEN'),
('SP4', 'DEN'),
('SP4', 'XAM'),
('SP40', 'DEN'),
('SP41', 'DEN'),
('SP41', 'XAM'),
('SP42', 'DEN'),
('SP42', 'XAM'),
('SP43', 'DEN'),
('SP43', 'XAM'),
('SP43', 'XANH'),
('SP44', 'DO'),
('SP45', 'XAM'),
('SP46', 'DEN'),
('SP46', 'XANH'),
('SP47', 'DEN'),
('SP47', 'TRANG'),
('SP48', 'XAM'),
('SP49', 'DEN'),
('SP49', 'DO'),
('SP5', 'DEN'),
('SP5', 'XANH_REU'),
('SP50', 'DEN'),
('SP50', 'XANH'),
('SP6', 'BE'),
('SP6', 'DEN'),
('SP6', 'XANH_REU'),
('SP7', 'BO'),
('SP7', 'DEN'),
('SP7', 'XAM'),
('SP8', 'DEN'),
('SP8', 'NAU'),
('SP8', 'TRANG'),
('SP8', 'XAM'),
('SP9', 'NAU'),
('SP9', 'XAM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanhieu`
--

CREATE TABLE `nhanhieu` (
  `MA_NHAN_HIEU` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TEN_NHAN_HIEU` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NGAY_CAP_NHAT` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanhieu`
--

INSERT INTO `nhanhieu` (`MA_NHAN_HIEU`, `TEN_NHAN_HIEU`, `NGAY_CAP_NHAT`) VALUES
('NH1', 'NIKE', '2022-12-13 23:45:35'),
('NH2', 'FAKE', '2022-12-13 23:45:35'),
('NH3', 'LOCAL BRAND', '2022-12-13 23:45:36'),
('NH4', 'GUCCI', '2022-12-13 23:45:36'),
('NH5', 'LV', '2022-12-13 23:45:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieunhap`
--

CREATE TABLE `phieunhap` (
  `MA_PHIEU_NHAP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `NGUOI_NHAP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGAY_NHAP` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quenmatkhau`
--

CREATE TABLE `quenmatkhau` (
  `MA_DINH_DANH` int(11) NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NGAY_LAY_LAI` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TEN_SP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MA_NHAN_HIEU` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `GIA` double NOT NULL,
  `MO_TA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `HINH_NHO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGUOI_THEM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGAY_THEM` datetime DEFAULT current_timestamp(),
  `TONG_DANH_GIA` int(11) DEFAULT 0,
  `TONG_SAO` int(11) DEFAULT 0,
  `SO_LUONG` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MA_SP`, `TEN_SP`, `MA_NHAN_HIEU`, `GIA`, `MO_TA`, `HINH_NHO`, `NGUOI_THEM`, `NGAY_THEM`, `TONG_DANH_GIA`, `TONG_SAO`, `SO_LUONG`) VALUES
('SP1', 'ÁO KHOÁT DÙ TRƠN MÀU ĐEN AKO20', 'NH3', 315000, NULL, '/assets/imgs/product-imgs/ak_den_1_1.jpg', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP10', 'ÁO HOODIE SPORTS ELEGANT AK011', 'NH1', 315000, NULL, '/assets/imgs/product-imgs/ak_bo_10_1.jpg', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP11', 'ÁO KHOÁT DÙ TAY PHỐI TÚI AK008', 'NH2', 345000, NULL, '/assets/imgs/product-imgs/ak_den_11_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP12', 'ÁO KHOÁT DÙ TÚI HỘP AK009', 'NH2', 345000, NULL, '/assets/imgs/product-imgs/ak_den_12_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP13', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK007', 'NH2', 445000, NULL, '/assets/imgs/product-imgs/ak_trang_13_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP14', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK001', 'NH2', 545000, NULL, '/assets/imgs/product-imgs/ak_den_14_1.jpg', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP15', 'ÁO KHOÁT KAKI AK266', 'NH2', 445000, NULL, '/assets/imgs/product-imgs/ak_den_15_1.jpg', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP16', 'ÁO KHOÁT MANGTO DẠ AK267', 'NH4', 1750000, NULL, '/assets/imgs/product-imgs/ak_bo_16_1.jpg', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP17', 'ÁO KHOÁT JEAN AK263', 'NH4', 515000, NULL, '/assets/imgs/product-imgs/ak_den_17_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP18', 'QUẦN T Y TRƠN QT024', 'NH4', 425000, NULL, '/assets/imgs/product-imgs/qt_den_18_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP19', 'QUẦN T Y TRƠN REGULAR QT026', 'NH4', 425000, NULL, '/assets/imgs/product-imgs/qt_den_19_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP2', 'ÁO KHOÁT DÙ TRƠN NÓN RỜI AK019', 'NH3', 345000, NULL, '/assets/imgs/product-imgs/ak_den_2_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP20', 'QUẦN T Y PHỐI SỌC QT023', 'NH4', 385000, NULL, '/assets/imgs/product-imgs/qt_den_20_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP21', 'QUẦN T Y NAZAFU QT006', 'NH5', 475000, NULL, '/assets/imgs/product-imgs/qt_xanh_21_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP22', 'QUẦN T Y NAZAFU QT005', 'NH5', 475000, NULL, '/assets/imgs/product-imgs/qt_xam_22_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP23', 'QUẦN T Y NAZAFU QT003', 'NH5', 475000, NULL, '/assets/imgs/product-imgs/qt_xam_23_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP24', 'QUẦN T Y CĂN BẢN FORM SLIMFIT QT020', 'NH5', 345000, NULL, '/assets/imgs/product-imgs/qt_xam_24_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP25', 'QUẦN T Y TÚI SAU PHỐI D Y DỆT QT022', 'NH5', 445000, NULL, '/assets/imgs/product-imgs/qt_den_25_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP26', 'QUẦN T Y CĂN BẢN FORM SLIMFIT QT021', 'NH1', 445000, NULL, '/assets/imgs/product-imgs/qt_den_26_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP27', 'QUẦN T Y CĂN BẢN FORM SLIMFIT QT019', 'NH1', 345000, NULL, '/assets/imgs/product-imgs/qt_xam_27_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP28', 'QUẦN T Y CĂN BẢN FORM SLIMFIT QT018', 'NH1', 345000, NULL, '/assets/imgs/product-imgs/qt_den_28_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP29', 'QUẦN T Y TÚI SAU PHỐI D Y DỆT QT017', 'NH1', 345000, NULL, '/assets/imgs/product-imgs/qt_den_29_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP3', 'ÁO KHOÁT KAKI BASIC AK018', 'NH3', 545000, NULL, '/assets/imgs/product-imgs/ak_bo_3_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP30', 'QUẦN T Y LƯNG SAU PHỐI D Y DỆT QT016', 'NH1', 345000, NULL, '/assets/imgs/product-imgs/qt_den_30_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP31', 'QUẦN T Y CĂN BẢN FORM SLIMFIT QT015', 'NH2', 425000, NULL, '/assets/imgs/product-imgs/qt_den_31_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP32', 'QUẦN T Y PHỐI D Y DỆT QT014', 'NH2', 425000, NULL, '/assets/imgs/product-imgs/qt_den_32_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP33', 'QUẦN T Y PHỐI D Y DỆT QT013', 'NH2', 425000, NULL, '/assets/imgs/product-imgs/qt_den_33_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP34', 'QUẦN T Y CĂN BẢN FORM SLIMFIT QT012', 'NH2', 425000, NULL, '/assets/imgs/product-imgs/qt_den_34_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP35', 'QUẦN T Y CĂN BẢN FORM SLIMFIT QT011', 'NH2', 425000, NULL, '/assets/imgs/product-imgs/qt_den_35_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP36', 'QUẦN T Y KẺ CARO FORM SLIMFIT QT010', 'NH3', 425000, NULL, '/assets/imgs/product-imgs/qt_xam_36_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP37', 'QUẦN T Y XẾP LY FORM SLIMFIT QT007', 'NH3', 385000, NULL, '/assets/imgs/product-imgs/qt_den_37_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP38', 'QUẦN T Y LINEN LƯNG THUN QT008', 'NH3', 375000, NULL, '/assets/imgs/product-imgs/qt_den_38_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP39', 'QUẦN T Y LINEN FORM LOOSE-CROPPED QT002', 'NH3', 385000, NULL, '/assets/imgs/product-imgs/qt_den_39_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP4', 'ÁO KHOÁT NẸP BẤM NÚT AK010', 'NH3', 445000, NULL, '/assets/imgs/product-imgs/ak_den_4_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP40', 'QUẦN T Y GẮN NHÃN QT001', 'NH3', 385000, NULL, '/assets/imgs/product-imgs/qt_den_40_1.png', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP41', 'QUẦN T Y FORM REGULAR QT155', 'NH4', 385000, NULL, '/assets/imgs/product-imgs/qt_den_41_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP42', 'QUẦN T Y FORM REGULAR QT154', 'NH4', 385000, NULL, '/assets/imgs/product-imgs/qt_den_42_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP43', 'QUẦN T Y SỌC SLIM-CROPPED LAI LƠ VÊ QT153', 'NH4', 385000, NULL, '/assets/imgs/product-imgs/qt_den_43_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP44', 'QUẦN T Y ĐỎ ĐÔ QT110', 'NH4', 385000, NULL, '/assets/imgs/product-imgs/qt_do_44_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP45', 'QUẦN T Y XÁM CHUỘT ĐẬM QT141', 'NH4', 385000, NULL, '/assets/imgs/product-imgs/qt_xam_45_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP46', 'QUẦN T Y NAZAFU XANH ĐEN QT1128', 'NH5', 545000, NULL, '/assets/imgs/product-imgs/qt_den_46_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP47', 'QUẦN T Y NAZAFU SỌC TRẮNG KEM QT1123', 'NH5', 545000, NULL, '/assets/imgs/product-imgs/qt_den_47_1.jpg', NULL, '2022-12-13 23:45:37', 0, 0, 0),
('SP48', 'QUẦN T Y XÁM QT1120', 'NH5', 395000, NULL, '/assets/imgs/product-imgs/qt_xam_48_1.jpg', NULL, '2022-12-13 23:45:38', 0, 0, 0),
('SP49', 'QUẦN T Y NAZAFU ĐỎ ĐÔ QT1113', 'NH5', 545000, NULL, '/assets/imgs/product-imgs/qt_den_49_1.jpg', NULL, '2022-12-13 23:45:38', 0, 0, 0),
('SP5', 'ÁO KHOÁT NỈ TRƠN AK013', 'NH3', 395000, NULL, '/assets/imgs/product-imgs/ak_den_5_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP50', 'QUẦN T Y NAZAFU ĐEN QT1109', 'NH5', 525000, NULL, '/assets/imgs/product-imgs/qt_den_50_1.jpg', NULL, '2022-12-13 23:45:38', 0, 0, 0),
('SP6', 'ÁO HOODIE BELIEVE AK012', 'NH1', 395000, NULL, '/assets/imgs/product-imgs/ak_be_6_1.jpg', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP7', 'ÁO KHOÁT KAKI TÚI ĐẮP AK017', 'NH1', 545000, NULL, '/assets/imgs/product-imgs/ak_bo_7_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP8', 'ÁO KHOÁT DA LỘN LIMITED AK016', 'NH1', 645000, NULL, '/assets/imgs/product-imgs/ak_den_8_1.png', NULL, '2022-12-13 23:45:36', 0, 0, 0),
('SP9', 'ÁO KHOÁT DA LỘN AK015', 'NH1', 395000, NULL, '/assets/imgs/product-imgs/ak_nau_9_1.jpg', NULL, '2022-12-13 23:45:36', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MA_TK` int(11) NOT NULL,
  `HO` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIA_CHI` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEN_TK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MAT_KHAU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NGAY_DK` datetime NOT NULL DEFAULT current_timestamp(),
  `MA_VAI_TRO` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VT2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MA_TK`, `HO`, `TEN`, `SDT`, `EMAIL`, `DIA_CHI`, `TEN_TK`, `MAT_KHAU`, `NGAY_DK`, `MA_VAI_TRO`) VALUES
(1, 'Luong Huu', 'Luan', '1215943200', 'admin1@gmail.com', NULL, 'admin1', 'e00cf25ad42683b3df678c61f42c6bda', '2022-12-13 23:45:36', 'VT1'),
(2, 'Nguyen Duy', 'Long', '1325943200', 'admin2@gmail.com', NULL, 'admin2', 'c84258e9c39059a89ab77d846ddab909', '2022-12-13 23:45:36', 'VT1'),
(3, 'Nguyen Cong', 'Phuc', '3455943200', 'admin3@gmail.com', NULL, 'admin3', '32cacb2f994f6b42183a1300d9a3e8d6', '2022-12-13 23:45:36', 'VT1'),
(4, 'Nguyen Van', 'A', '1826384619', 'khachhang1@gmail.com', 'tp hcm', 'khachhang1', '32cacb2f994f6b42183a1300d9a3e8d6', '2022-12-13 23:45:36', 'VT2');

--
-- Bẫy `taikhoan`
--
DELIMITER $$
CREATE TRIGGER `TAO_GIO_CHO_TK` AFTER INSERT ON `taikhoan` FOR EACH ROW INSERT INTO GIO(MA_TK) VALUES(NEW.MA_TK)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `the`
--

CREATE TABLE `the` (
  `MA_SP` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MA_CT_THE` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `the`
--

INSERT INTO `the` (`MA_SP`, `MA_CT_THE`) VALUES
('SP1', 'AOKHOAT'),
('SP10', 'AOKHOAT'),
('SP11', 'AOKHOAT'),
('SP12', 'AOKHOAT'),
('SP13', 'AOKHOAT'),
('SP14', 'AOKHOAT'),
('SP15', 'AOKHOAT'),
('SP16', 'AOKHOAT'),
('SP17', 'AOKHOAT'),
('SP18', 'QUANTAY'),
('SP19', 'QUANTAY'),
('SP2', 'AOKHOAT'),
('SP20', 'QUANTAY'),
('SP21', 'QUANTAY'),
('SP22', 'QUANTAY'),
('SP23', 'QUANTAY'),
('SP24', 'QUANTAY'),
('SP25', 'QUANTAY'),
('SP26', 'QUANTAY'),
('SP27', 'QUANTAY'),
('SP28', 'QUANTAY'),
('SP29', 'QUANTAY'),
('SP3', 'AOKHOAT'),
('SP30', 'QUANTAY'),
('SP31', 'QUANTAY'),
('SP32', 'QUANTAY'),
('SP33', 'QUANTAY'),
('SP34', 'QUANTAY'),
('SP35', 'QUANTAY'),
('SP36', 'QUANTAY'),
('SP37', 'QUANTAY'),
('SP38', 'QUANTAY'),
('SP39', 'QUANTAY'),
('SP4', 'AOKHOAT'),
('SP40', 'QUANTAY'),
('SP41', 'QUANTAY'),
('SP42', 'QUANTAY'),
('SP43', 'QUANTAY'),
('SP44', 'QUANTAY'),
('SP45', 'QUANTAY'),
('SP46', 'QUANTAY'),
('SP47', 'QUANTAY'),
('SP48', 'QUANTAY'),
('SP49', 'QUANTAY'),
('SP5', 'AOKHOAT'),
('SP50', 'QUANTAY'),
('SP6', 'AOKHOAT'),
('SP7', 'AOKHOAT'),
('SP8', 'AOKHOAT'),
('SP9', 'AOKHOAT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaitro`
--

CREATE TABLE `vaitro` (
  `MA_VAI_TRO` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TEN_VAI_TRO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NGAY_THEM` datetime NOT NULL DEFAULT current_timestamp(),
  `NGAY_CAP_NHAT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vaitro`
--

INSERT INTO `vaitro` (`MA_VAI_TRO`, `TEN_VAI_TRO`, `NGAY_THEM`, `NGAY_CAP_NHAT`) VALUES
('VT1', 'ADMIN', '2022-12-13 23:45:36', NULL),
('VT2', 'USER', '2022-12-13 23:45:36', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdanhgia`
--
ALTER TABLE `chitietdanhgia`
  ADD PRIMARY KEY (`MA_CT_DANH_GIA`);

--
-- Chỉ mục cho bảng `chitietgio`
--
ALTER TABLE `chitietgio`
  ADD UNIQUE KEY `UK_CTGIO` (`MA_GIO`,`MA_SP`),
  ADD KEY `FK_CTGIO_SP` (`MA_SP`);

--
-- Chỉ mục cho bảng `chitietkichthuoc`
--
ALTER TABLE `chitietkichthuoc`
  ADD PRIMARY KEY (`MA_CT_KICH_THUOC`);

--
-- Chỉ mục cho bảng `chitietmau`
--
ALTER TABLE `chitietmau`
  ADD PRIMARY KEY (`MA_CT_MAU`);

--
-- Chỉ mục cho bảng `chitietthe`
--
ALTER TABLE `chitietthe`
  ADD PRIMARY KEY (`MA_CT_THE`);

--
-- Chỉ mục cho bảng `cthd`
--
ALTER TABLE `cthd`
  ADD UNIQUE KEY `UK_CTHD` (`MA_HOA_DON`,`MA_SP`),
  ADD KEY `FK_CTHD_SP` (`MA_SP`);

--
-- Chỉ mục cho bảng `ctphieunhap`
--
ALTER TABLE `ctphieunhap`
  ADD PRIMARY KEY (`MA_PHIEU_NHAP`),
  ADD KEY `FK_CTPN_SP` (`MA_SP`);

--
-- Chỉ mục cho bảng `dangky`
--
ALTER TABLE `dangky`
  ADD PRIMARY KEY (`MA_DK`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD UNIQUE KEY `UK_DANHGIA` (`MA_SP`,`MA_TK`,`MA_CT_DANH_GIA`),
  ADD KEY `FK_DANHGIA_TK` (`MA_TK`),
  ADD KEY `FK_DANHGIA_CTDANHGIA` (`MA_CT_DANH_GIA`);

--
-- Chỉ mục cho bảng `gio`
--
ALTER TABLE `gio`
  ADD PRIMARY KEY (`MA_GIO`),
  ADD KEY `FK_GIO_TK` (`MA_TK`);

--
-- Chỉ mục cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD UNIQUE KEY `UK_HINHANH` (`MA_SP`,`MA_CT_MAU`,`DUONG_DAN_ANH`),
  ADD KEY `FK_HINHANH_CTMAU` (`MA_CT_MAU`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MA_HOA_DON`),
  ADD KEY `FK_HOADON_TK` (`MA_TK`);

--
-- Chỉ mục cho bảng `kichthuoc`
--
ALTER TABLE `kichthuoc`
  ADD UNIQUE KEY `UK_KICHTHUOC` (`MA_SP`,`MA_CT_KICH_THUOC`),
  ADD KEY `FK_KT_CTKICHTHUOC` (`MA_CT_KICH_THUOC`);

--
-- Chỉ mục cho bảng `mau`
--
ALTER TABLE `mau`
  ADD UNIQUE KEY `UK_MAU` (`MA_SP`,`MA_CT_MAU`),
  ADD KEY `FK_MAU_CTMAU` (`MA_CT_MAU`);

--
-- Chỉ mục cho bảng `nhanhieu`
--
ALTER TABLE `nhanhieu`
  ADD PRIMARY KEY (`MA_NHAN_HIEU`);

--
-- Chỉ mục cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`MA_PHIEU_NHAP`);

--
-- Chỉ mục cho bảng `quenmatkhau`
--
ALTER TABLE `quenmatkhau`
  ADD PRIMARY KEY (`MA_DINH_DANH`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MA_SP`),
  ADD KEY `FK_SP_NHANHIEU` (`MA_NHAN_HIEU`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MA_TK`),
  ADD KEY `FK_TK_VAITRO` (`MA_VAI_TRO`);

--
-- Chỉ mục cho bảng `the`
--
ALTER TABLE `the`
  ADD UNIQUE KEY `UK_THE` (`MA_SP`,`MA_CT_THE`),
  ADD KEY `FK_THE_CTTHE` (`MA_CT_THE`);

--
-- Chỉ mục cho bảng `vaitro`
--
ALTER TABLE `vaitro`
  ADD PRIMARY KEY (`MA_VAI_TRO`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitietdanhgia`
--
ALTER TABLE `chitietdanhgia`
  MODIFY `MA_CT_DANH_GIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dangky`
--
ALTER TABLE `dangky`
  MODIFY `MA_DK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gio`
--
ALTER TABLE `gio`
  MODIFY `MA_GIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MA_HOA_DON` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `quenmatkhau`
--
ALTER TABLE `quenmatkhau`
  MODIFY `MA_DINH_DANH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MA_TK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietgio`
--
ALTER TABLE `chitietgio`
  ADD CONSTRAINT `FK_CTGIO_GIO` FOREIGN KEY (`MA_GIO`) REFERENCES `gio` (`MA_GIO`),
  ADD CONSTRAINT `FK_CTGIO_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`);

--
-- Các ràng buộc cho bảng `cthd`
--
ALTER TABLE `cthd`
  ADD CONSTRAINT `FK_CTHD_HD` FOREIGN KEY (`MA_HOA_DON`) REFERENCES `hoadon` (`MA_HOA_DON`),
  ADD CONSTRAINT `FK_CTHD_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`);

--
-- Các ràng buộc cho bảng `ctphieunhap`
--
ALTER TABLE `ctphieunhap`
  ADD CONSTRAINT `FK_CTPN_PN` FOREIGN KEY (`MA_PHIEU_NHAP`) REFERENCES `phieunhap` (`MA_PHIEU_NHAP`),
  ADD CONSTRAINT `FK_CTPN_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `FK_DANHGIA_CTDANHGIA` FOREIGN KEY (`MA_CT_DANH_GIA`) REFERENCES `chitietdanhgia` (`MA_CT_DANH_GIA`),
  ADD CONSTRAINT `FK_DANHGIA_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`),
  ADD CONSTRAINT `FK_DANHGIA_TK` FOREIGN KEY (`MA_TK`) REFERENCES `taikhoan` (`MA_TK`);

--
-- Các ràng buộc cho bảng `gio`
--
ALTER TABLE `gio`
  ADD CONSTRAINT `FK_GIO_TK` FOREIGN KEY (`MA_TK`) REFERENCES `taikhoan` (`MA_TK`);

--
-- Các ràng buộc cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD CONSTRAINT `FK_HINHANH_CTMAU` FOREIGN KEY (`MA_CT_MAU`) REFERENCES `chitietmau` (`MA_CT_MAU`),
  ADD CONSTRAINT `FK_HINHANH_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `FK_HOADON_TK` FOREIGN KEY (`MA_TK`) REFERENCES `taikhoan` (`MA_TK`);

--
-- Các ràng buộc cho bảng `kichthuoc`
--
ALTER TABLE `kichthuoc`
  ADD CONSTRAINT `FK_KT_CTKICHTHUOC` FOREIGN KEY (`MA_CT_KICH_THUOC`) REFERENCES `chitietkichthuoc` (`MA_CT_KICH_THUOC`),
  ADD CONSTRAINT `FK_KT_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`);

--
-- Các ràng buộc cho bảng `mau`
--
ALTER TABLE `mau`
  ADD CONSTRAINT `FK_MAU_CTMAU` FOREIGN KEY (`MA_CT_MAU`) REFERENCES `chitietmau` (`MA_CT_MAU`),
  ADD CONSTRAINT `FK_MAU_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SP_NHANHIEU` FOREIGN KEY (`MA_NHAN_HIEU`) REFERENCES `nhanhieu` (`MA_NHAN_HIEU`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `FK_TK_VAITRO` FOREIGN KEY (`MA_VAI_TRO`) REFERENCES `vaitro` (`MA_VAI_TRO`);

--
-- Các ràng buộc cho bảng `the`
--
ALTER TABLE `the`
  ADD CONSTRAINT `FK_THE_CTTHE` FOREIGN KEY (`MA_CT_THE`) REFERENCES `chitietthe` (`MA_CT_THE`),
  ADD CONSTRAINT `FK_THE_SP` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
