CREATE DATABASE JettSportsCenter

GO

USE JettSportsCenter

GO

CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY NOT NULL CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(100) NOT NULL CHECK(LEN(StaffName) > 4),
	StaffGender VARCHAR(20) NOT NULL CHECK(StaffGender IN ('Male', 'Female')) ,
	StaffSalary INT NOT NULL CHECK(StaffSalary >= 1000000)
)

GO

CREATE TABLE MsCustomer(
	CustomerID CHAR(5) PRIMARY KEY NOT NULL CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]') ,
	CustomerName VARCHAR(100) NOT NULL CHECK(CustomerName LIKE '% %'),
	CustomerAge INT NOT NULL CHECK(CustomerAge >= 6),
	CustomerPhone VARCHAR(10) NOT NULL CHECK(LEN(CustomerPhone) = 10)
)

GO

CREATE TABLE MsSportField(
	SportFieldID CHAR(5) PRIMARY KEY NOT NULL CHECK(SportFieldID LIKE 'SF[0-9][0-9][0-9]'),
	SportFieldName VARCHAR(100) NOT NULL CHECK(SportFieldName LIKE '% Field'),
	SportFieldAddress VARCHAR(255) NOT NULL CHECK(SportFieldAddress LIKE '% Street'),
	SportFieldRentingFee INT CHECK(SportFieldRentingFee BETWEEN 10000 AND 100000)
)

GO

CREATE TABLE MsProduct(
	ProductID CHAR(5) PRIMARY KEY NOT NULL CHECK(ProductID LIKE 'PR[0-9][0-9][0-9]'),
	ProductName VARCHAR(100) NOT NULL CHECK(LEN(ProductName) >= 4),
	ProductPrice INT NOT NULL CHECK(ProductPrice BETWEEN 10000 AND 1000000)
)

GO

CREATE TABLE RentalTransactionDetail(
	RentalTransactionID CHAR(5) PRIMARY KEY NOT NULL CHECK(RentalTransactionID LIKE 'RT[0-9][0-9][0-9]'),
	SportFieldID CHAR(5) FOREIGN KEY REFERENCES MsSportField(SportFieldID),
	RentalLength INT NOT NULL CHECK(RentalLength >= 1)
)

GO

CREATE TABLE ProductTransactionDetail(
	ProductTransactionID CHAR(5) PRIMARY KEY NOT NULL CHECK(ProductTransactionID LIKE 'PT[0-9][0-9][0-9]'),
	ProductID CHAR(5) FOREIGN KEY REFERENCES MsProduct(ProductID),
	Quantity INT NOT NULL CHECK(Quantity >= 1)
)

GO

CREATE TABLE TransactionHeader(
	TransactionID CHAR(5) PRIMARY KEY NOT NULL CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	ProductTransactionID CHAR(5) FOREIGN KEY REFERENCES ProductTransactionDetail(ProductTransactionID),
	RentalTransactionID CHAR(5) FOREIGN KEY REFERENCES RentalTransactionDetail(RentalTransactionID),
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID),
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID),
	TransactionDate DATE NOT NULL CHECK(YEAR(TransactionDate) = YEAR(GETDATE()))
)