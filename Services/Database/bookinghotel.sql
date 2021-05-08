-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 08, 2021 lúc 06:52 PM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookinghotel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaiphong`
--

CREATE TABLE `loaiphong` (
  `id` int(11) NOT NULL,
  `tenloaiphong` varchar(200) NOT NULL,
  `hinhanhloaiphong` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaiphong`
--

INSERT INTO `loaiphong` (`id`, `tenloaiphong`, `hinhanhloaiphong`) VALUES
(1, 'Phòng Vip', 'https://cf.bstatic.com/images/hotel/max1024x768/224/224952755.jpg'),
(2, 'Phòng Standard', 'https://cdn.huongnghiepaau.com/wp-content/uploads/2018/06/phong-standard.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong`
--

CREATE TABLE `phong` (
  `id` int(11) NOT NULL,
  `tenphong` varchar(200) NOT NULL,
  `giaphong` int(15) NOT NULL,
  `hinhanhphong` varchar(200) NOT NULL,
  `mota` longtext NOT NULL,
  `idphong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phong`
--

INSERT INTO `phong` (`id`, `tenphong`, `giaphong`, `hinhanhphong`, `mota`, `idphong`) VALUES
(1, 'Phòng 101', 250000, 'http://www.biendoihotel.vn/userfiles/anhsanpham/PhongNghi/p2%20(7).jpg', 'Nếu làm việc trong lĩnh vực khách sạn, bạn sẽ thường xuyên bắt gặp những thuật ngữ chỉ các loại phòng như: single, double, twin hay suite, studio… Vậy bạn đã hiểu hết về những loại phòng này chưa?', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `taikhoan` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `birthday`, `address`, `email`, `phone`, `taikhoan`, `password`) VALUES
(1, 'Tran Khanh Duy', '2021-05-13', 'Quang Ngai', 'khanhduyboyka@gmail.com', '0329334542', 'khanhduytran', 'TR6xyh55'),
(13, 'Trần Thị Hạnh Hòa', '2001-04-03', 'Đà Nẵng', 'hhoahi2001@gmail.com', '0774539469', 'hhoahi', 'hhoahi'),
(14, 'Quý trâm', '2021-05-25', 'gia lai', 'quytram@gmail.com', '1234567', 'quytram', '123');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `phong`
--
ALTER TABLE `phong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
