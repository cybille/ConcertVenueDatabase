-- VIEW

-- customer

CREATE VIEW Concerts AS 
SELECT concert.concert_name, concert.genre, concert.date, concert.time, location.street
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
SELECT merchandise_name, merchandise_type, merchandise_price
FROM ConcertVenue.merchandise;
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


