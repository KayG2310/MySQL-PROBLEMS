SELECT project_id, 
       round(AVG(experience_years)::numeric,2)  AS average_years
FROM Project
JOIN Employee 
  ON Project.employee_id = Employee.employee_id
GROUP BY project_id order by project_id;
