CREATE DATABASE lectures;

use lectures;

-- IF function
SELECT IF(100<200, "YES", "NO");

CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT
);

INSERT INTO Employees (ID, NAME, DEPARTMENT, SALARY) VALUES 
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'Engineering', NULL),
(3, 'Charlie', NULL, 60000),
(4, 'Diana', 'Marketing', 70000),
(5, 'Eve', NULL, NULL);

select * from employees;


select name, department,
	   if(salary is null, "salary not provided", concat("$", salary))
from employees;

select name,
	   CASE 
	   		when salary is null then "salary not provided"
	   		when salary < 60000 then "below average"
	   		else "above average"
	   END as salary_status
from employees;

select name,
	   ifnull(salary, 0) as salary
from employees;

SELECT name, department, salary
FROM employees e
WHERE salary > (
 SELECT AVG(salary)
 FROM employees
);


SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');

CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');



delimiter //
CREATE PROCEDURE citycount (IN country CHAR(3), OUT cities INT)
BEGIN
SELECT COUNT(*) INTO cities FROM world.city
WHERE CountryCode = country;
END//

delimiter ;