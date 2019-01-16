select curdate(), current_date;
select curtime(), current_time;
select now(), sysdate();

select emp_no, now() from employees; 
 -- all time is same from start time.
select emp_no, sysdate() from employees; 
 -- it is different depending on time to get the result sheet(printing result).

-- formating

select first_name,
      date_format(hire_date, '%Y-%m-%d %h:%i:%s')
  from employees;
  
-- 각 직원들에 대해 직원의 이름과 근무개월수
select first_name,
      concat(
      cast(period_diff(
            date_format(curdate(), '%Y%m'),
            date_format(hire_date, '%Y%m')) as char), 
       '개월')
  from employees;
  
  -- 각 사원들은 입사 후 6개월 뒤에 정규직으로 발령이 된다.
  -- 발령날은 언제?
  -- month, week, year, day
select first_name,
       hire_date,
       date_add(hire_date, interval 6 month)
  from employees;
  
select date_add(
      cast('1994-05-20' as DATE),
        interval 10000 day);
