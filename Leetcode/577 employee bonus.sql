select Employee.name, Bonus.bonus
from Employee left join Bonus on
Employee.empId = Bonus.EmpId
where Bonus.bonus < 1000 or Bonus.bonus is null;
