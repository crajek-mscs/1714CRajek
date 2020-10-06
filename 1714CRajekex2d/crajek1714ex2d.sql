-- Cory Rajek
-- Exercise 2D: Summary queries
-- PropertyManager db

--1) Bldgs, Apmt, Admin
SELECT Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM   Building INNER JOIN
             Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
             Person ON Apartment.AdminId = Person.PersonId
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person.LastName, Person.FirstName

--2) Tenants, Bldgs, Apmt
SELECT Person.PersonId, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM   Person INNER JOIN
             Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
             Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId, Apartment.ApartmentNum

--3) Apmt, Tenant, Inv, Line Items
SELECT Apartment.ApartmentNum, Person.LastName, Person.FirstName, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM   Apartment INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate

--4) Apmt, Tenant, Inv Total
SELECT Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM   Apartment INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate

--5) Inv, Tenant, Receipt
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Building.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM   Invoice INNER JOIN
             Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
             Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate

--6) Inv, Tenant, Apmt, Billed, Received
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, SUM(LineItem.Amount) AS Billed, AVG(Receipt.Amount) AS Received
FROM   Invoice INNER JOIN
             Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
             Person ON Apartment.TenantId = Person.PersonId INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
             Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum

--7) Admin, Inv, Total, Billed, Received
SELECT Person.PersonId, Person.LastName, Receipt.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Billed, AVG(Receipt.Amount) AS Received
FROM   Apartment INNER JOIN
             Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
             LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
             Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
             Person ON Apartment.AdminId = Person.PersonId
GROUP BY Person.PersonId, Person.LastName, Receipt.InvoiceId, In
