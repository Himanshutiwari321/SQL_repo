#display duplicate of a column 
SELECT Department, count(*) FROM employeetabel
GROUP BY Department 
HAVING count(*)>1;

SELECT *
FROM employeetabel
WHERE Department IN ( SELECT Department FROM employeetabel 
GROUP BY Department
HAVING COUNT(*) > 1
);

SELECT * FROM ( SELECT *, COUNT(*) OVER (PARTITION BY Department) AS cnt FROM employeetabel) t
WHERE cnt > 1;