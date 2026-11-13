
select*
from sql_technical_assessment_dataset.departments;
;
select *
from sql_technical_assessment_dataset.staff;

select first_name, last_name, gender, is_transgender
from sql_technical_assessment_dataset.staff
where gender = 'Female' and is_transgender = 1;

select sum(salary) as total_salary
from sql_technical_assessment_dataset.staff;

select count(*) as under_paid
from sql_technical_assessment_dataset.staff
where salary < 70000;

select count(*) staff_not_under_any_dept
from sql_technical_assessment_dataset.staff
where department_id is null;


select first_name, last_name,  salary, job_title 
from sql_technical_assessment_dataset.staff
where department_id is null
limit 4;

select *
from sql_technical_assessment_dataset.staff 
where first_name = "Marcus" and last_name ="Vance"
;



select *
from sql_technical_assessment_dataset.staff
where staff_id = (
select manager_id
from sql_technical_assessment_dataset.staff 
where first_name = "Marcus" and last_name ="Vance"
);

select *, s.department_id
from sql_technical_assessment_dataset.staff s
join sql_technical_assessment_dataset.departments d
on s.department_id = d.department_id
where staff_id = (
select manager_id
from sql_technical_assessment_dataset.staff s
where first_name = 'Marcus' and last_name ='Vance')
;


select 
 en.first_name as employees_name,
 ed.department_name as employees_department, 
 mn.first_name as managers_name, 
 md.department_name as managers_department
from sql_technical_assessment_dataset.staff en
join sql_technical_assessment_dataset.departments ed
on en.department_id = ed.department_id
join sql_technical_assessment_dataset.staff mn
on en.staff_id = mn.manager_id
join sql_technical_assessment_dataset.departments md
on en.staff_id = mn.manager_id
where en.manager_id is not null

;

SELECT
en.first_name AS employee_name,
ed.department_name AS employee_department,

(SELECT first_name
 FROM sql_technical_assessment_dataset.staff
 WHERE staff_id = en.manager_id
 ) AS manager_name,
 
 (SELECT md.department_name
 FROM sql_technical_assessment_dataset.staff ms
 JOIN sql_technical_assessment_dataset.departments md
 ON ms.department_id = md.department_id
 WHERE ms.staff_id = en.manager_id
 ) AS manager_department
 
FROM sql_technical_assessment_dataset.staff en
JOIN sql_technical_assessment_dataset.departments ed
ON en.department_id = ed.department_id
WHERE en.manager_id IS NOT NULL
;

select locate('Sarah', first_name)
from staff;

select count(*)
from staff
where first_name = 'Sarah' or last_name = 'Sarah';


select department_name, sum(salary)
from departments d
join staff s
on d.department_id= s.department_id
group by department_name;

select count(*)
from staff
where year(hire_date) = 2021; 

select gender, count(gender)
from staff
where is_active = 1
group by gender;

select *
from staff
where hire_date = '2021-03-15';




select count(*)
from staff;


select *
from sql_technical_assessment_dataset.staff;


select 
 en.first_name as employees_name,
 mn.first_name as managers_name,
 en.staff_id
from sql_technical_assessment_dataset.staff en
join sql_technical_assessment_dataset.staff mn
on en.staff_id = mn.manager_id
where en.manager_id is not null
;





















































































































   


select*
from sql_technical_assessment_dataset.departments;
;
select *
from sql_technical_assessment_dataset.staff;


select *
from  staff s
join departments d 
on s.department_id = d.department_id;




select *
from  staff s
join departments d 
on s.department_id = d.department_id;









SELECT
    (SELECT COUNT(*) FROM sql_technical_assessment_dataset.staff WHERE is_active = 0 )    AS is_not_active,
    (SELECT COUNT(*) FROM sql_technical_assessment_dataset.staff WHERE is_active = 1 )      AS is_active;




select distinct gender
from sql_technical_assessment_dataset.staff;

select distinct is_transgender
from sql_technical_assessment_dataset.staff;

select distinct is_active
from sql_technical_assessment_dataset.staff;

SELECT
    d.department_id,
    d.department_name,
    SUM(s.salary) AS total_salary
FROM sql_technical_assessment_dataset.staff s
JOIN sql_technical_assessment_dataset.departments d
    ON s.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY total_salary DESC;


SELECT department_id, COUNT(*) AS n
FROM sql_technical_assessment_dataset.staff
WHERE department_id IS NOT NULL
GROUP BY department_id
ORDER BY department_id;


select department_name, location, annual_budget
from sql_technical_assessment_dataset.departments
order by annual_budget;



SELECT
    d.department_id,
    d.department_name,
    COUNT(s.staff_id) AS staff_count
FROM sql_technical_assessment_dataset.departments d
LEFT JOIN sql_technical_assessment_dataset.staff s ON s.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY staff_count DESC;



SELECT
    (SELECT COUNT(*) FROM sql_technical_assessment_dataset.staff WHERE gender = 'Female')     AS female,
    (SELECT COUNT(*) FROM sql_technical_assessment_dataset.staff WHERE gender = 'Male')       AS male,
    (SELECT COUNT(*) FROM sql_technical_assessment_dataset.staff WHERE gender = 'Non-binary') AS non_binary;

SELECT staff_id, job_title, department_id
FROM sql_technical_assessment_dataset.staff s
ORDER BY department_id ASC;


SELECT d.department_id, d.department_name,
       COUNT(s.staff_id) AS headcount
FROM sql_technical_assessment_dataset.departments d
LEFT JOIN sql_technical_assessment_dataset.staff s ON s.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY headcount DESC;


