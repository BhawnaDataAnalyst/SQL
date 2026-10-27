CREATE TABLE Customers (
	Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(100)
);

ALTER TABLE Customers
RENAME COLUMN Customer_ID to CustomerID;

INSERT INTO Customers (CustomerName, City) VALUES
('John Smith', 'New York'),
('Mary Johnson', 'Chicago'),
('Peter Adams', 'Los Angeles'),
('Nancy Miller', 'Houston'),
('Robert White', 'Miami');

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Amount INT
);

INSERT INTO Orders VALUES
(101,1,'2024-10-01',250)
,(102,2,'2024-10-05',300)
,(103,1,'2024-10-07',150)
,(104,3,'2024-10-10',450)
,(105,6,'2024-10-12',400);

CREATE TABLE Payments (
   PaymentID VARCHAR(10) PRIMARY KEY,
   CustomerID INT,
   PaymentDate DATE,
   Amount INT
);

INSERT INTO Payments (PaymentID, CustomerID, PaymentDate, Amount) VALUEs  
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employees (EmployeeName, ManagerID) VALUES  
('Alex Green', NULL),
('Brian Lee', 1),
('Carol Ray', 1),
('David Kim', 2),
('Eva Smith', 2);

-- Question 1. Retrieve all customers who have placed at least one order.

SELECT * 
FROM Customers INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.

SELECT * 
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.

SELECT * 
FROM Customers RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- Question 4. Display all customers and orders, whether matched or not.

SELECT * 
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT * 
FROM Customers RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- Question 5. Find customers who have not placed any orders.

SELECT * 
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

-- Question 6. Retrieve customers who made payments but did not place any orders.

SELECT * 
FROM Customers 
INNER JOIN Payments
ON Customers.CustomerID = Payments.CustomerID
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

-- Question 7. Generate a list of all possible combinations between Customers and Orders.

SELECT * 
FROM Customers CROSS JOIN Orders;

-- Question 8. Show all customers along with order and payment amounts in one table.

SELECT *
FROM Customers 
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Payments 
ON Customers.CustomerID = Payments.CustomerID;

-- Question 9. Retrieve all customers who have both placed orders and made payments.

SELECT *
FROM Customers 
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Payments 
ON Customers.CustomerID = Payments.CustomerID;
