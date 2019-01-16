-- mysql string function

select ucase('Seoul'), upper('seoul');
select lcase('Seoul'), lower('SEOUL');

select substring('Happy Birthday', 3,2);
select substring('Happy Birthday',3,2) from dual;
select substring(first_name, 3,2) from employees;

select first_name, gender, hire_date from employees
 where substring(hire_date, 1,4) = '1989';
 
select LPAD('hi', 10, '*') from dual;
select RPAD('hi', 10, '*') from dual;

select LPAD(cast(salary as char), 10, '*') from salaries;

select concat('---', ltrim('   hello   '),'---'), 
 concat('---', rtrim('   hello    '), '---'),
 concat('---', trim('   hello   '), '---');

select trim(both 'x' from 'xxxhixxx'),
 trim(leading 'x' from 'xxxhixxx'),
 trim(trailing 'x' from 'xxxhixxx');



