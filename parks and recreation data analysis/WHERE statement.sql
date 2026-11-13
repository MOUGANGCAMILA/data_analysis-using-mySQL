SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'leslie';


SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 50000;


SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 50000 AND NOT dept_id != 1
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%a%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender LIKE '%f%';



