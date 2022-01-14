-- VIEW

-- general
CREATE VIEW Concert_location AS 
SELECT * 
FROM concertvenue.location;

CREATE VIEW Upcoming_concerts AS 
SELECT *
FROM ConcertVenue.concert;

CREATE VIEW Featured_performer AS
SELECT *
FROM ConcertVenue.performer;

CREATE VIEW Merchandise_sold AS 
SELECT *
FROM ConcertVenue.merchandise;

CREATE VIEW song_line_up AS 
SELECT *
FROM ConcertVenue.album;

CREATE VIEW Audience AS 
SELECT *
FROM ConcertVenue.customer;
