-- Drop table if exists
DROP TABLE wordassociation;

-- Create table and view column datatypes
CREATE TABLE wordassociation (
	author INT,
	word1 VARCHAR,
	word2 VARCHAR,
	source VARCHAR
);

SELECT *
FROM wordassociation;

-- Collect all rows with the word "stone" in the "word1" column
SELECT * FROM wordassociation 
where 1=1
and word1 = 'stone';

-- Collect all rows where the author is within the 0-10 range
SELECT *FROM wordassociation
where 1=1 
and author between 0 and 10;

-- Search for the word "pie" in both "word1" and "word2" columns
SELECT * FROM wordassociation
where 1=1 
and word1 = 'pie'
or word2 = 'pie';

-- BONUS
-- Select all rows with a source of "BC"
SELECT * FROM wordassociation
where source = 'BC'
and author between 333 and 335;

-- Collect all rows where the author is within the 333-335 range and has a source of "BC"
