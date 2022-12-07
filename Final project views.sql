/* Final Project Views
USE CoastalServices;
GO
--Updateable View:
CREATE VIEW Owner_Useful
AS
SELECT ownershipID, lName, fName
FROM Ownership
WHERE ownershipID !='MS' AND ownershipID ! = 'MU';

SELECT * FROM Owner_Useful

USE CoastalServices;
GO
--Updateable View:
CREATE VIEW NonWW_Owned
AS
SELECT * FROM Corporation
WHERE OwnerID!='WW'

SELECT * FROM NonWW_Owned;

USE CoastalServices;
GO
--Updateable View:
CREATE VIEW Important_Types
AS
SELECT * FROM EstablishmentType
WHERE establishmentTypeID!='D';


USE CoastalServices;
GO
--Updateable View:
CREATE VIEW Eighties_Employees
AS
SELECT * FROM employeeBirthdays
WHERE birthday_date BETWEEN '1980-01-01' AND '1989-12-31';

SELECT * FROM Eighties_Employees;

USE CoastalServices;
GO
ALTER VIEW Important_Types
AS
SELECT * FROM EstablishmentType;

SELECT * FROM Important_Types;*/