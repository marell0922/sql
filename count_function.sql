select * from salaries where emp_no = 10060;
select emp_no, avg(salary), sum(salary) from salaries where emp_no=10060;
select emp_no, avg(salary), sum(salary) from salaries group by emp_no;

select count(*) from dept_emp where dept_no ='d008';

select salary, from_date, to_date from salaries where emp_no=10060; 
select min(salary), from_date, to_date from salaries where emp_no=10060;
select max(salary), from_date, to_date from salaries where emp_no=10060;

select * from (select max(salary) as 'max_salary', 
min(salary) as 'min_salary' from salaries 
 where emp_no=10060) as a;
 
select emp_no, count(*) from titles group by emp_no;

select emp_no, avg(salary) from salaries 
 group by emp_no having avg(salary)< 10000;


