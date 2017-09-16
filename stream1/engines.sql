CREATE DATABASE IF NOT EXISTS `engine_test`;
USE `engine_test`;

CREATE TABLE IF NOT EXISTS `country_heap` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(100) NOT NULL COMMENT 'short country',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC))
ENGINE = HEAP;

INSERT INTO `country_heap` (country_name)
  VALUES
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN');

CREATE TABLE IF NOT EXISTS `country_blackhole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(100) NOT NULL COMMENT 'short country',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC))
ENGINE = BLACKHOLE;

INSERT INTO `country_blackhole` (country_name)
  VALUES
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN'),
  ('USA'), ('RUSSIA'), ('SPAIN'), ('GERMAN');
