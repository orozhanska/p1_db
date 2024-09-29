USE P03;

select *
from Attendance
where 1=1
and status = "Present"
and attendance_date BETWEEN "2023-01-01" and "2023-09-07";

select *
from Classes
where lower(subject) not like "%math%";

select *
from v_grades
order by enrollment_date desc;

select class_id, -- 1) columns which are not aggregated - it will create the unique values
	avg(grade_num) class_avg_grade -- 3) aggregates
from v_grades
group by 1; -- 2) groups 

select * 
from students;

select grade_level,
	count(*)
from students
group by grade_level;

select *
from classes;

select * 
from teachers; 

select c.class_name, t.first_name, t.last_name
from classes as c 
join teachers as t
on c.teacher_id = t.teacher_id;