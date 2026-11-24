SELECT 
salary,
round(salary) as round_salary,
ceil(salary) as cail_salry,
FLOOR(salary) as floor_salary,
salary*2 as salary_mul,
salary*1.10 as salary_increased, --10% increase
POWER(salary,2) as power_2,
SQRT(salary) as sqrt_salary

FROM employees

SELECT 
salary,
salary*0.05 as salary_tax,
salary-(salary*0.05) as salary_after_tax

FROM employees