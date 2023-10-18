USE JettSportsCenter

GO

INSERT INTO MsSportField
VALUES
('SF001','Las Vegas Volleyball Field','Shandy Shores 8 Street',15000),
('SF002','Sunib Soccer Field','Alsut 88 Street',25000),
('SF003','Laurent Baseball Field','Alam Sutera Street',45000),
('SF004','Rising Star Basketball Field','Jl.Feronia 2 Street',25000),
('SF005','Tiki Taka Football Field','18 Graha Street',35000),
('SF006','Smackdown Tennis Field','Wrestlemania 69 Street',80000),
('SF007','Raw meat Hockey Field','Paleto boulevard Street',65000),
('SF008','Master Yoda Soccer Field','Skywalker 77 Street',70000),
('SF009','Dean Ambrose Basketball Field','Shield 99 Street',55000),
('SF010','Triple H Baseball Field','Mcmahon Family 87 Street',66000),
('SF011','Captain Morgan Volleyball Field','Holywings 96 Street',25000)

INSERT INTO MsProduct
VALUES
('PR001','Dumbbell 1KG','25000'),
('PR002','Dumbbell 5KG','50000'),
('PR003','Dumbbell 10KG','200000'),
('PR004','Dumbbell 15KG','250000'),
('PR005','Dumbbell 20KG','300000'),
('PR006','Treadmill','500000'),
('PR007','Pull Up Bar','700000'),
('PR008','Gym Ball','850000'),
('PR009','Skipping Rope','65000'),
('PR010','Yoga Matt','100000')


INSERT INTO MsStaff
VALUES 
('ST001','Sofia Camen','Female','2500000'),
('ST002','Nick Jones','Male','6000000'),
('ST003','Howard Bright','Male','4500000'),
('ST004','Shawn Michael','Male','1500000'),
('ST005','Natalia Alicia','Female','2000000'),
('ST006','Roman Reigns','Male','3500000'),
('ST007','Carolina Marin','Female','5000000'),
('ST008','Albert Williams','Male','2000000'),
('ST009','Kylie Clarke','Female','5500000'),
('ST010','Clay Erickson','Male','4000000'),
('ST011','Kate Bishop','Female','7000000')

INSERT INTO MsCustomer
VALUES
('CU001','Stephanie McMahon','32','0823554578'),
('CU002','Sin Cara Vaint','36','0852114985'),
('CU003','Brock Lesnar','43','0813669624'),
('CU004','Conor McGregor','39','0825462587'),
('CU005','Randy Orton','28','0854746852'),
('CU006','Paris Pernandes','21','0832587652'),
('CU007','Nikki Bella','32','0813224625'),
('CU008','John Wick P','46','0822454632'),
('CU009','Max Verstappen','23','0825226597'),
('CU010','Jorge Lorenzo','16','0812458326'),
('CU011','Alex Albon','17','0854754826')

GO

INSERT INTO ProductTransactionDetail 
VALUES
('PT001','PR001',1),
('PT002','PR003',3),
('PT003','PR009',8),
('PT004','PR002',4),
('PT005','PR005',7),
('PT006','PR004',3),
('PT007','PR007',2),
('PT008','PR010',4),
('PT009','PR006',6),
('PT010','PR008',9),
('PT011','PR004',4),
('PT012','PR003',3),
('PT013','PR009',8),
('PT014','PR002',4),
('PT015','PR005',7),
('PT016','PR004',3),
('PT017','PR007',2),
('PT018','PR010',4),
('PT019','PR006',6),
('PT020','PR008',9),
('PT021','PR004',4),
('PT022','PR003',3),
('PT023','PR009',8),
('PT024','PR002',4),
('PT025','PR005',7)

INSERT INTO RentalTransactionDetail
VALUES
('RT001','SF010',5),
('RT002','SF006',2),
('RT003','SF008',3),
('RT004','SF002',7),
('RT005','SF006',9),
('RT006','SF009',2),
('RT007','SF010',1),
('RT008','SF004',5),
('RT009','SF003',3),
('RT010','SF002',4),
('RT011','SF005',6),
('RT012','SF008',3),
('RT013','SF009',4),
('RT014','SF006',5),
('RT015','SF004',7),
('RT016','SF005',2),
('RT017','SF002',5),
('RT018','SF006',4),
('RT019','SF001',6),
('RT020','SF003',1),
('RT021','SF007',3),
('RT022','SF009',2),
('RT023','SF005',5),
('RT024','SF004',6),
('RT025','SF006',4)

GO

INSERT INTO TransactionHeader
VALUES
('TR001','PT005','RT007','ST003','CU002','2022-12-14'),
('TR002','PT002','RT022','ST006','CU006','2022-03-21'),
('TR003','PT012','RT002','ST001','CU009','2022-01-04'),
('TR004','PT007','RT005','ST004','CU010','2022-04-13'),
('TR005','PT021','RT004','ST008','CU004','2022-06-02'),
('TR006','PT004','RT012','ST006','CU006','2022-07-17'),
('TR007','PT018','RT009','ST011','CU003','2022-01-18'),
('TR008','PT009','RT003','ST003','CU007','2022-05-25'),
('TR009','PT004','RT015','ST011','CU008','2022-01-12'),
('TR010','PT003','RT014','ST002','CU009','2022-09-06'),
('TR011','PT019','RT006','ST004','CU006','2022-10-09'),
('TR012','PT017','RT008','ST005','CU004','2022-11-07'),
('TR013','PT005','RT009','ST004','CU005','2022-02-15'),
('TR014','PT014','RT013','ST006','CU002','2022-06-09'),
('TR015','PT001','RT002','ST011','CU003','2022-12-08')



