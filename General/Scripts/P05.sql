create database P05;

use P05;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(30),
    birth_date DATE
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(10, 2),
    opened_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    description VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(10, 2),
    loan_type VARCHAR(50),
    loan_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);

select *
from randomdata;


create table birthday_table as
(
	select id, 
		firstname, 
		lastname, 
		email, 
		age, 
		cast(birthday as date) as birthday
	from randomdata
);

select *
from birthday_table;

-- data or metadata

explain analyze select *
from birthday_table;

create table birthday_table_ind as
(
	select *
	from birthday_table
);

ALTER TABLE birthday_table_ind
ADD INDEX `birthday_index` (`birthday`);

 -- we create the index on the column we use very often
-- purpose is to shorten the time of the quary
-- primary key checks the uniqueness of the row

coalesce()
nullif()

select *
from Payments
limit 100000;

limit 1000000;

select 

SELECT coalesce(loan_type, "NA"),
       SUM(loan_amount)
FROM loans
GROUP BY COALESCE(loan_type, 'NA')
limit 100000;

update Transactions 
set description = NULL 
where description = ''; 

-- при підрахунку метрик по колонках з null треба бути дуже оборежним та використовуваи coalesce

SELECT coalesce(loan_type, "NA") as loan_type,
	   count(*) as count_loans, -- counts all rows 
       SUM(loan_amount) as sum_loans,
       avg(loan_amount) as avg_loans,
       count(loan_amount), -- doesnt count nulls
       count(case when loan_type = 'Home' then 1 end),
       avg(coalesce(loan_amount, 0))
FROM loans
GROUP BY COALESCE(loan_type, 'NA')
limit 100000;

select count(*)
from loans
limit 10000;

select *,
	  nullif(loan_amount, 'Home')
from loans;

select * , -- рядкові функції
	   date_add(loan_date, interval '10' day),
	   current_date(),
	   now(),
	   current_timestamp()
from loans
limit 100000;

select *
from customers c
limit 10000;

alter table customers
drop column `customer_id,first_name,last_name,email,phone_number,birth_date`;

select customer_id,
		first_name,
		last_name,
		email,
		phone_number,
		birth_date,
		concat(first_name, coalesce(last_name, '')) as full_name,
		CONCAT(first_name, ' ', COALESCE(last_name, '')),
		lower(first_name), -- string functions
		upper(first_name)
from customers c
limit 10000;

select * 
from customers c
left join loans l
on c.customer_id = l.customer_id
where c.customer_id = 1;

select *
from accounts a -- перша таблиця має всі дані, які необхідно
left join transactions t
on a.account_id = t.account_id
and t.transaction_type = 'Credit' -- оптимізованіше
limit 10000


-- with cte_1 as
-- (
-- select a.account_id, t.amount, t.transaction_type
-- from accounts a -- перша таблиця має всі дані, які необхідно
-- left join transactions t
-- on a.account_id = t.account_id
-- and t.transaction_type = 'Credit' -- оптимізованіше
-- limit 10000
-- )
-- select account_id, transaction_type, sum(amount)
-- from cte_1
-- group by account_id, transaction_type
-- limit 10000;

select a.account_id,
	   t.transaction_type,
	   sum(t.amount)
from accounts a
left join transactions t
on a.account_id = t.account_id
group by 1,2;

on last_name = last_name
and first_name = first_name -- можна джоінити за кількома колонками


-- Для таблиці Customers зробити мапінг грунтуючись на рандомним числах
-- 1) Додати пусту колонку
-- 2) Вставити рандомні значення
-- 3) Додати другу пусту колонку
-- 4) На основі рандомних значень зробити мапінг
-- 5) Видалити колонку з рандомними значенням

select * from customers limit 200;

alter table customers
add random INT;

update customers
set random = floor(1 + (rand() * 100)); 


alter table customers
add mapping VARCHAR(50);


select customer_id, first_name, last_name, email, phone_number, birth_date, random, 
		case 
			when random > 75 then "High"
			when random < 25 then "Low"
			else "Medium"
		end as mapping
from customers

update customers 
set mapping = 
	case 
		when random > 75 then "High"
		when random < 25 then "Low"
		else "Medium"
	end;

alter table customers 
drop column mapping; 

-- Для кожного кастомера і лоан тайпу порахувати середній payment_amount

select *
from loans;

create table clp_final as
(
with cl as
(
select l.loan_id, l.customer_id, l.loan_amount, l.loan_type, c.first_name, c.last_name
from loans l
left join customers c
on l.customer_id = c.customer_id
limit 100000
),
clp AS 
(
select coalesce(cl.loan_id, 0), cl.customer_id, cl.loan_amount, coalesce(cl.loan_type, "NA") as loan_type, concat(coalesce(cl.first_name, "NFN"), " ", coalesce(cl.last_name, "NLN")) as full_name, p.payment_id, p.payment_amount
from payments p
left join cl 
on p.loan_id = cl.loan_id
)
select full_name, loan_type, coalesce(avg(payment_amount), 0) as avg_payment
from clp
group by full_name, loan_type
)

-- Знайти кастомера і лоантайп у яких значення середня пейменту менше ніж загальний середній пеймент

select * from clp_final limit 20000;

select *, cu
from clp_final
where avg_payment > (select avg(avg_payment) from clp_final);

