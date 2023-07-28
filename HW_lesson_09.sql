/* Урок 9. Транзакции, переменные, представления. Администрирование. Хранимые процедуры и функции, триггеры */

-- Практическое задание по теме 'Транзакции, переменные, представления'

-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;

SELECT * FROM users WHERE id = 1;

INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;

DELETE FROM users WHERE id = 1; -- Если переместить, то удаляем из 

COMMIT;

-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

CREATE VIEW prod (name, heading)
  AS SELECT name, (SELECT name FROM catalogs WHERE catalogs.id = products.catalog_id)
    FROM products;
        
SELECT * FROM prod;


-- 3. (по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разреженные календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходной таблице и 0, если она отсутствует.

USE different;

CREATE TABLE IF NOT EXISTS posts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	created_at DATE NOT NULL
);

INSERT INTO posts VALUES
	(NULL, 'Первая запись', '2018-08-01'),
	(NULL, 'Вторая запись', '2018-08-04'),
	(NULL, 'Третья запись', '2018-08-16'),
	(NULL, 'Четвертая запись', '2018-08-17');

SELECT * FROM posts;

CREATE TEMPORARY TABLE last_days (
	day INT
);

INSERT INTO last_days VALUES
	(0), (1), (3), (4), (5), (6), (7), (8), (9), (10),
	(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
	(21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT
	DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day
FROM
	last_days AS l
ORDER BY
	day;

SELECT
	DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day,
	NOT ISNULL(p.name) AS order_exist
FROM
	last_days AS l
LEFT JOIN
	posts AS p
ON
	DATE(DATE('2018-08-31') - INTERVAL l.day DAY) = p.created_at
ORDER BY
	day;

-- 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

DROP TABLE IF EXISTS posts;

CREATE TABLE IF NOT EXISTS posts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	created_at DATE NOT NULL
);

INSERT INTO posts VALUES
	(NULL, 'Первая запись', '2018-11-01'),
	(NULL, 'Вторая запись', '2018-11-02'),
	(NULL, 'Третья запись', '2018-11-03'),
	(NULL, 'Четвертая запись', '2018-11-04'),
	(NULL, 'Пятая запись', '2018-11-05'),
	(NULL, 'Шестая запись', '2018-11-06'),
	(NULL, 'Седьмая запись', '2018-11-07'),
	(NULL, 'Восьмая запись', '2018-11-08'),
	(NULL, 'Девятая запись', '2018-11-09'),
	(NULL, 'Десятая запись', '2018-11-10');


SELECT * FROM posts;


START TRANSACTION;


SELECT COUNT(*) FROM posts;

SELECT 10 - 5;

DELETE FROM posts ORDER BY created_at LIMIT 5;

COMMIT;


SELECT * FROM posts;


TRUNCATE posts;

INSERT INTO posts VALUES
	(NULL, 'Первая запись', '2018-11-01'),
	(NULL, 'Вторая запись', '2018-11-02'),
	(NULL, 'Третья запись', '2018-11-03'),
	(NULL, 'Четвертая запись', '2018-11-04'),
	(NULL, 'Пятая запись', '2018-11-05'),
	(NULL, 'Шестая запись', '2018-11-06'),
	(NULL, 'Седьмая запись', '2018-11-07'),
	(NULL, 'Восьмая запись', '2018-11-08'),
	(NULL, 'Девятая запись', '2018-11-09'),
	(NULL, 'Десятая запись', '2018-11-10');


SELECT * FROM posts;


START TRANSACTION;


PREPARE postdel FROM 'DELETE FROM posts ORDER BY created_at LIMIT ?';

SET @total = (SELECT COUNT(*) - 5 FROM posts);

EXECUTE postdel USING @total;

COMMIT;


SELECT * FROM posts;


-- Практическое задание по теме 'Администрирование MySQL'

-- 1.Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.

CREATE USER shop_read;

CREATE USER shop;

GRANT SELECT ON shop.* to shop_read;

GRANT ALL ON shop.* to shop;

-- 2. (по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, имя пользователя и его пароль.Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.

DROP TABLE IF EXISTS accounts2;
CREATE TABLE accounts2 (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45),
	password VARCHAR(45)
);

INSERT INTO accounts2 VALUES
	(NULL, 'bob', '123'),
	(NULL, 'jack', '123'),
	(NULL, 'ron', '123');


CREATE OR REPLACE VIEW username(user_id, user_name) AS 
	SELECT id, name FROM accounts2;

SELECT * FROM accounts2;
SELECT * FROM username;


DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY '123';
GRANT SELECT ON shop_online.username TO 'shop_reader'@'localhost';


SELECT * FROM catalogs;
 -- success
SELECT * FROM username;

-- 3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.

SELECT IF(X=1, Fn_1, Fn_2) F
FROM(
  SELECT @I := @I + @J Fn_1, @J := @I + @J Fn_2
  FROM
    (SELECT 0 dummy UNION ALL SELECT 0 UNION ALL SELECT 0)a,
    (SELECT 0 dummy UNION ALL SELECT 0 UNION ALL SELECT 0)b,
    (SELECT @I := 1, @J := 1)IJ
)T,
  (SELECT 1 X UNION ALL SELECT 2)X LIMIT 1 OFFSET 6;


	
