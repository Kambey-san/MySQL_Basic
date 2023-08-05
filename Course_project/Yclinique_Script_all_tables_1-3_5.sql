/* Курсовой проект. База данных частной клиники */
/* БД предполагает использование в работе частной клиники или сети, в т.ч. франшизы. 
Важной сотавляющей является услуга дистанционных консультаций (телемедицина) и он-лайн поддержка пациентов 24/7 */

/* Решаемые задачи:
- Хранение и учет данных пациентов клиники
- Маршрутизация пациентов внутри и вне клиники
- Поддержка пациентов он-лайн, в т.ч. через встроенный мессенжер (хранение персональных данных!)
- Учет работы персонала
- Учет данных об оказанных услугах
- Учет складских запасов лекарственных средств и расходных материалов
 */

DROP DATABASE IF EXISTS yclinique;
CREATE DATABASE yclinique;
USE yclinique;

DROP TABLE IF EXISTS managers;
CREATE TABLE `managers` (
  `id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `position` varchar(50) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  #PRIMARY KEY (`id`,`position`),
  PRIMARY KEY (`id`),
  INDEX last_name_IDX (`last_name`),
  INDEX first_name_IDX (`first_name`),
  INDEX position_IDX (`position`)
) COMMENT='сотрудники';

INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (1,'Marylinda','Richley','F','CEO','(582) 8985620','mrichley0@yclinic.com');
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (2,'Melba','O''Brian','F','surgeon','(419) 8938028','mobrian1@yclinic.com');
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (3,'Dionis','Leehane','F','family_doc','(120) 7355368','dleehane2@yclinic.com');
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (4,'David','Alpes','M','dentist','(112) 5188713','dalpes3@yclinic.com');
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (5,'Nealson','Fried','M','gynecologist','(966) 5997156','nfried4@yclinic.com');	
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (6,'Craig','Puddefoot','M','physio','(634) 8533824','cpuddefoot5@yclinic.com');	
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (7,'Tony','Kirby','M','client_manager_1','(317) 6142091','tkirby6@yclinic.com');
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (8,'Clark','Mirando','M','client_manager_2','(612) 6793836','cmirando7@yclinic.com');
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (9,'Modestia','Mattusov','F','nurse','(687) 1692648','mmattusov8@yclinic.com');
INSERT INTO `managers` (`id`,`first_name`,`last_name`,`gender`,`position`,`phone_number`,`email`) VALUES (10,'Orrin','Liepmann','M','executive_secretary','(792) 9577114','oliepmann9@yclinic.com');
	
	
DROP TABLE IF EXISTS patients;
CREATE TABLE `patients` (
  `pat_id` int NOT NULL,
  `pat_name` varchar(50) DEFAULT NULL,
  `pat_gender` varchar(50) DEFAULT NULL,
  `pat_birthday` varchar(50) DEFAULT NULL,
  `pat_address` varchar(50) DEFAULT NULL,
  `pat_job` varchar(50) DEFAULT NULL,
  `pat_phone` varchar(50) DEFAULT NULL,
  `pat_email` varchar(50) DEFAULT NULL,
  `first_visit_date` DATETIME DEFAULT NULL,
  `primary_diagnosis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pat_id`),
  KEY `patients_pat_name_IDX` (`pat_name`,`pat_birthday`,`primary_diagnosis`) USING BTREE
) COMMENT='пациенты';
	 
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (7183,'Maxie Hackleton','M','1997-10-04','78 Rutledge Plaza','Environmental Specialist','(406) 5124731','mhackleton1@army.mil','2023-02-23 08:19:52','M4855XD');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (6252,'Zollie Kiffe','F','1966-12-01','95308 Larry Avenue','Graphic Designer','(804) 6772112','zkiffe4@nsw.gov.au','2022-11-04 17:48:23','N5082');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (6942,'Uri Itzchaky','F','1996-05-14','10 Rusk Plaza','Geological Engineer','(515) 2606428','uitzchaky5@live.com','2022-12-07 16:21:38','S42215P');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (3328,'Waldemar Beard','F','1971-09-13','580 Petterle Plaza','Pharmacist','(617) 1227311','wbeard8@marketwatch.com','2023-07-08 15:54:39','T370X4S');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (2109,'Robinetta Keddle','F','1971-06-04','018 Mayer Drive','Help Desk Operator','(853) 5746026','rkeddle9@last.fm','2022-09-07 01:18:35','R895');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (1459,'Jamey Arsey','M','1956-08-19','25996 Bultman Road','Staff Scientist','(636) 4752299','jarsey6@wikia.com','2023-06-09 13:09:27','R0683');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (6242,'Herve Guilliland','F','1960-09-09','6530 Mayer Park','VP Accounting','(639) 8731129','hguilliland0@google.com.hk','2022-09-12 01:06:27','M1486');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (9100,'Electra Reglar','F','1955-03-24','92548 Chinook Parkway','Associate Professor','(557) 4516421','ereglar2@quantcast.com','2023-03-01 22:37:39','T8859XS');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (1443,'Tarrah Errol','M','2000-04-23','518 Continental Center','Accounting Assistant III','(898) 6674310','terrol3@webeden.co.uk','2023-05-23 07:30:54','S53412A');
INSERT INTO `patients` (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES (5665,'Cornie Sankey','M','1990-09-06','17996 Green Ridge Terrace','Senior Developer','(893) 9438574','csankey7@ow.ly','2023-04-06 04:10:57','K5506');

	 
DROP TABLE IF EXISTS price;	 
CREATE TABLE `price` (
  `serv_id` int DEFAULT NULL,
  `managers_id_serv` int DEFAULT NULL,
  `serv_name` varchar(50) DEFAULT NULL,
  `serv_price` int DEFAULT NULL,
   CONSTRAINT `serv_1` FOREIGN KEY (`managers_id_serv`) REFERENCES `managers` (`id`),
   INDEX serv_id_IDX(serv_id),
   INDEX price_serv_name_IDX(serv_name),
   INDEX serv_price_IDX(serv_price)

) COMMENT='услуги';

INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (11,3,'examination',200);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (20,10,'clinique_stay_one_day',300);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (12,3,'appointment',50);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (13,9,'manipulation',50);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (14,4,'tooth_removal',100);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (15,4,'tooth_prosthetics',1500);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (16,5,'ultrasound_diagnostics',300);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (17,2,'MI_surgery',2000);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (18,6,'physiotherapy',150);
INSERT INTO `price` (serv_id,managers_id_serv,serv_name,serv_price) VALUES (19,6,'massage',200);
	 

DROP TABLE IF EXISTS status;	 
CREATE TABLE `status` (
  `status_id` int DEFAULT NULL,
  `pat_id_sts` int DEFAULT NULL,
  `status_pat` varchar(50) DEFAULT NULL,
  `data_start` varchar(50) DEFAULT NULL,
  `data_end` varchar(50) DEFAULT NULL,
  CONSTRAINT `status_1` FOREIGN KEY (`pat_id_sts`) REFERENCES `patients` (`pat_id`),
  KEY `status_status_pat_IDX` (`status_pat`) USING BTREE
  
) COMMENT='статус';

INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (112,7183,'not_initiated','2022-07-14','2023-03-11');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (223,6252,'in_progress','2022-07-15','2023-01-17');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (334,6942,'finished','2022-07-23','2023-09-21');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (113,3328,'not_initiated','2022-07-16','2023-04-19');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (224,2109,'in_progress','2022-07-10','2023-12-30');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (335,1459,'finished','2022-07-09','2023-12-25');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (114,6242,'not_initiated','2022-07-05','2023-06-05');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (225,9100,'in_progress','2022-07-06','2023-06-08');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (336,1443,'finished','2022-07-17','2022-09-01');
INSERT INTO `status` (status_id,pat_id_sts,status_pat,data_start,data_end) VALUES (115,5665,'not_initiated','2022-07-19','2022-09-14');
	 
DROP TABLE IF EXISTS serv_location;
CREATE TABLE serv_location(
`loc_id` int DEFAULT NULL,
`pat_location` varchar(50) DEFAULT NULL,
`markup` int DEFAULT NULL,
INDEX pat_location_IDX (pat_location),
INDEX loc_id_IDX (loc_id),
INDEX markup_IDX (markup)

) COMMENT='место';
	 
INSERT INTO `serv_location`	(loc_id,pat_location,markup) VALUES (100,'on_clinic',0);
INSERT INTO `serv_location`	(loc_id,pat_location,markup) VALUES (200,'on_line',0);
INSERT INTO `serv_location`	(loc_id,pat_location,markup) VALUES (300,'at_home',200);


DROP TABLE IF EXISTS pat_routing;
CREATE TABLE `pat_routing`(
`pat_id_rout` int DEFAULT NULL,
`pat_name_rout` varchar(50) DEFAULT NULL,
`manr_id_rout` int DEFAULT NULL,
`manr_name_rout` varchar(50) DEFAULT NULL,
`serv_id_rout` int DEFAULT NULL,
`serv_loc_rout` int DEFAULT NULL,
`data_time_start` DATETIME,
`data_time_end` DATETIME,
INDEX `serv_loc_rout_IDX` (`serv_loc_rout`),
CONSTRAINT `pat_rout_1` FOREIGN KEY (`pat_id_rout`) REFERENCES `patients` (`pat_id`),
CONSTRAINT `pat_name_rout_l` FOREIGN KEY (`pat_name_rout`) REFERENCES `patients` (`pat_name`),
CONSTRAINT `manr_rout_1` FOREIGN KEY (`manr_id_rout`) REFERENCES `managers` (`id`),
CONSTRAINT `serv_rout_1` FOREIGN KEY (`serv_id_rout`) REFERENCES `price` (`serv_id`),
CONSTRAINT `pat_location_k` FOREIGN KEY (`serv_loc_rout`) REFERENCES `serv_location` (`loc_id`)

) COMMENT='маршрутизация';

INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (7183,'Maxie Hackleton', 10,'Liepmann',20,100,'2023-04-19 11:30','2023-04-26 11:00');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (7183,'Maxie Hackleton',3,'Leehane',11,100,'2023-04-20 08:30','2023-04-20 09:00');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (7183,'Maxie Hackleton',2,'Brian',17,100,'2023-04-23 08:30','2023-04-23 10:30');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (7183,'Maxie Hackleton',9,'Mattusov',13,100,'2023-04-23 18:00','2023-04-23 18:30');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (7183,'Maxie Hackleton',9,'Mattusov',13,100,'2023-04-23 18:00','2023-04-24 18:30');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (7183,'Maxie Hackleton',9,'Mattusov',13,100,'2023-04-23 18:00','2023-04-25 18:30');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (7183,'Maxie Hackleton',3,'Leehane',11,200,'2023-04-30 12:00','2023-04-30 12:30');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (6252,'Zollie Kiffe', 4,'Alpes',14,100,'2023-05-04 11:30','2023-05-04 12:00');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (6252,'Zollie Kiffe', 4,'Alpes',15,100,'2023-05-04 12:00','2023-05-04 14:00');	 
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (9100,'Electra Reglar',5,'Fried',11,100,'2023-06-10 08:30','2023-06-10 08:45');
INSERT INTO `pat_routing` (pat_id_rout,pat_name_rout,manr_id_rout,manr_name_rout,serv_id_rout,serv_loc_rout,data_time_start,data_time_end) VALUES (9100,'Electra Reglar',5,'Fried',16,100,'2023-06-10 08:45','2023-06-10 09:00');	
	

DROP TABLE IF EXISTS pat_info;
CREATE TABLE `pat_info` (
  `inf_id` int NOT NULL,
  `type_id` int NOT NULL, -- увязать со специалистом => managers (`id`)
  `pat_id_inf` int NOT NULL,
  `description` text,
  `file_name` varchar(255) DEFAULT NULL,
  `size` int NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` DATETIME DEFAULT NOW(),
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `type_id_IDX` (`type_id`),
  INDEX pat_id_inf_IDX (`pat_id_inf`),
  CONSTRAINT `pat_id_inf_1` FOREIGN KEY (`pat_id_inf`) REFERENCES `patients` (`pat_id`),
  CONSTRAINT `type_id_1` FOREIGN KEY (`type_id`) REFERENCES `managers` (`id`)

  ) COMMENT='информация о пациентах';
  
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10001,3,7183,'Bronchial asthma, right lung cyst','Lectus.mp4',200,NULL,'2022-08-05 16:04:26','2022-12-08 05:30:59');														
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES										
(10002,3,7183,'Spontaneous tachycardia','TinciduntEget.txt',2,NULL,'2022-08-07 00:32:54','2023-02-19 14:42:37');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10003,2,7183,'Сholelithiasis','NonMattis.jpeg',20,NULL,'2022-08-04 00:35:44','2022-08-28 12:37:43');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10004,2,6252,'Arterial hypertension','SuspendisseAccumsanTortor.avi',700,NULL,'2022-08-06 16:51:31','2023-01-13 19:34:05');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10005,5,6942,'Uterine fibroids','Faucibus.mp4',400,NULL,'2022-08-06 13:05:19','2023-07-31 05:41:02');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10006,5,3328,'Uterine fibroids, ectopic pregnancy','ConvallisMorbi.avi',800,NULL,'2022-08-07 20:07:35','2022-12-31 09:10:06');	
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10007,6,3328,'Spinal osteochondrosis, multiple hernias of the spine','Tortor.avi',900,NULL,'2022-08-06 08:27:36','2023-03-26 10:53:01');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10008,3,3328,'Sleep disturbance','TurpisEget.png',13,NULL,'2022-08-08 18:34:38','2023-07-05 23:35:39');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10009,2,2109,'Other osteoporosis with pathological fracture, shoulder','Nec.avi',750,NULL,'2022-08-05 15:56:16','2022-12-18 09:05:14');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10010,3,1459,'Anemia and thrombocytopenia','ElementumNullam.avi',850,NULL,'2022-08-05 20:04:08','2023-07-03 02:35:23');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10011,5,6242,'Genital varices in pregnancy, third trimester','At.gif',6,NULL,'2022-08-04 19:04:03','2023-06-13 14:13:59');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10012,2,6242,'Sprain of interphalangeal joint of left index finger','Dui.avi',950,NULL,'2022-08-05 06:15:12','2022-09-19 22:24:12');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10013,5,6242,'Term delivery with preterm labor, unsp trimester, oth fetus','HacHabitasse.gif',8,NULL,'2022-08-06 00:21:31','2023-03-11 18:50:21');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10014,3,6242,'Heart arythmy','VariusInteger.mp4',500,NULL,'2022-08-05 21:15:08','2023-03-01 04:39:16');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10015,3,9100,'Thyroid hyperplasia','VestibulumAnte.mp4',600,NULL,'2022-08-06 11:11:49','2023-02-01 22:26:50');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10016,2,9100,'Bitten by shark','AcLobortis.jpeg',11,NULL,'2022-08-08 01:25:13','2023-01-17 10:46:47');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10017,3,9100,'Pneumoconiosis due to dust containing silica','AcDiamCras.xls',14,NULL,'2022-08-05 12:23:21','2023-07-04 14:42:42');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10018,2,1443,'Displacement of gastrointestinal prosth dev/grft, sequela','CursusId.jpeg',6,NULL,'2022-08-06 12:37:17','2023-03-22 08:38:04');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10019,2,1443,'Injury of blood vessel of left middle finger, sequela','Ultrices.ppt',23,NULL,'2022-08-05 10:04:04','2023-03-29 19:43:30');
INSERT INTO `pat_info` (inf_id,type_id,pat_id_inf,description,file_name,size,metadata,created_at,updated_at) VALUES
(10020,2,5665,'Nondisp articular fracture of head of left femur, sequela','Varius.txt',3,NULL,'2022-08-08 18:23:05','2022-08-24 06:19:08');														


DROP TABLE IF EXISTS stock;
CREATE TABLE `stock`(
`stock_id` int NOT NULL,
`service_id` int NOT NULL, -- => price` (`serv_id`)
`stock_name` varchar(255) DEFAULT NULL,
`initial_quantity` BIGINT UNSIGNED NOT NULL,
`presently_quantity` BIGINT UNSIGNED NOT NULL,
`delivery_date` datetime DEFAULT CURRENT_TIMESTAMP,
`update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
INDEX `service_id_IDX` (`service_id`),
INDEX `stock_name_IDX` (`stock_name`),
CONSTRAINT `service_id_1` FOREIGN KEY (`service_id`) REFERENCES `price` (`serv_id`)

 ) COMMENT='склад';

INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30001,12,'Nystatin',198,56,'2023-04-27 12:00:00','2023-08-03 23:24:08');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30002,12,'Aspirin',896,17,'2023-05-20 12:00:00','2023-07-12 20:17:32');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30003,12,'Fluconazole',494,1,'2023-06-29 12:00:00','2023-07-10 04:43:03');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30004,12,'TITANIUM DIOXIDE',441,56,'2023-05-13 12:00:00','2023-07-18 11:23:36');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30005,12,'DEXTROMETHORPHAN HYDROBROMIDE',777,15,'2023-07-18 12:00:00','2023-07-22 09:09:00');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30006,12,'Adrenalin',694,95,'2023-06-09 12:00:00','2023-07-16 02:57:31');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30007,18,'not_applicable',135,53,'2023-05-21 12:00:00','2023-07-26 09:45:32');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30008,12,'PHENYLEPHRINE HYDROCHLORIDE',386,160,'2023-07-31 12:00:00','2023-07-09 21:21:23');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30009,13,'Oxytocin',255,71,'2023-05-02 12:00:00','2023-07-07 20:19:54');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30010,12,'Sodium chloride solution 0.9%',877,70,'2023-05-12 12:00:00','2023-07-13 23:57:50');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30011,17,'Propofol',576,41,'2023-05-31 12:00:00','2023-07-16 09:50:22');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30012,12,'Omacetaxine mepesuccinate',940,53,'2023-05-13 12:00:00','2023-07-18 03:32:08');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30013,13,'Pramipexole Dihydrochloride',344,75,'2023-06-16 12:00:00','2023-07-08 22:03:33');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30014,12,'Enalapril Maleate',321,8,'2023-04-14 12:00:00','2023-08-02 03:47:31');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30015,11,'Gynecological_set',359,91,'2023-07-23 12:00:00','2023-07-08 17:35:21');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30016,14,'Dental-kit',316,44,'2023-06-26 12:00:00','2023-07-13 22:52:20');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30017,11,'Med_clothing',533,4,'2023-04-20 12:00:00','2023-07-15 01:50:23');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30018,17,'MIS-set',100,66,'2023-07-14 12:00:00','2023-07-09 09:11:36');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30019,17,'Ligature-set',830,71,'2023-06-03 12:00:00','2023-07-08 05:26:44');
INSERT INTO `stock` (stock_id,service_id,stock_name,initial_quantity,presently_quantity,delivery_date,update_date) VALUES
(30020,13,'Swathe-set',178,86,'2023-06-10 12:00:00','2023-07-08 18:11:04');


DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
`ms_id` int NOT NULL,
`from_manr_id` int NOT NULL,
`to_pat_id` int NOT NULL,
`ms_body` text,
`created_at` datetime DEFAULT CURRENT_TIMESTAMP,
INDEX `from_manr_id_IDX` (`from_manr_id`),
INDEX `to_pat_id_IDX` (`to_pat_id`),
CONSTRAINT `from_manr_id_1` FOREIGN KEY (`from_manr_id`) REFERENCES `managers` (`id`),
CONSTRAINT `to_pat_id_1` FOREIGN KEY (`to_pat_id`) REFERENCES `patients` (`pat_id`)

) COMMENT='сообщения';

INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES 
(40001,7,1443,'Other repair of laceration of eyelid, partial-thickness','2023-07-04 10:27:34');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40002,7,1443,'Laparoscopic repair of direct inguinal hernia with graft or prosthesis','2023-01-12 08:41:26');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40003,7,1459,'Apicoectomy','2022-04-24 06:19:43');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40004,8,2109,'Resection of quadrant of breast','2022-05-06 05:47:47');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40005,7,5665,'Microscopic examination of specimen from kidney, ureter, perirenal and periureteral tissue, other microscopic examination','2022-09-16 02:14:04');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40006,8,6242,'Full-thickness skin graft to hand','2023-03-18 07:56:23');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40007,8,2109,'Other repair of cervix','2022-10-02 00:05:17');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40008,8,5665,'Tendon pulley reconstruction of hand','2022-11-09 02:33:47');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40009,8,6242,'Magnetic resonance imaging of musculoskeletal','2022-04-17 12:36:05');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40010,10,6242,'Implantation or insertion of biventricular external heart assist system','2022-12-24 02:59:44');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40011,7,6942,'Other intrathoracic anastomosis of esophagus','2022-08-19 11:48:48');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40012,10,6942,'Vaginal biopsy','2023-05-09 07:05:34');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40013,8,3328,'Microscopic examination of specimen from unspecified site, cell block and Papanicolaou smear','2023-07-09 02:36:41');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40014,8,6942,'Revision of hip replacement, both acetabular and femoral components','2022-10-11 23:31:34');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40015,7,6942,'Immediate postpartum manual replacement of inverted uterus','2023-06-29 09:32:38');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40016,10,3328,'Other excision of joint, hip','2023-01-20 16:16:30');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40017,8,7183,'Percutaneous aspiration of bladder','2022-09-16 02:39:55');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40018,8,7183,'Other removal of both ovaries and tubes at same operative episode','2023-03-08 12:19:57');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40019,8,9100,'Laser interstitial thermal therapy [LITT] of lesion or tissue of brain under guidance','2023-04-06 02:51:45');
INSERT INTO `messages` (ms_id,from_manr_id,to_pat_id,ms_body,created_at) VALUES
(40020,10,9100,'Biopsy of bony palate','2023-04-21 15:37:05');


DROP TABLE IF EXISTS rating;
CREATE TABLE `rating`(
`rat_id` int NOT NULL,
`pat_id` int NOT NULL,
`manr_id` int NOT NULL,
`points` int NOT NULL,
INDEX `pat_id_IDX` (`pat_id`),
INDEX `manr_id_IDX` (`manr_id`),
INDEX `points_IDX` (`points`),
CONSTRAINT `pat_id_k` FOREIGN KEY (`pat_id`) REFERENCES `patients` (`pat_id`),
CONSTRAINT `manr_id_k` FOREIGN KEY (`manr_id`) REFERENCES `managers` (`id`)

) COMMENT='рейтинг';

INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50001,1443,2,8);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50002,1443,3,9);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50003,1443,7,9);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50004,1443,9,2);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50005,9100,9,6);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50006,9100,5,10);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50007,9100,2,9);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50008,7183,2,9);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50009,7183,3,9);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50010,7183,9,10);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50011,7183,8,7);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50012,7183,10,10);
INSERT INTO `rating` (rat_id,pat_id,manr_id,points) VALUES
(50013,6252,4,10);


 
 
 
 
 