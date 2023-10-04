CREATE DATABASE `carve`;

USE `carve`;

CREATE TABLE `role` (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255)
);

CREATE TABLE `users` (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(255),
`password` VARCHAR(255),
`email` VARCHAR(255)
);

CREATE TABLE `user_role` (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`role_id` BIGINT,
`user_id` BIGINT,
FOREIGN KEY (`role_id`) REFERENCES `role`(id),
FOREIGN KEY (`user_id`) REFERENCES `users`(id)
);

CREATE TABLE `level`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255)
);

CREATE TABLE `detail`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`description` VARCHAR(255),
`img` VARCHAR(255),
`sound` TEXT,
`video` TEXT
);

CREATE TABLE `set`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255),
`price` DOUBLE
);

CREATE TABLE `flash_card`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`set_id` BIGINT,
`level_id` BIGINT,
`front_side` BIGINT,
`back_side` BIGINT,
FOREIGN KEY (`set_id`) REFERENCES `set`(id),
FOREIGN KEY (`level_id`) REFERENCES `level`(id),
FOREIGN KEY (`front_side`) REFERENCES `detail`(id),
FOREIGN KEY (`back_side`) REFERENCES `detail`(id)
);

CREATE TABLE `user_set`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`user_id` BIGINT,
`set_id` BIGINT,
FOREIGN KEY (`user_id`) REFERENCES `users`(id),
FOREIGN KEY (`set_id`) REFERENCES `set`(id)
);

CREATE TABLE `cart`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`user_id` BIGINT,
FOREIGN KEY (`user_id`) REFERENCES `users`(id)
);

CREATE TABLE `cart_item`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`set_id` BIGINT,
`cart_id` BIGINT,
`set_price` DOUBLE,
FOREIGN KEY (`set_id`) REFERENCES `set`(id),
FOREIGN KEY (`cart_id`) REFERENCES `cart`(id)
);

CREATE TABLE `order`(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
`cart_id` BIGINT,
`total_price` DOUBLE,
FOREIGN KEY (`cart_id`) REFERENCES `cart`(id)
);





