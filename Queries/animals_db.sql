--Create a new table 
CREATE TABLE people(
	name VARCHAR(30) NOT NULL,
	has_pet BOOLEAN DEFAULT false,
	pet_type VARCHAR(10) NOT NULL,
	pet_name VARCHAR(30),
	pet_age INT
);

--Query all the fields from the table 
SELECT *
FROM people;

--Insert data into the table 
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES('Jacob', true,'dog','Misty', 10),
('Ahmed', true, 'rock','Rockington', 100),
('Peter', true, 'cat','Franklin', 2),
('Dave', true, 'dog', 'Queso', 1);

--Query only the pet_name field 
SELECT pet_name from PEOPLE;

--Filter the query to show only dogs under the age of 5 
SELECT * FROM people
where 1=1
and pet_type = 'dog'
and pet_age <5;

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	city VARCHAR(30) NOT NULL,
	state VARCHAR (30) NOT NULL,
	population INT
);
-Miscellaneous 
--Insert DATA into the table 
INSERT INTO cities (city, state, population)
VALUES('Alameda','California', 79177),
('Mesa', 'Arizona', 496401),
('Boerne', 'Texas', 16056),
('Boerne', 'Texas', 16056),
('Anaheim', 'Texas', 352947),
('Tucson', 'Arizona', 535677),
('Garland', 'Texas', 238002);

SELECT * from cities;

--SELECT only the cities 
SELECT city FROM cities;

--Create query for cities in TEXAS only 
SELECT city, state from cities
WHERE state = 'Texas';

--Create query to view cities and states with a population less than 100,00
SELECT city,state from cities 
WHERE 1=1
and population < 100000;
--Create query to view the city in California with a population less than 100,000
SELECT city FROM cities 
WHERE 1=1
and state = 'California'
and population < 100000;
--Create a query to update the state to California for the city of Anaheim.
UPDATE cities 
set state ='California'
where city = 'Anaheim';
--Creat a query to remove the duplicate ('Boerne', 'Texas', 16056 by id = 4 )
DELETE FROM cities 
where id = 4;