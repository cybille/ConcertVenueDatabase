
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
 
 


