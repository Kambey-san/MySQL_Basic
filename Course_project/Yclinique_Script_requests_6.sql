USE yclinique;

/* Выбрать пациентов женщин */
SELECT pat_name, pat_gender FROM patients WHERE pat_gender IN ('F'); #простая фильтрация

/* Средний возраст пациентов */
SELECT AVG(TIMESTAMPDIFF(YEAR, pat_birthday, NOW())) AS age FROM patients; #итоговые функции

/* Выбрать пациентов женщин и показать их средний возраст*/
SELECT AVG(TIMESTAMPDIFF(YEAR, pat_birthday, NOW())) AS age FROM patients WHERE pat_gender IN ('F'); #фильтр + f()
/* Выбрать пациентов мужчин и показать их средний возраст*/
SELECT AVG(TIMESTAMPDIFF(YEAR, pat_birthday, NOW())) AS age FROM patients WHERE pat_gender IN ('M');

/* Показать услуги средней ценовой категории */
SELECT serv_name, serv_price FROM price WHERE serv_price BETWEEN 100 AND 1000; #фильтрация

/* Показать складские запасы наборов(сетов) медзделий*/
SELECT stock_name, presently_quantity FROM stock WHERE stock_name LIKE '%set'; #фильтрация+метаданные

/* Средний рейтинг, например, хирурга по отзывам пациентов */
SELECT AVG (points) AS avg_rating FROM rating WHERE manr_id = 2; #итоговые функции

/* Количество назначенных биопсий */
SELECT COUNT(*) AS biopsi_ms FROM messages WHERE ms_body LIKE '%iops%'; #фильтрация+метаданные

/* Количество услуг на 1 сотрудника */
SELECT managers_id_serv, COUNT(*) AS num_servs  #группы
FROM price
GROUP BY managers_id_serv;

/* Список пациентов, получивших хирургическую помощь */ #вложенный запрос
SELECT DISTINCT pat_id, pat_name
FROM patients
WHERE pat_id IN (SELECT pat_id_inf
                 FROM pat_info
                 WHERE type_id = 2);

/* Список пациентов, получивших услугу семейного доктора */ #JOIN		
SELECT DISTINCT pat_id, pat_name
FROM patients
JOIN pat_info ON pat_id = pat_id_inf
WHERE type_id = 3;
