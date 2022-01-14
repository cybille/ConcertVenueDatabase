

SELECT concert.concert_name, concert.genre, concert.time, location.street
FROM concert 
JOIN location
ON concert.location_id = location.location_id;

SELECT passes.pass_type, customer.custormer_id
FROM passes
JOIN customer
ON passes.passes_id=customer.passes_id;








