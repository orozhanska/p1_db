
ALTER TABLE user_profiles
COMMENT 'Table containing user profiles information';

ALTER TABLE user_profiles
MODIFY COLUMN user_id VARCHAR(36) COMMENT 'Unique identifier for each user',
MODIFY COLUMN first_name VARCHAR(50) COMMENT 'First name of the user',
MODIFY COLUMN last_name VARCHAR(50) COMMENT 'Last name of the user',
MODIFY COLUMN email VARCHAR(100) COMMENT 'Email address of the user',
MODIFY COLUMN phone_number VARCHAR(20) COMMENT 'Phone number of the user',
MODIFY COLUMN birth_date DATE COMMENT 'Date of birth of the user',
MODIFY COLUMN address VARCHAR(255) COMMENT 'Residential address of the user',
MODIFY COLUMN city VARCHAR(100) COMMENT 'City where the user resides',
MODIFY COLUMN country VARCHAR(100) COMMENT 'Country where the user resides',
MODIFY COLUMN occupation VARCHAR(100) COMMENT 'Occupation of the user';


INSERT INTO user_profiles (user_id, first_name, last_name, email, phone_number, birth_date, address, city, country, occupation) 
VALUES 
('9f1947b9-dc78-4f59-a781-5a5e4b22ee52', 'John', 'Doe', 'john.doe@example.com', '1234567890', '1990-01-01', '123 Main Street', 'New York', 'USA', 'Software Engineer'),
('c86b6238-f634-4ff6-9489-7edfebb89732', 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '1995-05-15', '456 Oak Avenue', 'Los Angeles', 'USA', 'Data Analyst'),
('a67882af-4d6d-4b3f-894d-f0b19fd0d681', 'Alice', 'Johnson', 'alice.johnson@example.com', '5551112222', '1985-10-20', '789 Elm Road', 'Chicago', 'USA', 'Marketing Manager'),
('7f849b5c-2671-476e-b953-5a79b3c1d50b', 'Bob', 'Brown', 'bob.brown@example.com', '1112223333', '1982-03-12', '321 Cedar Lane', 'Houston', 'USA', 'Financial Analyst'),
('d32a55ed-3105-4979-8d7b-7b5b6e9f5f63', 'Emily', 'Wilson', 'emily.wilson@example.com', '4445556666', '1998-07-08', '567 Pine Street', 'San Francisco', 'USA', 'Graphic Designer'),
('5c18f12e-4fd2-4ae9-8157-20e40d95f82d', 'Michael', 'Davis', 'michael.davis@example.com', '7778889999', '1976-12-25', '987 Birch Avenue', 'Miami', 'USA', 'Sales Manager'),
('8a24f7b9-3f5b-454c-80ac-74b9d3f8ff5d', 'Samantha', 'Clark', 'samantha.clark@example.com', '3334445555', '1993-09-30', '654 Maple Drive', 'Seattle', 'USA', 'HR Coordinator'),
('04e44182-f6b3-48e6-8ab3-0ad1c07af8f3', 'David', 'Martinez', 'david.martinez@example.com', '9990001111', '1980-02-18', '234 Walnut Street', 'Boston', 'USA', 'Product Manager'),
('6e7d92ee-9c0a-4a2e-ae6b-b3998624995f', 'Emma', 'Anderson', 'emma.anderson@example.com', '6667778888', '1987-06-17', '876 Cherry Avenue', 'Austin', 'USA', 'Software Developer'),
('b84a7744-1690-4a2c-bd32-6b16d11f9d51', 'James', 'Lee', 'james.lee@example.com', '2223334444', '1991-11-05', '543 Elm Street', 'Denver', 'USA', 'Data Scientist');
;

SELECT * FROM user_profiles;

UPDATE user_profiles
SET occupation = 'Senior Software Engineer'
WHERE city = 'New York';

UPDATE user_profiles
SET phone_number = '1231231234'
WHERE first_name = 'Emily' AND last_name = 'Wilson';

DELETE FROM user_profiles
WHERE user_id = '5c18f12e-4fd2-4ae9-8157-20e40d95f82d';

DELETE FROM user_profiles
WHERE email LIKE '%@example.com';

-- ROLLBACK;

DELETE FROM user_profiles;

TRUNCATE TABLE user_profiles;

DROP TABLE user_profiles;

USE P02;

CREATE TABLE book_shoppy (
    book_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    auther_first_name VARCHAR(100),
    auther_last_name VARCHAR(100),
    publisher VARCHAR(50),
    publishing_date DATE,
    city_of_publishing VARCHAR(100),
    country_of_publishing VARCHAR(100),
    pages INT
);

ALTER TABLE book_shoppy
COMMENT 'Table containing user information about the books we offer';

ALTER TABLE book_shoppy
MODIFY COLUMN book_id VARCHAR(10) COMMENT 'Unique identifier for each book',
MODIFY COLUMN name VARCHAR(50) COMMENT 'Name of the user',
MODIFY COLUMN auther_first_name VARCHAR(100) COMMENT 'First name of the author',
MODIFY COLUMN auther_last_name VARCHAR(100) COMMENT 'Last name of the author',
MODIFY COLUMN publisher VARCHAR(50) COMMENT 'Name of the publisher',
MODIFY COLUMN publishing_date DATE COMMENT 'Date of publishing',
MODIFY COLUMN city_of_publishing VARCHAR(100) COMMENT 'Where was the book published (city)',
MODIFY COLUMN country_of_publishing VARCHAR(100) COMMENT 'Where was the book published (country)',
MODIFY COLUMN pages INT COMMENT 'Number of pages';

INSERT INTO book_shoppy (book_id, name, auther_first_name, auther_last_name, publisher, publishing_date, city_of_publishing, country_of_publishing, pages)
VALUES 
('B001', 'The Great Adventure', 'John', 'Smith', 'Adventure House', '2020-05-12', 'New York', 'USA', 320),
('B002', 'Mastering SQL', 'John', 'Doe', 'TechPress', '2021-08-25', 'San Francisco', 'USA', 450),
('B003', 'Python Programming', 'John', 'Johnson', 'CodeCrafters', '2019-10-01', 'London', 'UK', 550),
('B004', 'Deep Dive into React', 'John', 'Brown', 'Web Developers Ltd', '2022-01-15', 'Berlin', 'Germany', 380),
('B005', 'Data Science Basics', 'Alice', 'Green', 'DataWorks', '2020-11-30', 'Toronto', 'Canada', 410),
('B006', 'AI and Machine Learning', 'David', 'White', 'FutureTech', '2023-03-07', 'Tokyo', 'Japan', 600),
('B007', 'Understanding Algorithms', 'John', 'Miller', 'Algorithm World', '2018-07-20', 'Paris', 'USA', 300),
('B008', 'Building Web Applications', 'Daniel', 'Garcia', 'FullStack Press', '2021-09-10', 'Madrid', 'Spain', 470),
('B009', 'Cloud Computing Essentials', 'John', 'Martinez', 'CloudMasters', '2019-04-22', 'Sydney', 'USA', 290),
('B010', 'Big Data Analytics', 'Liam', 'Davis', 'AnalyticsPro', '2022-12-01', 'Mumbai', 'India', 520);

SELECT * 
FROM book_shoppy

SELECT bs.country_of_publishing, 
       COUNT(bs.country_of_publishing) AS n_books, 
       AVG(bs.pages) AS avg_pages
FROM book_shoppy AS bs
WHERE bs.auther_first_name = 'John'
GROUP BY bs.country_of_publishing
HAVING AVG(bs.pages) < 500
ORDER BY n_books;

