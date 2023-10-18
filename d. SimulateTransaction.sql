Use JettSportsCenter
GO

--Alex Albon rents Sunib Soccer Field for 7 hours 
--and bought three of Dumbbell 15KG
--with staff Nick Jones at 
--28th March 2022

INSERT INTO ProductTransactionDetail VALUES
('PT026', 'PR004', 3)

INSERT INTO RentalTransactionDetail VALUES
('RT026', 'SF002', 7)
GO

INSERT INTO TransactionHeader VALUES
('TR016', 'PT026', 'RT026', 'ST002', 'CU001', '2022-3-28')



--A new customer, Lumine Lily, 20 years old with 2000000 salary
--and has a phone number 0828328283
--rents Laurent Baseball Field for 4 hours
--and bought one of Treadmill
--with staff Shawn Michael at
--30th March 2022

INSERT INTO MsCustomer VALUES
('CU012', 'Lumine Lily', 20, '0828328283')
GO

INSERT INTO ProductTransactionDetail VALUES
('PT027', 'PR004', 1)

INSERT INTO RentalTransactionDetail VALUES
('RT027', 'SF003', 4)
GO

INSERT INTO TransactionHeader VALUES
('TR017', 'PT027', 'RT027', 'ST004', 'CU012', '2022-3-30')