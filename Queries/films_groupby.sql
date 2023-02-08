--Select everything from film
Select * from film
--Count the amount of film_id's in film table 
SELECT COUNT (film_id) as total_film
from film;

--Group by rating and aggregate the film_id count 
SELECT rating,
COUNT(film_id) total_films
from film
GROUP BY rating;

--Select the average rental duration
SELECT round(avg(rental_duration),2) as rnd_avg_rental_duration
from film;

--Group by the rental duration, avergae the rental rate and give alias
SELECT rental_duration, round(avg(rental_rate),2)
from film
GROUP BY rental_duration;

--Find the rows with the minimum rental rate
SELECT rental_duration, min(rental_rate) min_rate
from film
group by rental_duration;

--Find the rows with minimum rental rate and the title of the movie
SELECT rental_duration, title 
from film
WHERE rental_rate = (select min(rental_rate)from film)
group by rental_duration, title;

--Filter by aggregate
SELECT rental_duration, MAX(rental_rate) AS max_rental_rate
FROM film
WHERE 1=1
GROUP BY rental_duration
HAVING MAX(rental_rate) > 3;

--1. What is the average cost to rent a film in the pagila stores?
SELECT round(avg(rental_rate),2) avg_rate
from film;

--2. What is the average rental cost of the films by rating?
SELECT rating, round(avg(rental_rate),2) avg_rate
from film 
group by rating;

--3. How much would it cost to replace all the films in the database 
SELECT sum(replacement_cost) tot_cost
from film;

--4. How much would it cost to replace all the films ineah ratings category?
SELECT rating, sum(replacement_cost)
from film
group by rating;

--5. How long is the longest movie in the database? and the shortest?
SELECT max (length)
from film;
--min
SELECT min(length)
from film;