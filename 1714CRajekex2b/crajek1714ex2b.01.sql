-- Cory Rajek
-- Exercise 2B: Summary queries
-- PropertyManager db

--1) Count all buildings
SELECT COUNT(*) AS [Count All Buildings]
FROM   Building

--2) Count Buildings in Winona
SELECT COUNT(*) AS [Count Buildings in Winona]
FROM   Building
GROUP BY City
HAVING (City = N'Winona')

--3) Avg Rent of All Apart
SELECT AVG(Rent) AS [Av Rent of All Apart]
FROM   Apartment

--4) Total Rent in Bldg1
SELECT SUM(Rent) AS [Total Rent in Bldg1]
FROM   Apartment
WHERE (BuildingId = 1)

--5) Cheapest Rent in Bldg2
SELECT MIN(Rent) AS [Cheapest Rent in Bldg2]
FROM   Apartment
WHERE (BuildingId = 2)

--6) Smallest, Avg., Largest Size Bldg1
SELECT MIN(SquareFeet) AS [smallest size], AVG(SquareFeet) AS [ave size], MAX(SquareFeet) AS [largest size]
FROM   Apartment
WHERE (BuildingId = 1)

--7) Cheapest Garage
SELECT MIN(Amount) AS [Cheapest Garage]
FROM   LineItem
WHERE (Description = N'garage')

--8) Total Amount Gas
SELECT SUM(Amount) AS [Total Amount Gas]
FROM   LineItem
GROUP BY Description
HAVING (Description = N'gas')

--9) Total Oct Rent
SELECT SUM(Amount) AS [Total Oct Rent]
FROM   LineItem
GROUP BY Description
HAVING (Description LIKE N'%October%')