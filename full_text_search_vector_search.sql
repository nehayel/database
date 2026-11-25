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



/*
1. Demo Table products ——→ id, product_name, description
2. Demo Data Insert

3. Search: LIKE Search ——→ LIKE '%Apple%'
   - Simple,
   - Small,
   - Medium 1K,
   - সার্চ করলে পুরো টেবিল স্ক্যান করতে হয়।

4. Full Text Search (FTS)
   - Large
   - Robust
   - Speed
   - ইনডেক্স ব্যবহার করে দ্রুত টেক্সট সার্চ করতে পারে
   - to_tsvector(——Col——)
   - @@to_tsquery(——Keyword——)
   - Blog Search
   - News Search
   - Product Search
   - Large Content Search
   - Documentation Search

5. to_tsvector(Col) ——→ Text কে Search Vector এ রূপান্তর করে
   Text ——→ Apple smartphone with advanced camera
   Vector Token ——→ 'advanc':4 'appl':1 'camera':5 'smartphon':2 (Search Vector/ Token)

6. @@to_tsquery(Keyword) ——→ Search Keyword কে Query তে রূপান্তর করে
   Keyword ——→ "android smartphone 2026"
   Output ——→ android & smartphone & 2026
   Match ——→ Table ——→ Col ——→ Description
*/
