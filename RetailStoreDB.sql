--Creating Database--
CREATE DATABASE RetailStoreDB;
--Creating Customers Table--
CREATE TABLE Customers
(
	CustomerID int IDENTITY(1,1) NOT NULL,
	FirstName varchar(255),
	LastName varchar(255),
	Email varchar(255),
	RegistrationDate datetime,
	PRIMARY KEY(CustomerID)
);
--Creating Products Table--
CREATE TABLE Products
(
	ProductID int IDENTITY(1,1) NOT NULL,
	ProductName varchar(255),
	Category varchar(255),
	Price int,
	StockQuantity int,
	PRIMARY KEY(ProductID)
);
--Creating Orders Table--
CREATE TABLE Orders
(
	OrderID int IDENTITY(1,1) NOT NULL,
	OrderDate datetime,
	Quantity int,
	PRIMARY KEY(OrderID),
	CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID),
	ProductID int FOREIGN KEY REFERENCES Products(ProductID)
);
--Inserting In Customers--
INSERT INTO Customers
	(FirstName,LastName,Email,RegistrationDate)
VALUES('Ahmed', 'Ghaith', 'a.wesam2300@nu.edu.eg', '2025-2-18 14:30:00'),
	('First', 'Example', 'example1@nu.edu.eg', '2025-2-19 14:30:00'),
	('Second', 'Example', 'example2@nu.edu.eg', '2025-2-20 15:45:00'),
	('Third', 'Example', 'example3@nu.edu.eg', '2025-2-21 16:00:30'),
	('Fourth', 'Example', 'example4@nu.edu.eg', '2025-2-22 17:30:00'),
	('Fifth', 'Example', 'example5@nu.edu.eg', '2025-2-23 18:20:45');
--Inserting In Products--
INSERT INTO Products
	(ProductName,Category,StockQuantity,Price)
VALUES
	('Cheese', 'DAIRY'  , 25 , 20),
	('Milk'  , 'DAIRY'  , 0  , 30),
	('Butter', 'DAIRY'  , 20 , 300),
	('Bread' , 'DAIRY'  , 100, 2),
	('Tuna'  , 'FISH'   , 70 , 6),
	('Water' , 'SEAFOOD', 2  , 7);
--Inserting In Orders--
INSERT INTO Orders
	(OrderDate,Quantity,CustomerID,ProductID)
VALUES
	('2025-2-18 14:30:00', 20, 1, 2),
	('2025-2-19 14:30:00', 10, 1, 3),
	('2025-2-20 15:45:00', 30, 2, 3),
	('2025-2-21 16:00:30', 1, 2, 6),
	('2025-2-22 17:30:00', 5, 3, 4),
	('2025-2-23 18:20:45', 9, 5, 1);
--Viewing Content Of All Tables--
SELECT *
FROM Customers;
SELECT *
FROM Products;
SELECT *
FROM Orders;
--Showing Customers That Have Registered After A Certain Time--
SELECT *
FROM Customers
WHERE RegistrationDate > '2025-2-21 00:00:00';
--Showing The Items That Have The Highest 3 Prices in Products--
SELECT TOP 3
	*
FROM Products
ORDER BY Price DESC;
--Showing The Orders With The Customer's Name, Product Name, Quantity, And Order Date--
SELECT OrderID, Customers.FirstName, Customers.LastName, Products.ProductName, Orders.Quantity, OrderDate
FROM Orders
	JOIN Customers ON Customers.CustomerID = Orders.CustomerID
	JOIN Products ON Products.ProductID = Orders.ProductID;
--Showing Total Amount Spent By Each Customer--


--Deleting All Tables--
DROP TABLE Customers;
DROP TABLE Products;
DROP TABLE Orders;
