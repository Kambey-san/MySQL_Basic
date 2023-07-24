/* Урок 5. Операторы, фильтрация, сортировка и ограничение.*/


/* Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»*/

/* 1. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august) */

SELECT name, birthday FROM users WHERE DATE_FORMAT(birthday, '%M') IN ('may', 'august');

/* 2. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN 1(5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN. */

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL,
  name VARCHAR(255),
  UNIQUE unique_name(name(10))
);

INSERT INTO catalogs (id, name) VALUES
  (1, 'Процессоры'),
  (2, 'Материнские платы'),
  (5, 'Видеокарты');

SELECT id, name, FIELD(id, 5, 1, 2) AS pos FROM catalogs WHERE id IN (5, 1, 2);
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

/* Практическое задание теме «Агрегация данных»*/

/* 1. Подсчитайте средний возраст пользователей в таблице users. shop*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS age FROM users;

/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

SELECT
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday), DAY(birthday))), '%W') AS day, COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;


