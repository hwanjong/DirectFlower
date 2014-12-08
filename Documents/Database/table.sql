CREATE TABLE Auction_list
(
	order_id     NUMBER(8) NOT NULL,
	auction_lat  VARCHAR2(50) NOT NULL,
	auction_lng  VARCHAR2(50) NOT NULL
)
;


CREATE TABLE Evaluation_list
(
	shop_num   NUMBER(8) NULL,
	e_score    NUMBER(8) NULL,
	e_comment  VARCHAR2(50) NULL,
	user_id    VARCHAR2(50) NULL
)
;


CREATE TABLE like_info
(
	user_id   VARCHAR2(50) NULL,
	shop_num  NUMBER(8,2) NULL
)
;


CREATE TABLE Order_info
(
	order_id        NUMBER(8) NOT NULL,
	user_id         VARCHAR2(50) NULL,
	state           VARCHAR2(50) NOT NULL,
	visit           VARCHAR2(50) NOT NULL,
	target_address  VARCHAR2(50) NULL,
	target_name     VARCHAR2(50) NULL,
	photo_url       VARCHAR2(50) NULL,
	request_time    DATE NOT NULL,
	shop_num        NUMBER(8) NULL,
	target_phone    VARCHAR2(50) NULL,
	auction_name VARCHAR2(50)
)
;


CREATE TABLE post
(
	shop_num      NUMBER(8) NULL,
	user_comment  VARCHAR2(50) NULL,
	score         NUMBER(8) NULL,
	user_id       VARCHAR2(50) NULL
)
;


CREATE TABLE Product_list
(
	product_id    NUMBER(8) NOT NULL,
	product_name  VARCHAR2(50) NOT NULL,
	price         NUMBER(8) NOT NULL,
	special	VARCHAR2(8),
	shop_num      NUMBER(8) NOT NULL
)
;


CREATE TABLE Response_shop
(
	order_id        NUMBER(8) NOT NULL,
	shop_num        NUMBER(8) NOT NULL,
	response_money  NUMBER(8) NOT NULL,
	response_photo  VARCHAR2(50) NULL
)
;


CREATE TABLE Sale_list
(
	order_id    NUMBER(8) NULL,
	product_id  NUMBER(8) NULL,
	amount      NUMBER(8) NOT NULL
)
;


CREATE TABLE Shop
(
	shop_num       NUMBER(8) NOT NULL,
	event_comment  VARCHAR2(100) NULL,
	event_count    NUMBER(8) NULL,
	shop_location  VARCHAR2(100) NOT NULL,
	shop_photo     VARCHAR2(50) NULL,
	shop_name      VARCHAR2(70) NULL,
	shop_lat       VARCHAR2(50) NULL,
	shop_lng       VARCHAR2(50) NULL
)
;


CREATE TABLE Shop_product
(
	shop_num    NUMBER(8) NULL,
	product_id  NUMBER(8) NULL
)
;


CREATE TABLE User_list
(
	user_id    VARCHAR2(50) NOT NULL,
	pw         VARCHAR2(50) NOT NULL,
	name       VARCHAR2(50) NOT NULL,
	phone_num  VARCHAR2(50) NOT NULL,
	shop_num   NUMBER(8) NULL,
	gcm_key    VARCHAR2(50) NULL
)
;



ALTER TABLE User_list
	ADD CONSTRAINT UQ_User_gcm_key UNIQUE (gcm_key)
;

ALTER TABLE Order_info ADD CONSTRAINT PK_Order_info 
	PRIMARY KEY (order_id)
;

ALTER TABLE Product_list ADD CONSTRAINT PK_Product_list 
	PRIMARY KEY (product_id)
;

ALTER TABLE Shop ADD CONSTRAINT PK_Shop 
	PRIMARY KEY (shop_num)
;

ALTER TABLE User_list ADD CONSTRAINT PK_User 
	PRIMARY KEY (user_id)
;
