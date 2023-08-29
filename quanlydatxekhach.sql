-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 29, 2023 lúc 06:15 PM
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
(1, 'Hồ Chí Minh - Đà Lạt'),
(2, 'Nha Trang - Hồ Chí Minh'),
(3, 'Hồ Chí Minh - Cần Thơ'),
(4, 'Đắk Lắk - Hồ Chí Minh '),
(5, 'Hồ Chí Minh - Lâm Đồng'),
(10, 'Đà Nẵng - Cần Thơ');

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
  `start_time` time NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `vehicle_image` varchar(100) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `trip`
--

INSERT INTO `trip` (`id`, `trip_name`, `departure_place`, `driver_id`, `price`, `seats`, `start_time`, `vehicle_name`, `vehicle_image`, `route_id`) VALUES
(1, 'Hoàng Hà', 'Hồ Chí Minh', 5, 300000, 46, '20:00:00', 'Xe giường nằm', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/hoangha_diswzu.jpg', 1),
(3, 'Đức Phong', 'Hồ Chí Minh', 6, 165000, 46, '12:00:00', 'Xe giường nằm', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/ducphong_wlfk0n.jpg', 3),
(4, 'Hoàng Tâm', 'Đắk Lắk', 7, 255000, 48, '14:00:00', 'Xe giường nằm Limousine', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/hoangtam_ejkbhu.jpg', 4),
(5, 'Minh Toàn', 'Hồ Chí Minh', 5, 350000, 46, '08:00:00', 'Xe giường nắm Limuosine', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/hoangtam_ejkbhu.jpg', 1),
(6, 'Thành Công', 'Đăk Lăk', 6, 255000, 32, '16:00:00', 'Xe ghế ngồi', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/ducphong_wlfk0n.jpg', 4),
(7, 'Trung Quân ', 'Bến xe Nha Trang', 7, 275000, 32, '18:00:00', 'Xe ghê ngồi', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/ducphong_wlfk0n.jpg', 2),
(13, 'Trung Minh', 'Bến xe Miền Đông', 5, 350000, 5, '20:00:00', '', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1692956256/gau7fjib3gceu7k0cxqa.jpg', 10),
(16, 'Hà Nôi - Cao Bằng', 'Bến xe Hà Nội', 6, 350000, 35, '05:00:00', 'Xe ghế ngồi', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693305016/nyyqua2zedc0ctdvudwq.jpg', 2);

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
  `active` bit(1) NOT NULL DEFAULT b'1',
  `avatar` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `first_name`, `last_name`, `email`, `phone`, `active`, `avatar`, `role_id`) VALUES
(1, 'dangtrungminh', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Minh', 'Đặng', 'dangtrungminh@gmail.com', '0937654561', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 1),
(2, 'tuyetmai', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Mai', 'Nguyễn Thị Tuyết', 'tuyetmai@gmail.com', '0329438809', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu2_ypad1s.jpg', 1),
(3, 'dangluan', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Luân', 'Đặng Công', 'congluan@gmail.com', '0948567231', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 2),
(4, 'nhinguyen', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Nhi', 'Nguyễn Thị Ý', 'nguyenthiynhi@gmail.com', '0937826651', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu2_ypad1s.jpg', 3),
(5, 'trancongthanh', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Thành', 'Trần Công', 'trancongthanh@gmail.com', '0947628876', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam1_liwqst.jpg', 4),
(6, 'leminhnguyen', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Nguyên', 'Lê Minh', 'leminhnguyen@gmail.com', '0328736651', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam2_askxqh.jpg', 4),
(7, 'hohoangnam', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', 'Nam', 'Hồ Hoàng', 'hohoangnam@gmail.com', '0987876112', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nam2_askxqh.jpg', 4),
(8, 'letrinh', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', 'Trinh', 'Lê Thị Tuyết', 'letrinh0904@gmail.com', '0935787710', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1690699273/avatar/nu1_tg88vd.jpg', 2),
(9, 'dangtrunglong', '$2a$10$cuKnGP2moiSP4Nrom86r2e4PJjv75beedjwY86HieT3Bjz1ofagTa', 'long', 'Ddddd', 'dangtrunglong@gmail.com', '123456789', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693318374/rvuc2z9htlzrl8iknbak.jpg', 2),
(10, 'dangtrunglong123', '$2a$10$JBzu69a35lct5acJZORkaOHpg3oxMVkjn9YzCr02xlkZ5anRF29rS', 'Long', 'Đặng Trung', 'dangtrunglong@gmail.com', '0132323323', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693318740/fo13qadzeg4d6fdjm0bz.jpg', 2),
(11, 'dangtrungquang', '$2a$10$vDK35C0kT8GAA9SQX92cteapNvMlUEQ31c1gpxjjAqkLY5XtNqeRq', 'ádadadas', 'dsasads', 'a@gmail.com', '1235455', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693324538/fp9haizxa9lfrkhtpjtr.jpg', 2),
(12, '', '$2a$10$MY/WmyqEFYram3ZKYG8QuOq1RcKa.XAseJtkjr1D79dvp.Zdl7N4y', '', '', '', '', b'1', NULL, 2),
(13, 'dangthiabc', '$2a$10$TJ1xZHdmxD3XsQP167NNgefgWi9Wim2lDxwuRYVNzPV.O/FhbOrm6', 'fasfasfdasd', 'dsfasdfasdf', 'a@gmail.com', '123466788', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693325084/wtjjzu6gllxzxi3whkyf.jpg', 2),
(14, 'dangtrungabcd', '$2a$10$p/Yf144i89d4MUwBL2q/yuFBVKbFe3mQiGpX76/NgKIdeiFUePyRu', 'ádfasfds', 'dấdfasdf', 'dangtrunglong@gmail.com', '13232323', b'1', 'https://res.cloudinary.com/dchkh7d18/image/upload/v1693325190/kbx5iqiwvzk8crufdgez.jpg', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
