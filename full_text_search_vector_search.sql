SELECT * FROM products
WHERE name LIKE '%Samsung%'

SELECT * FROM products
WHERE name LIKE '%Bionic%'
OR description LIKE '%Bionic %'


SELECT * FROM products
WHERE name ILIKE '%bionic%'
OR description ILIKE '%bionic %'   --ILIKE dile case sensitive na choto boro hater woed sob cole ase 



---vector search

SELECT * FROM products
WHERE to_tsvector(description)
@@to_tsquery('bionic')


SELECT * FROM products
WHERE to_tsvector(description)
@@to_tsquery('chip & bionic')


SELECT * FROM products
WHERE to_tsvector(description)
@@to_tsquery('fuck | chip')

SELECT * FROM products