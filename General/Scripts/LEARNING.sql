CREATE DATABASE LEARNING;

USE LEARNING;

SELECT DATABASE();

ALTER DATABASE LEARNING READ ONLY = 1;

DROP DATABASE LEARNING;


CREATE TABLE employ(
employee_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
hourly_pay DECIMAL(5, 2),
hire_date DATE
);

RENAME TABLE employ TO workers;

ALTER TABLE workers
ADD phone_number VARCHAR(15);

SELECT *
FROM workers;

ALTER TABLE workers
RENAME COLUMN phone_number TO email;

ALTER TABLE workers
MODIFY COLUMN email VARCHAR(100);

ALTER TABLE workers
MODIFY COLUMN email VARCHAR (100)
AFTER last_name;

ALTER TABLE workers
MODIFY COLUMN email VARCHAR (100)
FIRST;

ALTER TABLE workers
DROP COLUMN email;

INSERT INTO workers
VALUES (1, "Olesia", "Ro", 13.67, "2024-08-19"),
	   (2, "Daria", "Hak", 12.78, "2024-10-11");
	  
INSERT INTO workers(employee_id, first_name, hourly_pay)
VALUES (3, "Kristi", 12.90)
	  
SELECT *
FROM workers
WHERE hire_date >= "2024-10-10";

SELECT *
FROM workers
WHERE hire_date IS NULL;

SELECT *
FROM workers
WHERE hire_date IS NOT NULL;

UPDATE workers
SET last_name = "Kracker"
WHERE employee_id = 3;

UPDATE workers
SET last_name = "Micker",
	hire_date = "2023-12-23"
WHERE employee_id = 3;

UPDATE workers
SET hourly_pay = 10.15;

SELECT *
FROM workers;

DELETE FROM workers
WHERE employee_id = 2;

CREATE TABLE time(
	my_date DATE,
	my_time TIME,
	my_datetime DATETIME
);

SELECT *
FROM time;

INSERT INTO time
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());

CREATE TABLE products (
	product_id INT,
	product_name VARCHAR(25) UNIQUE,
	price DECIMAL(4,2)
);

DROP TABLE products;

SELECT *
FROM products;

ALTER TABLE products
ADD CONSTRAINT
UNIQUE(product_id);

DROP TABLE products;

CREATE TABLE products (
	product_id INT,
	product_name VARCHAR(25) UNIQUE,
	price DECIMAL(4,2) NOT NULL
);

ALTER TABLE products
MODIFY product_name VARCHAR(25) UNIQUE NOT NULL;

DROP TABLE workers;

CREATE TABLE workers(
employee_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
hourly_pay DECIMAL(5, 2) NOT NULL,
hire_date DATE,
CONSTRAINT chk_hourlypay CHECK(hourly_pay >=10.00)
);

INSERT INTO workers
VALUES (1, "Olesia", "Ro", 13.67, "2024-08-19"),
	   (2, "Daria", "Hak", 12.78, "2024-10-11");

INSERT INTO workers
VALUES (1, "Kseniia", "SH", 10.67, "2024-08-19"),
	   (2, "Hello", "Good", 12.78, "2024-10-11");
	  
SELECT *
FROM workers;

ALTER TABLE workers
ADD CONSTRAINT chk_hiredate CHECK (hire_date >= "2024-07-11");

ALTER TABLE workers
DROP CHECK chk_hiredate;

CREATE TABLE products (
	product_id INT,
	product_name VARCHAR(25) UNIQUE,
	price DECIMAL(4,2) DEFAULT 0
);

SELECT *
FROM products;

ALTER TABLE products
ALTER price SET DEFAULT 0;

INSERT INTO products (product_id, product_name)
VALUES (101, "corn"),
	   (102, "popcorn"),
	   (103, "cake");
	  
CREATE TABLE transactions(
	transaction_id INT,
	amount DECIMAL(4,2),
	transaction_date DATETIME DEFAULT NOW()
);

INSERT INTO transactions(transaction_id, amount)
VALUES (1, 13.12);

SELECT * 
FROM transactions;

DROP TABLE transactions;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
	amount DECIMAL(4,2),
	transaction_date DATETIME DEFAULT NOW()
);


ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY (transaction_id);



DROP TABLE transactions;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
	amount DECIMAL(4,2),
	transaction_date DATETIME DEFAULT NOW()
);

SELECT * 
FROM transactions;

INSERT INTO transactions(amount)
VALUES (3.99);

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

DELETE FROM transactions;

INSERT INTO transactions(amount)
VALUES (3.99);

SELECT * 
FROM transactions;

CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
)

SELECT * FROM customers;

INSERT INTO customers (first_name, last_name)
VALUES ("Olesia", "Ro"),
  	   ("Dariia", "Hak");
  	  
DROP TABLE transactions;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
	amount DECIMAL(4,2),
	transaction_date DATETIME DEFAULT NOW(),
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT * 
FROM transactions;


ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1;

ALTER TABLE transactions 
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

ALTER TABLE transactions
AUTO_INCREMENT = 1000;

ALTER TABLE transactions
DROP FOREIGN KEY fk_customer_id;

SELECT *
FROM transactions;

DELETE FROM customers;

INSERT INTO customers(first_name, last_name)
VALUES ("Dariia", "Hak");

SELECT * FROM customers;

INSERT INTO transactions (amount, customer_id)
VALUES (10.89, 3),
       (9.34, 3),
       (7.90, 4),
       (12.99, 4);
      
INSERT INTO transactions (amount, customer_id)
VALUES (1.56, NULL);

INSERT INTO customers(first_name, last_name)
VALUES ("Poppy", "Puff");

SELECT *
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;


SELECT transaction_id, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT transaction_id, first_name, last_name
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;


SELECT transaction_id, first_name, last_name
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;



SELECT tr.transaction_id, c.first_name, c.last_name
FROM transactions as tr
LEFT JOIN customers as c
ON tr.customer_id = c.customer_id;


SELECT COUNT(amount) AS count
FROM transactions;


SELECT MAX(amount) AS max
FROM transactions;

SELECT MIN(amount) AS min
FROM transactions;

SELECT AVG(amount) AS avg
FROM transactions;

SELECT SUM(amount) AS sum
FROM transactions;

SELECT CONCAT(first_name, ' ' ,last_name) AS full_name
FROM customers;

SELECT * FROM workers;

DELETE FROM workers
WHERE employee_id = 2;

ALTER TABLE workers
ADD CONSTRAINT 
PRIMARY KEY(employee_id);

ALTER TABLE workers
AUTO_INCREMENT = 1;

ALTER TABLE workers
MODIFY hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

INSERT INTO workers(employee_id, first_name, last_name, hourly_pay)
VALUES (3, "Mee", "moo", 11.56);


-- day 2 (before friday)

select *
from workers;

ALTER TABLE workers
ALTER hourly_pay SET DEFAULT 10;

insert into workers (employee_id, first_name, last_name)
values (4, "Olha", "Koral"),
	   (5, "Olena", "Hohol");
	  
	  
select *
from workers
where first_name like "o%";

	  
select *
from workers
where first_name like "__e";

select *
from workers
where hire_date like "____-__-12%";


-- order by - ASC default - in alphabetic order default
select * from workers
order by first_name DESC;

select * from workers
order by hourly_pay ASC, last_name DESC;

select * from workers
order by hire_date limit 1;

select * from workers
order by hire_date;

select * from workers
order by hire_date limit 2,3; -- three after the second

-- unions  -vertical unions

create table income(
	income_source varchar(100),
	amount int
);

insert into income
values ("job1", 59000),
	   ("job2", 100000),
	   ("business", 120000);
	  
	  
insert into income
values ("food", 19000);
	  
create table expenses(
	expenses_source varchar(100),
	amount int
);

insert into expenses
values ("food", 19000),
	   ("rent", 120000),
	   ("chocolates", 10000);
	  
select * from income;

select * from expenses;


select * from income

union all -- saves the duplicates

select * from expenses;

select * from income

union -- deoesn't include duplicates

select * from expenses;
-- we should have the same columns for doing unions