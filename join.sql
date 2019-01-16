 -- equi join(inner join)
 
 -- 현재 근무중인 직원의 이름과 직책을 출력하세요.
 select concat(a.first_name,' ',a.last_name) as name, b.title 
  from employees a, titles b
   where a.emp_no = b.emp_no  -- join 조건
   and b.to_date='9999-01-01'; -- 선택 조건
   
-- 현재 근무중인 직책이 Senior Engineer 인 직원의 이름을 출력하세요.
select concat(a.first_name,' ',a.last_name) as name
  from employees a, titles b
   where a.emp_no = b.emp_no  -- join 조건
   and b.to_date='9999-01-01' -- 선택 조건
   and b.title='Senior Engineer';

select concat(first_name, ' ', last_name) as name, b.title
 from employees a, titles b
  where a.emp_no=b.emp_no
   and a.gender='f';
 
-- natural join
-- 현재 근무중인 직책이 Senior Engineer 인 직원의 이름을 출력하세요.
select a.emp_no, concat(a.first_name,' ',a.last_name) as name, b.title
  from employees a natural join titles b
   where b.to_date='9999-01-01'; -- 같은 이름의 컬럼이 많은 경우.
   
-- join ~using
select a.emp_no, concat(a.first_name,' ',a.last_name) as name, b.title
  from employees a join titles b using(emp_no)
   where b.to_date='9999-01-01';

-- join ~on
select a.emp_no, concat(a.first_name,' ',a.last_name) as name, b.title
  from employees a join titles b
   on a.emp_no=b.emp_no-- where a.emp_no = b.emp_no  -- join 조건
   and b.to_date='9999-01-01';
   
-- problem 01
select a.emp_no as no, concat(a.first_name, ' ', last_name) as name, b.dept_name
 from employees a, departments b, dept_emp c
  where a.emp_no=c.emp_no and b.dept_no=c.dept_no and to_date > now(); 

-- problem 02
select a.emp_no as no,concat(a.first_name,' ',last_name) as name, salary  
 from employees a natural join salaries
  where to_date > now();
