SELECT People.LastName + N',' + N' ' + People.FirstName AS Members, Churches.ChurchName AS Redeemer
FROM   Members INNER JOIN
             Churches ON Members.Church_Id = Churches.Id INNER JOIN
             People ON Members.Person_Id = People.Id AND Churches.Id = People.Church_Id
WHERE (Churches.ChurchName = N'Redeemer')