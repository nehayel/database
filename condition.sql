SELECT name, salary, 

   CASE 
      WHEN salary >= 40000 THEN 'High salary'
      WHEN salary >= 30000 THEN 'Medium salary'
      WHEN salary >= 20000 THEN 'low salary ' 
      ELSE  'very low salary'
   END AS salary_grade
FROM employees;

SELECT name, positon,

   CASE 
      WHEN positon like 'sales' THEN  'salesman'
      ELSE  'employee'
   END as department
FROM employees