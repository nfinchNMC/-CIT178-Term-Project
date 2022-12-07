CREATE DATABASE CoastalServices
GO
USE CoastalServices;
CREATE TABLE Corporation(
	ID int NOT NULL,
	CompanyName varchar(40) NOT NULL,
	ZipCode varchar(6) NOT NULL,
	OwnerID varchar(3) NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE Subsidiaries(
	ID int NOT NULL,
	EstablishmentName varchar(40) NOT NULL,
	CorpID int NOT NULL,
	TypeID varchar(3) NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE EstablishmentType(
	establishmentTypeID varchar(3) NOT NULL,
	EstablishmentType varchar(30) NOT NULL,
	PRIMARY KEY(establishmentTypeID)
);
GO
CREATE TABLE Ownership(
	ownershipID varchar(3) NOT NULL,
	lName varchar(20) NOT NULL,
	fName varchar(20) NOT NULL,
	PRIMARY KEY(ownershipID)
);
GO
CREATE TABLE ZipCode(
	Zip varchar(6) NOT NULL,
	state varchar(40) NOT NULL,
	city varchar(40) NOT NULL,
	PRIMARY KEY(Zip)
);
GO
CREATE TABLE Employees(
	ID int NOT NULL,
	FirstName varchar(40) NOT NULL,
	LastName varchar(40) NOT NULL,
	SubsidiaryID int NOT NULL,
	Salary money NOT NULL,
	Title varchar(40) NULL,
	PRIMARY KEY(ID)
);