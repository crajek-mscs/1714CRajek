-- Cory Rajek
-- Exercise 2E: Summary queries
-- PropertyManager db

--1) Bldg Name and Location
SELECT BuildingName, Address, City + N',' + N' ' + State + N' ' + Zip AS [City State Zip]
FROM   Building
WHERE (City = N'Winona') AND (State = N'MN')

--2) Apartment Estimated Rent
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100 AS [Estimated Rent]
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE (Building.City = N'Red Wing') AND (Building.State = N'MN')

--3) Estimated vs. Actual Rent
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100 AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100) AS Difference
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE (Building.City = N'Red Wing') AND (Building.State = N'MN')

--4) Invoice Total
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Total
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate

--5) Invoice Total and Receipt
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Total, AVG(Receipt.Amount) AS Amount
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
             Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate

--6) Invoice Total vs Received
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS InvoiceTotal, Receipt.Amount AS Received, SUM(LineItem.Amount) - Receipt.Amount AS Difference
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
             Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount, Apartment.ApartmentNum
HAVING (SUM(LineItem.Amount) - Receipt.Amount > 0)

--7) Late Payments
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(DAY, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
             Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
WHERE (DATEDIFF(DAY, Invoice.DueDate, Receipt.ReceiptDate) > 0)

--8) Next Invoice Date
SELECT Person.PersonId, Person.FirstName + N' ' + Person.LastName AS Tenant, MAX(Invoice.InvoiceDate) AS [Recent Invoice], DATEADD(month, 1, MAX(Invoice.InvoiceDate)) AS [Next Invoice]
FROM   Person INNER JOIN
             Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
GROUP BY Person.PersonId, Person.FirstName + N' ' + Person.LastName