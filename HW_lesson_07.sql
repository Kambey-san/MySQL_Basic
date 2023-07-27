/*Урок 7. Сложные запросы*/

-- 1.Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. 

select distinct user_id from orders;

SELECT
	id, name, birthday_at
FROM
	users
WHERE
	id IN (SELECT DISTINCT user_id FROM orders);  


-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.     

SELECT
	id,
	name,
	price,
	(SELECT name FROM catalogs WHERE id = products.catalog_id) AS catalogs
FROM
	products;

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

CREATE DATABASE IF NOT EXISTS flights_cities;

USE flights_cities;

DROP TABLE IF EXISTS flights;
CREATE TABLE IF NOT EXISTS flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(255) COMMENT 'Город отправления',
	`to` VARCHAR(255) COMMENT 'Город прибытия'
) COMMENT = 'Рейсы';

INSERT INTO flights (`from`, `to`) VALUES
	('moscow', 'omsk'),
	('nowgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');
	
DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities (
	id SERIAL PRIMARY KEY,
	label VARCHAR(255) COMMENT 'Код города',
	name VARCHAR(255) COMMENT 'Название города'
) COMMENT = 'Словарь городов';

INSERT INTO cities (label, name) VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('nowgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
	
SELECT
	id,
	(SELECT name FROM cities WHERE label = flights.from) AS `from`,
	(SELECT name FROM cities WHERE label = flights.to) AS `to`
FROM
	flights;
