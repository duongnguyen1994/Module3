CREATE DATABASE TH_Thaotacvoibang
GO

USE TH_Thaotacvoibang
GO
--CREATE TABLE
CREATE TABLE Persons(
	PersonID		INT				IDENTITY		PRIMARY KEY,
	LastName		NVARCHAR(20)	NOT NULL,
	FirstName		NVARCHAR(20)	NOT NULL,
	Age				INT
);

CREATE TABLE Suppliers(
	SupplierID		INT				IDENTITY		PRIMARY KEY,
	SupplierName	VARCHAR(20)	NOT NULL,
	AccountRep		VARCHAR(30)		NOT NULL		DEFAULT 'TBD'
);

--DROP TABLE

DROP TABLE Persons, Suppliers;

--ALTER TABLE
	--ADD MORE COLUMNS
ALTER TABLE Persons
	ADD [Address]	NVARCHAR(30),
		Class		VARCHAR(10);

	--ALTER COLUMNS
ALTER TABLE Suppliers
	ALTER COLUMN SupplierName NVARCHAR(30)	NOT NULL

	--DROP COLUMNS
ALTER TABLE Persons
	DROP COLUMN
		LastName,
		Age;

--CHANGE COLUMN NAME
EXEC sp_rename 'Persons.Address', 'Add', 'COLUMN'

--CHANGE TABLE NAME
EXEC sp_rename 'Persons','People';
