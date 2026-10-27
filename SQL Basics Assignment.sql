-- Question 1 - Create a new database named company_db

CREATE DATABASE company_db;

-- Create a table named employees

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

-- question 2 - Insert Data into Employees Table

INSERT INTO employees ( employee_id, first_name, last_name, department, salary, hire_date) VALUES
						(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
                        (102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
                        (103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
                        (104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
                        (105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');
                        
SELECT 
    *
FROM
    employees;
 
 -- Question 3 - Display All Employee Records Sorted by Salary (Lowest to Highest)
 
SELECT 
    *
FROM
    employees
ORDER BY salary ASC;

-- Question 4 - Show Employees Sorted by Department (A–Z) and Salary (High → Low)

SELECT * FROM employees
ORDER BY department ASC;

SELECT * FROM employees
ORDER BY salary DESC;

-- Question 5 - List All Employees in the IT Department, Ordered by Hire Date (Newest First)

SELECT * FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;

-- Question 6 - Create and Populate a Sales Table

CREATE TABLE sales (
		sale_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_name VARCHAR(50),
        amount INT,
        sale_date DATE
);

INSERT INTO sales (customer_name, amount, sale_date) VALUES
					('Aditi', 1500, '2024-08-01'),
                    ('Rohan', 2200, '2024-08-03'),
                    ('Aditi', 3500, '2024-09-05'),
                    ('Meena', 2700, '2024-09-15'),
                    ('Rohan', 4500, '2024-09-25');
                    
SELECT * FROM sales;

-- Question 7 - Display All Sales Records Sorted by Amount (Highest → Lowest)

SELECT * FROM sales
ORDER BY amount DESC;

-- Question 8 - Show All Sales Made by Customer “Aditi”

SELECT * FROM sales
WHERE customer_name = 'Aditi';

-- Question 9 - What is the Difference Between a Primary Key and a Foreign Key?
-- Primary Key is a column value that uniquely identify records in a table. Must be unique. It can't be Null. While Foreign Key is a column that connects a table from another table. Values are not unique, can be null and can be more than 1. 

-- Question 10 - What Are Constraints in SQL and Why Are They Used?
-- Constraints are applied to column in data to restrict the values inserted, updated or deleted in table. It helps to prevent duplicate or incorrect entries. It helps maintain accuracy and data integrity. 