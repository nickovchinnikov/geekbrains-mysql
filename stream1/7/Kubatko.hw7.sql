/**
 * Created by skubatko on 15/09/17.
 */

/**
 * на решение задач 1-3 затрачено
 * 04:10 ÷ 05:40 = 1,5 часа
 */

/**
 * Задача 1. У Вас есть социальная сеть, где пользователи (id, имя)
 * могут ставить друг другу лайки.
 * Создайте необходимые таблицы для хранения данной информации.
 * Создайте запрос, который выведет информацию:
 * ● ид пользователя;
 * ● имя;
 * ● лайков получено;
 * ● лайков поставлено;
 * ● взаимные лайки.
 */
DROP DATABASE IF EXISTS social_network;
CREATE DATABASE social_network;
USE social_network;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id        INT           NOT NULL,
  nickname  VARCHAR(45)   NOT NULL,
  UNIQUE KEY (nickname),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id        INT   NOT NULL,
  from_id   INT   NOT NULL,
  to_id     INT   NOT NULL,
  UNIQUE KEY (from_id, to_id),
  FOREIGN KEY (from_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (to_id)   REFERENCES users (id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

SELECT  u.*,
        COUNT(l.from_id)  `получено`,
        COUNT(l.to_id)    `поставлено`,
        COUNT(
          SELECT il.id
            FROM likes il
            WHERE il.from_id = il.to_id
        )
  FROM likes l
  LEFT JOIN users u ON l.from_id = u.id
  LEFT JOIN u ON l.to_id = u.id
  GROUP BY u.id;

# Расширенное ДЗ
SELECT u.nickname FROM users u
  LEFT JOIN likes l ON u.id = l.from_id
  LEFT JOIN likes l2 ON u.id = l2.to_id
  WHERE u.id = 1;

SELECT u.nickname, u2.nickname FROM users u
  LEFT JOIN likes l ON u.id = l.from_id
  LEFT JOIN (
    SELECT l.to_id, u.nickname FROM users as u
      LEFT JOIN likes l ON u.id = l.from_id
  ) AS u2
    ON l.from_id = u2.to_id
  WHERE u.id = 1;


/**
 * Задача 2. Для структуры из задачи 1 выведите список всех пользователей,
 * которые поставили лайк пользователям A и B (id задайте произвольно),
 * но при этом не поставили лайк пользователю C.
 */

SET userA_id = 1;
SET userB_id = 2;
SET userC_id = 3;

SELECT u.*
  FROM likes l
  LEFT JOIN users u ON l.from_id = u.id
  LEFT JOIN u ON l.to_id = u.id
  WHERE to_id =  userA_id
    AND to_id =  userB_id
    AND to_id <> userC_id
  GROUP BY u.id
;

/**
 * Задача 3. Добавим сущности «Фотография» и «Комментарии к фотографии».
 * Нужно создать функционал для Пользователей, который позволяет
 * ставить лайки не только пользователям, но и фото или комментариям к фото.
 * Учитывайте следующие ограничения:
 * ● пользователь не может дважды лайкнуть одну и ту же сущность;
 * ● пользователь имеет право отозвать лайк;
 * ● необходимо иметь возможность считать число полученных сущностью лайков и выводить
 * список пользователей, поставивших лайки;
 * ● в будущем могут появиться новые виды сущностей, которые можно лайкать.
 */

DROP TABLE IF EXISTS pictures;
CREATE TABLE pictures (
  id        INT   NOT NULL,
  user_id   INT   NOT NULL,
  KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS pic_comments;
CREATE TABLE pic_comments (
  id      INT   NOT NULL,
  pic_id  INT   NOT NULL,
  KEY (pic_id),
  FOREIGN KEY (pic_id) REFERENCES pictures (id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS likes_pic;
CREATE TABLE likes_pic (
  id      INT   NOT NULL,
  pic_id  INT   NOT NULL,
  UNIQUE KEY (pic_id),
  FOREIGN KEY (pic_id) REFERENCES pictures (id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS likes_pic_comment;
CREATE TABLE likes_pic_comment (
  id              INT   NOT NULL,
  pic_comments_id INT   NOT NULL,
  UNIQUE KEY (pic_comments_id),
  FOREIGN KEY (pic_comments_id) REFERENCES pic_comments (id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

SELECT COUNT (*)
  FROM likes_pic lp
  LEFT JOIN pictures p
    ON p.id = lp.pic_id
  GROUP BY p.id
;

SELECT COUNT (*)
  FROM likes_pic_comment lpc
  LEFT JOIN pic_comments pc
    ON pc.id = lpc.pic_comments_id
  GROUP BY pc.id
;

SELECT u.*
  FROM likes_pic lp
  LEFT JOIN pictures p
    ON p.id = lp.pic_id
  LEFT JOIN users u
    ON u.id = p.user_id
  GROUP BY u.id
;

SELECT u.*
  FROM likes_pic_comment lpc
  LEFT JOIN pic_comments pc
    ON pc.id = lpc.pic_comments_id
  LEFT JOIN pictures p
    ON p.id = pc.pic_id
  LEFT JOIN users u
    ON u.id = p.user_id
  GROUP BY u.id
;

/**
 * Домашнее задание 7
 */

/**
 * 1. Создать нового пользователя и задать ему права доступа на базу данных “страны и города мира”.
 */

USE geodata;

CREATE USER `user_test`@`localhost` IDENTIFIED BY `12345`;
GRANT ALL PRIVILIGIES ON *.* TO `user_test`@`localhost`;
FLUSH PRIVILIGIES;

/**
 *
 * 2. Сделать резервную копию базы, удалить базу и пересоздать из бекапа.
 */

-- вариант 1
mysqldump -uroot employees | gzip > dump.sql.gz
mysqladmin -uroot drop employees
mysqladmin -uroot create employees
gunzip < dump.sql.gz | mysql -uroot employees

-- вариант 2
mysqldump -uroot employees > dump.sql
mysqladmin -uroot drop employees
mysqladmin -uroot create employees
mysql -uroot employees < dump.sql
