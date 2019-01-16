select * from employees;
select * from departments;
select emp_no, first_name, hire_date from employees;

-- alias
select emp_no as '번호', first_name as '이름', hire_date as '입사일' from employees;

-- concat
select concat(first_name, ' ',last_name) as '이름', 
 gender as '성별', hire_date as '입사일' from employees;

-- distinct
select title from titles;
select distinct title from titles;

select concat(first_name, ' ', last_name) as '이름', gender as '성별',
 hire_date as '입사일' from employees order by hire_date asc;
 
select * from salaries where from_date like "2001-%"
 order by salary desc;
select emp_no, salary from salaries where from_date >'2001'
 order by salary desc;
 
select concat(first_name, ' ', last_name) as '이름', gender as '성별',
 hire_date as '입사일' from employees where hire_date <'1991';

select concat(first_name, ' ', last_name) as '이름', gender as '성별',
 hire_date as '입사일' from employees where hire_date <'1989' and gender = 'f';

-- in
select emp_no, dept_no from dept_emp where dept_no in ('d005', 'd009');
select emp_no, dept_no from dept_emp where dept_no ='d005' or dept_no = 'd009';

select concat(first_name , ' ', last_name), hire_date from employees
 where hire_date like "1989-%"; 
