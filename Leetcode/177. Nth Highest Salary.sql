CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    with ans as (select distinct f.salary as pay, (select count(distinct s.salary) from Employee s where s.salary >= f.salary) as rank from Employee f order by f.salary desc) select ans.pay from ans where ans.rank = n
  );
END;
$$ LANGUAGE plpgsql;
