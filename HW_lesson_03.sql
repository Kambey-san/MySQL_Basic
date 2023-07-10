/* Практическое задание по теме “Введение в проектирование БД”
Написать cкрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы 
(с перечнем полей, указанием индексов и внешних ключей)*/

USE vk;

DROP TABLE IF EXISTS vk_market_categories;
CREATE TABLE vk_market_categories (
	category_id SERIAL PRIMARY KEY, -- ID категории
	category_name VARCHAR(255) UNIQUE, -- наименование категории
	created_at DATETIME DEFAULT NOW(), -- дата создания
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- дата обновления
    
    INDEX category_name_idx(category_name) -- индекс для поиска по наименованию категории
    
) COMMENT = 'Таблица товарных категорий';

DROP TABLE IF EXISTS vk_market_products;
CREATE TABLE vk_market_products(
    product_id SERIAL PRIMARY KEY, -- ID товара
	product_name VARCHAR(255), -- наименование товара
	product_photo VARCHAR(255) DEFAULT NULL, -- изображение товара
	product_description TEXT, -- описание товара
	product_price DECIMAL(10,2), -- стоимость товара
	created_at DATETIME DEFAULT NOW(), -- дата создания
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- дата обновления
    
)COMMENT = 'Таблица товаров';
    
    INDEX updated_at_idx(updated_at), --  индекс по новизне
    
DROP TABLE IF EXISTS vk_market_sellers;
CREATE TABLE vk_market_sellers(
seller_id SERIAL PRIMARY KEY, -- ID продавца
seller_name VARCHAR(255)UNIQUE, -- наименование продавца
sellers_phone BIGINT UNSIGNED UNIQUE, -- телефон продавца
sellers_email VARCHAR(100)UNIQUE -- эл. почта продавца

)COMMENT = 'Таблица продавцов';

    INDEX seller_idx(seller_name), -- индекс по продавцу
    
    
    FOREIGN KEY fk_product_category(category_name) REFERENCES product_categories(category_id),
    FOREIGN KEY fk_product(product_name) REFERENCES product_name(product_id),
    FOREIGN KEY fk_product_name(product_id)) REFERENCES seller_name(seller_id)

);