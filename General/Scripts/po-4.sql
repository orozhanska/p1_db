CREATE DATABASE P03;

USE P03;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    grade_level INT,
    enrollment_date DATE
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, grade_level, enrollment_date)
VALUES
(1, 'John', 'Doe', '2008-05-20', 9, '2023-09-01'),
(2, 'Jane', 'Smith', '2009-03-15', 8, '2022-09-01'),
(3, 'Michael', 'Brown', '2010-07-10', 7, '2021-09-01'),
(4, 'Emily', 'Davis', '2008-01-30', 9, '2023-09-01'),
(5, 'Daniel', 'Wilson', '2009-11-25', 8, '2022-09-01'),
(6, 'Sarah', 'Moore', '2010-09-05', 7, '2021-09-01'),
(7, 'Matthew', 'Taylor', '2008-12-02', 9, '2023-09-01'),
(8, 'Sophia', 'Anderson', '2009-08-18', 8, '2022-09-01'),
(9, 'James', 'Thomas', '2010-02-14', 7, '2021-09-01'),
(10, 'Olivia', 'Jackson', '2008-03-21', 9, '2023-09-01'),
(11, 'Liam', 'White', '2008-07-25', 9, '2023-09-01'),
(12, 'Emma', 'Garcia', '2009-09-12', 8, '2022-09-01'),
(13, 'Lucas', 'Martinez', '2010-11-05', 7, '2021-09-01'),
(14, 'Mia', 'Rodriguez', '2008-05-30', 9, '2023-09-01'),
(15, 'William', 'Clark', '2009-10-19', 8, '2022-09-01'),
(16, 'Amelia', 'Lee', '2010-08-22', 7, '2021-09-01'),
(17, 'Benjamin', 'Walker', '2008-12-14', 9, '2023-09-01'),
(18, 'Ava', 'Harris', '2009-01-27', 8, '2022-09-01'),
(19, 'Charlotte', 'Young', '2010-02-18', 7, '2021-09-01'),
(20, 'Noah', 'King', '2008-09-30', 9, '2023-09-01');

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    subject VARCHAR(50),
    hire_date DATE
);

INSERT INTO Teachers (teacher_id, first_name, last_name, subject, hire_date)
VALUES
(1, 'Adam', 'Johnson', 'Mathematics', '2015-08-25'),
(2, 'Lisa', 'Williams', 'English', '2017-02-13'),
(3, 'David', 'Martinez', 'Science', '2016-05-01'),
(4, 'Karen', 'Clark', 'History', '2018-09-20'),
(5, 'Christopher', 'Rodriguez', 'Physical Education', '2020-03-18'),
(6, 'Laura', 'Lewis', 'Art', '2019-07-14'),
(7, 'Mark', 'Lee', 'Mathematics', '2015-08-25'),
(8, 'Jennifer', 'Walker', 'English', '2017-02-13'),
(9, 'George', 'Hall', 'Science', '2016-05-01'),
(10, 'Susan', 'Allen', 'History', '2018-09-20');

CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50),
    subject VARCHAR(50),
    teacher_id INT,
    room_number VARCHAR(10),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

INSERT INTO Classes (class_id, class_name, subject, teacher_id, room_number)
VALUES
(1, 'Algebra I', 'Mathematics', 1, 'A101'),
(2, 'Geometry', 'Mathematics', 7, 'A102'),
(3, 'English Literature', 'English', 2, 'B203'),
(4, 'World History', 'History', 4, 'C305'),
(5, 'Biology', 'Science', 3, 'D410'),
(6, 'Physical Education', 'Physical Education', 5, 'Gym'),
(7, 'Art Fundamentals', 'Art', 6, 'E205'),
(8, 'Physics', 'Science', 9, 'D411'),
(9, 'U.S. History', 'History', 10, 'C306'),
(10, 'English Writing', 'English', 8, 'B204');

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    class_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

INSERT INTO Enrollments (enrollment_id, student_id, class_id, enrollment_date, grade)
VALUES
(1, 1, 1, '2023-09-01', 'A'),
(2, 2, 3, '2022-09-01', 'B+'),
(3, 3, 5, '2021-09-01', 'A-'),
(4, 4, 4, '2023-09-01', 'B'),
(5, 5, 2, '2022-09-01', 'A'),
(6, 6, 7, '2021-09-01', 'B+'),
(7, 7, 8, '2023-09-01', 'A-'),
(8, 8, 9, '2022-09-01', 'B'),
(9, 9, 6, '2021-09-01', 'A'),
(10, 10, 10, '2023-09-01', 'B+'),
(11, 11, 1, '2023-09-01', 'A'),
(12, 12, 2, '2022-09-01', 'B'),
(13, 13, 3, '2021-09-01', 'A-'),
(14, 14, 4, '2023-09-01', 'B+'),
(15, 15, 5, '2022-09-01', 'A'),
(16, 16, 6, '2021-09-01', 'A'),
(17, 17, 7, '2023-09-01', 'B+'),
(18, 18, 8, '2022-09-01', 'A'),
(19, 19, 9, '2021-09-01', 'B'),
(20, 20, 10, '2023-09-01', 'A');

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    class_id INT,
    attendance_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

INSERT INTO Attendance (attendance_id, student_id, class_id, attendance_date, status)
VALUES
(1, 1, 1, '2023-09-01', 'Present'),
(2, 2, 3, '2022-09-02', 'Absent'),
(3, 3, 5, '2021-09-03', 'Present'),
(4, 4, 4, '2023-09-04', 'Present'),
(5, 5, 2, '2022-09-05', 'Absent'),
(6, 6, 7, '2021-09-06', 'Present'),
(7, 7, 8, '2023-09-07', 'Present'),
(8, 8, 9, '2022-09-08', 'Absent'),
(9, 9, 6, '2021-09-09', 'Present'),
(10, 10, 10, '2023-09-10', 'Present'),
(11, 11, 1, '2023-09-01', 'Present'),
(12, 12, 2, '2022-09-02', 'Present'),
(13, 13, 3, '2021-09-03', 'Absent'),
(14, 14, 4, '2023-09-04', 'Present'),
(15, 15, 5, '2022-09-05', 'Absent'),
(16, 16, 6, '2021-09-06', 'Present'),
(17, 17, 7, '2023-09-07', 'Present'),
(18, 18, 8, '2022-09-08', 'Present'),
(19, 19, 9, '2021-09-09', 'Present'),
(20, 20, 10, '2023-09-10', 'Present');


Message бд-3


WITH grade AS 
(

)


SELECT *, 
  CASE 
    WHEN grade = 'A' THEN 5
    WHEN grade = 'A-' THEN 4
    WHEN grade = 'B+' THEN 3
    WHEN grade = 'B' THEN 2
    ELSE 1
  END AS grade_num
FROM Enrollments;

SELECT avg(t1.grade_num) AS avg_grade_num
FROM 
(
  SELECT *, 
    CASE 
      WHEN grade = 'A' THEN 5
      WHEN grade = 'A-' THEN 4
      WHEN grade = 'B+' THEN 3
      WHEN grade = 'B' THEN 2
      ELSE 1
    END AS grade_num
  FROM Enrollments
) AS t1;

WITH avg_grade AS
(
  SELECT avg(t1.grade_num) AS avg_grade_num
  FROM 
  (
    SELECT *, 
      CASE 
        WHEN grade = 'A' THEN 5
        WHEN grade = 'A-' THEN 4
        WHEN grade = 'B+' THEN 3
        WHEN grade = 'B' THEN 2
        ELSE 1
      END AS grade_num
    FROM Enrollments
  ) AS t1
)
SELECT * FROM avg_grade;

create view v_grades as
(

	with grades_mapped as
	(
		select *,
			case when grade = 'A' then 5
				when grade = 'A-' then 4
				when grade = 'B+' then 3
				when grade = 'B' then 2
				else 1
			end as grade_num
		from enrollments
	),
	avg_grade as
	(
		select avg(t1.grade_num) as avg_grade_num
		from grades_mapped as t1
	),
	compare_grades_to_avg as
	(
		select *
		from grades_mapped as t1, avg_grade
	)
	
	
	select *,
		if(grade_num>avg_grade_num,1,0) is_higher
	from compare_grades_to_avg

);

select * from v_grades;

select * from Attendance;
select * from Classes;



CREATE TABLE abcd AS
WITH classes_attend AS 
(
    SELECT at.student_id, at.status, c.class_name, c.class_id
    FROM Attendance as at
    LEFT JOIN Classes as c
    ON at.class_id = c.class_id
),
gen_count AS 
(
    SELECT class_id, COUNT(*) AS total_count
    FROM classes_attend
    GROUP BY class_id
),
present_count AS 
(
    SELECT class_id, COUNT(*) AS present
    FROM classes_attend
    WHERE status = 'Present'
    GROUP BY class_id
),
joined_count AS 
(
    SELECT gen_count.class_id, gen_count.total_count, COALESCE(present_count.present, 0) AS present
    FROM gen_count
    LEFT JOIN present_count
    ON gen_count.class_id = present_count.class_id
),
subj_class AS 
(
    SELECT t.teacher_id, t.first_name, t.last_name, t.subject, c.class_id, c.class_name
    FROM Teachers AS t
    JOIN Classes AS c
    ON t.teacher_id = c.teacher_id
),
teacher_att AS 
(
    SELECT sc.class_id, sc.teacher_id, sc.first_name, sc.class_name, jc.present, jc.total_count
    FROM subj_class AS sc
    LEFT JOIN joined_count AS jc
    ON sc.class_id = jc.class_id
)

SELECT class_id, teacher_id, first_name, present, class_name, total_count, 
       (present / total_count) * 100 AS percentage_att
FROM teacher_att

select *
from abcd;







