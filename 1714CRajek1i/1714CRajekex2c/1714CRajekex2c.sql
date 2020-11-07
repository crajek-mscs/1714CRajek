-- Cory Rajek
-- Exercise 2C: Summary queries
-- PropertyManager db

--1) City, State, Count Bldg
SELECT State, City, COUNT(*) AS [Building Count]
FROM   Building
GROUP BY State, City

--2) City, Count Bldg
SELECT City AS [MN City], COUNT(*) AS [Building Count]
FROM   Building
GROUP BY State, City
HAVING (State = N'MN')

--3) Bldg Id, Bldg Name, Avg Rent
SELECT Apartment.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Avg Rent]
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Apartment.BuildingId, Building.BuildingName

--4) City, Bldg Name, Tot Rent
SELECT Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Tot Rent]
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING (Building.State = N'MN')

--5) Cheapest Rent
SELECT Building.City, MIN(Apartment.Rent) AS [Min Rent]
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City

--6) Bldg Name, Sm Size, Ave Size, Lg Size
SELECT Building.BuildingName, MIN(Apartment.SquareFeet) AS [Sm Size], AVG(Apartment.SquareFeet) AS [Avg Size], MAX(Apartment.SquareFeet) AS [Lg Size]
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE (Apartment.TenantId IS NULL)
GROUP BY Building.BuildingName, Building.City
HAVING (Building.City = N'Winona')

--7) InvoiceId, Cheapest Price
SELECT MIN(LineItem.Amount) AS [Cheapest Garage]
FROM   Invoice INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY LineItem.Description, Invoice.InvoiceDate
HAVING (LineItem.Description = N'Garage') AND (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))

--8) InvoiceId, Tot Amount Billed
SELECT Invoice.InvoiceId, SUM(LineItem.Amount) AS [Tot Amount Billed]
FROM   Invoice INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate
HAVING (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))