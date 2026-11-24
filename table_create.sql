INSERT INTO employees(id, name, positon, date_of_joining)
VALUES
(2, 'nehayel', 'sales', '2022-03-21'),
(3, 'hamu', 'fuctin', '2022-03-11'),
(4, 'huglu', 'cash', '2022-04-21'),
(5, 'himu', 'cash2', '2021-03-21');

SELECT * FROM employees;

SELECT NAME, positon FROM employees;

SELECT * FROM employees;

DELETE FROM employees WHERE id=1;


SELECT name,
REPLACE(name, 'a', '@') as replce_name,
substring(name FROM 1 for 3) as substring_name,
upper(name) AS upper_name,
char_length(name) AS count_name,
length(name) as bite_l,
reverse(name) as reverse_name,
CONCAT(name,' hossain') as concat_name,
CONCAT (name,' ', positon) as concating


FROM employees


