select * from employees;

select salary,salary+100,salary-100 from employees;

select sysdate,sysdate+365 from dual; --임시더미테이블

select 1+3 from dual;

-- 문자'3'을 사칙연산을 하면 숫자로 자동변환
select 1+'3' from dual;

-- 문자 'a'는 사칙연산 하면 에러
select 1+'a' from dual;

-- 문자는 사칙연산을 할 수 없음.
select 'a'+'b' from dual;

--문자 결합은 ||
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

--emp_name(email) 출력

select emp_name||' ( '|| email ||' ) ' u_nicld from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;

--00/01/01 이후 입사한 사원을 출력하시오.
--00/01/24,00-01-01,2000-01-01 같은 형태임.
select * from employees
where hire_date>'00-01-01'
order by hire_date asc;

select * from employees
order by salary desc;

select count(*) from employees;
select max(salary) from employees;

--이중쿼리
select * from employees
where salary=(select max(salary) from employees);

select * from employees
where commission_pct is null;

select * from employees
where commission_pct is not null;

--부서번호가 80번 이상인 사원을 출력하시오.
select * from employees
where department_id>=80
order by department_id asc;

--부서번호가 80만 제외하고 출력하시오.
select * from employees
where not department_id = 80
order by department_id asc;

-- <>, !=, not 
select * from employees
where department_id != 80
order by department_id asc;

-- 부서번호가 50번 이면서 급여가 6000이상인 사원을 출력하시오.
select * from employees
where department_id = 50 and salary >= 6000;

--between A and B
select*from employees
where salary>=2000 and salary<=3000;

select * from employees
where salary between 2000 and 3000;

--avg, count, max, min
select avg(salary) from employees;

select * from employees
where salary <= 6461
order by salary desc
;

select * from employees
where salary <= (select avg(salary) from employees)
order by salary desc
;

-- 월급 3000,4000,6000
-- or나열 / in(조건1,조건2..)
select * from employees
where salary = 3000 or salary = 4000 or salary=6000
order by salary asc;

select * from employees
where salary in(3000,4000,6000)
;

--사원번호 101, 151, 200  급여
select employee_id, salary from employees
where employee_id in(101,151,200)
;
select employee_id, salary from employees
where employee_id=100 or employee_id=151 or employee_id=200; 

--급여 2000미만 3000초과인 사원을 출력.
select * from employees
where salary<2000 or salary>3000;

select*from employees
where salary not between 2000 and 3000;

--입사일이 00/01/01 ~ 00/12/31
select*from employees
where hire_date between '00/01/01' and '00/12/31';

select * from employees
where hire_date >= '00-01-01' and hire_date <= '00-12-31';

--S로 시작되는 이름을 출력하시오.
select emp_name from employees
where emp_name like 'S%'
;

--n로 끝나는 이름을 출력
select emp_name from employees
where emp_name like '%n'
;

--처음,끝,중간 e가 있는 이름을 출력하시오.
select emp_name from employees
where emp_name like '%e%';

