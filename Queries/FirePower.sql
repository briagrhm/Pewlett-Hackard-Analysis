-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

--Add Primary Key
Alter Table firepower
ADD COLUMN id serial PRIMARY KEY

--DELETE and update data
--DELETE where reservepersonnel =0
SELECT * FROM firepower where reservepersonnel = 0;
DELETE FROM firepower
WHERE reservepersonnel = 0;


--Update totalaircraftstrength +=1
update firepower
set totalaircraftstrength = totalaircraftstrength +1
where fighteraircraft =1;

SELECT AVG(TotalMilitaryPersonnel)AS AvgTotMilPersonnel,
	AVG(TotalAirCraftStrength) AS AVGTotAircraftStrength,
	AVG(TotalHelicopterStrength)AS AvgTotHelicopterStrength,
	AVG(TotalPopulation)AS AvgTotalPopulation
FROM firepower;

INSERT INTO firepower(Country, TotalPopulation, TotalMilitaryPersonnel, TotalAircraftStrength, TotalHelicopterStrength)
VALUES ('GlobalLand', 60069024, 524358,457, 183);

SELECT * FROM firepower
WHERE 1=1 
and totalpopulation = 60069024;