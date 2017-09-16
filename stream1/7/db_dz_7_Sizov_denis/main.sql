CREATE USER `cake`@`localhost`
  IDENTIFIED BY `12345`;

GRANT ALL PRIVILEGES
  ON geodata . *
  TO 'cake'@'localhost';

mysqldump -uroot -p12345 employees > dump.sql;
DROP DATABASE employees;
mysql -uroot -p12345 employees < dump.sql;