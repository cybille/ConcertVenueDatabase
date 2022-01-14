-- Query General
SELECT * 
FROM concertvenue.location;

SELECT *
FROM ConcertVenue.concert;

SELECT *
FROM ConcertVenue.performer;

SELECT *
FROM ConcertVenue.merchandise;

SELECT *
FROM ConcertVenue.album;

SELECT *
FROM ConcertVenue.customer;

-- Query General
SELECT * 
FROM concertvenue.location;

SELECT *
FROM ConcertVenue.concert;

SELECT *
FROM ConcertVenue.performer;

SELECT *
FROM ConcertVenue.merchandise;

SELECT *
FROM ConcertVenue.album;

SELECT *
FROM ConcertVenue.customer;

select *
from concertvenue.contact;










-- query concert location

SELECT concert_name
FROM ConcertVenue.concert
WHERE concert = (Select location
From location);

-- query concert preformers

SELECT concert_name, performers
FROM ConcertVenue.concert
WHERE concert = (Select performer_first_name , performer_last_name
From performer);




