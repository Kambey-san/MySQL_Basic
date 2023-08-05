USE yclinique;

/* Представление. Расход склада по виду услуг */
DROP VIEW IF EXISTS stock_spending;
CREATE VIEW stock_spending AS
SELECT service_id,
       stock_name,
	   initial_quantity,
	   initial_quantity-presently_quantity AS spending
FROM stock;

-- test:
SELECT *
FROM stock_spending
WHERE service_id = 12

/* Представление. Отношения пациент-специалист */
DROP VIEW IF EXISTS clinic_relations;
CREATE VIEW clinic_relations AS
SELECT `pat_id`, `pat_name`, `pat_gender`, TIMESTAMPDIFF(YEAR, pat_birthday, NOW()) AS age,
       `id`, `last_name`, `position`
FROM `patients`, `managers`, `pat_info`
WHERE `pat_id` = `pat_id_inf`
AND `id` = `type_id`;

-- test:
SELECT * 
FROM clinic_relations
WHERE `id` = 2;

/* Прцедура. Вызов даных онлайн услуг из таблицы маршрутизации */

DROP PROCEDURE IF EXISTS online_visits;
DELIMITER //
CREATE PROCEDURE online_visits()
		SELECT pat_name_rout, manr_id_rout, manr_name_rout, serv_id_rout, data_time_start, data_time_end
		FROM pat_routing WHERE serv_loc_rout = 200; //
		
-- test:
CALL online_visits;




