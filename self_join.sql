CREATE Table categories(
   id SERIAL PRIMARY KEY,
   name VARCHAR(100),
   parent_id int
)

SELECT * FROM categories


---Self JOin Query

--- 2 step self join 
SELECT
R.name AS root_category,
S.name AS sub_category

FROM categories AS R 
JOIN categories AS S

ON R.id = S.parent_id 


---3 step self join

SELECT
R.name AS root_category,
S.name AS sub_category,
C.name AS Child_category

FROM categories AS R 
JOIN categories AS S
ON R.id = S.parent_id
JOIN categories AS C
ON S.id = C.parent_id