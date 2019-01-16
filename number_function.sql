select abs(-10), abs(10);

select mod(234,10), 234 % 10;

select floor(2.3), floor(-2.333);

select ceiling(1.3), ceiling(-2.42);

select round(3.14), round(3.6);

select round(3.1463, 2);

select pow(2, 3);

select sign(-2), sign(0), sign(3);

select greatest(3,5,1,6), greatest('a','B','C', 'A'),
 greatest('ABCD', 'ABDC', 'ACBD', 'ACDB');
 
select least(3,5,1,6), least('a','B','C','A');
