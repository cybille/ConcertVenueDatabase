

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
ON information
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



