#Display duplicates of a column.
#simple apporoch 
SELECT  Department ,COUNT(*) FROM employeetabel
GROUP BY Department
HAVING COUNT(*) > 1;

#apporoch window function 
SELECT * FROM (SELECT *, COUNT(*) OVER (PARTITION BY Department) AS cnt FROM employeetabel ) t 
WHERE cnt > 1;