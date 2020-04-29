USE WholeyMoleyFoods;
-- test all tables
SELECT * FROM [dbo].[Account]
SELECT * FROM [dbo].[Allergens]
SELECT * FROM [dbo].[Branch]
SELECT * FROM [dbo].[BranchProduct]
SELECT * FROM [dbo].[Customer]
SELECT * FROM [dbo].[CustomerOrder]
SELECT * FROM [dbo].[CustomerType]
SELECT * FROM [dbo].[Employee] 
SELECT * FROM [dbo].[EmployeeSkill] 
SELECT * FROM [dbo].[OrderDetail] 
SELECT * FROM [dbo].[PaymentType] 
SELECT * FROM [dbo].[Product] 
SELECT * FROM [dbo].[ProductAllergens] 
SELECT * FROM [dbo].[ProductCombo]
SELECT * FROM [dbo].[SalePerMonth]
SELECT * FROM [dbo].[Skill]
SELECT * FROM [dbo].[WorkBranch]

-- get staff names who have IT skill
SELECT e.FirstName, e.LastName FROM EmployeeSkill es
	INNER JOIN Employee e on e.EmployeeID = es.EmployeeID
	INNER JOIN Skill s on s.SkillID = es.SkillID
	WHERE s.SkillName = 'IT'



--get all staff names who work at Branch B
SELECT e.FirstName, e.LastName FROM WorkBranch wb
	INNER JOIN Employee e  on e.EmployeeID = wb.EmployeeID
	INNER JOIN Branch b on b.BranchID = wb.BranchID
	WHERE b.BranchName = 'Branch B'


--Emplyee to CustomerOrder  line not currect point to Emplyee ID
--get all customerOrder dealed by staff(Blair Pearson)
SELECT * FROM CustomerOrder o
	INNER JOIN Employee e on e.EmployeeID = o.EmployeeID
	WHERE e.FirstName = 'Blair' and e.LastName = 'Pearson'


--get all Branch B's salePerMonth records
SELECT s.AmountPerMonth, s.DataGenerationDate FROM SalePerMonth s
	INNER JOIN Branch b on b.BranchID = s.BranchID
	WHERE b.BranchName = 'Branch B'


--get all VIP customers' name and all their payment Types
SELECT c.FirstName, c.LastName, p.TypeName from Customer c
	INNER JOIN Account a on a.CustomerID = c.CustomerID
	INNER JOIN CustomerType t on t.CustomerTypeID = c.CustomerTypeID
	INNER JOIN PaymentType p on p.PaymentTypeID = a.PaymentTypeID
	WHERE t.TypeName = 'VIP'



--get all items for order 1, and display few colums
SELECT co.OrderID,p.ProductName, od.OrderQuantity, od.UnitPrice, b.BranchName FROM  OrderDetail od
	INNER JOIN CustomerOrder co on od.OrderID = co.OrderID
	INNER JOIN BranchProduct bp on bp.BranchProductID = od.BranchProductID
	INNER JOIN Product p on p.ProductID = bp.ProductID
	INNER JOIN Branch b on b.BranchID = bp.BranchID
	WHERE co.OrderID = 1