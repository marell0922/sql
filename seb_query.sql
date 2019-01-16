-- seb query
select a.emp_no, concat(a.first_name, ' ', last_name) as name
 from employees a, dept_emp b
  where a.emp_no =b.emp_no
   and b.dept_no=(select b.dept_no
    from employees a, dept_emp b
     where a.emp_no=b.emp_no
      and concat(a.first_name, ' ',a.last_name) = 'Fai Bale'
      and b.to_date > now());
   
select a.emp_no, concat(a.first_name, ' ', last_name) as name
 from employees a, dept_emp b
  where a.emp_no =b.emp_no
   and (b.dept_no, b.emp_no)=(select b.dept_no, b.emp_no
    from employees a, dept_emp b
     where a.emp_no=b.emp_no
      and concat(a.first_name, ' ',a.last_name) = 'Fai Bale'
      and b.to_date > now());

select concat(a.first_name, ' ',a.last_name) as name, salary
from employees a, salaries b
where a.emp_no=b.emp_no
and b.to_date ='9999-01-01'
and b.salary > (select avg(salary) from salaires);

select min(a.avgsalary)
from (select b.title, avg(a.salary) as avgsalary
from salaries a, titles b
where a.to_date='9999-01-01' and b.to_date='9999-01-01') as a;

select b.title, avg(a.salary)
from salaries a, titles b
where a.to_date='9999-01-01' and b.to_date='9999-01-01';

select * from employees;
