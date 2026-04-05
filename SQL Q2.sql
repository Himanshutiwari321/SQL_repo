#Display alternative records 
#apporoch when we want alternative recodes in odd number.
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY EmpID) AS RN FROM employeetabel ) t
WHERE RN % 2 = 1;

#apporoch when me want alternative records in even number.
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY EmpID) AS RN FROM employeetabel ) t
WHERE RN % 2 = 0;

#apporoch when we want tebel without rn column. because rather than using SELECT * we are use only important column SELECT EmpID and FirstName.
SELECT EmpID, FirstName
FROM ( SELECT EmpID, FirstName, ROW_NUMBER() OVER (ORDER BY EmpID) AS rn FROM employeetabel) t
WHERE rn % 2 = 1;

SELECT EmpID, FirstName
FROM ( SELECT EmpID, FirstName, ROW_NUMBER() OVER (ORDER BY EmpID) AS rn FROM employeetabel) t
WHERE rn % 2 = 0;