
-- 테이블간 조인(JOIN) SQL 문제입니다.

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
select a.emp_no, concat(a.first_name, ' ', a.last_name) as name, salary
from employees a, salaries b
where a.emp_no=b.emp_no
and b.to_date = '9999-01-01'
order by salary desc;
-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
select a.emp_no, concat(a.first_name,' ', a.last_name) as name, b.title
from employees a, titles b
where a.emp_no=b.emp_no
and b.to_date='9999-01-01'
order by name;
-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
select a.emp_no, concat(a.first_name, ' ', last_name) as name, c.dept_name 
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no
and b.dept_no=c.dept_no
and b.to_date='9999-01-01'
order by name;
-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
select a.emp_no, concat(a.first_name,' ', a.last_name) as name, b.salary, c.title, e.dept_name
from employees a, salaries b, titles c, dept_emp d, departments e
where a.emp_no=b.emp_no and b.to_date='9999-01-01'
and a.emp_no=c.emp_no and c.to_date='9999-01-01' 
and a.emp_no=d.emp_no and d.to_date='9999-01-01'
and d.dept_no=e.dept_no
order by name;
-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. 
-- (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
select a.emp_no, concat(a.first_name,' ',a.last_name) as name
from employees a, titles b
where a.emp_no=b.emp_no 
and b.to_date <> '9999-01-01' and b.title='Technique Leader';
-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
select a.first_name, a.last_name, c.dept_name, d.title
from employees a, dept_emp b, departments c, titles d
where a.emp_no=b.emp_no and b.to_date='9999-01-01'
and b.dept_no=c.dept_no and a.emp_no=d.emp_no and d.to_date='9999-01-01'
and last_name like "S%";
-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
select a.emp_no, concat(a.first_name,' ', a.last_name) as name, b.salary
from employees a, salaries b, titles c
where a.emp_no = b.emp_no and a.emp_no=c.emp_no
and b.salary > 40000 and b.to_date='9999-01-01'
and c.title='Engineer' and c.to_date='9999-01-01' 
order by salary desc;
-- 문제8.
-- 현재 급여가 50000이 넘는 직책을 급여가 큰 순서대로 출력하시오
select c.title, max(b.salary) as max_salary
from employees a, salaries b, titles c
where a.emp_no=b.emp_no and b.to_date='9999-01-01'
and a.emp_no=c.emp_no and c.to_date='9999-01-01'
and b.salary > 5000
group by c.title
order by max_salary desc;
-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
select c.dept_name, avg(d.salary) as avg_salary
from employees a, dept_emp b, departments c, salaries d
where a.emp_no=b.emp_no and b.dept_no=c.dept_no and b.to_date='9999-01-01' 
and a.emp_no=d.emp_no and d.to_date='9999-01-01'
group by c.dept_name
order by avg_salary desc;
-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
select b.title, avg(c.salary) as avg_salary
from employees a, titles b, salaries c
where a.emp_no=b.emp_no and a.emp_no=c.emp_no
and b.to_date='9999-01-01' and c.to_date='9999-01-01'
group by b.title
order by avg_salary desc;

-- 예제 5
-- 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
select c. title, avg(b.salary) as avg_salary, count(*) as amount
from employees a, salaries b, titles c
where a.emp_no=b.emp_no and a.emp_no=c.emp_no 
and c.to_date='9999-01-01' and b.to_date='9999-01-01'
group by c.title
having count(*) >100;
-- 예제 6
-- 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
select c.dept_name, avg(d.salary) as avg_salary
from employees a, dept_emp b, departments c, salaries d, titles e
where a.emp_no=b.emp_no and b.to_date='9999-01-01'
and b.dept_no=c.dept_no and a.emp_no=d.emp_no and d.to_date='9999-01-01'
and a.emp_no=e.emp_no and e.to_date='9999-01-01' and e.title='Engineer'
group by c.dept_name;
-- 예제 7
-- 현재 직책별로 급여의 총합을 구하되 Engineer 직책은 제외하세요.
-- 단, 총합이 2000000000 이상인 직책만 나타내며 급여총합에 대해서 내림차순으로 정렬하세요.
select e.title, sum(d.salary) as sum_salary
from employees a, dept_emp b, departments c, salaries d, titles e
where a.emp_no=b.emp_no and b.to_date='9999-01-01'
and b.dept_no=c.dept_no and a.emp_no=d.emp_no and d.to_date='9999-01-01'
and a.emp_no=e.emp_no and e.to_date='9999-01-01' and e.title <>'Engineer'
group by e.title
having sum_salary >2000000000
order by sum_salary desc;