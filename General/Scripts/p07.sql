create database po7;
use P05;

CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

INSERT INTO Students (id, name, age)
VALUES 
(1, 'John Doe', 15),
(2, 'Jane Smith', 14),
(3, 'Sam Brown', 16);

with sum_ages as
(
	select sum(age),
		count(age)
	from students
)

select *
from students, sum_ages

select *,
	sum(age) over (),
	count(age) over (),
	row_number() over ()
from students

select *
from 
(
select *,
	row_number() over (order by loan_amount desc) as rn -- window function
from loans l
) test1
where rn = 4;

select *
from 
(
select *,
	row_number() over (partition by loan_type order by loan_amount desc) as rn -- thats how we use group by and window function on the same level
from loans l
) test1
where rn = 4;

select *
from loans
where loan_date is not null
order by loan_date
limit 100000;  

select *,
	lag(loan_amount, 1) over (order by loan_date desc) -- you usually use this with dates -- -- if you work in trade -- previous data -- the first will be row
from loans l
where loan_date is not null;

select *,
	lead(loan_amount, 1) over (order by loan_date desc) -- you usually use this with dates -- -- if you work in trade -- next data -- the lst will be row
from loans l
where loan_date is not null;

-- use indexes when 1) the column is wildly used 2) dates



