USE WholeyMoleyFoods;
SELECT * FROM CustomerType;
SELECT * FROM PaymentType;
SELECT * FROM Skill;
SELECT * FROM Product;
SELECT * FROM Branch;

Delete PaymentType
dbcc Checkident (PaymentType,reseed,0)

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
('HT licence');

INSERT INTO [dbo].[Product]([ProductName], [ProductSize], [Allergens], [ListPrice], [PDescription]) 
VALUES ('sandwiches',12,'In faucibus.','29.13','Description'),
('desserts',27,'feugiat placerat','62.73','Description'),
('salads',5,'risus. Donec','77.54','Description'),
('pies',88,'sapien. Cras','48.75','Description');

INSERT INTO [dbo].[Branch]([BranchName],[AddressLine1],[AddressLine2],[City],[PostCode],[Area],[NumberOfStaff]) 
VALUES ('Aliquam Eros Turpis Company','723-1086 Erat. Rd.','Ap #389-8067 At, St.','Sukabumi','8077','Cantebury',20),
('Mus Ltd','P.O. Box 196, 5762 Maecenas Av.','4144 Eget St.','Vienna','5887','Auckland',11);