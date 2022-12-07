/* Final Project Procedures 
-- Retrieves and displays data
USE AP;
GO
CREATE PROC spVendorPhone
AS
SELECT VendorID, VendorName, VendorPhone FROM Vendors
ORDER BY VendorName;
GO
EXEC spVendorPhone;

-- Takes an input parameter
USE AP;
GO
CREATE PROC spVendorSt
	@VendorSt char(2)
AS
BEGIN
	SELECT * FROM Vendors
	WHERE VendorState = @VendorSt;
END
GO
EXEC spVendorSt CA

-- Takes one input parameter and returns three output parameters
USE AP;
GO
CREATE PROC spVendorContact
	@VendorID int,
	@VendorName varchar(50) OUTPUT,
	@VendorPhone varchar(50) OUTPUT,
	@VendorContactFName varchar(50) OUTPUT,
	@VendorContactLName varchar(50) OUTPUT
AS
SELECT @VendorName = VendorName, @VendorPhone = VendorPhone, @VendorContactFName = VendorContactFName, @VendorContactLName = VendorContactLName
FROM Vendors
WHERE VendorID = @VendorID;
GO 
-- Run the procedure
DECLARE @VendorName varchar(50);
DECLARE @Phone varchar(50);
DECLARE @FirstName varchar(50);
DECLARE @LastName varchar(50);
EXEC spVendorContact 11, @VendorName OUTPUT, @Phone OUTPUT, @FirstName OUTPUT, @LastName OUTPUT;
SELECT @VendorName AS 'Vendor Name', @Phone AS 'Phone Number', @FirstName AS 'Vendor First Name', @LastName AS 'Vendor Last Name'; 

-- Stored procedure that has a return value 
USE Northwind;
GO
CREATE PROC spOrderCount
AS
DECLARE @OrderCount int;
SELECT @OrderCount = COUNT(*)
FROM Orders
RETURN @OrderCount;
GO 

DECLARE @OrderCount int;
EXEC @OrderCount = spOrderCount;
PRINT 'There are ' + CONVERT(varchar, @CustomerCount) + ' orders.';
GO */

/* Final Project User Defined Functions
-- creates the function
USE ProductOrders;
GO
CREATE FUNCTION fnGetTitle
    (@ItemTitle nvarchar(50) = '%')
    RETURNS int
BEGIN
    RETURN (SELECT ItemID FROM Items WHERE Title Like @ItemTitle);
END; 

-- uses the function
GO
SELECT ItemID, Title, Artist, UnitPrice FROM Items
WHERE ItemID = dbo.fnGetTitle('U%'); 

USE ProductOrders;
GO
CREATE FUNCTION fnItems
	(@Title nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Items WHERE Title LIKE @Title);
GO
SELECT * FROM dbo.fnItems('%The%'); */

/* Final Project User Defined Functions 
-- creates the function
USE ProductOrders;
GO
CREATE FUNCTION fnGetTitle
    (@ItemName nvarchar(50) = '%')
    RETURNS int
BEGIN
    RETURN (SELECT Item# FROM Products WHERE ItemName Like @ItemName);
END; 

-- uses the function
GO
SELECT Item#, ItemDescription, Price FROM Products 
WHERE Item# = dbo.fnGetItem('Brownie%');

USE SugarBakers;
GO
CREATE FUNCTION fnProducts
	(@ItemName nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Products WHERE ItemName LIKE @ItemName);
GO
SELECT * FROM dbo.fnProducts('%B%'); */

 /* Final Project Triggers 

 -- create archive table by copying customer table without any rows
 USE Northwind;
 GO
 SELECT EmployeeID, Firstname, LastName INTO DecemberEmployees
 FROM Employees
 WHERE 1=0; 
 
 -- update CustomerTransaction table and add activity column for status
 ALTER TABLE DecemberEmployees
 ADD Activity varchar(50); 
GO

 -- create insert trigger
 CREATE TRIGGER DecemberEmployees_INSERT ON Employees
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeID int
	DECLARE @FirstName nvarchar(10)
	DECLARE @LastName nvarchar(20)

    SELECT @EmployeeID = INSERTED.EmployeeID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName
	FROM INSERTED

    INSERT INTO DecemberEmployees VALUES(@EmployeeID, @FirstName, @LastName, 'Inserted' )
END 
GO 
-- add row into customer to test insert trigger
INSERT INTO Customers VALUES(1,'Fred','Flintstone');
GO
-- view data in customer archive
SELECT * FROM DecemberEmployees;
GO
 -- create delete trigger
 CREATE TRIGGER DecemberEmployees_DELETE ON Employees
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeID int
	DECLARE @FirstName nvarchar(10)
	DECLARE @LastName nvarchar(20)

    SELECT @EmployeeID = DELETED.EmployeeID, @FirstName = DELETED.FirstName, @LastName = DELETED.LastName
	FROM DELETED

    INSERT INTO DecemberEmployees VALUES(@EmployeeID,@FirstName, @LastName, 'Deleted' )
END
GO
-- delete row from customer to test delete trigger
DELETE FROM Employees WHERE EmployeeID = 1;
GO

-- view data in customer archive
SELECT * FROM DecemberEmployees;

GO
 -- create update trigger
 CREATE TRIGGER DecemberEmployees_UPDATE ON Employees
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeID int
	DECLARE @FirstName nvarchar(10)
	DECLARE @LastName nvarchar(20)

    SELECT @EmployeeID =INSERTED.EmployeeID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName
	FROM INSERTED

	-- Since all the data is being written to the archive table, there is no need to identify what was changed
    INSERT INTO DecemberEmployees VALUES(@EmployeeID,@FirstName, @LastName, 'Updated' )
END
GO
-- insert a new row and then update the row (this will test the insert and update triggers)
INSERT INTO DecemberEmployees VALUES(5253,'Wilma','Flintstone');
GO
UPDATE Customers 
SET FirstName = 'Carl'
WHERE CustomerID = 5253;
GO
-- view data in customer archive
SELECT * FROM DecemberEmployees; */