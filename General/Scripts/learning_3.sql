create database learning_exercises;

use learning_exercises;

-- https://www.geeksforgeeks.org/sql-exercises/
-- Create Sales table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    total_price DECIMAL(10, 2)
);

-- Insert sample data into Sales table

INSERT INTO Sales (sale_id, product_id, quantity_sold, sale_date, total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);

-- Create Products table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- Insert sample data into Products table

INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

select * from sales limit 1000;
-- 1) Identify products with total sales exceeding 30.

select p.product_name, sum(s.total_price) as total
from sales s
left join products p
on s.product_id = p.product_id
group by p.product_id
having total>30
order by total desc;

-- 2) Count the number of sales made in each month.
select date_format(sale_date, '%Y-%m') as month, sum(quantity_sold) as sales
from sales
group by month;

-- 3) Determine the average quantity sold for products with a unit price greater than $100.
SELECT avg(s.quantity_sold) as av_q
from sales s
left join products p
on s.product_id = p.product_id
where p.unit_price > 100
limit 200;

-- 4)  Retrieve the product name and total sales revenue for each product.
SELECT p.product_name, sum(s.total_price) as total_revenue
from sales s
left join products p
on s.product_id = p.product_id
group by p.product_name;

-- 5) Highest percentage in revenue?
SELECT p.category, sum(s.total_price) as product_revenue, 
	sum(s.total_price)/(select sum(total_price) from sales) * 100 as perc_of_TR
from sales s
left join products p
on s.product_id = p.product_id
group by p.category
limit 200;

-- 6) Rank products based on total sales revenue.
SELECT p.product_name, SUM(s.total_price) AS total_revenue,
       RANK() OVER (ORDER BY SUM(s.total_price) DESC) AS revenue_rank
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 7) Calculate the running total revenue for each product category.

SELECT p.category, p.product_name, s.sale_date, 
       SUM(s.total_price) OVER (PARTITION BY p.category ORDER BY s.sale_date) AS running_total_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id;

-- 8) Categorize sales as “High”, “Medium”, or “Low” based on total price (e.g., > $200 is High, $100-$200 is Medium, < $100 is Low).
select product_name, unit_price,
	case 
		when unit_price > 200 then "High"
		when unit_price < 100 then "Low"
		else "Medium"
	end as unit_price_status
from products;

-- 9) Identify sales where the quantity sold is greater than the average quantity sold.
SELECT *
from sales
where quantity_sold > (select avg(quantity_sold) from sales)
limit 200;

-- 10) Extract the month and year from the sale date and count the number of sales for each month.
select date_format(sale_date, '%Y-%m') as month, count(*) as num_of_sales
from sales
group by month;

SELECT CONCAT(YEAR(sale_date), '-', LPAD(MONTH(sale_date), 2, '0')) AS month,
       COUNT(*) AS sales_count
FROM Sales
GROUP BY YEAR(sale_date), MONTH(sale_date);

-- 11) Calculate the number of days between the current date and the sale date for each sale.
SELECT sale_id, DATEDIFF(NOW(), sale_date) AS days_since_sale
FROM Sales;

-- 12) Identify sales made during weekdays versus weekends.
SELECT sale_id,
       CASE 
           WHEN DAYOFWEEK(sale_date) IN (1, 7) THEN 'Weekend'
           ELSE 'Weekday'
       END AS day_type
FROM Sales;

-- 13) Write a query to create a view named Total_Sales that displays the total sales amount for 
-- each product along with their names and categories.
drop view total_sales;
create view total_sales as
select p.product_name, p.category, sum(s.total_price)
from sales s
join products p 
on s.product_id = p.product_id
group by p.product_id, p.category;
select * from total_sales limit 200;

-- 14) Retrieve the product details (name, category, unit price) for products that have a quantity 
-- sold greater than the average quantity sold across all products.

SELECT product_name, category, unit_price
FROM Products
WHERE product_id IN (
    SELECT product_id
    FROM Sales
    GROUP BY product_id
    HAVING SUM(quantity_sold) > (SELECT AVG(quantity_sold) FROM Sales)
);

-- 15) Create a view named Top_Products that lists the top 3 products based on the total quantity sold.
select product_id
from sales
group by product_id
order by sum(quantity_sold)
limit 3

SELECT p.product_name, sum(s.quantity_sold) as total_q
from sales s
left join products p 
on s.product_id = p.product_id
group by p.product_name
order by total_q DESC 
limit 3;






