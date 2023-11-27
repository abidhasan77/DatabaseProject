/*                                                                            

                                                                
				                                     	      SQL Project Name: IceCream_Parlour Management System
						                                    	 Trainee Name : Md. Abid Hasan Miad
							                                    	Trainee ID: 
							                                         Batch ID : PNTL-21

                                          --------------------------------------------------------------------------------------
                                 

**Query

- **1: Select from Table**
- **2: Select from View**
- **3: Select Into**
- **4: Implicit Join with Where Clause and Order By Clause**
- **5: Inner Join with Group By Clause**
- **6: Outer Join**
- **7: Cross Join**
- **8: Top Clause with Ties**
- **9: Distinct**
- **10: Comparison, Logical (AND, OR, NOT), and Between Operator**
- **11: Like, In, Not In Operator, and Is Null Clause**
- **12: Offset Fetch**
- **13: Union**
- **14: Except and Intersect**
- **15: Aggregate Functions**
- **16: Group By and Having Clause**
- **17: Rollup and Cube Operator**
- **18: Grouping Sets**
- **19: Sub-queries (Inner, Correlated)**
- **20: Exists**
- **21: CTE (Common Table Expressions)**
- **22: Merge**
- **23: Built-in Functions**
- **24: Case**
- **25: IIF and CHOOSE**
- **26: COALESCE and ISNULL**
- **27: While Loops**
- **28: Grouping Function**
- **29: Ranking Function**
- **30: If-Else and Print**
- **31: Try-Catch**
- **32: GOTO Statement**
- **33: WAITFOR**
- **34: sp_helptext**
- **35: Transaction with Save Points**

This format provides numerical labels for each subsection while removing the section titles.
*/



--1. Select from Table:

SELECT * FROM EmployeeData;


--2. Select from View:

SELECT * FROM EmployeeSalaryView;


--3. Select Into:

SELECT * INTO NewEmployeeData FROM EmployeeData WHERE SalaryGrade > 3;


--4. Implicit Join with Where Clause and Order By Clause:

SELECT E.Emp_Name, D.Dep_Name
FROM EmployeeData E, DepartmentTable D
WHERE E.DepartmentID = D.Dep_ID
ORDER BY E.Emp_Name;


--5. Inner Join with Group By Clause:

SELECT D.Dep_Name, COUNT(E.Emp_ID) AS EmployeeCount
FROM EmployeeData E
INNER JOIN DepartmentTable D ON E.DepartmentID = D.Dep_ID
GROUP BY D.Dep_Name;


--6. Outer Join:

SELECT O.ShareHolderName, S.ShopName
FROM OwnerTable O
LEFT OUTER JOIN ShopOutlet S ON O.ShopID = S.ShopID;


--7. Cross Join:

SELECT E.Emp_Name, S.ShopName
FROM EmployeeData E
CROSS JOIN ShopOutlet S;


--8. Top Clause with Ties:

SELECT TOP 5 * FROM EmployeeData;


--9. Distinct:

SELECT DISTINCT BloodGroup FROM EmployeeData;


--10. Comparison, Logical (AND, OR, NOT), and Between Operator:

SELECT * FROM EmployeeData WHERE SalaryGrade > 3 AND (BloodGroup = 'A+' OR BloodGroup = 'B+') AND NOT Gender = 'Male';


--11. Like, In, Not In Operator, and Is Null Clause:

SELECT * FROM EmployeeData WHERE Emp_Name LIKE 'M%' AND DepartmentID IN (1131, 1132) AND Email IS NOT NULL;


--12. Offset Fetch:

SELECT * FROM EmployeeData ORDER BY Emp_Name OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;


--13. Union:

SELECT Emp_Name FROM EmployeeData WHERE BloodGroup = 'O+'
UNION
SELECT ShareHolderName FROM OwnerTable WHERE Email IS NOT NULL;


--------------------------

--14. Except and Intersect:
-- Example using EXCEPT
SELECT Emp_Name FROM EmployeeData
EXCEPT
SELECT ShareHolderName FROM OwnerTable;

-- Example using INTERSECT
SELECT Emp_Name FROM EmployeeData
INTERSECT
SELECT ShareHolderName FROM OwnerTable;


--15. Aggregate Functions:

-- Example of SUM
SELECT DepartmentID, SUM(SalaryGrade) AS TotalSalary
FROM EmployeeData
GROUP BY DepartmentID;

-- Example of COUNT
SELECT DepartmentID, COUNT(Emp_ID) AS EmployeeCount
FROM EmployeeData
GROUP BY DepartmentID;

-- Example of AVG
SELECT DepartmentID, AVG(SalaryGrade) AS AverageSalary
FROM EmployeeData
GROUP BY DepartmentID;


--16. Group By and Having Clause:
SELECT DepartmentID, AVG(SalaryGrade) AS AverageSalary
FROM EmployeeData
GROUP BY DepartmentID
HAVING AVG(SalaryGrade) > 4;


--17. Rollup and Cube Operator:
-- Example using ROLLUP
SELECT DepartmentID, BloodGroup, AVG(SalaryGrade) AS AverageSalary
FROM EmployeeData
GROUP BY ROLLUP (DepartmentID, BloodGroup);

-- Example using CUBE
SELECT DepartmentID, BloodGroup, AVG(SalaryGrade) AS AverageSalary
FROM EmployeeData
GROUP BY CUBE (DepartmentID, BloodGroup);


--18. Grouping Sets:
SELECT DepartmentID, BloodGroup, AVG(SalaryGrade) AS AverageSalary
FROM EmployeeData
GROUP BY GROUPING SETS (DepartmentID, BloodGroup, ());


--19. Sub-queries (Inner, Correlated):

-- Example of an inner subquery
SELECT Emp_Name, SalaryGrade
FROM EmployeeData
WHERE SalaryGrade > (SELECT AVG(SalaryGrade) FROM EmployeeData);

-- Example of a correlated subquery
SELECT DepartmentID, Emp_Name
FROM EmployeeData E
WHERE SalaryGrade > (SELECT AVG(SalaryGrade) FROM EmployeeData WHERE DepartmentID = E.DepartmentID);


--20. Exists:

SELECT Emp_Name
FROM EmployeeData
WHERE EXISTS (SELECT * FROM OwnerTable WHERE ShareHolderName = Emp_Name);


--21. CTE (Common Table Expressions):

-- Example using a CTE
WITH CTE AS (
  SELECT DepartmentID, AVG(SalaryGrade) AS AvgSalary
  FROM EmployeeData
  GROUP BY DepartmentID
)
SELECT DepartmentID, AvgSalary
FROM CTE;


--21. CTE (Common Table Expressions):
-- Example using a CTE
WITH CTE AS (
  SELECT DepartmentID, AVG(SalaryGrade) AS AvgSalary
  FROM EmployeeData
  GROUP BY DepartmentID
)
SELECT DepartmentID, AvgSalary
FROM CTE;

--22. Merge:
-- Example of MERGE
MERGE INTO EmployeeData AS target
USING UpdatedEmployeeData AS source
ON target.Emp_ID = source.Emp_ID
WHEN MATCHED THEN
  UPDATE SET target.SalaryGrade = source.SalaryGrade
WHEN NOT MATCHED THEN
  INSERT (Emp_ID, SalaryGrade)
  VALUES (source.Emp_ID, source.SalaryGrade);

--23. Built-in Functions:
-- Example using a built-in function
SELECT Emp_Name, LEN(Emp_Name) AS NameLength
FROM EmployeeData;

--24. Case:
-- Example using a CASE statement
SELECT Emp_Name, Gender,
  CASE
    WHEN Gender = 'Male' THEN 'Mr. ' + Emp_Name
    WHEN Gender = 'Female' THEN 'Ms. ' + Emp_Name
    ELSE Emp_Name
  END AS Salutation
FROM EmployeeData;

--25. IIF and CHOOSE:

-- Example using IIF
SELECT Emp_Name, Gender, IIF(Gender = 'Male', 'Mr.', 'Ms.') + Emp_Name AS Salutation
FROM EmployeeData;

-- Example using CHOOSE
SELECT Emp_Name, Gender, CHOOSE(SalaryGrade, 'Low', 'Medium', 'High') AS SalaryCategory
FROM EmployeeData;

--26. COALESCE and ISNULL:
-- Example using COALESCE
SELECT Emp_Name, COALESCE(Email, 'Email not provided') AS ValidEmail
FROM EmployeeData;
-- Example using ISNULL
SELECT Emp_Name, ISNULL(Email, 'Email not provided') AS ValidEmail
FROM EmployeeData;


--27. While Loops:

-- Example using a simple WHILE loop
DECLARE @Counter INT = 1;
WHILE @Counter <= 10
BEGIN
  PRINT 'Loop Iteration: ' + CAST(@Counter AS VARCHAR);
  SET @Counter = @Counter + 1;
END;


--28. Grouping Function:
-- Example using GROUPING function
SELECT DepartmentID, BloodGroup, AVG(SalaryGrade) AS AverageSalary
FROM EmployeeData
GROUP BY GROUPING SETS (DepartmentID, BloodGroup, ());

SELECT DepartmentID, BloodGroup, AVG(SalaryGrade) AS AverageSalary
FROM EmployeeData
GROUP BY ROLLUP (DepartmentID, BloodGroup)
HAVING GROUPING(BloodGroup) = 1;


--29. Ranking Function:
-- Example using a ranking function
SELECT Emp_Name, SalaryGrade,
  RANK() OVER (PARTITION BY DepartmentID ORDER BY SalaryGrade DESC) AS Rank
FROM EmployeeData;

--30. If-Else and Print:
-- Example using IF-ELSE
DECLARE @Variable INT = 10;
IF @Variable > 5
  PRINT 'Variable is greater than 5';
ELSE
  PRINT 'Variable is not greater than 5';

-- Example using PRINT
PRINT 'This is a simple message';


--31. Try-Catch:

-- Example using TRY-CATCH
BEGIN TRY
  -- Code that might throw an error
  DECLARE @Value INT = 1 / 0;
END TRY
BEGIN CATCH
  -- Error handling code
  PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;


--32. GOTO Statement:
-- Example using GOTO
DECLARE @Counter INT = 1;
WHILE @Counter <= 5
BEGIN
  PRINT 'Counter: ' + CAST(@Counter AS VARCHAR);
  SET @Counter = @Counter + 1;
  IF @Counter > 3
    GOTO ExitLoop;
END;
ExitLoop:
PRINT 'Loop exited.';


--33. WAITFOR:

-- Example using WAITFOR
WAITFOR DELAY '00:00:10';
PRINT 'This message will appear after a 10-second delay.';


--34. sp_helptext:

-- Example using sp_helptext to view the definition of a stored procedure
EXEC sp_helptext 'YourStoredProcedureName';
