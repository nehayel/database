CREATE TABLE users(
   id BIGSERIAL PRIMARY KEY,
   firstname VARCHAR(50) NOT NULL,
   lastname VARCHAR(50) NOT NULL,
   email VARCHAR(15) UNIQUE NOT NULL,
   mobile VARCHAR(50) NOT NULL,
   pass VARCHAR(500) NOT NULL,
   otp VARCHAR(10) NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE categories(
   id BIGSERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   user_id BIGINT NOT NULL,
   FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE customers(
   id BIGSERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   mobile VARCHAR(15) NOT NULL,
   user_id BIGINT NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );


CREATE TABLE products(
   id BIGSERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   price VARCHAR(50) NOT NULL,
   unit VARCHAR(50) NOT NULL,
   img_url VARCHAR(500) NOT NULL,
   user_id BIGINT NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
   category_id BIGINT NOT NULL,
   FOREIGN KEY(category_id) REFERENCES categories(id) ON UPDATE CASCADE ON DELETE RESTRICT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE invoices(
   id BIGSERIAL PRIMARY KEY,
   total VARCHAR(50) NOT NULL,
   discount VARCHAR(50) NOT NULL,
   vat VARCHAR(50) NOT NULL,
   payable VARCHAR(50) NOT NULL,
   user_id BIGINT NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
   customer_id BIGINT NOT NULL,
   FOREIGN KEY(customer_id) REFERENCES customers(id) ON UPDATE CASCADE ON DELETE CASCADE,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE invoices_products(
   id BIGSERIAL PRIMARY KEY,
   qty VARCHAR(50) NOT NULL,
   sale_price VARCHAR(50) NOT NULL,
   user_id BIGINT NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
   product_id BIGINT NOT NULL,
   FOREIGN KEY(product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE,
   invoice_id BIGINT NOT NULL,
   FOREIGN KEY(invoice_id) REFERENCES invoices(id) ON UPDATE CASCADE ON DELETE CASCADE,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Indexing

/*
users
login Optimize ---> email
Profile Data Optimize ---> Id (---PK---Auto Index)
*/
CREATE INDEX idx_users_email ON users(email)

/*
categories
user wise categories Optimize ---> user_id
*/
CREATE INDEX idx_categories_user_id ON categories(user_id)


/*
customers
user wise customer Optimize ---> user_id
customers date lookup --->email, mobile
*/
CREATE INDEX idx_customers_user_id ON customers(user_id)
CREATE INDEX idx_customers_email ON customers(email)
CREATE INDEX idx_customers_mobile ON customers(mobile)


/*
products
user wise products Optimize ---> user_id
products date lookup --->name, category_id
*/
CREATE INDEX idx_products_user_id ON products(user_id)
CREATE INDEX idx_products_name ON products(name)
CREATE INDEX idx_products_category_id ON products(category_id)


/*
invoices
user wise invoices Optimize ---> user_id
invoices date lookup --->created_at, customer_id
*/
CREATE INDEX idx_invoices_user_id ON invoices(user_id)
CREATE INDEX idx_invoices_created_at ON invoices(created_at)
CREATE INDEX idx_invoices_customer_id ON invoices(customer_id)


/*
invoices_products
user wise invoices_products Optimize ---> user_id
invoices_products date lookup --->invoice_id, product_id
*/
CREATE INDEX idx_invoices_products_user_id ON invoices_products(user_id)
CREATE INDEX idx_invoices_products_invoice_id ON invoices_products(invoice_id)
CREATE INDEX idx_invoices_products_product_id ON invoices_products(product_id)


SELECT * FROM products WHERE id=3

SELECT NAME,price FROM products 

SELECT 
MAX(price::NUMERIC) AS max_price,
MIN(price::NUMERIC) AS min_price,
AVG(price::NUMERIC) AS avg_price,
SUM(price::NUMERIC) AS sum_price

FROM products

SELECT 
name, 
price::NUMERIC as base_price,
price::NUMERIC * 0.15 as vat_amount,
price::NUMERIC *1.15 as total_amount, ---15% Vat INCLUDE
price::NUMERIC > 500 as Is_expensive,
price::NUMERIC - price::NUMERIC * 0.30 as discount_price  ----30% Discount
FROM products

SELECT 
name,
price::NUMERIC,

CASE
   WHEN price::NUMERIC<100  THEN 'CHEEP'
   WHEN price::NUMERIC BETWEEN 100 AND 600 THEN 'Moderate'
   WHEN price::NUMERIC BETWEEN 601 AND 1200 THEN 'Near Expensive'
   ELSE 'Expensive' 

END AS price_category

FROM products


---Apply discount Rule
--price > 500 -> 10% discount
---price > 1000 -> 5% discount
---otherwise -> no discount
SELECT
name,
price::NUMERIC AS Base_Price,
CASE 
   WHEN price::NUMERIC > 1000 THEN price::NUMERIC * 0.05
   WHEN price::NUMERIC > 500 THEN price::NUMERIC * 0.10   
   ELSE  00
END AS Discount_Amount

FROM products 



---SELECT name,price FROM(....SUB QUERY....) AS table_alias

SELECT product_name, base_price, discount_amount, base_price-discount_amount AS final_amount

FROM(
   SELECT 
   name as product_name,
   price::NUMERIC as base_price,
   CASE 
      WHEN price::NUMERIC > 1000 THEN price::NUMERIC * 0.05
      WHEN price::NUMERIC > 500 THEN price::NUMERIC * 0.10   
   ELSE  00
   END AS discount_amount
   FROM products
)AS products_table



SELECT 
avg(price::NUMERIC) AS max_price
FROM products


---Inner Join

SELECT 
products.name AS products_name,
categories.name AS category_name
FROM

products INNER JOIN categories
ON products.category_id = categories.id 

SELECT 
p.name as product_name,
p.unit as quantity,
c.name as product_category,
p.price as price

FROM
products AS p INNER JOIN categories AS c
on p.category_id = c.id

SELECT
c.name AS Customer_name,
c.mobile AS Customer_mobile,
i.total AS Total_amount,
i.discount AS Discount_amount,
i.payable AS Payable_amount

FROM
invoices AS i INNER JOIN customers AS c
ON i.customer_id = c.id  


---3 tables
SELECT 
p.name AS Product_name,
p.unit AS Product_quantity,
p.price AS Price,
c.name AS Category_name,
CONCAT(u.firstname, ' ', u.lastname) AS User_name

FROM
products AS p INNER JOIN categories AS c 
ON p.category_id = c.id

INNER JOIN users AS u
ON c.user_id = u.id 



---left Join
SELECT 
categories.name,
products.name,
products.price

FROM
categories LEFT JOIN products
ON categories.id = products.category_id



---Full Outer Join
SELECT
c.name AS category_name,
p.name AS product_name,
p.price AS product_price

FROM
products AS p FULL OUTER JOIN categories AS c
ON p.category_id = c.id


---group by and having clause

CREATE Table sales(
   customer_name VARCHAR(50),
   category VARCHAR(50),
   amount NUMERIC(10,2),
   city VARCHAR(50)
)

INSERT INTO sales (customer_name, category, amount, city) VALUES
('Rahim', 'Electronics', 25000.00, 'Dhaka'),
('Karim', 'Furniture', 18000.00, 'Chattogram'),
('Rahim', 'Clothing', 4500.00, 'Dhaka'),
('Tanvir', 'Electronics', 32000.00, 'Khulna'),
('Karim', 'Groceries', 2200.00, 'Rajshahi'),
('Rahim', 'Furniture', 27000.00, 'Sylhet'),
('Tanvir', 'Clothing', 6800.00, 'Dhaka'),
('Rahim', 'Groceries', 1500.00, 'Barishal'),
('Karim', 'Electronics', 41000.00, 'Chattogram'),
('Tanvir', 'Furniture', 12500.00, 'Rangpur');


SELECT * FROM sales

--- Grop BY

SELECT customer_name, sum(amount) FROM sales GROUP BY customer_name 

SELECT category, sum(amount) AS Total FROM sales GROUP BY category

SELECT city, sum(amount) As total FROM sales GROUP BY city


---Having 

SELECT customer_name, sum(amount) FROM sales GROUP BY customer_name HAVING sum(amount)>60000

SELECT category, sum(amount) AS Total FROM sales GROUP BY category HAVING sum(amount) > 20000

SELECT city, sum(amount) As total FROM sales GROUP BY city HAVING sum(amount) > 40000



---DISTINCT---> Unique


ALTER TABLE sales ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM sales

SELECT DISTINCT city FROM sales 

SELECT city FROM sales

SELECT customer_name FROM sales

SELECT DISTINCT customer_name FROM sales

SELECT customer_name, category, city FROM sales

SELECT DISTINCT customer_name, category, city FROM sales


---order by

SELECT * FROM sales ORDER BY amount ASC ----small to big

SELECT * FROM sales ORDER BY amount DESC ---big to small

---limit and pagination

SELECT * FROM sales LIMIT 5 OFFSET 0 ----skip 1st 0 rows take 5 rows ---page 1

SELECT * FROM sales LIMIT 5 OFFSET 5----skip 1st 5 rows take 5 rows ---page 2

SELECT * FROM sales LIMIT 5 OFFSET 10 ----skip 1st 10 rows take 5 rows ---page 3

SELECT * FROM sales LIMIT 5 OFFSET 15 ----skip 1st 15 rows take 5 rows ---page 4


---Between / not between

SELECT * FROM sales WHERE amount BETWEEN 1000 AND 2000 --- 1000 to 2000 tk

SELECT * FROM sales WHERE amount NOT BETWEEN 1000 AND 2000 --- SKIP 1000 to 2000 tk


---in / not in

SELECT * FROM sales WHERE amount IN (1500,1800,1900)  --- just (1500,1800,1900) tk's rows

SELECT * FROM sales WHERE amount NOT IN (1500,1800,1900)  --- just SKIP (1500,1800,1900) tk's rows

--- exist
SELECT * FROM sales WHERE EXISTS (
   SELECT 1 FROM sales WHERE amount < 2000  ---just true false dekhe true hoilei sob show korbe false hoile ektaw na 
)
