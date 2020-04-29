CREATE DATABASE WholeyMoleyFoods

USE WholeyMoleyFoods;

--L5
Drop table OrderDetail;
--L4
Drop table CustomerOrder;
--L3
Drop table WorkBranch;
Drop table EmployeeSkill;
Drop table Account;
--L2
Drop table Employee;
Drop table SalePerMonth;
Drop table BranchProduct;
Drop table ProductCombo;
Drop table ProductAllergens;
Drop table Customer;
--L1
Drop table Skill;
Drop table Product;
Drop table Branch;
Drop table Allergens;
Drop table CustomerType;
Drop table PaymentType;

--L1

CREATE TABLE PaymentType
(
PaymentTypeID INTEGER IDENTITY(1,1)  PRIMARY KEY,
TypeName VARCHAR(15)
);

CREATE TABLE CustomerType
(
CustomerTypeID INTEGER IDENTITY(1,1)  PRIMARY KEY,
TypeName VARCHAR(15)
);

CREATE TABLE Skill
(
SkillID INTEGER IDENTITY(1,1)  PRIMARY KEY,
SkillName VARCHAR(30),
);

CREATE TABLE Allergens
(
AllergensID INTEGER IDENTITY(1,1)  PRIMARY KEY,
AllergensName VARCHAR(20)
);

CREATE TABLE Product
(
ProductID INTEGER IDENTITY(1,1)  PRIMARY KEY,
ProductName VARCHAR(35),
ProductSize VARCHAR(15),
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

--L2

CREATE TABLE Customer
(
CustomerID CHAR(8) PRIMARY KEY,
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

CREATE TABLE SalePerMonth
(
SalePerMonthID INTEGER IDENTITY(1,1)  PRIMARY KEY,
BranchID INTEGER,
AmountPerMonth DECIMAL(10,2),
DataGenerationDate DATETIME,
FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
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


CREATE TABLE ProductCombo
(
ProductComboID INTEGER IDENTITY(1,1)  PRIMARY KEY,
ProductID INTEGER,
SubProductID INTEGER,
SubProductQuantity INTEGER,
FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
FOREIGN KEY (SubProductID) REFERENCES Product (ProductID),
);

CREATE TABLE ProductAllergens
(
PAllergensID INTEGER IDENTITY(1,1)  PRIMARY KEY,
ProductID INTEGER,
AllergensID INTEGER,
FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
FOREIGN KEY (AllergensID) REFERENCES Allergens (AllergensID),
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

--L3
CREATE TABLE Account
(
AccountID INTEGER IDENTITY(1,1)  PRIMARY KEY,
CustomerID CHAR(8),
LastPayDate DATETIME,
LastPayAmount DECIMAL (6,2),
PaymentTypeID INTEGER,
Balance DECIMAL (8,2),
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
FOREIGN KEY (PaymentTypeID) REFERENCES PaymentType (PaymentTypeID),
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

CREATE TABLE WorkBranch
(
WorkBranchID INTEGER IDENTITY(1,1)  PRIMARY KEY,
EmployeeID INTEGER,
BranchID INTEGER,
FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

--L4

CREATE TABLE CustomerOrder
(
OrderID INTEGER IDENTITY(1,1)  PRIMARY KEY,
CustomerID CHAR(8),
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

--L5
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

