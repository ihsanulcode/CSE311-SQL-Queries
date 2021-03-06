# if you're installing this on your own computer, un-comment and run the following lines, so that you place the tables into their own schema
drop schema if exists Assignment2;
create schema Assignment2;
use Assignment2;

SET foreign_key_checks = 0;

drop table if exists Supplier;
drop table if exists Delivery;
Drop table if exists Item;
drop table if exists Department;
drop table if exists Employee;
drop table if exists Sale;


CREATE TABLE Item (
	ItemID	SMALLINT,
	ItemName	VARCHAR(50)	NOT NULL,
	ItemType 	CHAR(1),
	ItemColour 	VARCHAR(20),
	PRIMARY KEY (ItemID)
);

CREATE TABLE Employee (
	EmployeeID      SMALLINT,
	EmployeeName    VARCHAR(50),
	EmployeeSalary  DECIMAL(8,2),
	DepartmentID    SMALLINT,
	BossID  SMALLINT,
	PRIMARY KEY (EmployeeID),
  FOREIGN KEY (BossID) references Employee(EmployeeID),
  FOREIGN KEY (DepartmentID) references Department(DepartmentID)
);

CREATE TABLE Department (
DepartmentID	    SMALLINT,
DepartmentName	  VARCHAR(50) 	NOT NULL,
DepartmentFloor 	INTEGER,
DepartmentPhone 	INTEGER,
ManagerID 	      SMALLINT	 NOT NULL,
PRIMARY KEY (DepartmentID),
FOREIGN KEY (ManagerID) references Employee(EmployeeID)
);



CREATE TABLE Sale (
	SaleID	INTEGER 	NOT NULL,
	SaleQTY	INTEGER,
	ItemID 	SMALLINT	NOT NULL,
	DepartmentID 	SMALLINT	NOT NULL,
	PRIMARY KEY (SaleID),
FOREIGN KEY (ItemID) references Item(ItemID),
FOREIGN KEY (DepartmentID) references Department(DepartmentID)
);

CREATE TABLE Supplier (
	SupplierID 	SMALLINT	NOT NULL,
	SupplierName	VARCHAR(25),
	SupplierPhone	VARCHAR(16),
	PRIMARY KEY (SupplierID)
);

CREATE TABLE Delivery (
	DeliveryID 	INTEGER 	NOT NULL,
	DeliveryQTY	INTEGER 	NOT NULL,
	ItemID	SMALLINT 	NOT NULL,
	DepartmentID	SMALLINT 	NOT NULL,
	SupplierID	SMALLINT	NOT NULL,
	PRIMARY KEY (DeliveryID),
FOREIGN KEY (ItemID) references Item(ItemID),
FOREIGN KEY (DepartmentID) references Department(DepartmentID),
FOREIGN KEY (SupplierID) references Supplier(SupplierID)
);




INSERT INTO Item VALUES 
	(1,'Boots - snakeproof','C','Green'),
	(4,'Camel saddle','R','Brown'),
	(18,'Compass','N','-'),
	(2,'Elephant polo stick','R','Bamboo'),
	(15,'Exploring in 10 Easy Lessons','B','-'),
	(9,'Geo positioning system','N','-'),
	(7,'Hammock','F','Khaki'),
	(6,'Hat - polar explorer','C','White'),
	(12,'How to Win Foreign Friends','B','-'),
	(10,'Map case','E','Brown'),
	(11,'Map measure','N','-'),
	(8,'Pith helmet','C','Khaki'),
	(13,'Pocket knife - Avon','E','Brown'),
	(14,'Pocket knife - Nile','E','Brown'),
	(5,'Safari chair','F','Khaki'),
	(16,'Safari cooking kit','F','-'),
	(17,'Sextant','N','-'),
	(3,'Stetson','C','Black'),
	(19,'Tent - 2 person','F','Khaki'),
	(20,'Tent - 8 person','F','Khaki');

INSERT INTO Department VALUES
	(1,'Management',5,34,1),
	(8,'Books',1,81,4),
	(3,'Clothes',2,24,4),
	(4,'Equipment',3,57,3),
	(5,'Furniture',4,14,3),
	(6,'Navigation',1,41,3),
	(7,'Recreation',2,29,4),
	(2,'Accounting',5,35,5),
	(9,'Purchasing',5,36,7),
	(10,'Personnel',5,37,9),
	(11,'Marketing',5,38,2);


INSERT INTO Employee VALUES
	(1,'Alice',75000,1,0),
	(2,'Ned',45000,11,1),
	(3,'Andrew',25000,11,2),
	(4,'Clare',22000,11,2),
	(5,'Todd',38000,2,1),
	(6,'Nancy',22000,2,5),
	(7,'Brier',43000,9,1),
	(8,'Sarah',56000,9,7),
	(9,'Sophie',35000,10,1),
	(10,'Sanjay',15000,6,3),
	(11,'Rita',15000,8,4),
	(12,'Gigi',16000,3,4),
	(13,'Maggie',16000,3,4),
	(14,'Paul',11000,4,3),
	(15,'James',15000,4,3),
	(16,'Pat',15000,5,3),
	(17,'Mark',15000,7,3);

INSERT INTO Sale VALUES
	(1001,2,1 ,3),
	(1002,1,8,3),
	(1003,1,17,6),
	(1004,3,6 ,3),
	(1005,5,8,4),
	(1006,1,14,3),
	(1007,1,14,7),
	(1008,1,18,6),
	(1009,1,9 ,6),
	(1010,5,11,6),
	(1011,1,9 ,8),
	(1012,1,17,8),
	(1013,3,14,8),
	(1014,1,14,6),
	(1015,1,14,4),
	(1016,1,17,3),
	(1017,1,17,4),
	(1018,1,17,7),
	(1019,1,17,5),
	(1020,1,14,5),
	(1021,1,15 ,8),
	(1022,1,12 ,8),
	(1023,1,18 ,8),
	(1024,1,8,8),
	(1025,1,2 ,7),
	(1026,1,4 ,7);


INSERT INTO Supplier VALUES
	(101,'Global Books & Maps', '55244552'),
	(102,'Nepalese Corp.', '55244552'),
	(103,'All Sports Manufacturing', '55478252'),
	(104,'Sweatshops Unlimited', '55245552'),
	(105,'All Points_ Inc.', '54585252'),
	(106,'Sao Paulo Manufacturing', '54572752');


INSERT INTO Delivery VALUES
	(51,50,14,6,105),
	(52,10,14,8,105),
	(53,10,14,3,105),
	(54,10,14,4,105),
	(55,10,14,5,105),
	(56,10,14,7,105),
	(57,50,18,6,101),
	(58,10,9 ,6,101),
	(59,10,11,6,101),
	(60,25,10 ,6,101),
	(61,2,17,6,101),
	(62,1,17,4,105),
	(63,20,18 ,4,103),
	(64,1,9 ,8,103),
	(65,15,11,6,103),
	(66,1,17,8,103),
	(67,5,17,7,102),
	(68,3,17,6,104),
	(69,5,1,3,105),
	(70,15,8,3,105),
	(71,1,8,3,101),
	(72,1,8,3,102),
	(73,1,8,3,103),
	(74,1,8,3,104),
	(75,5,8,6,105),
	(76,5,8,8,105),
	(77,5,8,4,105),
	(78,5,8,5,105),
	(79,5,8,7,105),
	(80,10,14,6,102),
	(81,1,18 ,6,102),
	(82,1,9 ,6,102),
	(83,10,11,6,102),
	(84,5,10 ,6,102),
	(85,5,18 ,8,102),
	(86,5,13,7,102),
	(87,5,19,7,102),
	(88,2,20,7,102),
	(89,5,15 ,6,102),
	(90,5,12 ,6,102),
	(91,10,15 ,8,102),
	(92,10,12 ,8,102),
	(93,2,15 ,7,102),
	(94,2,12 ,7,102),
	(95,5,18 ,4,105),
	(96,2,1 ,4,105),
	(97,20,8,4,106),
	(98,20,14,4,106),
	(99,1,17,4,106),
	(100,3,6 ,3,105),
	(101,3,3,3,105);

SET foreign_key_checks = 1;

