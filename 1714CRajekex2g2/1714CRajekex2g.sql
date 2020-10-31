-- Cory Rajek
-- Exercise 2G: Summary queries
-- PropertyManager2 db

--1) Buildings, Apartments, Admins
SELECT Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName AS Admin
FROM   Buildings INNER JOIN
             Apartments ON Buildings.Id = Apartments.Building_Id INNER JOIN
             People ON Apartments.Tenant_Id = People.Id
ORDER BY Buildings.Id

--2) Apartments, Invoices, LineItems
SELECT Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N',' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, LineItems.Description, LineItems.Amount
FROM   Buildings INNER JOIN
             Apartments ON Buildings.Id = Apartments.Building_Id INNER JOIN
             People ON Apartments.Tenant_Id = People.Id INNER JOIN
             Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
             LineItems ON Invoices.Id = LineItems.Invoice_Id
ORDER BY Apartments.Building_Id, Tenant

--3) Tenants, Invoices, Receipts
SELECT People.Id, People.LastName + N',' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, Invoices.DueDate, Receipts.ReceiptDate, Receipts.Amount
FROM   People INNER JOIN
             Apartments ON People.Id = Apartments.Tenant_Id INNER JOIN
             Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
             Receipts ON Invoices.Id = Receipts.Invoice_Id
ORDER BY Tenant