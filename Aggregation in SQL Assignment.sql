USE world;

-- Question 1 : Count how many cities are there in each country?

SELECT CountryCode, Count(Name) FROM city
GROUP BY CountryCode;

-- Question 2 : Display all continents having more than 30 countries.

SELECT Continent, Count(Code) FROM country
GROUP BY Continent
HAVING Count(Code) > 30;

-- Question 3 : List regions whose total population exceeds 200 million.

Select Region, Population FROM country
WHERE Population > 200000000;

-- Question 4 : Find the top 5 continents by average GNP per country.

SELECT Continent, AVG(GNP) FROM country
GROUP BY Continent
ORDER BY AVG(GNP) DESC
LIMIT 5;

-- Question 5 : Find the total number of official languages spoken in each continent.

SELECT country.Continent, COUNT(countrylanguage.Language) AS Officiallanguage_count
FROM country INNER JOIN countrylanguage 
ON country.Code = countrylanguage.CountryCode
GROUP BY Country.Continent, countrylanguage.IsOfficial
HAVING countrylanguage.IsOfficial = 'T';

-- Question 6 : Find the maximum and minimum GNP for each continent.

SELECT Continent, MAX(GNP) AS Maximum_GNP, MIN(GNP) AS Minimum_GNP 
FROM country
GROUP BY Continent;

-- AS Continent has many values as 0 so min will come 0 we can find out minimum value greater than 0 as

SELECT Continent, MAX(GNP) AS Maximum_GNP, MIN(GNP) AS Minimum_GNP 
FROM country
WHERE GNP > 0
GROUP BY Continent;

-- Question 7 : Find the country with the highest average city population.

SELECT CountryCode, AVG(Population)
FROM city
GROUP BY CountryCode
ORDER BY AVG(Population) DESC
LIMIT 1;

-- Question 8 : List continents where the average city population is greater than 200,000.

SELECT country.Continent, AVG(city.Population) AS Average_city_population
FROM country INNER JOIN city
ON country.Code = city.CountryCode
GROUP BY country.Continent
HAVING AVG(city.Population) > 200000;

-- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.

SELECT Continent, SUM(Population) AS Total_population, AVG(LifeExpectancy) AS Average_life_expectancy
FROM country
GROUP BY Continent
ORDER BY AVG(LifeExpectancy) DESC;

-- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.

SELECT Continent, AVG(LifeExpectancy)
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AVG(LifeExpectancy) DESC
LIMIT 3;

 
