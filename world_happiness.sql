-- To load the databse
USE world_happiness; 
SELECT * 
FROM data2022;

-- Count the number of columns for better understanding
SELECT count(*) AS NumberOfColumns
FROM information_schema.columns
WHERE table_name = 'data2022';

-- Now let's find out the number of rows.
SELECT COUNT(*) AS NumberOfRows
FROM data2022;

-- To get more data information
SHOW columns FROM `data2022`;

-- Checking null values in happiness_score column
SELECT *
FROM data2022
WHERE Happiness_score IS NULL OR Happiness_score = ''; 

-- Deleting the last record with null value for all features
-- Disabling the safe_update mode first 
SET SQL_SAFE_UPDATES=0;
-- execute delete statement
DELETE FROM data2022
WHERE Country = 'XX';
-- enable safe update mode
SET SQL_SAFE_UPDATES=1;

-- Analyzing the data
-- Top 5 countries with highest score
SELECT ID_RANK, Country, Happiness_score
From data2022
group by Country
order by Happiness_score desc
limit 5;

-- Top 5 countries with least score
SELECT ID_RANK, Country, Happiness_score
From data2022
group by Country
order by Happiness_score asc
limit 5;

-- SCORE and RANK of INDIA
SELECT ID_RANK, Country, Happiness_score
FROM data2022
WHERE Country = 'India';

-- Top 5 countries in GDP_pc
SELECT Country, GDP_pc
FROM data2022
GROUP BY Country
order by GDP_pc desc
LIMIT 5;

-- Top 5 countries in Social_support
SELECT Country, Social_support
FROM data2022
GROUP BY Country
order by Social_support desc
LIMIT 5;

-- Exploring the min, max and avg Health_life_expectancy score
SELECT Country, Healthy_life_expectancy as min_Health_Life_Exp
FROM data2022
group by country
Having min(Healthy_life_expectancy)
order by min(Healthy_life_expectancy) asc
Limit 1;

SELECT Country, Healthy_life_expectancy
FROM data2022
group by country
Having max(Healthy_life_expectancy)
order by max(Healthy_life_expectancy) desc
Limit 1;

SELECT round(avg(Healthy_life_expectancy), 2)
FROM data2022;

-- Top 5 countries in freedom_to_choose
SELECT Country, freedom_to_choose
FROM data2022
Group by Country
Order by freedom_to_choose desc
Limit 5;

-- Top 5 countries in Generosity
SELECT Country, Generosity
FROM data2022
GROUP BY Country
order by Generosity desc
LIMIT 5;

-- Top 5 countries with highest perception_of_corruption
SELECT Country, Perceptions_of_corruption
FROM data2022
GROUP BY Country
order by Perceptions_of_corruption desc
LIMIT 5;

-- Top 5 countries with lowest perception_of_corruption
SELECT Country, Perceptions_of_corruption
FROM data2022
GROUP BY Country
order by Perceptions_of_corruption asc
LIMIT 5;
