-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 09, 2023 lúc 03:11 PM
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
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `desciption` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `evaluate`
--

INSERT INTO `evaluate` (`id`, `user_id`, `trip_id`, `desciption`, `created_date`) VALUES
(2, 3, 4, 'Lần đầu trãi nghiệm dịch vụ xe, tôi rất thích và tôi sẽ chọn nơi đây vào những lần tiếp theo.', '2023-09-04 15:50:20'),
(3, 3, 3, 'Nhân viên thái độ, ko còn được phục vụ tốt như trước', '2023-09-04 15:50:20'),
(7, 3, 3, 'tuyệt vời', '2023-09-04 15:50:20'),
(8, 3, 3, 'tuyệt vời', '2023-09-04 15:50:26'),
(9, 3, 3, 'Xe hơi nóng', '2023-09-04 15:52:59'),
(10, 22, 3, 'tài xế nhiệt tình\n', '2023-09-04 22:08:52'),
(11, 22, 5, 'Tài xế nhiệt tình', '2023-09-04 22:36:36'),
(12, 3, 5, 'Xe mát mẻ\n', '2023-09-07 19:49:16'),
(13, 25, 6, 'Xe mới, tài xế nhiệt tình', '2023-09-08 01:16:41');

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
(1, 'Hồ Chí Minh - Đà Lạt'),
(2, 'Nha Trang - Hồ Chí Minh'),
(3, 'Hồ Chí Minh - Cần Thơ'),
(4, 'Đắk Lắk - Hồ Chí Minh '),
(5, 'Hồ Chí Minh - Lâm Đồng');

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
  `start_day` date NOT NULL,
  `ticket_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`id`, `user_id`, `trip_id`, `seat_number`, `created_date`, `start_day`, `ticket_price`) VALUES
(1, 3, 3, 2, '2023-07-28 20:26:47', '2023-07-29', 165000),
(3, 3, 3, 11, '2023-07-29 11:27:15', '2023-07-29', 165000),
(4, 1, 1, 0, '2023-09-07 17:09:03', '2023-09-17', 300000),
(5, 3, 1, 0, '2023-09-07 17:18:26', '2023-09-17', 300000),
(6, 3, 1, 8, '2023-09-07 17:24:42', '2023-09-17', 300000),
(7, 3, 1, 15, '2023-09-07 20:49:12', '2023-09-10', 300000),
(8, 3, 7, 15, '2023-09-07 22:05:27', '2023-09-10', 275000),
(9, 3, 1, 15, '2023-09-07 22:25:49', '2023-09-24', 300000),
(10, 3, 6, 12, '2023-09-07 22:25:49', '2023-09-24', 255000),
(11, 3, 5, 12, '2023-09-07 22:38:52', '2023-09-17', 350000),
(12, 3, 5, 15, '2023-09-07 22:38:52', '2023-09-15', 350000),
(13, 3, 6, 15, '2023-09-07 23:35:10', '2023-09-10', 255000);

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
  `start_time` time NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `vehicle_image` varchar(100) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `trip`
--

INSERT INTO `trip` (`id`, `trip_name`, `departure_place`, `driver_id`, `price`, `seats`, `start_time`, `vehicle_name`, `vehicle_image`, `route_id`) VALUES
(1, 'Hoàng Hà', 'Bến xe miền Đông', 5, 300000, 46, '20:00:00', 'Xe giường nằm', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693779466/m4melxtqtv0betzzg4qa.jpg', 1),
(3, 'Đức Phong', 'Bến xe miền Đông', 6, 165000, 46, '12:00:00', 'Xe giường nằm', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/ducphong_wlfk0n.jpg', 3),
(4, 'Hoàng Tâm', 'Bến xe Đắk Lắk', 7, 255000, 48, '14:00:00', 'Xe giường nằm Limousine', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/hoangtam_ejkbhu.jpg', 4),
(5, 'Minh Toàn', 'Bến xe miền Đông', 5, 350000, 46, '08:00:00', 'Xe giường nằm Limousine', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/hoangtam_ejkbhu.jpg', 1),
(6, 'Thành Công', 'Bến xe Đăk Lăk', 6, 255000, 32, '16:00:00', 'Xe ghế ngồi', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/ducphong_wlfk0n.jpg', 4),
(7, 'Trung Quân ', 'Bến xe Nha Trang', 7, 275000, 32, '18:00:00', 'Xe ghê ngồi', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/ducphong_wlfk0n.jpg', 2),
(17, 'Hồng Nhung', 'Bến xe Nha Trang', 6, 350000, 35, '20:00:00', 'Xe giường nằm', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1694114640/wdeaw7fhtbfds82qgjmt.jpg', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `first_name`, `last_name`, `email`, `phone`, `avatar`, `role_id`) VALUES
(1, 'dangtrungminh', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Minh', 'Đặng', 'dangtrungminh@gmail.com', '0937654561', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 1),
(2, 'tuyetmai', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Mai', 'Nguyễn Thị Tuyết', 'tuyetmai@gmail.com', '0329438809', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu2_ypad1s.jpg', 1),
(3, 'dangluan', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Luân', 'Đặng Công', 'congluan@gmail.com', '0948567231', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 2),
(4, 'nhinguyen', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Nhi', 'Nguyễn Thị Ý', 'nguyenthiynhi@gmail.com', '0937826651', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu2_ypad1s.jpg', 3),
(5, 'trancongthanh', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Thành', 'Trần Công', 'trancongthanh@gmail.com', '0947628876', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 4),
(6, 'leminhnguyen', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Nguyên', 'Lê Minh', 'leminhnguyen@gmail.com', '0328736651', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam2_askxqh.jpg', 4),
(7, 'hohoangnam', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Nam', 'Hồ Hoàng', 'hohoangnam@gmail.com', '0987876112', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam2_askxqh.jpg', 4),
(8, 'abcdeffdsfasdf', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Trinh', 'Lê Thị Tuyết', 'letrinh0904@gmail.com', '0935787710', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu1_tg88vd.jpg', 2),
(22, 'letrungthang', '$2a$10$enDJ/xEvTyj4SJKeiHR1OeNlIYKB0GKy98ZkvWtV9o6eff7gUH4jq', 'Thắng', 'Lê Trung', 'thang@gmail.com', '1234567891', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693833574/bd8jxvqdv0exwl82gmcc.jpg', 2),
(23, 'lenguyentuanh', '$2a$10$.OCaKC4/kg2Sofkrrs7lp.TTlLH5Kxu5OKcRjk5HYgIiYq.wV9F4q', 'Anh', 'Lê Nguyễn Tú', 'tuanh@gmail.com', '0123456789', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1694108075/lpjbwxahtcwmmgmniwhg.jpg', 2),
(24, 'dangtrunglong', '$2a$10$Wf1lbFdqBsTLUItSGXpuveeAiJ2WvB/6yNsVftSLOyoGuC.QiblJ6', 'Tín', 'Đặng Trung ', 'long@gmail.com', '0123456789', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1694109815/stlfvwwj0snfid4fqcxj.jpg', 2),
(25, 'lehuuhung123', '$2a$10$wujV.psFgJqDydap9lk8w.gt6WVqwWRz9/GXjx6d/Zs3crM4xs/va', 'hùng', 'lê hữu ', 'hung@gmail.com', '0123456789', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1694110542/p6x5whjgtz3mpmzks3po.jpg', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_EVALUAE_TRIP` (`trip_id`),
  ADD KEY `FK_EVALUATE_USER` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  ADD CONSTRAINT `FK_EVALUAE_TRIP` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  ADD CONSTRAINT `FK_EVALUATE_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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
