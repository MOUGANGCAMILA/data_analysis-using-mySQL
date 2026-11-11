SELECT gender, avg(age),  max(age), min(age), count(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary;



-- order by
SELECT *
FROM parks_and_recreation.employee_demographics
order by gender desc, age desc
;


select occupation, avg(salary)
from employee_salary
where occupation like '%pa%'
group by occupation
having avg(salary) > 50000
;

-- limit & aliasiing

select *
from employee_demographics
order by age desc
limit 2, 1
;

-- aliasing

select gender, avg(age) AS avg_avg
from employee_demographics
group by gender
having avg_avg > 40

;


-- joins

select *
from employee_demographics;

select *
from employee_salary;


-- inner joins
select dem.employee_id, age, occupation
from employee_demographics dem
join employee_salary sal
   on dem.employee_id = sal.employee_id
   
;
   
-- outer joins

select *
from employee_demographics dem
 right join employee_salary sal
   on dem.employee_id = sal.employee_id
   ;
   
-- self join

select emp1.employee_id as emp_santa, 
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as  emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp

from employee_salary emp1
join employee_salary emp2
   on    emp1.employee_id + 3 = emp2.employee_id
   ;
   
select *
from employee_demographics  as dem
inner join employee_salary as sal
  on dem.employee_id = sal.employee_id
inner join parks_departments  pd
  on sal.dept_id = pd.department_id
  ;
   

select *
from parks_departments 
   
   ;
   
   
-- unions

select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary;



 -- string functions
 
 select length ('hello');
 
select first_name, length(first_name)
from employee_demographics 
order by length(first_name) desc ;

select upper('hello');
select lower('hello');


select first_name, upper(first_name)
from employee_demographics ;


select  trim('           helo      ');
select  ltrim('           helo      ');
select  rtrim('           helo      ');


select first_name, left(first_name, 4), right(first_name, 4), substring(first_name, 3, 2), birth_date, substring(birth_date, 6, 2) as birth_month

from employee_demographics;


select first_name, replace(first_name, 'a', 'z')
from employee_demographics;



select locate('x', 'alexander');


select first_name, locate('r', first_name)
from employee_demographics;

select first_name, last_name,
concat(first_name,'  ', last_name)
from employee_demographics;


select first_name,
last_name,
case 
  when age <= 30 then  'young'
  when age between 31 and 40 then 'old'
  when age >= 41 then 'very old'
end as Age_bracket

from employee_demographics;
-- case statements
-- pay increase and bonus
-- <= 50000 = 5%
-- < 50000 = 7%
-- finance = 10% bonus


select first_name, last_name, salary,
case
   when salary <= 50000 then salary + (salary * 0.05) 
   when salary > 50000 then salary + (salary * 0.07) 
end as new_salary,
case 
   when dept_id = 6 then salary * 10
end as Bonus
from employee_salary;

select *
from employee_demographics;
select *
from parks_departments;


-- subqueries


select *
from employee_demographics
where employee_id in 
                 ( select employee_id
                      from employee_salary
                      where dept_id = 1)
                      
;

select first_name, salary, 
(select avg(salary)
from employee_salary)
from employee_salary
;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;

select gender, avg(`max(age)`)
from 
( select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender) as Agg_table
group by gender;


-- window functions

select gender, avg(salary) avg_salary
 from employee_demographics dem
 join employee_salary sal
     on dem.employee_id = sal.employee_id
group by gender     
     ;



select gender, avg(salary) over(partition by  gender)
 from employee_demographics dem
 join employee_salary sal
     on dem.employee_id = sal.employee_id
 
     ;



select dem.first_name, dem.last_name, gender, 
sum(salary) over(partition by  gender)
 from employee_demographics dem
 join employee_salary sal
     on dem.employee_id = sal.employee_id
     ;



select dem.first_name, dem.last_name, gender, salary,
sum(salary) over(partition by  gender order by dem.employee_id) as rolling_total
 from employee_demographics dem
 join employee_salary sal
     on dem.employee_id = sal.employee_id
     ;


select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc)
 from employee_demographics dem
 join employee_salary sal
     on dem.employee_id = sal.employee_id
     ;



