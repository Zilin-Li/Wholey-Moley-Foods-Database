USE WholeyMoleyFoods;
--L1

--Delete Skill
--dbcc Checkident (Skill,reseed,0)

INSERT INTO [dbo].[CustomerType]([TypeName]) VALUES ('VIP'),
('VVIP'),
('NORMAL');

INSERT INTO PaymentType([TypeName]) VALUES ('Credit card'),
('Debit card'),
('Cheque'),
('E-payments'),
('Money transfers');

INSERT INTO Skill([SkillName]) VALUES ('First Aid Certificate'),
('IT'),
('HT licence'),
('CISSP'),
('CCIP');

INSERT INTO Allergens([AllergensName]) VALUES ('Milk'),
('Egg'),
('Fish '),
('Tree nuts'),
('Peanuts'),
('Wheat'),
('Soybeans'),
('Crustacean shellfish');

INSERT INTO Product([ProductName], [ProductSize], [ListPrice], [PDescription]) 
VALUES ('Milk','250ml','2.99','Description'),
('Fresh salads','100g','9.54','Description'),
('Pies','500g','9.99','Description');

INSERT INTO Product([ProductName], [ProductSize], [ListPrice], [PDescription]) 
VALUES ('Gift1','1000g','784','Combo'),('Gift2','700g','564','Combo2');

INSERT INTO Branch([BranchName],[AddressLine1],[AddressLine2],[City],[PostCode],[Area],[NumberOfStaff]) 
VALUES ('Branch A','45 xx Street','Woodburry','Christchurch','8077','Cantebury',20),
('Branch B','892 xx Street','New Lynn','Auckland','8077','Auckland',45),
('Branch C','245 xx Street','Cambridge','Hamilton','8457','Waikato',11),
('Branch D','121 xx Street','TE ARO','Wellington','1546','Wellington',15),
('Branch E','724 xx Street','Lorneville','Invercargill','4842','Southland',10),
('Branch F','424 xx Street','South Dunedin','Dunedin','1154','Otago',8),
('Branch G','643 xx Street','Blaketown','Greymouth','9642','West Coast',17);

--L2

SELECT * FROM Employee;
SELECT * FROM SalePerMonth;
SELECT * FROM BranchProduct;
SELECT * FROM ProductCombo;
SELECT * FROM ProductAllergens;
SELECT * FROM Customer;

INSERT INTO Employee([FirstName],[LastName],[AddressLine1],[AddressLine2],[City],[PostCode],[DateOfBirth],[MobilePhone],[TelephoneNum],[DateOfHire],
[JobTitle],[PayRate],[BaseBranchID],[IsHiredBefore]) 
VALUES('Blair', 'Pearson','8462 Et St.','Woodburry','Baschi','4567','03/10/2020',
'(05) 5876 1481','(03) 8430 4613','10/02/2019','Sales',497.00,1,0),
('Nigel', 'Jefferson','139-2403 Vehicula Rd.','New Lynn','Verrebroek','1547','08/30/2020',
'(05) 5249 7651','(05) 1568 4683','02/15/2021','Manager',687.00,2,0),
('Patience', 'Humphrey','P.O. Box 395','Penatibus','Austin','1345','09/06/2019',
'(05) 4345 2153','(03) 23131 2313','05/09/2020','Sales',1234.00,3,1),
('Blair1', 'Pearson1','8462 Et St.','Woodburry','Baschi','4567','03/10/2020',
'(05) 5876 1481','(03) 8430 4613','10/02/2019','Sales',497.00,4,0),
('Nigel1', 'Jefferson1','139-2403 Vehicula Rd.','New Lynn','Verrebroek','1547','08/30/2020',
'(05) 5249 7651','(05) 1568 4683','02/15/2021','Manager',687.00,5,1),
('Patience1', 'Humphrey1','P.O. Box 395','Penatibus','Austin','1345','09/06/2019',
'(05) 4345 2153','(03) 23131 2313','05/09/2020','Sales',1234.00,6,0),
('Blair2', 'Pearson2','8462 Et St.','Woodburry','Baschi','4567','03/10/2020',
'(05) 5876 1481','(03) 8430 4613','10/02/2019','Sales',497.00,7,0),
('Nigel2', 'Jefferson2','139-2403 Vehicula Rd.','New Lynn','Verrebroek','1547','08/30/2020',
'(05) 5249 7651','(05) 1568 4683','02/15/2021','Manager',687.00,1,1),
('Patience2', 'Humphrey2','P.O. Box 395','Penatibus','Austin','1345','09/06/2019',
'(05) 4345 2153','(03) 23131 2313','05/09/2020','CEO',1234.00,3,0);

INSERT INTO SalePerMonth ([BranchID],[AmountPerMonth],[DataGenerationDate])
VALUES(1,464578.00,'01/01/2020'),
(1,54313247.00,'01/02/2020'),
(1,45687132.00,'01/03/2020'),
(2,53453445.00,'01/01/2020'),
(2,45345345.00,'01/02/2020'),
(2,4565676.00,'01/03/2020'),
(3,2342423.00,'01/01/2020'),
(3,7634523.00,'01/02/2020'),
(3,9764564.00,'01/03/2020');

INSERT INTO BranchProduct([BranchID],[ProductID],[ProductQuantity])
VALUES(1,1,45983),(1,2,6598),(1,3,794212),(2,1,12456),(2,2,62154),(2,3,154),
(3,1,1548),(3,2,659),(3,3,57876),(4,1,1548),(4,2,659),(5,1,1548),(5,3,57876),
(6,1,1548),(7,2,659),(7,3,57876);


INSERT INTO ProductCombo ([ProductID],[SubProductID],[SubProductQuantity])
VALUES (4,1,1),(4,2,2),(4,3,1),(5,1,4),(5,2,6);

INSERT INTO ProductAllergens([ProductID],[AllergensID])
VALUES(1,1),(3,6),(4,1),(4,6),(5,1);

INSERT INTO Customer([CustomerID],[FirstName],[LastName],[AddressLine1],[AddressLine2],[City],[PostCode],[Country],[DateOfBirth],[CustomerTypeID],[CreditStatus])
VALUES('A0000001','Jack','Simpson','8443 Quam, Street','4927 Dapibus St.','Baschi',4578,'NZ','01/05/2020',3,'approved'),
('A0000002','Olympia','Wright','8443 Quam, Street','4927 Dapibus St.','Diepenbeek',2578,'NZ','01/06/1978',3,'pending'),
('A0000003','Jack','Simpson','8443 Quam, Street','4927 Dapibus St.','Leerbeek',4148,'NZ','01/02/1987',1,'approved'),
('A0000004','Anastasia','Higgins','457 XXX, Street','BHFYU','Kansas City',9841,'NZ','01/02/1987',3,'pending'),
('A0000005','Wang','Reese','872 XXX, Street','DGFDZA','Jacksonville',8025,'NZ','01/06/1977',3,'pending'),
('A0000006','Bruno','Wheeler','932 XXX, Street','DSGDFDSF','Oberpullendorf',2365,'NZ','12/12/1966',2,'approved'),
('A0000007','Hannah','Gardner','784 XXX, Street','DFS','Narbolia',1478,'NZ','01/11/1998',1,'pending');


--L3
SELECT * FROM WorkBranch;
SELECT * FROM EmployeeSkill;
SELECT * FROM Account;

INSERT INTO Account([CustomerID],[LastPayDate],[LastPayAmount],[PaymentTypeID],[Balance])
VALUES('A0000003','01/02/2019',2457.00,4,47821.00),
('A0000002','01/03/2019',2457.00,4,784.00),
('A0000001','02/06/2019',12.00,1,1523.00),
('A0000002','03/07/2019',4.00,1,44.00),
('A0000005','04/12/2019',78.00,2,78.00),
('A0000005','05/06/2019',125.00,3,1236.00),
('A0000006','06/09/2019',13.60,4,104.00),
('A0000003','07/11/2019',45.60,1,713.00),
('A0000007','08/10/2019',33.10,1,789.00);

INSERT INTO EmployeeSkill([SkillID],[EmployeeID],[ExpirationTime])
VALUES (1,4,NULL),
(2,4,'12/11/2021'),
(4,1,NULL),
(5,2,NULL),
(1,9,NULL),
(3,3,'12/01/2022');

INSERT INTO WorkBranch([EmployeeID],[BranchID])
VALUES(1,2),(2,1),(3,3),(4,5),(5,4),(6,7),(7,1),(8,6),(9,2),(1,2);

INSERT INTO CustomerOrder([CustomerID],[AccountID],[OrderBranchID],[PickupBranchID],
[EmployeeID],[OrderDateTime],[PickupDate],[CreditAuthStatus])
VALUES ('A0000003',1,2,2,1,'01/02/2019','07/11/2019','ok'),
('A0000002',2,5,3,4,'01/03/2019','07/11/2019','ok'),
('A0000004',NULL,6,6,8,'02/03/2019','07/11/2019','ok');

INSERT INTO OrderDetail([OrderID],[BranchProductID],[OrderQuantity],[UnitPrice],[UnitPriceDiscount])
VALUES(1,1,5,45.00,0),
(2,3,1,3.99,10),
(2,3,1,2.00,0),
(3,6,10,125.00,15);