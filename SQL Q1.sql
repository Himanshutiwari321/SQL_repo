#apporoch when we want only highest Salary from Departent. 
SELECT MAX(Salary),Department FROM employeetabel
GROUP BY  Department;

#apporoch when we want how many empoyee in perticuler department and each deparment highest salary.
SELECT count(*),MAX(Salary),Department FROM employeetabel
GROUP BY  Department;


#apporoch when we want employee highest salary with name.
SELECT FirstName, Salary,Department FROM employeetabel
WHERE (Department ,Salary) IN (SELECT Department , MAX(Salary) FROM employeetabel 
GROUP BY  Department);

#advance using window function .
SELECT FirstName , Salary , Department FROM
(SELECT * , DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rnk FROM employeetabel) t
WHERE rnk = 1 
ORDER BY Salary DESC;