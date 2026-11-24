SELECT 
MIN(salary) as min_salary,
max(salary) as max_salary,
AVG(salary) as avg_salary,
sum(salary) as sum_salary,
count(*) as total_rows

FROM employees

SELECT DISTINCT salary FROM employees