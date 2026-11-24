SELECT ROUND(123.3221)

SELECT ROUND(salary,3) FROM employees

--Nearest
SELECT CEIL(10.3)  --11

SELECT FLOOR(10.3432)--10

--Removing Decimal
SELECT trunc(122.343) --122

--positive
SELECT ABS(-500) --500

--modulus
SELECT MOD(10,3) --1

SELECT to_char(1234554.32, '$99,99,999')