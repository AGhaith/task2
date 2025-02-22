# Retail Store Database

A structured SQL database for managing customer orders, products, and customer information in a retail store.

## Features

- Creates a relational database (`RetailStoreDB`).
- Defines three main tables: `Customers`, `Products`, and `Orders`.
- Establishes relationships between tables using foreign keys.
- Supports data insertion for customers, products, and orders.
- Includes SQL queries to retrieve and analyze data.

## Requirements

- MySQL or SQL Server installed.
- VS Code with the SQL extension.

## How to Run

1. Open VS Code and connect to your database server.
2. Create the database by executing:
   ```sql
   CREATE DATABASE RetailStoreDB;
   ```
3. Switch to the new database:
   ```sql
   USE RetailStoreDB;
   ```
4. Create tables:

   ```sql
   -- Creating Customers Table
   CREATE TABLE Customers (
       CustomerID int IDENTITY(1,1) NOT NULL,
       FirstName varchar(255),
       LastName varchar(255),
       Email varchar(255),
       RegistrationDate datetime,
       PRIMARY KEY(CustomerID)
   );

   -- Creating Products Table
   CREATE TABLE Products (
       ProductID int IDENTITY(1,1) NOT NULL,
       ProductName varchar(255),
       Category varchar(255),
       Price int,
       StockQuantity int,
       PRIMARY KEY(ProductID)
   );

   -- Creating Orders Table
   CREATE TABLE Orders (
       OrderID int IDENTITY(1,1) NOT NULL,
       OrderDate datetime,
       Quantity int,
       PRIMARY KEY(OrderID),
       CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID),
       ProductID int FOREIGN KEY REFERENCES Products(ProductID)
   );
   ```

5. Insert sample data:

   ```sql
   -- Inserting Customers
   INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
       ('Ahmed', 'Ghaith', 'a.wesam2300@nu.edu.eg', '2025-2-18 14:30:00'),
       ('First', 'Example', 'example1@nu.edu.eg', '2025-2-19 14:30:00');

   -- Inserting Products
   INSERT INTO Products (ProductName, Category, StockQuantity, Price) VALUES
       ('Cheese', 'DAIRY', 25, 20),
       ('Milk', 'DAIRY', 0, 30);

   -- Inserting Orders
   INSERT INTO Orders (OrderDate, Quantity, CustomerID, ProductID) VALUES
       ('2025-2-18 14:30:00', 20, 1, 2),
       ('2025-2-19 14:30:00', 10, 1, 1);
   ```

## Queries & Usage

- **View all customers, products, and orders:**

  ```sql
  SELECT * FROM Customers;
  SELECT * FROM Products;
  SELECT * FROM Orders;
  ```

- **Find customers who registered after a specific date:**

  ```sql
  SELECT * FROM Customers WHERE RegistrationDate > '2025-2-21 00:00:00';
  ```

- **Get the top 3 most expensive products:**

  ```sql
  SELECT TOP 3 * FROM Products ORDER BY Price DESC;
  ```

- **Join tables to display orders with customer names and product details:**

  ```sql
  SELECT OrderID, Customers.FirstName, Customers.LastName, Products.ProductName, Orders.Quantity, OrderDate
  FROM Orders
  JOIN Customers ON Customers.CustomerID = Orders.CustomerID
  JOIN Products ON Products.ProductID = Orders.ProductID;
  ```

## Cleanup

To remove all tables:

```sql
DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE Customers;
```

This will delete all stored data and structures.

## License

This project is for educational purposes only.
