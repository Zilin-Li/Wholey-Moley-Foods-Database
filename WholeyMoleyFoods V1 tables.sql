CREATE DATABASE WholeyMoleyFoods

Drop table OrderDetail;
Drop table CustomerOrder;
Drop table WorkBranch;
Drop table EmployeeSkill;
Drop table Employee;
Drop table BranchProduct;
Drop table Account;
Drop table SalePerMonth;
Drop table ProductCombo;
Drop table Customer;
Drop table Skill;
Drop table Product;
Drop table CustomerType;
Drop table PaymentType;
Drop table Branch;

USE WholeyMoleyFoods;

CREATE TABLE CustomerType
(
CustomerTypeID INTEGER IDENTITY(1,1)  PRIMARY KEY,
TypeName VARCHAR(15)
);

CREATE TABLE PaymentType
(
PaymentTypeID INTEGER IDENTITY(1,1)  PRIMARY KEY,
TypeName VARCHAR(15)
);

CREATE TABLE Skill
(
SkillID INTEGER IDENTITY(1,1)  PRIMARY KEY,
SkillName VARCHAR(30),
);


CREATE TABLE Product
(
ProductID INTEGER IDENTITY(1,1)  PRIMARY KEY,
ProductName VARCHAR(35),
ProductSize VARCHAR(15),
Allergens VARCHAR(150),
ListPrice DECIMAL(6,2),
PDescription VARCHAR(300)
);


CREATE TABLE Branch
(
BranchID INTEGER IDENTITY(1,1)  PRIMARY KEY,
BranchName VARCHAR(30),
AddressLine1 VARCHAR(40),
AddressLine2 VARCHAR(40),
City VARCHAR(20),
PostCode CHAR(4),
Area VARCHAR(30),
NumberOfStaff INTEGER,
);

CREATE TABLE Customer
(
CustomerID INTEGER IDENTITY(1,1)  PRIMARY KEY,
FirstName VARCHAR(25),
LastName VARCHAR(25),
AddressLine1 VARCHAR(40),
AddressLine2 VARCHAR(40),
City VARCHAR(20),
PostCode CHAR(4),
Country VARCHAR(25),
DateOfBirth DATE,
CustomerTypeID INTEGER,
CreditStatus VARCHAR(20),
FOREIGN KEY (CustomerTypeID) REFERENCES  [dbo].[CustomerType]([CustomerTypeID])
);

CREATE TABLE ProductCombo
(
ProductComboID INTEGER IDENTITY(1,1)  PRIMARY KEY,
ProductID INTEGER,
SubProductID INTEGER,
FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
FOREIGN KEY (SubProductID) REFERENCES Product (ProductID),
);

CREATE TABLE SalePerMonth
(
SalePerMonthID INTEGER IDENTITY(1,1)  PRIMARY KEY,
BranchID INTEGER,
AmountPerMonth DECIMAL(8,2),
DataGenerationDate DATETIME,
FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
);

CREATE TABLE Account
(
AccountID INTEGER IDENTITY(1,1)  PRIMARY KEY,
CustomerID INTEGER,
LastPayDate DATETIME,
LastPayAmount DECIMAL (6,2),
PaymentTypeID INTEGER,
Balance DECIMAL (8,2),
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
FOREIGN KEY (PaymentTypeID) REFERENCES PaymentType (PaymentTypeID),
);


CREATE TABLE BranchProduct
(
BranchProductID INTEGER IDENTITY(1,1)  PRIMARY KEY,
BranchID INTEGER,
ProductID INTEGER,
ProductQuantity INTEGER,
FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
);


CREATE TABLE Employee
(
EmployeeID INTEGER IDENTITY(1,1)  PRIMARY KEY,
FirstName VARCHAR(25),
LastName VARCHAR(25),
AddressLine1 VARCHAR(40),
AddressLine2 VARCHAR(40),
City VARCHAR(20),
PostCode CHAR(4),
DateOfBirth DATE,
MobilePhone VARCHAR(20),
TelephoneNum VARCHAR(20),
DateOfHire DATE,
JobTitle VARCHAR(25),
PayRate Decimal (6,2),
BaseBranchID INTEGER,
IsHiredBefore BIT,
FOREIGN KEY (BaseBranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE CustomerOrder
(
OrderID INTEGER IDENTITY(1,1)  PRIMARY KEY,
CustomerID INTEGER,
AccountID INTEGER,
OrderBranchID INTEGER,
PickupBranchID INTEGER,
EmployeeID INTEGER,
OrderDateTime DATETIME,
PickupDate DATE,
CreditAuthStatus VARCHAR(15),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
FOREIGN KEY (OrderBranchID) REFERENCES Branch(BranchID),
FOREIGN KEY (PickupBranchID) REFERENCES Branch(BranchID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE WorkBranch
(
WorkBranchID INTEGER IDENTITY(1,1)  PRIMARY KEY,
EmployeeID INTEGER,
BranchID INTEGER,
FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE EmployeeSkill
(
EmployeeSkillID INTEGER IDENTITY(1,1)  PRIMARY KEY,
SkillID INTEGER,
EmployeeID INTEGER,
ExpirationTime	Date,
FOREIGN KEY (SkillID) REFERENCES Skill(SkillID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE OrderDetail
(
OrderDetailID INTEGER IDENTITY(1,1)  PRIMARY KEY,
OrderID INTEGER,
BranchProductID INTEGER,
OrderQuantity INTEGER,
UnitPrice DECIMAL(6,2),
UnitPriceDiscount INTEGER,
FOREIGN KEY (OrderID) REFERENCES CustomerOrder(OrderID),
FOREIGN KEY (BranchProductID) REFERENCES BranchProduct(BranchProductID)
);

