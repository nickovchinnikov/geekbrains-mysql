CREATE DATABASE IF NOT EXISTS db1;
USE db1;
CREATE TABLE IF NOT EXISTS tab1 (field_1 INT, field_2 INT);
INSERT INTO tab1 (field_1, field_2) VALUES (5, 4);
INSERT INTO tab1 (field_1, field_2) VALUES (2, 8);
LOCK TABLE tab1 READ;
INSERT INTO tab1 (field_1, field_2) VALUES (3, 7);