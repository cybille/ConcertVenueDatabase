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


