-- 1

SELECT
[Product] = REPLACE(mp.ProductID, 'PR', 'Product Id '),
[Total Item Sold] = CONVERT(VARCHAR, SUM(Quantity)) + ' pcs'
FROM MsProduct mp
JOIN ProductTransactionDetail ptd
ON mp.ProductID = ptd.ProductID
JOIN TransactionHeader th
ON ptd.ProductTransactionID = th.ProductTransactionID
JOIN MsStaff ms
ON th.StaffID = ms.StaffID
WHERE StaffGender = 'Female' AND
StaffSalary > 4000000
GROUP BY mp.productID

-- 2

SELECT
ptd.ProductTransactionID,
[Total Product Type] = COUNT(ProductID)
FROM ProductTransactionDetail ptd
JOIN TransactionHeader th
ON ptd.ProductTransactionID = th.ProductTransactionID
WHERE DATENAME(MONTH, TransactionDate) IN ('July', 'August', 'September', 'October', 'November', 'December')
GROUP BY ptd.ProductTransactionID
HAVING COUNT(ProductID) > 1

--3
SELECT 
	[Sport Field ID] = REPLACE(msf.SportFieldID, 'SF', 'Sport Field '),
	[Sport Field Address] = REPLACE(SportFieldAddress, 'Street', 'St.'),
	[Highest Transaction] = CONCAT('Rp. ', MAX(SportFieldRentingFee * RentalLength)),
	[Lowest Transaction] = CONCAT('Rp. ', MIN(SportFieldRentingFee * RentalLength))
FROM 
	MsSportField msf
	JOIN RentalTransactionDetail rtd ON msf.SportFieldID = rtd.SportFieldID
WHERE
	SportFieldRentingFee < 50000
	AND RIGHT(msf.SportFieldID, 1) IN (1,3,5,7,9)
GROUP BY
	msf.SportFieldID, SportFieldAddress

--4

SELECT
	msf.SportFieldID,
	[Staff Salary Deviation] = CONCAT('Rp. ', (MAX(StaffSalary) - MIN(StaffSalary)))
FROM
	MsSportField msf
	JOIN RentalTransactionDetail rtd ON rtd.SportFieldID = msf.SportFieldID
	JOIN TransactionHeader th ON th.RentalTransactionID = rtd.RentalTransactionID
	JOIN MsStaff ms ON th.StaffID = ms.StaffID
WHERE
	RIGHT(msf.SportFieldID, 1) IN (1,3,5,7,9)
GROUP BY
	msf.SportFieldID
HAVING
	(MAX(StaffSalary) - MIN(StaffSalary)) >= 1000000

--5

SELECT
	[Staff ID] = LOWER(ms.StaffID),
	[Staff Name] = UPPER(StaffName),
	[Staff Gender] = LEFT(StaffGender, 1),
	RentalTransactionID, CustomerName
FROM
	MsStaff ms
	JOIN TransactionHeader th ON th.StaffID = ms.StaffID
	JOIN MsCustomer mc ON mc.CustomerID = th.CustomerID
WHERE
	LEFT(StaffGender, 1) LIKE 'F'
GROUP BY
	ms.StaffID, StaffName, StaffGender, 
	RentalTransactionID, CustomerName, StaffSalary
HAVING
	StaffSalary = MAX(StaffSalary)

-- 6

SELECT DISTINCT
mc.CustomerID, 
CustomerName,
[Customer Age] = CONVERT(VARCHAR, CustomerAge) + ' Years Old',
[CustomerPhone] = '+62' + SUBSTRING(CustomerPhone, 3, LEN(CustomerPhone))
FROM MsCustomer mc
JOIN TransactionHeader th
ON mc.CustomerID = th.CustomerID
JOIN ProductTransactionDetail ptd
ON th.ProductTransactionID = ptd.ProductTransactionID, (
	SELECT CustomerID
	FROM MsCustomer
	GROUP BY CustomerID, CustomerAge
	HAVING CustomerAge = MIN(CustomerAge)
) AS X
WHERE x.CustomerID = mc.CustomerID 
GROUP BY mc.CustomerID, CustomerName, CustomerPhone, CustomerAge, Quantity
HAVING Quantity < 50

-- 7

SELECT 
[Category] = 'Most Expensive Product',
[ProductName] = UPPER(ProductName),
[ProductPrice] = 'Rp.' + CONVERT(VARCHAR, ProductPrice)
FROM MsProduct mp, (
SELECT ProductID
FROM MsProduct
GROUP BY ProductID, ProductPrice
HAVING ProductPrice = MAX(ProductPrice)
) AS X
WHERE mp.ProductID = x.ProductID
GROUP BY ProductName, ProductPrice
UNION
SELECT
[Category] = 'Most Affordable Product',
[ProductName] = UPPER(ProductName),
[ProductPrice] = 'Rp.' + CONVERT(VARCHAR, ProductPrice)
FROM MsProduct mp, (
SELECT ProductID
FROM MsProduct
GROUP BY ProductID, ProductPrice
HAVING ProductPrice = MIN(ProductPrice)
) AS X
WHERE mp.ProductID = x.ProductID
GROUP BY ProductName, ProductPrice

--8
SELECT 
	[ProductTransactionID] = REPLACE(ptd.ProductTransactionID, 'PT', 'Product Transaction ID '),
	[DATE] = CONVERT(nvarchar, TransactionDate, 107),
	mc.CustomerID,
	[Customer Name] = UPPER(CustomerName),
	ms.StaffID,
	StaffGender = LEFT(StaffGender, 1)
FROM
	ProductTransactionDetail ptd
	JOIN TransactionHeader th ON ptd.ProductTransactionID = th.ProductTransactionID
	JOIN MsCustomer mc ON mc.CustomerID = th.CustomerID
	JOIN MsStaff ms ON ms.StaffID = th.StaffID,
	( SELECT [Average] = AVG(StaffSalary)
		FROM MsStaff) a
WHERE
	StaffSalary > a.Average
GROUP BY
	ptd.ProductTransactionID, TransactionDate, mc.CustomerID, CustomerName, ms.StaffID, StaffGender, TransactionDate
HAVING
	TransactionDate = MIN(TransactionDate)

-- 9
GO
CREATE VIEW annualMonthlyRentalReport AS
SELECT [Yearly Rental Revenue] = SUM(RentalLength * SportFieldRentingFee), 
[Average Rental Revenue] = AVG(RentalLength * SportFieldRentingFee)
FROM RentalTransactionDetail rtd
JOIN MsSportField msf
ON msf.SportFieldID = rtd.SportFieldID
JOIN TransactionHeader ph
ON ph.RentalTransactionID = rtd.RentalTransactionID
WHERE DATENAME(MONTH,TransactionDate) = 'December' AND SportFieldRentingFee > 30000

-- 10
GO
CREATE VIEW annualMonthlyProductReport AS
SELECT 
[Yearly Product Revenue] = Quantity * ProductPrice,
[Average Product Revenue] = AVG(Quantity * ProductPrice)
FROM TransactionHeader th
JOIN ProductTransactionDetail ptd
ON th.ProductTransactionID = ptd.ProductTransactionID
JOIN MsProduct mp
ON mp.ProductID = ptd.ProductID
WHERE DATENAME(MONTH, TransactionDate) = 'January' AND
ProductPrice > 30000
GROUP BY Quantity, ProductPrice