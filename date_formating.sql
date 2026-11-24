SELECT
id,
date_of_joining,
to_char(date_of_joining, 'dd-mm-yyyy') as dd_mm_yyyy,
to_char(date_of_joining, 'dd/mm/yyyy') as iso_date,
to_char(date_of_joining, 'dd mon yyyy') as short_month_date,
to_char(date_of_joining, 'dd month yyyy') as full_month_date,
to_char(date_of_joining, 'day, dd month yyyy') as full_readable

FROM employees