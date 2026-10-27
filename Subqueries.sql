-- 1. Retrieve the names of employees who earn more than the average salary of all employees. 

SELECT name
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 2. Find the employees who belong to the department with the highest average salary. 

SELECT name
FROM Employee
WHERE department_id IN (
		SELECT department_id
		FROM Employee
		GROUP BY department_id
		HAVING AVG(salary) = (
				SELECT MAX(avg_salary)
				FROM (SELECT AVG(salary) AS avg_salary
				FROM Employee
				GROUP BY department_id
				) AS dept_avg
		)
); 

-- 3. List all employees who have made at least one sale. 

SELECT name
FROM Employee
WHERE emp_id IN (
SELECT DISTINCT emp_id
FROM Sales
); 

-- 4. Find the employee with the highest sale amount. 

SELECT name
FROM Employee
WHERE emp_id = (
   SELECT emp_id
   FROM Sales
   WHERE sale_amount = (SELECT MAX(sale_amount) FROM Sales)
);

-- 5. Retrieve the names of employees whose salaries are higher than Shubham’s salary. 
SELECT name
FROM Employee
WHERE salary > (
   SELECT salary
   FROM Employee
   WHERE name = 'Shubham'
);

-- 6. Find employees who work in the same department as Abhishek. 

SELECT name
FROM Employee
WHERE department_id = (
SELECT department_id
FROM Employee
WHERE name = 'Abhishek'
); 

-- 7. List departments that have at least one employee earning more than ₹60,000. 


SELECT DISTINCT department_id
FROM Employee
WHERE department_id IN (
SELECT department_id
FROM Employee
WHERE salary > 60000
); 

-- 8. Find the department name of the employee who made the highest sale. 

SELECT department_name
FROM Department
WHERE department_id = (
		SELECT department_id
		FROM Employee
		WHERE emp_id = (
				SELECT emp_id
				FROM Sales
				WHERE sale_amount = (SELECT MAX(sale_amount) FROM Sales)
		)
); 

-- 9. Retrieve employees who have made sales greater than the average sale amount. 

SELECT name
FROM Employee
WHERE emp_id IN (
   SELECT emp_id
   FROM Sales
   WHERE sale_amount > (SELECT AVG(sale_amount) FROM Sales)
);

-- 10. Find the total sales made by employees who earn more than the average salary. 

SELECT SUM(sale_amount) AS total_sales
FROM Sales
WHERE emp_id IN (
		SELECT emp_id
		FROM Employee
		WHERE salary > (SELECT AVG(salary) FROM Employee)
); 

-- 11. Find employees who have not made any sales. 

SELECT name
FROM Employee
WHERE emp_id NOT IN (
			SELECT DISTINCT emp_id
			FROM Sales
); 

-- 12. List departments where the average salary is above ₹55,000. 

SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000; 

-- 13. Retrieve department names where the total sales exceed ₹10,000. 

SELECT department_name
FROM Department
WHERE department_id IN (
   SELECT e.department_id
   FROM Employee e
   JOIN Sales s ON e.emp_id = s.emp_id
   GROUP BY e.department_id
   HAVING SUM(s.sale_amount) > 10000
);

-- 14. Find the employee who has made the second-highest sale. 

SELECT name
FROM Employee
WHERE emp_id = (
			SELECT emp_id
			FROM Sales
			WHERE sale_amount = (
						SELECT MAX(sale_amount)
						FROM Sales
						WHERE sale_amount < (SELECT MAX(sale_amount) FROM Sales)
			)
); 

-- 15. Retrieve the names of employees whose salary is greater than the highest sale amount recorded. 

SELECT name
FROM Employee
WHERE salary > (
   SELECT MAX(sale_amount)
   FROM Sales
);

