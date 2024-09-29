-- INDEX (BTree data structure)
-- Indexes are used to find values within a specific column more quickly
-- MySQL normally searches sequentially through a column
-- The longer the column, the more expensive the operation is
-- UPDATE takes more time, SELECT takes less time

USE LEARNING;

select * from customers;

show indexes from customers;

create index last_name_indx 
on customers(last_name);

create index last_name_firs_name_indx
on customers(last_name, first_name);

alter table customers
drop index last_name_indx;

-- як б-трі працює для індексів з текстовим значенням

-- query(subquery)

select * from workers; 

select avg(hourly_pay) from workers;

select first_name, last_name, hourly_pay, 
	(
		select avg(hourly_pay) 
		from workers
	) as avg_hourly_pay
from workers;

select first_name, last_name, hourly_pay
from workers
where hourly_pay > (select avg(hourly_pay) from workers);

select distinct customer_id
from transactions
where customer_id is not null;


select first_name, last_name
from customers
where customer_id in 
(
	select distinct customer_id
	from transactions
	where customer_id is not null
);

select first_name, last_name
from customers
where customer_id not in 
(
	select distinct customer_id
	from transactions
	where customer_id is not null
);

-- GROUP BY = aggregate all rows by a specific column
-- 		often used with aggregate functions
-- 		ex. SUM(), MAX(), MIN(), AVG(), COUNT()

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) 
    REFERENCES customers(customer_id)
);

INSERT INTO transactions
VALUES  (1000, 4.99, 3, "2023-01-01"),
  (1001, 2.89, 2, "2023-01-01"),
  (1002, 3.38, 3, "2023-01-02"),
  (1003, 4.99, 1, "2023-01-02"),
  (1004, 1.00, NULL, "2023-01-03"),
  (1005, 2.49, 4, "2023-01-03"),
  (1006, 5.48, NULL, "2023-01-03");
 
 /* foreign  kye = множина primary key  в іншій таблиці, інакше - помилка 
  * може бути foreign key null, але він точнот ммає бути в іншій табоиці, якщо не нульовий*/
        
SELECT * FROM transactions;

select * from customers;

insert into customers
values (1, "Poppy", "Puff"),
	   (2, "Doppy", "Krucky");
	  

select sum(amount) as revenue, order_date 
from transactions
group by order_date;

select sum(amount), customer_id
from transactions
group by customer_id;

select sum(amount), customer_id
from transactions
group by customer_id;

select sum(amount) as sum_by_c, customer_id
from transactions
group by customer_id
having sum_by_c > 5 and customer_id is not null;


-- ROLLUP, extension of the GROUP BY clause
-- produces another row and shows the GRAND TOTAL (super-aggregate value)

select sum(amount) as revenue, order_date 
from transactions
group by order_date with rollup;

delete from customers
where customer_id = 4; -- SQL Error [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails 

alter table transactions drop foreign key transactions_ibfk_1;

ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
ON DELETE SET NULL;


delete from customers
where customer_id = 4; 

select * from transactions;

insert into customers
values (4, "Deleted", "Ghost");

alter table transactions drop foreign key fk_customer_id;

ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
ON DELETE CASCADE;

update transactions
set customer_id = 4
where transaction_id = 1005;


-- Stored procedure = is prepared SQL code that you can save
-- great if there's a query that you write often

SELECT DISTINCT first_name, last_name
FROM transactions
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

DELIMITER $$

CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM customers;
END $$

DELIMITER ;

call get_customers();

DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)  
BEGIN  
 SELECT *
 FROM customers
 WHERE customer_id = id;
END $$
DELIMITER ; 

call find_customer(1);

