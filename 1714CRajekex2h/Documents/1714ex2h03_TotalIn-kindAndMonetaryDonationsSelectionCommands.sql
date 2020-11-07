SELECT BusinessTransactions.Amount AS [Total Value], TransationTypes.Description, TransationTypes.TransactionCategory, People.LastName + N',' + N' ' + People.FirstName AS Doner
FROM   BusinessTransactions INNER JOIN
             Doners ON BusinessTransactions.Id = Doners.Id INNER JOIN
             People ON BusinessTransactions.Person_Id = People.Id AND Doners.Person_Id = People.Id INNER JOIN
             TransationTypes ON BusinessTransactions.Id = TransationTypes.BusinessTransaction_Id
WHERE (TransationTypes.TransactionCategory = N'In-kind')

SELECT BusinessTransactions.Amount AS [Total Value], TransationTypes.Description, TransationTypes.TransactionCategory, People.LastName + N',' + N' ' + People.FirstName AS Doner
FROM   BusinessTransactions INNER JOIN
             Doners ON BusinessTransactions.Id = Doners.Id INNER JOIN
             People ON BusinessTransactions.Person_Id = People.Id AND Doners.Person_Id = People.Id INNER JOIN
             TransationTypes ON BusinessTransactions.Id = TransationTypes.BusinessTransaction_Id
WHERE (TransationTypes.TransactionCategory = N'Monetary')