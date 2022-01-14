-- VIEW

-- performer

CREATE VIEW venue AS 
SELECT street
FROM concertvenue.location
;

CREATE VIEW Concert_merchandise AS 
SELECT merchandise_name, merchandise_type, merchandise_price , Merchandise_retailer
FROM ConcertVenue.merchandise;

CREATE VIEW Concert_album AS 
SELECT album_name, number_of_songs
FROM ConcertVenue.album;

CREATE VIEW customer_base AS 
SELECT count(custormer_id), passes_id
FROM ConcertVenue.customer
GROUP BY passes_id;
