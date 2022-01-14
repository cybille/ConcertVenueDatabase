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
performer_last_name varchar(30),
contact_id int unique
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





















