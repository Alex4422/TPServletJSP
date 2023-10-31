
-- 
-- CONTRUCTION OF THE DATABASE
-- 

-- TABLE CUSTOMER
create table CUSTOMER(

 	customer_id int NOT NULL AUTO_INCREMENT,
	firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	register_date date not NULL,
    birth_date date not NULL,
    address varchar(255) NOT NULL,
    zipcode char(5) NOT NULL,
    city varchar(50) NOT NULL,
    phone_number varchar(20) NOT NULL,
    
	PRIMARY KEY (customer_id)
) ENGINE=MyISAM;
-- TABLE CREATED

-- TABLE PURCHASE_ORDER
create table PURCHASE_ORDER(

 	order_id int NOT NULL AUTO_INCREMENT,
	customer_id int NOT NULL,
    date date not NULL,
    
	PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id)REFERENCES CUSTOMER(customer_id)
) ENGINE=MyISAM;
-- TABLE CREATED

-- TABLE ORDER_PRODUCT
create table ORDER_PRODUCT(

 	order_id int NOT NULL AUTO_INCREMENT,
	product_id int NOT NULL,
    
	PRIMARY KEY (order_id,product_id),
    FOREIGN KEY (order_id) REFERENCES PURCHASE_ORDER(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
) ENGINE=MyISAM;
-- TABLE CREATED

-- TABLE PRODUCT
create table PRODUCT(

 	product_id int NOT NULL AUTO_INCREMENT,
	product_category_id int NOT NULL,
    name varchar(50) NOT NULL,
    description varchar(255)  NOT NULL,
    price decimal(5,2) NOT NULL,
    available_stock int NOT NULL,
    
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_category_id) REFERENCES PRODUCT_CATEGORY(product_category_id)
) ENGINE=MyISAM;
-- TABLE CREATED

-- TABLE PRODUCT_CATEGORY
create table PRODUCT_CATEGORY(

	product_category_id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description varchar(255) NOT NULL,
    
    PRIMARY KEY (product_category_id)
) ENGINE=MyISAM;
-- TABLE CREATED
    
    
-- 
-- I populate the database
-- 

-- TABLE CUSTOMER, format date = MySQL displays DATE values in 'YYYY-MM-DD' format

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(1,'Kristina','VAREDE','2021-03-10','1980-10-09','21 jump street','CA105','Los Angeles','152877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(2,'Talita','GRIPPE','2021-07-18','1994-10-20','Rua verde, 5','40110','SALVADOR-BA','005552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(3,'Gesiane','DE SOUZA','2021-02-20','1976-11-17','Rua Barbosa, 7','30000','Belo-MG','005552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(4,'Emilia','Pinto','2020-07-20','1998-11-17','Rua Caldo Verde, 7','30000','Belo-MG','005552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(5,'Rogelio','MARTINS','2020-10-05','1982-05-17','Rua do Salitre, 40','11704','Lisboa','003515552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(6,'Luisa','Silva','2020-10-05','1982-05-17','Rua do Salitre, 22','11704','Lisboa','003515552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(7,'Rosa','Ferreira','2020-10-05','1982-05-17','Rua do Salitre, 22','11704','Lisboa','003515552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(8,'Tina','Mendonza','2020-10-05','1982-02-17','Rue de Meaux, 27','75000','Paris','00337656552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(9,'Paula','Perreira','2020-10-25','1982-05-17','Rua Edouard Pailleron, 22','75000','Paris','00334566915552877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(10,'Sultane','Bathiyar','2020-10-05','1982-08-17','Sosyal Sk, 22','34000','Istanbul','00351987656656');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(11,'Zeynep','Kaya','2020-10-05','1982-08-25','Sosyal Sk, 22','34000','Istanbul','00351987656656');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(12,'Marco','Polo2','2021-03-18','1984-10-09','21 jump street','CA105','Los Angeles','152877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(14,'Alex','Willer','2021-03-18','1984-10-09','calle de la felicidad, 44 ','CA105','Mexico','152877766');

insert into CUSTOMER(customer_id,firstname,lastname,register_date,birth_date,address,zipcode,city,phone_number)
values(15,'Beau','Williams','2021-03-18','1984-10-09','2 diamond street ','AR105','Phoenix','152877766');

-- TABLE PURCHASE_ORDER, format date = MySQL displays DATE values in 'YYYY-MM-DD' format

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(1,1,'2021-03-14');

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(2,2,'2021-03-13');

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(3,3,'2021-03-15');

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(4,4,'2021-03-12');

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(5,5,'2021-03-11');

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(7,1,'2021-04-11');

-- clients: city Paris

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(9,8,'2021-05-07');

insert into PURCHASE_ORDER(order_id,customer_id,date)
values(10,8,'2021-05-07');

-- TABLE ORDER_PRODUCT

insert into ORDER_PRODUCT(order_id,product_id)
values(1,1);

insert into ORDER_PRODUCT(order_id,product_id)
values(2,3);

insert into ORDER_PRODUCT(order_id,product_id)
values(3,4);

insert into ORDER_PRODUCT(order_id,product_id)
values(4,4);

insert into ORDER_PRODUCT(order_id,product_id)
values(5,2);

insert into ORDER_PRODUCT(order_id,product_id)
values(6,10);

insert into ORDER_PRODUCT(order_id,product_id)
values(7,11);

insert into ORDER_PRODUCT(order_id,product_id)
values(8,12);

insert into ORDER_PRODUCT(order_id,product_id)
values(9,12);

insert into ORDER_PRODUCT(order_id,product_id)
values(10,12);

-- TABLE PRODUCT

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(1,1,'stick','weapon for short & average distance',6.00,100000);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(2,1,'knife','weapon for short & average distance',8.00,100000);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(3,1,'tonfa','weapon for short distance',7.00,100000);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(4,1,'sai','weapon for short distance to stab',9.00,100000);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(5,1,'gun','weapon for all distance',400.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(6,3,'The notebook','huh Rachel Mac Adams',400.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(7,4,'hot chocolate','It is so tasteful',2.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(8,9,'tea','It is so tasteful',2.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(9,9,'coffee','It is so tasteful',2.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(10,8,'egyptian art','art in the history',100.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(11,9,'shovel','to dig',14.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(12,9,'watering can','to water plants',10.00,100);

insert into PRODUCT(product_id,product_category_id,name,description,price,available_stock)
values(13,9,'watering can','to water plants',10.00,100);

-- TABLE PRODUCT_CATEGORY

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(1,'weapon','tools for self-defense');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(2,'self-defense books','books for self-defense');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(3,' romantic books','sentimental romance books  ');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(4,'detective novels',' books with investigations inside');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(5,'spy novels',' books with adventure & mysteries inside');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(6,'gloves','to protect your hands');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(7,'glasses','to protect your eyes');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(8,'Books','How to learn something');

insert into PRODUCT_CATEGORY(product_category_id,name,description)
values(9,'Garden','How to build a vegetable patch');