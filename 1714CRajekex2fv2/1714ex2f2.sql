-- Cory Rajek
-- Exercise 2f: Animal Shelter test queries
-- AnimalShelter db

--1) All Animals
SELECT Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM   Animals INNER JOIN
             AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
             People ON Animals.Person_Id = People.Id

--2) Cash donations
SELECT People.LastName + N',' + N' ' + People.FirstName AS Donor, Donations.DonationDate, Donations.Value AS Amount
FROM   People INNER JOIN
             Donations ON People.Id = Donations.Person_Id INNER JOIN
             DonationTypes ON Donations.DonationType_Id = DonationTypes.Id
WHERE (DonationTypes.Description = N'Cash')

--3) Total donations for each donor
SELECT People.Id, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS [Total Donations]
FROM   People INNER JOIN
             Donations ON People.Id = Donations.Person_Id
GROUP BY People.Id, People.FirstName + N' ' + People.LastName

--4) Number of dogs for each owner
SELECT People.Id, People.LastName + N',' + N' ' + People.FirstName AS Owner, COUNT(*) AS [Number of Dogs]
FROM   People INNER JOIN
             Animals ON People.Id = Animals.Person_Id INNER JOIN
             AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id
WHERE (AnimalTypes.Type = N'dog')
GROUP BY People.Id, People.LastName + N',' + N' ' + People.FirstName