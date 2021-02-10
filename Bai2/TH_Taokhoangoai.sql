CREATE DATABASE DB_TH_TaoKhoaNgoai
GO;

USE DB_TH_TaoKhoaNgoai
GO;

CREATE TABLE Customers(
	CustomerId		INT			IDENTITY(1,1)		PRIMARY KEY,
	FirstName		NVARCHAR(30)	NOT NULL,
	LastName		NVARCHAR(30)	NOT NULL,
	[Address]		NVARCHAR(30)	NOT NULL,
	Email			VARCHAR(30)
);

--CACH 1

CREATE TABLE Orders(
	OrderId			INT			IDENTITY(1,1)		PRIMARY KEY,
	OrderDate		DATETIME	DEFAULT	GETDATE(),
	RequiredDate	DATETIME,
	ShippedDate		DATETIME,
	CustomerId		INT			FOREIGN KEY REFERENCES Customers(CustomerId)
)

--CACH 2

CREATE TABLE ListOrders(
	OrderId			INT			IDENTITY(1,1)		PRIMARY KEY,
	OrderDate		DATETIME	DEFAULT	GETDATE(),
	RequiredDate	DATETIME,
	ShippedDate		DATETIME,
	CustomerId		INT			NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
)