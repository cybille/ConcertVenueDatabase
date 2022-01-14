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
