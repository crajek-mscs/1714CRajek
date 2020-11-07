SELECT Locations.City, People.LastName + N',' + N' ' + People.FirstName AS [Potential Member], PotentialMembers.DateOfContact, Locations.Address, People.Phone
FROM   Locations INNER JOIN
             People ON Locations.Id = People.Location_Id INNER JOIN
             PotentialMembers ON People.Id = PotentialMembers.Person_Id
WHERE (People.DescriptionOfRole = N'PotentialMember')