-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 30, 2023 lúc 08:47 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlydatxekhach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evaluate`
--

CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `desciption` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `evaluate`
--

INSERT INTO `evaluate` (`id`, `trip_id`, `desciption`) VALUES
(1, 2, 'Rộng rãi, thoáng mát. Không quá nóng. Có nước uống miễn phí, nhà vệ sinh sạch sẽ'),
(2, 4, 'Lần đầu trãi nghiệm dịch vụ xe, tôi rất thích và tôi sẽ chọn nơi đây vào những lần tiếp theo.'),
(3, 3, 'Nhân viên thái độ, ko còn được phục vụ tốt như trước'),
(4, 4, 'Đây là nơi trung chuyển ra xe lớn, đến đây xe trung chuyển sẽ hỗ trợ bạn đoạn đường mà không cần đến người nhà. Nơi đợi có ghế ngồi, yên tĩnh,an toàn, nhân viên niềm nở, thân thiện.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'STAFF'),
(4, 'DRIVER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `route_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `route`
--

INSERT INTO `route` (`id`, `route_name`) VALUES
(1, 'HCM - Đà Lạt'),
(2, 'Nha Trang - HCM'),
(3, 'HCM - Cần Thơ'),
(4, 'Đắk Lắk - HCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `seat_number` int(2) NOT NULL,
  `created_date` datetime NOT NULL,
  `start_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`id`, `user_id`, `trip_id`, `seat_number`, `created_date`, `start_day`) VALUES
(1, 3, 3, 2, '2023-07-28 20:26:47', '2023-07-29'),
(2, 8, 2, 10, '2023-07-28 20:28:46', '2023-07-29'),
(3, 3, 3, 11, '2023-07-29 11:27:15', '2023-07-29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `trip_name` varchar(50) NOT NULL,
  `departure_place` varchar(50) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `seats` int(11) NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `vehicle_image` varchar(100) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `trip`
--

INSERT INTO `trip` (`id`, `trip_name`, `departure_place`, `driver_id`, `price`, `seats`, `vehicle_name`, `vehicle_image`, `route_id`) VALUES
(1, 'Hoàng Hà', 'Hồ Chí Minh', 5, 300000, 46, 'Xe giường nằm', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/hoangha_diswzu.jpg', 1),
(2, 'Phương Trang', 'Nha Trang', 7, 275000, 48, 'Xe giường nằm Limousine', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699274/avatar/phuongtrang_l3rsz9.jpg', 2),
(3, 'Đức Phong', 'Hồ Chí Minh', 6, 165000, 46, 'Xe giường nằm', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/ducphong_wlfk0n.jpg', 3),
(4, 'Hoàng Tâm', 'Đắk Lắk', 7, 255000, 48, 'Xe giường nằm Limousine', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/hoangtam_ejkbhu.jpg', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `active` bit(1) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `first_name`, `last_name`, `email`, `phone`, `active`, `avatar`, `role_id`) VALUES
(1, 'dangtrungminh', 'admin', 'Minh', 'Đặng', 'dangtrungminh@gmail.com', '0937654561', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 1),
(2, 'tuyetmai', 'admin', 'Mai', 'Nguyễn Thị Tuyết', 'tuyetmai@gmail.com', '0329438809', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu2_ypad1s.jpg', 1),
(3, 'dangluan', 'dangluan123', 'Luân', 'Đặng Công', 'congluan@gmail.com', '0948567231', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 2),
(4, 'nhinguyen', 'nhi1762', 'Nhi', 'Nguyễn Thị Ý', 'nguyenthiynhi@gmail.com', '0937826651', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu2_ypad1s.jpg', 3),
(5, 'trancongthanh', 'congthanh', 'Thành', 'Trần Công', 'trancongthanh@gmail.com', '0947628876', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 4),
(6, 'leminhnguyen', 'nguyen123', 'Nguyên', 'Lê Minh', 'leminhnguyen@gmail.com', '0328736651', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam2_askxqh.jpg', 4),
(7, 'hohoangnam', 'namhoang', 'Nam', 'Hồ Hoàng', 'hohoangnam@gmail.com', '0987876112', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam2_askxqh.jpg', 4),
(8, 'letrinh', 'letrinh0904', 'Trinh', 'Lê Thị Tuyết', 'letrinh0904@gmail.com', '0935787710', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu1_tg88vd.jpg', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_EVALUAE_TRIP` (`trip_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_TICKET_USER` (`user_id`),
  ADD KEY `FK_TICKET_TRIP` (`trip_id`);

--
-- Chỉ mục cho bảng `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_TRIP_USER` (`driver_id`),
  ADD KEY `FK_TRIP_ROUTE` (`route_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_USER_ROLE` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  ADD CONSTRAINT `FK_EVALUAE_TRIP` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Các ràng buộc cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_TICKET_TRIP` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  ADD CONSTRAINT `FK_TICKET_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `FK_TRIP_ROUTE` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`),
  ADD CONSTRAINT `FK_TRIP_USER` FOREIGN KEY (`driver_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
