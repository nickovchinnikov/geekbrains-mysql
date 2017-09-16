/* полные права на созданного пользователя*/
CREATE USER 'user1'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON * . * TO 'user1'@'localhost';
FLUSH PRIVILEGES;

/*права на конкретную базу*/
CREATE USER 'user2'@'localhost' IDENTIFIED BY '123';
GRANT SELECT, UPDATE ON employes. * TO 'user2'@'localhost';
FLUSH PRIVILEGES;
 
/*забрать права*/
REVOKE ALL PRIVILEGES ON * . * TO 'user1'@'localhost';

/*права на конкретную таблицу БД*/
GRANT SELECT,UPDATE,DROP PRIVILEGES ON geodata._cities TO 'user1'@'localhost';
 /*дамп базы */

/* запакованный дамп */
mysqldump --user=root --pqssword=123456 geodata | -gzip9 -c > /home/test/sqldumps/geodata.sql.gz

/*восстановление */
mysql -uroot -p=123456 geodata < /home/test/sqldumps/geodata.sql
/* воссатановлие архива БД*/
gunzip < /home/test/sqldumps/geodata.sql.gz | mysql -uroot -p123456 geodata