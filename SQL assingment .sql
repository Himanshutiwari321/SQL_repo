CREATE DATABASE IF NOT EXISTS assingment;
USE assingment;

CREATE TABLE employeetabel(
EmpID INT PRIMARY KEY ,
FirstName VARCHAR(30),
LastName  VARCHAR(30),
Department VARCHAR(30),
salary INT DEFAULT 0,
HireDate date
);

INSERT INTO employeetabel
VALUES
(101, "Alice", "Johnson", "IT", 6500, '2020-03-15'),
(102, "Mark", "Rivera", "HR", 4800, '2019-07-22'),
(103, "Shopia", "Lee", "FINANCE",7200 , '2021-01-10'),
(104, "Danil", "Kim", "IT", 5800, '2018-011-05'),
(105, "Emma", "Brown", "MARKETING", 5300, '2022-04-18'),
(106, "Liam", "Patel", "FINANCE", 6900, '2020-09-29'),
(107, "Olivia", "Garcia", "HR", 4600, '2017-06-30'),
(108, "Noah", "Thompson", "IT", 7500, '2020-02-12'),
(109, "Ava", "Martinez", "MARKETING", 5100, '2019-12-02'),
(110, "Ethan", "Davis", "FINANCE", 8000, '2020-05-14');

SELECT * FROM employeetabel; #question 1 Write a query to display every employee and all their data.

SELECT FirstName , LastName , salary FROM employeetabel; #question 2 List only the FirstName, LastName, and Salary of every employee

SELECT * FROM employeetabel 
WHERE Department = "IT";  #question 3 Show all employees who work in the 'IT' department.

SELECT * FROM employeetabel 
WHERE salary > 6000; #question 4  Retrieve employees with a salary greater than 6000

SELECT * FROM employeetabel 
ORDER BY HireDate DESC; #question 5 List all employees ordered by HireDate from newest to oldest

SELECT Department, count(EmpID) , sum(salary)
 FROM employeetabel 
GROUP BY Department; #question 6 Show a list of all unique departments present in the table.

SELECT * FROM employeetabel
WHERE FirstName LIKE "A%";#question 7  Find employees whose first name starts with ‘Aʼ.

SELECT *
FROM employeetabel
WHERE salary BETWEEN 4000 AND 7000; #question 8 Show employees whose salaries are between 4000 and 7000.

SELECT avg(salary) as avarage_salary
FROM  employeetabel; #question 9 Find the average salary of all employees 

SELECT Department, COUNT(*) AS Total_Employees
FROM employeetabel
GROUP BY Department
HAVING COUNT(*) > 3; #question 10 List each department along with the number of employees, but only include departmentswith more than 3 employees.

SELECT FirstName FROM employeetabel;
SELECT * FROM employeetabel
WHERE Department = "IT";  


#Question----interview

#1-second highest salary in table
#apporoch when we want only second highest salary. 
SELECT MAX(Salary) FROM employeetabel
WHERE salary < (SELECT MAX(Salary) FROM employeetabel);
#apporoch when we want second highest salary and name of the employee, and this query very usefull when want 1,2,3,4....rank salary and name of emp. 
SELECT FirstName, salary
FROM (SELECT FirstName, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM employeetabel) t
WHERE rnk = 2;