/* Курсовой проект. База данных частной клиники */
/* предварительная версия */

DROP DATABASE IF EXISTS yclinic;
CREATE DATABASE yclinic;
USE yclinic;

CREATE TABLE `managers` (
  `id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `position` varchar(50) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`position`),
  KEY `managers_position_IDX` (`position`,`last_name`,`first_name`) USING BTREE
) COMMENT='сотрудники';

INSERT INTO yclinic.managers (id,first_name,last_name,gender,`position`,phone_number,email) VALUES
	 (1,'Marylinda','Richley','F','CEO','(582) 8985620','mrichley0@yclinic.com'),
	 (2,'Melba','O''Brian','F','surgeon','(419) 8938028','mobrian1@yclinic.com'),
	 (3,'Dionis','Leehane','F','therapeutist','(120) 7355368','dleehane2@yclinic.com'),
	 (4,'David','Alpes','M','dentist','(112) 5188713','dalpes3@yclinic.com'),
	 (5,'Nealson','Fried','M','gynecologist','(966) 5997156','nfried4@yclinic.com'),
	 (6,'Craig','Puddefoot','M','physio','(634) 8533824','cpuddefoot5@yclinic.com'),
	 (7,'Tony','Kirby','M','client_manager_1','(317) 6142091','tkirby6@yclinic.com'),
	 (8,'Clark','Mirando','M','client_manager_2','(612) 6793836','cmirando7@yclinic.com'),
	 (9,'Modestia','Mattusov','F','nurse','(687) 1692648','mmattusov8@yclinic.com'),
	 (10,'Orrin','Liepmann','M','executive_secretary','(792) 9577114','oliepmann9@yclinic.com');
	

CREATE TABLE `patients` (
  `pat_id` varchar(50) NOT NULL,
  `pat_name` varchar(50) DEFAULT NULL,
  `pat_gender` varchar(50) DEFAULT NULL,
  `pat_birthday` varchar(50) DEFAULT NULL,
  `pat_address` varchar(50) DEFAULT NULL,
  `pat_job` varchar(50) DEFAULT NULL,
  `pat_phone` varchar(50) DEFAULT NULL,
  `pat_email` varchar(50) DEFAULT NULL,
  `first_visit_date` varchar(50) DEFAULT NULL,
  `primary_diagnosis` varchar(50) DEFAULT NULL
) COMMENT='пациенты';
	 
INSERT INTO yclinic.patients (pat_id,pat_name,pat_gender,pat_birthday,pat_address,pat_job,pat_phone,pat_email,first_visit_date,primary_diagnosis) VALUES
	 ('09-776-7183','Maxie Hackleton','M','1997-10-04','78 Rutledge Plaza','Environmental Specialist','(406) 5124731','mhackleton1@army.mil','2023-02-23 08:19:52','M4855XD'),
	 ('22-629-6252','Zollie Kiffe','F','1966-12-01','95308 Larry Avenue','Graphic Designer','(804) 6772112','zkiffe4@nsw.gov.au','2022-11-04 17:48:23','N5082'),
	 ('36-982-6942','Uri Itzchaky','F','1996-05-14','10 Rusk Plaza','Geological Engineer','(515) 2606428','uitzchaky5@live.com','2022-12-07 16:21:38','S42215P'),
	 ('37-186-3328','Waldemar Beard','F','1971-09-13','580 Petterle Plaza','Pharmacist','(617) 1227311','wbeard8@marketwatch.com','2023-07-08 15:54:39','T370X4S'),
	 ('44-995-2109','Robinetta Keddle','F','1971-06-04','018 Mayer Drive','Help Desk Operator','(853) 5746026','rkeddle9@last.fm','2022-09-07 01:18:35','R895'),
	 ('61-409-0459','Jamey Arsey','M','1956-08-19','25996 Bultman Road','Staff Scientist','(636) 4752299','jarsey6@wikia.com','2023-06-09 13:09:27','R0683'),
	 ('68-785-6242','Herve Guilliland','F','1960-09-09','6530 Mayer Park','VP Accounting','(639) 8731129','hguilliland0@google.com.hk','2022-09-12 01:06:27','M1486'),
	 ('71-211-9107','Electra Reglar','F','1955-03-24','92548 Chinook Parkway','Associate Professor','(557) 4516421','ereglar2@quantcast.com','2023-03-01 22:37:39','T8859XS'),
	 ('73-493-1443','Tarrah Errol','M','2000-04-23','518 Continental Center','Accounting Assistant III','(898) 6674310','terrol3@webeden.co.uk','2023-05-23 07:30:54','S53412A'),
	 ('87-130-5665','Cornie Sankey','M','1990-09-06','17996 Green Ridge Terrace','Senior Developer','(893) 9438574','csankey7@ow.ly','2023-04-06 04:10:57','K5506');
	

CREATE TABLE `price` (
  `serv_id` varchar(50) NOT NULL,
  `serv_name` varchar(50) DEFAULT NULL,
  `serv_price` int DEFAULT NULL,
  KEY `price_serv_name_IDX` (`serv_name`) USING BTREE
) COMMENT='услуги';

INSERT INTO yclinic.price (serv_id,serv_name,serv_price) VALUES
	 ('00-1','examination',200),
	 ('00-10','clinique_stay_one_day',300),
	 ('00-2','appointment',50),
	 ('00-3','injection',50),
	 ('00-4','tooth_removal',100),
	 ('00-5','tooth_prosthetics',1500),
	 ('00-6','ultrasound_diagnostics',300),
	 ('00-7','MI_surgery',2000),
	 ('00-8','physiotherapy',150),
	 ('00-9','massage',200);


CREATE TABLE `status` (
  `status_id` int DEFAULT NULL,
  `status_pat` varchar(50) DEFAULT NULL,
  `data_start` varchar(50) DEFAULT NULL,
  `data_end` varchar(50) DEFAULT NULL,
  KEY `status_status_pat_IDX` (`status_pat`) USING BTREE
) COMMENT='статус';

INSERT INTO yclinic.status (status_id,status_pat,data_start,data_end) VALUES
	 (112,'not_initiated','2023-07-14 22:25:24','2023-03-11 16:17:34'),
	 (223,'in_progress','2023-07-15 05:40:39','2023-01-17 12:17:44'),
	 (334,'finished','2023-07-23 05:14:00','2022-09-21 15:36:27'),
	 (113,'not_initiated','2023-07-16 18:15:34','2023-04-19 15:12:00'),
	 (224,'in_progress','2023-07-10 06:49:25','2022-12-30 13:16:16'),
	 (335,'finished','2023-07-09 11:47:21','2022-12-25 22:18:40'),
	 (114,'not_initiated','2023-07-05 17:47:23','2023-06-05 03:14:26'),
	 (225,'in_progress','2023-07-06 14:21:04','2023-06-08 01:32:42'),
	 (336,'finished','2023-07-17 18:05:20','2022-09-01 15:38:23'),
	 (115,'not_initiated','2023-07-19 01:21:10','2022-09-14 03:39:31');