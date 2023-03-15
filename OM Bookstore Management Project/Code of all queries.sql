-- How many days is the data period?

-- SQL code
SELECT * FROM book_data.Orders
ORDER BY order_date
limit 1;

SELECT * FROM book_data.Orders
ORDER BY order_date DESC
limit 1;

SELECT DATEDIFF ("2022-09-02", "2022-08-16") as total_days;

-- How many books do we have in total?

-- SQL code
SELECT COUNT(book_id) AS total_books
FROM book_info;

-- Return a table containing a list of book titles that have a higher number of pages than the average number of book pages!

-- SQL code
SELECT book_name
	,number_of_pages
FROM book_info
WHERE number_of_pages > (
		SELECT AVG(number_of_pages) AS higher_page
		FROM book_info
		)
ORDER BY number_of_pages;

-- Which publisher has printed the most books?

-- SQL code
SELECT p.publisher_id
	,p.name AS publisher
	,COUNT(bi.publisher_id) AS total
FROM book_info bi
JOIN publisher p ON bi.publisher_id = p.publisher_id
GROUP BY p.publisher_id,
	publisher
ORDER BY total DESC LIMIT 3;

-- 5. What is the total revenue of the bookstore?
-- 6. How many books are sold online?

-- SQL code
-- revenue amount
SELECT SUM(quantity * unit_price) AS Revenue
FROM Order_items oi;

-- total book sold
SELECT SUM(quantity) AS totalbooks_sold
FROM Order_items;

-- Which Province has the most invoices?

-- SQL Code
SELECT c.province
	,COUNT(o.order_id) AS invoice_number
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY invoice_number
ORDER BY 2 DESC;

-- Who is the best customer?

-- SQL code
SELECT o.customer_id
	,fist_name
	,last_name
	,COUNT(oi.quantity) AS total_book
	,SUM(quantity * unit_price) AS money_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY 1
	,2
	,3
ORDER BY 5 DESC LIMIT 3;

-- Who is writing Horror books?

-- SQL code
SELECT author
	,book_name
FROM book_info bi
JOIN genre g ON bi.genre_id = g.genre_id
WHERE g.name = "Horror";

-- First, find which artist has earned the most according to the InvoiceLines. Now use this artist to find which customer spent the most on this artist.

-- SQL code
WITH tbl_best_selling_author
AS (
	SELECT author
		,SUM(oi.unit_price * oi.quantity) AS total_sales
	FROM book_info bi
	JOIN Order_items oi ON bi.book_id = oi.product_id
	GROUP BY author
	ORDER BY total_sales DESC LIMIT 10
	)
SELECT bsa.author
	,SUM(oi.unit_price * oi.quantity) AS amount_spent
	,c.customer_id
	,c.fist_name
	,c.last_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
JOIN book_info bi ON oi.product_id = bi.book_id
JOIN tbl_best_selling_author bsa ON bi.author = bsa.author
GROUP BY bsa.author
	,c.customer_id
	,c.first_name
	,c.last_name
ORDER BY amount_spent DESC;

-- We want to find out the most popular book Genre for each Province!

-- SQL code
WITH RECURSIVE tbl_sales_per_province
AS (
	SELECT COUNT(*) AS purchases_per_genre
		,province
		,g.name AS genre
		,g.genre_id
	FROM Customers c
	JOIN Orders o ON c.customer_id = o.customer_id
	JOIN Order_items oi ON o.order_id = oi.order_id
	JOIN book_info bi ON oi.product_id = bi.book_id
	JOIN genre g ON bi.genre_id = g.genre_id
	GROUP BY 2
		,3
		,4
	ORDER BY 1 DESC
	)
	,tbl_max_genre_per_province
AS (
	SELECT MAX(purchases_per_genre) AS max_genre_number
		,province
	FROM tbl_sales_per_province
	GROUP BY 2
	ORDER BY 2
	)
SELECT tbl_sales_per_province.*
FROM tbl_sales_per_province
JOIN tbl_max_genre_per_province ON tbl_sales_per_province.province = tbl_max_genre_per_province.province
WHERE tbl_sales_per_province.purchases_per_genre = tbl_max_genre_per_province.max_genre_number;

-- Write a query that determines the customer that has spent the most on books for each province.

-- SQL code
WITH RECURSIVE tbl_customer_with_province
AS (
	SELECT c.customer_id
		,fist_name
		,last_name
		,province
		,SUM(oi.quantity * oi.unit_price) AS total_spending
	FROM Order_items oi
	JOIN Orders o ON oi.order_id = o.order_id
	JOIN Customers c ON c.customer_id = o.customer_id
	GROUP BY 1
		,2
		,3
		,4
	ORDER BY 2
		,3 DESC
	)
	,tbl_province_max_spending
AS (
	SELECT province
		,MAX(total_spending) AS max_spending
	FROM tbl_customer_with_province
	GROUP BY 1
	)
SELECT tbl_cp.province
	,tbl_cp.customer_id
	,tbl_cp.fist_name
	,tbl_cp.last_name
	,tbl_cp.total_spending
FROM tbl_customer_with_province tbl_cp
JOIN tbl_province_max_spending tbl_ms ON tbl_cp.province = tbl_ms.province
WHERE tbl_cp.total_spending = tbl_ms.max_spending
ORDER BY 1;
