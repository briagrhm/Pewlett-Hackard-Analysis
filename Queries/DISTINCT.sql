SELECT * FROM actor;
--pagiliaa-insert -data
--Select count of actors first names in descending order 
SELECT first_name, count(*) actor_ct
from actor 
group by first_name
order by actor_ct DESC;

--Select the average duration of movies by rating order by avg_duration
SELECT * FROM film
SELECT rating, round(avg(rental_duration)) as avg_duration
from film
group by rating 
order by avg_duration;

--SELECT top ten replace costs for the length of the movie 
SELECT length, round(avg(replacement_cost),2) avg_cost
from film
group by length
order by avg_cost DESC
LIMIT 10;

--SELECT the count of countries
SELECT *FROM country
SELECT * FROM city

SELECT co.country, count(ci.city) city_count
from country co
inner join city ci on ci.country_id = co.country_id
group by co.country
order by city_count DESC;


--First SELECT customer_id, inventory_id, and rental_date and order by customer_id
SELECT * FROM rental

SELECT customer_id inventory_id, rental_date
from rental
order by customer_id, inventory_id DESC;
--Using the previous query we add DISTINCT statement to get the different values
SELECT DISTINCT customer_id, inventory_id, rental_date
from rental
order by rental_date;
--USe join to find the inventory, film and store id 
SELECT *FROM inventory;

SELECT DISTINCT r.customer_id, r.inventory_id, rental_date
from rental r 
inner join inventory i on r.inventory_id = i.inventory_id
inner join store s on i.store_id = s.store_id
order by rental_date;

--Use DISTINCT ON and pass the customer_id in the parentheses to get each unique customers latest rental date
SELECT DISTINCT ON(customer_id) customer_id, rental_date
from rental
ORDER BY customer_id, rental_date DESC;

--Retrieve the latest rental for each customers first and last and email address 
Select distinct on (r.customer_id)
c.first_name , 
c.last_name, 
c.email, 
r.rental_date
from rental r
left join customer c on r.customer_id = c.customer_id
ORDER BY r.customer_id, r.rental_date DESC;

--Retrieve the latest rental date for each title 
SELECT DISTINCT ON (f.title) f.title, r.rental_date
from rental r
inner join inventory i on i.inventory_id = r.inventory_id
inner join film f on f.film_id=i.film_id
order by f.title, r.rental_date DESC;

--Bonus:
--Query 2 only returned 958 movies, which means 42 movies are not being rented. 
--We know that there are 1000 movies in the film table. 
SELECT title 
from film
WHERE film_id not in (
select i.film_id
	from rental r
	inner join inventory i on r.inventory_id = i.inventory_id
)