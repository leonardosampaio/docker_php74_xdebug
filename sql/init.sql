CREATE DATABASE IF NOT EXISTS `database`;
CONNECT `database`;

CREATE TABLE IF NOT EXISTS `test` (
  `id` INT(11) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE (`id`)
);

CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'test'@'%' WITH GRANT OPTION;