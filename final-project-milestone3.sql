USE CoastalServices;
SELECT ID, CompanyName AS 'Midwestern Corporations', city AS 'City', state AS 'State'
FROM Corporation
JOIN ZipCode ON Corporation.ZipCode = ZipCode.Zip
WHERE State='Michigan' OR State='Wisconsion';

SELECT lName AS 'Last Name', COUNT(ownershipID) AS 'Corporations Owned'
FROM Ownership JOIN Corporation ON Ownership.ownershipID = Corporation.OwnerID
GROUP BY lName
ORDER BY lName

SELECT Salary AS [Fradulant Salary], Employees.ID AS [Employee ID], FirstName AS [First Name], LastName AS [Last Name], Title AS [Employee Title], EstablishmentName AS [Flagged Establishment Name]
FROM Employees JOIN Subsidiaries ON Employees.SubsidiaryID = Subsidiaries.ID
WHERE Salary > 50000 OR Salary < 500
ORDER BY [Fradulant Salary]

SELECT MIN(Salary) AS [Min Salary], MAX(Salary) AS [Max Salary], AVG(Salary) AS [Average Salary]
FROM Employees