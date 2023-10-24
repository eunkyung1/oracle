select * from departments;

select * from departments order by manager_id asc;

select*from employees;

select*from employees order by employee_id desc;

--사번 200번 이상의 직원
select*from employees where employee_id >= 200;

--사번 190에서 205 사이의 직원
select*from employees 
where employee_id>=190 and employee_id<=205;
--조건에 해당되는 내용을 조회해줌.

--월급 5000이상이면서 순차정렬
select*from employees
where salary>=5000 order by salary asc;

select employee_id, emp_name, job_id,department_id,salary from employees;

--테이블의 데이터 복사
create table emp2 as select * from employees;

select * from emp2;

--컬럼 타입 검색
desc emp2;

--컬럼이름 변경
alter table emp2 rename column emp_name to e_name;

--컬럼 데이터타입 길이변경
--email 안에 데이터가 숫자가 아니면 변경이 안됨. (글자이기 때문에 숫자 변경못함)
alter table emp2 modify email varchar2(50);

--칼럼 삭제
alter table emp2 drop column create_date;

--컬럼 추가
alter table emp2 add create_date date;
--칼럼을 추가하면 마지막줄로 붙음.

--컬럼순서 변경
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;

select*from emp2;

--컬럼의 데이터만 복사
insert into emp2 select * from employees;


drop table emp2;

--이름,급여,입사일 출력
select emp_name,salary,hire_date from emp2 
order by emp_name asc;

alter table emp2 modify salary invisible;
alter table emp2 modify manager_id invisible;
alter table emp2 modify commission_pct invisible;
alter table emp2 modify retire_date invisible;
alter table emp2 modify department_id invisible;
alter table emp2 modify job_id invisible;

alter table emp2 modify salary visible;
alter table emp2 modify manager_id visible;
alter table emp2 modify commission_pct visible;
alter table emp2 modify retire_date visible;
alter table emp2 modify department_id visible;
alter table emp2 modify job_id visible;

insert into emp2 (employee_id,emp_name) select employee_id, emp_name from employees;

--별칭 선언, as 생략이 가능함.
select salary,salary*12 y_salary,salary*12*1342 as k_salary from employees;

select * from employees;

--연봉 nvl(변수,0) null경우 0으로 표시.
select salary, salary*12, commission_pct from employees;
select 
salary,
salary*12 as "년봉", 
(salary*12)*nvl(commission_pct,0) as "인센티브", --null 값은 무한대이기 때문에 0으로 지정을 해줘야함.
(salary*12)+(salary*12)*nvl(commission_pct,0) as "실제연봉" from employees; --nvl(-,0) -> null 값을 0으로 변경.

select nvl(manager_id,0) from employees;

--사번, 월급, 직급, 커미션, 연봉+커미션을 출력하시오.

select 
employee_id,
salary,
job_id,
salary*12 as "연봉",
(salary*12)+(salary*12)*nvl(commission_pct,0) as"연봉+커미션"
from employees;

--월급이 6000인 사원을 검색
select * from employees where salary=6000;

--띄어쓰기가 필요한 경우 ""안에 나열하기.
select salary as "em p"from employees where salary=6000;

--커미션이 null인 사람만 출력하시오. null를 찾을 때 is / null이 아닌 것 찾을 때 is not.(등가비교 불가)
select * from employees where commission_pct is not null;
select * from employees where commission_pct is null;

--column은 대채로 영문으로 작성. 한글은 에러가 날 확률이 높음. 

select * from departments;

--부서번호, 부서명을 출력하시오.
select department_id as "부서번호", department_name as "부서명" from departments 
where department_id>=10 and department_id<=40;

--문자타입을 붙여서 출력 '||'
select emp_name||'is a'||job_id from employees;

select concat(concat(emp_name,' is a '),job_id) con_name from employees; 

select * from stuscore;

select kor, eng, math, kor+eng+math,(kor+eng+math)/3 from stuscore;

select distinct department_id from employees order by department_id asc;

select distinct job_id from employees order by job_id asc;

--월급 3000, 6000, 7000인 사람 출력하시오.
select salary from employees where salary =3000 or salary=7000 or salary=6000;
select salary from employees where salary >=3000 and salary<=10000
order by salary desc;

--월급 5000이하 인 사람에게 +1000 월급을 인상해서 원화도 출력하시오.

select salary "기본월급", (salary+1000) "인상료", (salary+1000)*1342 "원화" 
from employees 
where salary<=5000
order by salary asc;

--부서번호가 10,30,50 인 사원번호 사원이름,부서번호,직급, 월급, 입사일 출력하시오.

select * from employees;

select employee_id, emp_name, department_id, job_id, salary, hire_date 
from employees 
where department_id =10 or department_id=30 or department_id =50
order by department_id asc, employee_id desc 
;

select * from employees;

--급여가 4000 이상 8000 이하 사원번호, 사원이름, 급여, 입사일, 부서번호 출력
--입사일이 2003/09/01 이후 사원만 출력하시오,

select employee_id, emp_name, salary, hire_date,hire_date+100, department_id 
from employees
where salary >= 4000 and salary<=8000 and hire_date >= '03/09/01'
;

commit;

