select count (*) from board;

--drop table board;

select * from board;

--becontent faucibus 들어가 있는 글을 출력
select * from board
where bcontent like '%faucibus%';

--bcontent 컬럼에 'ven'단어 갯수
--btitle 'ven' 개수

select * from board
where bcontent like '%ven%';

select * from board
where btitle like '%ven%';

select * from board
where bcontent like '%ven%' or btitle like '%ven%';

-- bontent n으로 시작하면서 4개의 문자단어가 있는 게시글 출력하시오.
-- nibh naabb quisque
-- n___%
select bcontent from board
where bcontent like '% n___%';

select emp_name from employees
where emp_name like 'P__ %';

select emp_name from employees
where emp_name like 'Do%';

select emp_name from employees
where emp_name like 'Lo__%';

select emp_name from employees
where emp_name like 'D%';

select emp_name from employees
where emp_name like '%a%';

--두전째 글자가 a 인 사원 이름을 출력하시오.
select emp_name from employees
where emp_name like '_a%';


--월급을 낮은 순부터 출력하시오/
select emp_name , salary from employees
order by salary asc;

--사워명 역순정렬
select employee_id, emp_name, job_id, hire_date from employees
order by emp_name desc;

--부서번호는 순차정렬, 이름 역순정렬 
select employee_id, emp_name, department_id, job_id, hire_date 
from employees
order by department_id asc, emp_name desc;

--월급으로 순차정렬,입사일 역순정렬
select employee_id, emp_name, department_id, job_id, salary, hire_date from employees
order by salary asc, hire_date desc;

--abs : 절대값
select -10, abs(-10) "절대값" from dual;

--floor : 버림
select 10.54578, floor(10.54578) from dual;

--trunc(값, 버림위치) : 특정저리 버림 // 버림위치를 넣지 않으면 자연수만 나옴
select 10.54578, trunc(10.54578,2),floor(10.54578) from dual;

--round : 특정자리 소수점 반올림
select 10.54578, round(10.54578), round(10.54578,3) from dual;

select * from stuscore;
select stunum, name, math, eng, math+eng, round((math+eng)/2,1) from stuscore;

-- 월급을 원화로 환산해서 1342.32원 소수점 3자리에서 반올림 출력
select employee_id,emp_name, salary, salary*1342.32, round(salary*1342.32,2) from employees;

-- 입사일이 현재날짜까지 걸린 일자를 출력하시오.
--소수점 3자리에서 반올림
select hire_date,round(hire_date - sysdate,2) from employees;

--입사일에서 현재날짜까지 걸린 일자를 출력하시오.
--소수점 자리는 반올림하고, 일을 년으로 환산
select hire_date, sysdate-hire_date, round(sysdate-hire_date),floor((sysdate-hire_date)/365) sdate from employees
order by sdate asc;



select * from member;

select * from employees;

--나머지 함수

select mod(27,2), mod(27,5), mod(27,7) from dual;

--employees사번이 홀수인 사원을 출력하시오.
select * from employees
where mod(employee_id,2)=1
order by employee_id asc
;

--부서번호가 짝수인 사원을 출력
select employee_id, emp_name, salary, manager_id, department_id  from employees
where mod(manager_id,2)=0
order by employee_id asc
;

select bhit from board;

select avg(bhit) from board;

select round(avg(bhit),1) from board;
select floor(avg(bhit)) from board;

select * from board
where bhit >= (select avg(bhit) from board)
;

select to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

--시퀀스
create sequence member_seq
start with 1
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;

--시퀀스
create sequence board_seq
start with 1001
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;

select * from board
order by bno desc
;

insert into board values(
board_seq.nextval,'제목입니다.','내용입니다.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg'
);
--nextval : 다음꺼부터 currval : 현재부터

select board_seq.currval from dual;
select board_seq.nextval from dual;

select member_seq.nextval from dual;

commit;

create sequence dept_seq
start with 10
increment by 10
minvalue 1
maxvalue 99999
nocycle
nocache
;

select dept_seq.nextval from dual;

desc stuscore;

select * from stuscore;

--delete stuscore;

commit;

select * from stuscore
order by total desc;

select name, rank() over (order by total desc) "m_rank",rank
from stuscore
order by stunum asc
;

update stuscore set rank =1
where stunum =1;

--total을 기준으로 역순정렬해서 등수를 출력.
select stunum,rank() over (order by total desc) 
from stuscore
;


--rank 
update stuscore a
set rank = ( -- select rank from stuscore
select b_rank from
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum = b.b_num 
);
select total, rank from stuscore
order by total desc;
select * from stuscore ;

select employee_id, emp_name ,employees.department_id, department_name, parent_id
from employees a,departments b
where a.department_id = b.department_id
;

select department_id, department_name from departments;

select * from departments;

create table emp2 as select * from employees;

commit;


--emp2
select * from emp2;

update emp2 set manager_id='';

--198번 사원에게 매니저아이디를 1로 줌
update emp2 set manager_id= 1
where employee_id = 198
;

select manager_id from employees;

update (select manager_id from employees)
set emp2.manager_id = employees.manager_id
;

-- 1. emp2의사원번호와 employees의 사원번호를 똑같이 일치
-- 2. emp2의 manager_id  employees manager_id 를 검색함.
-- 3. employees manager_id 를 emp2 manager_id에 입력시킴.
update (select a.manager_id a_m, b.manager_id b_m
from emp2 a, employees b
where a.employee_id = b.employee_id)
set a_m = b_m
;

create sequence emp_seq
start with 1
increment by 1
minvalue 1
maxvalue 100000
nocycle
nocache;

create table emp01(
empno number(4) primary key,
ename varchar(10),
hiredate date
);

insert into emp01 values(
emp_seq.nextval,'홍길동',sysdate);

insert into emp01 values(
emp_seq.nextval,'유관순',sysdate);

insert into emp01 values(
emp_seq.nextval,'이순신',sysdate);

insert into emp01 values(
emp_seq.nextval,'홍길자',sysdate);

insert into emp01 values(
emp_seq.nextval,'홍길순',sysdate);

select * from emp01;

select * from employees;

select employee_id, emp_name, job_id, hire_date
from employees
order by hire_date desc;

commit;