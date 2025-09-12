SELECT 
  CASE 
    WHEN COUNT(DISTINCT salary) < 2 THEN NULL
    ELSE (
      SELECT MIN(salary)
      FROM (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 2
      ) AS top2
    )
  END AS SecondHighestSalary
FROM Employee;
