CREATE Table products(
   id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   slug VARCHAR(255) UNIQUE,
   price NUMERIC(10,2) NOT NULL,
   stock INTEGER DEFAULT 0,
   description TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM products

INSERT INTO products (name, slug, price, stock, description) VALUES
('Samsung Galaxy A15', 'samsung-galaxy-a15', 24500.00, 40, '6.5 inch display, 128GB storage'),
('Samsung Galaxy S23', 'samsung-galaxy-s23', 89000.00, 12, 'Flagship Android phone'),
('Xiaomi Redmi Note 12', 'xiaomi-redmi-note-12', 21000.00, 55, 'AMOLED display, 5000mAh battery'),
('Realme C55', 'realme-c55', 17500.00, 0, 'Budget phone with fast charging'),
('iPhone 13', 'iphone-13', 95000.00, 8, '128GB, A15 Bionic chip'),
('iPhone 15 Pro', 'iphone-15-pro', 165000.00, 5, 'Titanium body, 256GB'),
('Dell Inspiron 15', 'dell-inspiron-15', 62000.00, 14, 'Core i5, 8GB RAM, 512GB SSD'),
('HP Pavilion 14', 'hp-pavilion-14', 68000.00, 9, 'Core i5, 16GB RAM'),
('Lenovo ThinkPad E14', 'lenovo-thinkpad-e14', 78000.00, 6, 'Business laptop, Core i7'),
('Asus ROG Strix G16', 'asus-rog-strix-g16', 185000.00, 3, 'Gaming laptop, RTX 4060'),
('MSI Katana 15', 'msi-katana-15', 142000.00, 4, 'Gaming laptop, RTX 4050'),
('Acer Aspire 5', 'acer-aspire-5', 54000.00, 20, 'Everyday laptop, Ryzen 5'),
('Sony WH-1000XM5', 'sony-wh-1000xm5', 38000.00, 10, 'Noise cancelling headphones'),
('JBL Flip 6', 'jbl-flip-6', 12500.00, 25, 'Portable Bluetooth speaker'),
('Anker Power Bank 20000', 'anker-power-bank-20000', 4200.00, 60, '20000mAh fast charging'),
('Cotton Shirt Blue', 'cotton-shirt-blue', 1450.00, 80, 'Formal cotton shirt, size M-XL'),
('Cotton Shirt White', 'cotton-shirt-white', 1450.00, 75, 'Formal cotton shirt, size M-XL'),
('Denim Jeans Slim Fit', 'denim-jeans-slim-fit', 2200.00, 45, 'Stretch denim, 30-36'),
('Chino Pant Khaki', 'chino-pant-khaki', 1850.00, 0, 'Casual chino pant'),
('Polo T-Shirt Black', 'polo-t-shirt-black', 950.00, 120, 'Cotton polo'),
('Katan Saree Red', 'katan-saree-red', 8500.00, 7, 'Handwoven katan saree'),
('Jamdani Saree Green', 'jamdani-saree-green', 12500.00, 5, 'Traditional Dhakai jamdani'),
('Cotton Saree Yellow', 'cotton-saree-yellow', 2400.00, 30, 'Daily wear cotton saree'),
('Salwar Kameez Embroidered', 'salwar-kameez-embroidered', 4800.00, 18, '3 piece embroidered set'),
('Salwar Kameez Cotton', 'salwar-kameez-cotton', 2900.00, 35, '3 piece cotton set'),
('Leather Wallet Brown', 'leather-wallet-brown', 1200.00, 50, 'Genuine leather wallet'),
('Running Shoes Pro', 'running-shoes-pro', 5600.00, 22, 'Lightweight running shoes'),
('Formal Leather Shoes', 'formal-leather-shoes', 4500.00, 0, 'Black formal shoes'),
('Wireless Mouse', 'wireless-mouse', 850.00, 90, '2.4GHz wireless mouse'),
('Mechanical Keyboard', 'mechanical-keyboard', 6500.00, 15, 'RGB mechanical keyboard');


SELECT name, price, stock FROM products WHERE price > 100000
UNION
SELECT name, price, stock FROM products WHERE price < 20000

SELECT name, price, stock FROM products WHERE price > 100000
UNION ALL
SELECT name, price, stock FROM products WHERE price < 20000


/*
Union
1. বিভিন্ন Table থেকে একই ধরনের Data আনতে হলে
2. Reporting তৈরি করতে হলে
3. Archive + Current Data একসাথে দেখাতে হলে
4. JOIN = Columns বাড়ায়
5. UNION = Rows বাড়ায়
6. 1st=10 UNION 2nd=15 ⟹ Duplicate বাদ গেলে 25 বা তার কম
   (যেমন 4টা Duplicate থাকলে 10+15-4 = 21)

Union ALL
1. বিভিন্ন Table থেকে একই ধরনের Data আনতে হলে
2. Reporting তৈরি করতে হলে
3. Archive + Current Data একসাথে দেখাতে হলে 
4. JOIN = Columns বাড়ায়
5. UNION ALL = Rows বাড়ায়
6. 1st=10 UNION ALL 2nd=15 ⟹ 10+15 = 25 (সবসময়)

Union VS Union ALL
1. Union ——→ duplicate rows ——→ Remove ——→ Unique
2. Union ALL ——→ duplicate rows ——→ Not Remove ——→ Not Unique

নিয়ম: দুটো SELECT-এ Column-এর সংখ্যা আর Data type একই হতে হবে

*/
