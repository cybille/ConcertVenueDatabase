-- Sql file= create_database_Concert_Venue

-- create database Concert Venue
DROP DATABASE IF EXISTS concertVenue;
CREATE DATABASE concertVenue;

-- call on database
USE concertVenue;

-- create main tables: concert, performer, customer
-- add constraints

CREATE TABLE location(
location_id int NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
street varchar(30) not null,
city varchar(30) not null,
state varchar(30) not null,
country varchar(30) not null,
zip varchar(30) not null
);

CREATE TABLE performer(
-- primary key/ id
performer_id int NOT NULL AUTO_INCREMENT PRIMARY KEY unique ,
performer_first_name varchar(30) not null,
performer_last_name varchar(30)
);


CREATE TABLE concert(
concert_id int NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
concert_name varchar(30) not null,
genre varchar(30) not null,
location_id int not null,
date DATE not null,
time TIME not null,
duration double,
performer_id int not null,
CONSTRAINT concert_fk_performer
    FOREIGN KEY (performer_id)
    REFERENCES  performer(performer_id),
CONSTRAINT concert_fk_location
    FOREIGN KEY (location_id)
    REFERENCES  location(location_id)
);



CREATE TABLE passes 
(
passes_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
pass_type varChar(30) DEFAULT 'general'
);


CREATE TABLE customer
(
-- primary key/ id
customer_id int NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
customer_fname varchar(30) not null,
customer_lname varchar(30),
concert_id int not null,
passes_id  int not null, 
customer_phone varchar(15) unique, 
customer_email varchar(30) not null unique, 
CONSTRAINT customer_fk_concert
    FOREIGN KEY (concert_id)
    REFERENCES  concert(concert_id),
CONSTRAINT customer_fk_passes
    FOREIGN KEY (passes_id)
    REFERENCES  passes(passes_id)
);

-- create foreign key tables: passes, album
-- add constraints



CREATE TABLE album
(
album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
album_name varChar(40) DEFAULT 'untitled',
number_of_songs int not null, 
performer_id int not null,
CONSTRAINT album_fk_perfomer
    FOREIGN KEY (performer_id)
    REFERENCES  performer(performer_id)

);

CREATE TABLE staff_position(
position_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
position_name VARCHAR(30) NOT NULL
);

CREATE TABLE Equipment
(
equipment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
position_id INT NOT NULL,
equipment_name VARCHAR(30) NOT NULL,
quantity INT DEFAULT 0,
CONSTRAINT equipment_fk_staff_position
    FOREIGN KEY (position_id)
    REFERENCES  staff_position(position_id)
);




-- create other table: merchandise, equipment, general staff
-- add constraints


CREATE TABLE staff(
staff_id int NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
position_id int NOT NULL,
concert_id int NOT NULL,
staff_first_name varchar(30) not null,
staff_last_name varchar(30) not null,
staff_phone varchar(15) unique, 
staff_email varchar(30) not null unique,
CONSTRAINT staff_fk_position
    FOREIGN KEY (position_id)
    REFERENCES staff_position(position_id),
CONSTRAINT staff_fk_concert
    FOREIGN KEY (concert_id)
    REFERENCES  concert(concert_id)
);

CREATE TABLE merchandise(
merchandise_id int NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
performer_id int NOT NULL unique,
merchandise_name varchar(30) not null,
merchandise_type varchar(30) not null,
merchandise_price varchar(30) not null,
CONSTRAINT merchandise_fk_performer
    FOREIGN KEY (performer_id)
    REFERENCES  performer(performer_id)
);



CREATE TABLE contact(
contact_id int NOT NULL AUTO_INCREMENT PRIMARY KEY unique,
performer_id int NOT NULL unique,
phone varchar(20) unique, 
email varchar(30) not null unique,
CONSTRAINT contact_fk_performer
FOREIGN KEY (performer_id)
REFERENCES performer(performer_id)
);

 -- ADD DATA
 
 -- Sql file= add_data_Concert_Venue

-- call on database
USE concertVenue;

-- insert data in main tables: concert, performer, customer
INSERT INTO location (location_id, street, city, state, country, zip) 
VALUES  
(1,  '2150 Hempstead Tpke', 'NY', 'NYC', 'USA', '11003'),
(2, 'Oosaka-jou Kouen', 'Osaka', 'NA', 'Japan', '3-1'),
(3,'Hamamatsu', 'NA', 'NA', 'Japan', '3'),
(4,'270 Tremont Street','Boston', 'MA', 'USA', '02116'),
(5,'620 Atlantic Ave','Brooklyn', 'NY', 'USA','11217'),
(6,'4 Pennsylvania Plaza', 'New York', 'NY', 'USA', '10001'),
(7,'1260 6th Ave', 'New York', 'NY', 'USA', '10020'),
(8,'45 Columbia St', 'Newark', 'NJ', 'USA', '07052'),
(9,'7800 cellar Door Drive', 'Bristow', 'Virginia', 'USA', '20136'),
(10,'10th & Lamar','Austin','Texas','USA','78703'),
(11,'8901 Sunset Boulevard', 'West Hollywood','California', 'USA','90069'),
(12,'807 Montgomery Street', 'San Francisco','California', 'USA', '94133' ),
(13, '737 N. Huron Street', 'Ypsilanti', 'Michigan', 'USA', '48197'),
(14, 'MetLife Stadium Dr', 'East Rutherford', 'NJ', 'USA', '07073'),
(15, '201 E Jefferson St', 'Phoenix', 'AZ', 'USA', '85004')
;

INSERT INTO  performer (performer_id, performer_first_name, performer_last_name)
 VALUES 
(1, 'Harry', 'Styles'),
(2, 'Ariana', 'Grande'),
(3, 'Nana', 'Mizuki'),
(4, 'Burnout', 'Syndromes'),
(5, 'Aimer', 'NA'),
(6, 'Carol', 'G'),
(7, 'Bad', 'Bunny'),
(8, 'Marc', 'Anthony'),
(9, 'Ana', 'Gabriel'),
(10, 'Carlos', 'Vives'),
(11,'Jack','White'),
(12,'Beck','NULL'),
(13,'Jaki','Byard'),
(14,'Terence','Blanchard'),
(15,'Van','Halen'),
(16, 'J.', 'Cole'),
(17, 'Drake', 'NULL'),
(18, 'Ed', 'Sheeran'),
(19, 'Kendrick', 'Lamar'),
(20, 'Post', 'Malone')
;


INSERT INTO concert (concert_id, concert_name ,genre, location_id, date, time ,duration , performer_id)
 VALUES

 -- (0, 'TBA', 'pop',0, 4, 4.5, 1),
(1, 'Harry Styles', 'pop', 1, '2022-02-05', 40000, 4.5, 1),
(2, 'Ariana Grande ', 'pop',1, '2022-02-02',50000, 4.5, 2),
(3, 'Nana Mizuki','J pop',2, '2023-12-04', 60000, 4.5, 3),
(4, 'Burnout', 'J-pop rock',3, '2023-01-04', 60000, 4.5, 4),
(5, 'Aimer', 'J-pop', 3, '2023-11-07', 55000, 4.5, 5),
(6, 'Carol_G', 'TBA',4, '2022-10-23', 73000,3.0, 6),
(7,'Bad_Bunny','reggaeton',5, '2023-06-15', 80000, 3, 7),
(8, 'M_Anthony', 'pop',6, '2022-09-10', 80000, 4.0, 8),
(9, 'A_Gabriel', 'pop',7, '2022-03-17', 80000, 5.0, 9),
(10, 'C_Vives', 'pop',8,'2021-12-31', 80000, 4.0, 10),
(11, 'Jiffy Lube Live', 'rock', 4, '2022-01-01', 50000, 1.5, 10),
(12, 'Mother Earth', 'rock', 10, '2023-12-21', 10000, 3, 11),
(13, 'Whisky a Go Go', 'rock', 11, '2022-03-01', 20000, 3, 11),
(14, 'The Orphanage', 'rock', 12, '2022-12-11', 40000, 4, 11),
(15, 'Suds Factory', 'rock', 13, '2023-01-02', 30000, 2023-03-22, 11),
(16, 'Summer', 'rap', 4,'2022-09-30',  60000, 2.5, 17),
(17, 'Runaway', 'hip-hop',6, '2024-12-09', 40000, 3, 20),
(18, 'KOD', 'rap', 6, '2023-02-27', 50000,  4, 16)
;

INSERT INTO passes VALUES 
-- (Passes_id, Pass_type )
(1, 'General'),
(2, 'Premium'),
(3, 'VIP')
;

INSERT INTO customer VALUES
-- (custormer_id , custormer_fname , custormer_lname , concert_id , passes_id  , phone , email)
-- Marlyn
(1, 'Maria', 'Lizama', 6, 1, '347 208 9032', 'mariaL@gmail.com'),
(2, 'Juan', 'Garcia', 7, 1, '347 208 9031', 'Garcia@hotmail.com'),
(3, 'Gloria', 'Balbuena', 8, 2, '347 333 3342', 'Balbuena@yahoo.com'),
(4, 'Fatima', 'Benitez', 9, 1, '564 848 4321', 'Benitez@aol.com'),
(5, 'Isabelle', 'Flores', 10, 2, '343 342 6434', 'Flores@hotmail.com'),
(6, 'Jennifer', 'Love', 4, 1, '347 208 8333', 'LoveJenn@gmail.com'),
(7, 'Cybille', 'Heart', 3, 3, '347 989 9031', 'cybille@hotmail.com'),
(8, 'Glenn', 'doll', 1, 1, '347 488 3342', 'glenndoll@yahoo.com'),
(9, 'Romeo', 'Juniot', 10, 3, '564 848 8833', 'juniotR@aol.com'),
(10, 'Soven', 'Lore', 15, 1, '343 300 3999', 'soven@hotmail.com'),
(11, 'Odette', 'Toxqui', 5, 2, '347 490 4321', 'Toxqui@yahoo.com'), 
(12, 'Elizabeth', 'Morales', 10, 1, '646 857 4321', 'morales@hotmail.com'),
(13, 'Tonny', 'Lopez', 11, 1,'543 345 3245', 'tonny1@aol.com'),
(14, 'Gisselle', 'Tapia', 13, 2, '433 433 6789', 'tapia13@gmail.com'),
(15, 'Rico', 'Les', 8,3, '544 453 6986', 'lessR@hotmail.com'),
(16, 'Thompson', 'Harry', 6, 1, '917 331 8321', 'Tharry123@gmail.com'),
(17, 'Luis', 'Cook', 3, 2, '347 212 1165', 'LuisC@hotmail.com'),
(18, 'Jerry', 'Liu', 5, 1, '347 939 8864', 'Jerry8864@gmail.com'),
(19, 'Giorno', 'Giovanna', 6, 2, '917 334 6712', 'GGiovanna@gmail.com'),
(20, 'Dio', 'Brando', 10, 2, '917 345 7812', 'DioBrando@gmail.com')
;

-- foreign key tables: passes, album




INSERT INTO album (album_id, album_name, number_of_songs, performer_id)
 VALUES 
-- (0, 'TBA', 1),
(1, 'Finish Line', 5, 1),
(2, 'Thank U Next', 12,2),
(3, 'Sweetener', 13, 2),
(4, 'Impact Exciter', 24, 3),
(5, 'Oasis', 8, 7),
(6, 'BURNOUT SYNDROMEZ', 12,4),
(7,'Dawn', 13, 5),
(8, 'SEJODIOTODITO', 15,6),
(9, 'EL MUNDO ES MIO', 16, 7),
(10, 'Divide', 16, 18),
(11, 'Amores', 13, 9),
(12, 'Lazaretto', 13,11),
(13, 'Boarding House Ranch', 11, 11),
(14, 'Morning Phase', 13, 12),
(15, 'Venomous Rat Regeneration Vendor', 15, 13),
(16, 'The Magic of 2', 16, 14),
(17,'Magnetic', 18, 15),
(18, 'Libre', 8, 8),
(19, 'Hollywood’s Bleeding', 17, 20),
(20, 'Scorpion', 25, 17),
(21, 'Damn', 14, 19),
(22,'Vives', 18, 10)
;





INSERT INTO  staff_position VALUES

-- (position_id, position_name)
(1, 'CEO'),
(2, 'stage manager'),
(3, 'stage crew'),
(4, 'janitor'),
(5, 'security guard'),
(6, 'production coordinator'),
(7, 'media manager'),
(8, 'cameraman'),
(9, 'makeup artist'),
(10, 'sound crew'),
(11, 'site manager'),
(12, 'director'),
(13, 'event producer'),
(14, 'visual technician'),
(15, 'photographer'),
(16, 'operations team')
;
INSERT INTO Equipment VALUES

-- (equipment_id, position_id, equipment_name , quantity)

-- (0, 'NA', 0),
(1, 1, 'planner', 3),
(2, 3, 'speaker' ,4),
(3, 3, 'microphone', 4),
(4, 11, 'monitor', 2),
(5, 4, 'cleaning supplies', 4),
(6, 11, 'stage props', 9),
(7, 9, 'makeup brushes', 5),
(8, 8, 'recording equipment', 3),
(9, 5, 'flashlight', 4),
(10, 2, 'barricades', 12),
(11, 13, 'walkie-talkie', 6),
(12, 14, 'fog machine', 5),
(13, 10, 'digital sound mixer', 2),
(14, 16, 'cables', 16),
(15, 15, 'posters', 20)
;

-- other table: merchandise, equipment, general staff

INSERT INTO staff (staff_id, position_id, concert_id, staff_first_name , staff_last_name, staff_phone , staff_email)
-- (0, 0, 0 , 'tba', '000 000 0000', 'noemail@gmail.com'),
-- Marlyn
 VALUES
(1, 10, 5, 'Jose', 'Lezame', '324 432 4323', 'Ljose@gmail.com'),
(2, 5, 9, 'Dilma', 'Rocas', '347 657 5643','Dilma@hotmail.com'),
(6, 1, 6, 'Petro', 'Garcia', '212 246 9050', 'pedroG@gmail.com'),
(7, 2, 7, 'Vivian', 'Davis', '212 214 5643', 'vivi@hotmail.com'),
(8, 3, 8, 'Delma', 'Williams', '347 947 4383', 'Delma@hotmail.com'),
(9, 2, 9, 'Elvis', 'Smith', '476 373 9242', 'Elvis3@gmail.com'),
(10, 3, 10, 'Gabriel', 'Brown', '543 543 5478', 'Gabriel@aol.com'),
(11, 4, 6, 'Jenny', 'Blue', '345 433 3423', 'Blue@yahoo.com'),
(12, 3, 7, 'Belen', 'Ter', '465 987 4323', 'TerBe@aol.com'),
(13, 6, 8, 'Karen', 'Rojas', '435 987 4367', 'Rojask@aol.com'),
(14, 3, 8, 'Ivan', 'Teclan', '433 678 8764', 'Teclan@hotmail.com'),
(15, 5, 9, 'Daniel', 'Torres', '346 543 0987', 'Dtorres@gmail.com'),
(16, 6, 4, 'Gigi', 'Tox', '929 985 4573', 'ToxG@gmail.com'),
(17, 5, 6, 'Meo', 'Won', '45 654 5435', 'Won3@aol.com'),
(18, 7, 9, 'Zulma', 'Miranda', '45 678 2345', 'Miranda@hotmail.com'),
(19, 5, 1, 'Margarita', 'Rojas', '646 876 8798', 'MRojas@hotmail.com'),
(20, 5, 9, 'Lucia', 'Tapia', '343 342 9876', 'LT@gmail.com')


;



INSERT INTO merchandise 
(merchandise_id,performer_id, merchandise_name, merchandise_type, merchandise_price)
VALUES
-- (0, 0, 'TBA', 1, 'General'),
(1,1, 'Styles', 'poster', 22 ),
(2,2, 'God is a woman', 'perfume', 50),
(3,3, 'Nana Mizuki', 'Glow wand', 10),
(4,4, 'Burnout', 'poster', 30 ),
(5, 18, 'Collaborations ',  'hoodie ', 50),
(6,6, 'Carol G','hoodies', 80 ),
(7,7, 'Bunny', 'accessories', 90 ),
(8,8, 'Anthony', 'T-shirts', 50),
(9,9, 'Ana Gabriel', 'poster', 40),
(10,10, 'Carlos Vives', 'T-shirts', 30 ), 
(11, 17, 'Champagne Mami', 'crewneck', 50),
(12, 20,  'Grailed ',  't-shirt ', 40),
(13, 5, 'Aimer', 'signed album', 90 ),
(14, 11, 'Last World ',  'hoodie ', 50),
(15, 13, 'Sweetener', 'crewneck', 40)
;

INSERT INTO contact (contact_id, performer_id, phone, email)
VALUES
(1111, 1, '646-000-2346', 'harrystyles@gmail.com'),
(1112, 2, '646 020 3535', 'grandeA@gmail.com'),
(1113, 3, '347-000-0300', 'nanamizuki@jmail.com'),
(1114, 4,  '929-344-3558', 'burnoutS@jmail.com'),
(1115,  5,  '646-000-5000', 'aimer@gmail.com'),
(1116, 6, '212-246-0867', 'CarolG@gmail.com'),
(1117, 7, '212-246-0868', 'BadB@gmail.com'),
(1118, 8, '212-246-000','MarcA@yahoo.com'),
(1119, 9, '212-227-2773', 'Gabriel@gmail.com'),
(1120, 10, '347-343-5432', 'Cvives@aol.com'),
(1121, 11, '347-383-1234', 'JackW@gmail.com'),
(1122, 12, '646-302-5048', 'Beck@gmail.com'),
(1123, 13, '917-654-9876', 'JakiB@gmail.com'),
(1124, 14, '123-456-7890', 'TerenceB@gmail.com'),
(1125, 15, '435-345-5436', 'VanH@gmail.com'),
(1126, 16,  '256-632-4587', 'coleJ@gmail.com'),
(1127, 17, '646-256-4568', 'drake@hotmail.com'),
(1128, 18, '917-473-8472', 'sheeranE@aol.com'),
(1129, 19, '932-848-3838', 'kendrick@gmail.com'),
(1130, 20, '832-433-3738', 'maloneP@yahoo.com')

;

-- CREATE VIEW
-- VIEW

-- general
CREATE VIEW Concert__location AS 
SELECT * 
FROM concertvenue.location;

CREATE VIEW Upcoming__concerts AS 
SELECT *
FROM ConcertVenue.concert;

CREATE VIEW Featured__performer AS
SELECT *
FROM ConcertVenue.performer;

CREATE VIEW Merchandise__sold AS 
SELECT *
FROM ConcertVenue.merchandise;

CREATE VIEW song_line__up AS 
SELECT *
FROM ConcertVenue.album;

CREATE VIEW Audience_ AS 
SELECT *
FROM ConcertVenue.customer;

-- VIEW

-- staff
CREATE VIEW Venue_locations AS 
SELECT * 
FROM concertvenue.location;

CREATE VIEW Upcoming_concerts AS 
SELECT *
FROM ConcertVenue.concert;

CREATE VIEW performers AS
SELECT *
FROM ConcertVenue.performer;

CREATE VIEW Merchandise_to_sell AS 
SELECT *
FROM ConcertVenue.merchandise;

CREATE VIEW artist_Album AS 
SELECT *
FROM ConcertVenue.album;

CREATE VIEW Customers AS 
SELECT *
FROM ConcertVenue.customer;


-- VIEW

-- performer

CREATE VIEW venue AS 
SELECT street
FROM concertvenue.location
;

CREATE VIEW Concert_merchandise AS 
SELECT merchandise_name, merchandise_type, merchandise_price 
FROM ConcertVenue.merchandise;

CREATE VIEW Concert_album AS 
SELECT album_name, number_of_songs
FROM ConcertVenue.album;


CREATE VIEW customer_base AS 
SELECT count(customer_id), passes_id
FROM ConcertVenue.customer
GROUP BY passes_id;


-- VIEW

-- customer

CREATE VIEW Concerts AS 
SELECT concert.concert_name, concert.genre,concert.date, concert.time, location.street
FROM concert 
JOIN location
ON concert.location_id = location.location_id;

CREATE VIEW pass AS 
SELECT Pass_type
FROM ConcertVenue.passes;

CREATE VIEW Featured_performer AS
SELECT concert.concert_name, concert.genre, concert.date, concert.time, 
performer.performer_first_name, performer.performer_last_Name
FROM concert 
JOIN performer
ON concert.performer_id = performer.performer_id;


CREATE VIEW Merchandise_sold AS 
SELECT 
merchandise.merchandise_name, merchandise.merchandise_price, merchandise_type,
performer.performer_first_name, performer.performer_last_Name
FROM performer 
JOIN merchandise
ON performer.performer_id = merchandise.performer_id;

CREATE VIEW song_line_up AS 
SELECT 
performer.performer_first_name, performer.performer_last_Name, 
album.album_name
FROM performer 
JOIN album
ON performer.performer_id = album.performer_id;


-- ACCESS CONTROL

-- (works only one time, after it gives error)
-- create user 'customer'@'localhost' identified by 'customer';
-- create user 'staff'@'localhost' identified by 'staff';
-- create user 'performer'@'localhost' identified by 'performer';



-- grant access
-- customer
GRANT SELECT
ON concert
TO 'customer'@'localhost'
;
GRANT INSERT
ON customer
TO 'customer'@'localhost'
;

GRANT SELECT
ON performer
TO 'customer'@'localhost';

GRANT SELECT
ON passes
TO 'customer'@'localhost'
;

GRANT SELECT
ON merchandise
TO 'customer'@'localhost'
;

-- performer

GRANT INSERT(performer_id, performer_first_name, performer_last_name)
ON performer
TO 'staff'@'localhost';

GRANT INSERT, SELECT, DELETE, UPDATE(performer_id, phone, email)
ON contact
TO 'staff'@'localhost';

GRANT SELECT, UPDATE (concert_name ,genre)
ON concert
TO 'performer'@'localhost'
;

GRANT SELECT
ON passes
TO 'performer'@'localhost'
;

GRANT INSERT, SELECT, UPDATE(merchandise_name)
ON merchandise
TO 'performer'@'localhost'
;

-- staff

GRANT INSERT, SELECT, DELETE, UPDATE(performer_id, performer_first_name, performer_last_name)
ON performer
TO 'staff'@'localhost';

GRANT INSERT, SELECT, UPDATE
ON concert
TO 'staff'@'localhost';

GRANT INSERT, SELECT, DELETE, UPDATE( concert_id , passes_id  ,customer_phone, 
customer_email)
ON customer
TO 'staff'@'localhost';

GRANT INSERT, SELECT, UPDATE
ON merchandise
TO 'staff'@'localhost';

GRANT INSERT, SELECT, DELETE, UPDATE(performer_id)
ON album
TO 'staff'@'localhost';

-- multiple
GRANT SELECT, UPDATE(album_name)
ON album
TO 'performer'@'localhost', 'staff'@'localhost';

FLUSH PRIVILEGES;

show grants for 'staff'@'localhost';
show grants for 'performer'@'localhost';
show grants for 'customer'@'localhost';



-- Query General
show tables;
SELECT * 
FROM concertvenue.location;

SELECT *
FROM ConcertVenue.concert;

SELECT *
FROM ConcertVenue.performer;

SELECT*
FROM concertvenue.contact;

SELECT *
FROM ConcertVenue.merchandise;

SELECT *
FROM ConcertVenue.album;

SELECT *
FROM ConcertVenue.customer;

SELECT *
FROM ConcertVenue.passes;

SELECT *
FROM ConcertVenue.staff;

SELECT *
FROM ConcertVenue.equipment;

SELECT *
FROM ConcertVenue.staff_position;


-- view as staff
SELECT *
FROM  Venue_locations;
SELECT *
FROM  Upcoming_concerts;
SELECT *
FROM  performers;
SELECT *
FROM   Merchandise_to_sell;
SELECT *
FROM  Customers;
SELECT *
FROM  artist_Album;

-- view as performers
SELECT *
FROM  venue;
SELECT *
FROM  Concert_merchandise;
SELECT *
FROM  Concert_album;
SELECT *
FROM  customer_base;

-- view as customers
SELECT *
FROM  Concerts;
SELECT *
FROM  pass;

SELECT *
FROM Featured_performer;
SELECT *
FROM  Merchandise_sold;
SELECT *
FROM  song_line_up;



use concertvenue;

-- all
--  search concert name, performers ect
SELECT concert_name, date
FROM concertvenue.concert
WHERE performer_id = (
SELECT performer_id
FROM concertvenue.performer
WHERE performer_first_name = 'Ariana' 
);

-- find concert by genre
 SELECT concert_name
FROM concert
WHERE genre = 'pop';


-- performers

-- performer registering for concert

INSERT INTO performer (performer_first_name, performer_last_name)
Values ('new performer', 'new performer')
;

INSERT INTO album (album_name, number_of_songs, performer_id)
values ('new album', 8, 16);

INSERT INTO contact (performer_id, phone, email)
VALUES (21,'718 833 3244', 'new@gmail.com');

UPDATE contact
SET phone= '718 833 4000', email = 'new@gmail.com'
WHERE performer_id = last_insert_id()
;

select *
from performer;
select *
from album;
select *
from contact;

-- customer buy ticket
 -- after searching and choosing
 INSERT INTO customer (customer_fname, customer_lname , concert_id , passes_id, customer_phone , customer_email)
 VALUES ('newCustomer', 'newcustomer', 12, 3, '516 787 3433', 'newcustomer@gmail.com');
 
 -- get their id/ ticket number
 -- get pass 
 
 select customer.customer_id as 'Ticket number ', passes.pass_type as 'pass'
 from passes
 join customer
 where passes.passes_id= customer.passes_id AND customer_id=last_insert_id();
 
 -- staff
 SELECT COUNT(concert_id), concert_name
FROM concert
WHERE genre = 'pop';
 
 














