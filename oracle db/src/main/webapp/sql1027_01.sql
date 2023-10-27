select sysdate from dual;

select sysdate, sysdate+1, add_months(sysdate,1) from dual;

--지정한 날의 달에 대해 마지막 일자를 알려줌.

select last_day(sysdate) from dual;

select last_day('20220101') from dual;

--날짜에서 년도, 월, 일만 출력
select extract(year from sysdate) from dual;

select extract(month from sysdate) from dual;

select extract(day from sysdate) from dual;

--날짜에서 날짜를 빼면 기간의 '일'을 알 수 있음
select bdate, trunc(sysdate-bdate) || '일' from board;

--지난 개월 수를 출력
select bdate, trunc(months_between(sysdate,bdate)) ||'개월' from board;


--날짜-> 문자로 형변환, 날짜 포맷 변경
select sysdate from dual;
select to_char(sysdate,'YYYY-MM-DD AM HH12:MI:SS') from dual; --HH24 : 24시간제
select to_char(sysdate, 'YYYY"년"MM"월"DD"일" DAY') from dual;

--숫자-> 문자로 형변환, 천단위표시, 원화표시
--9로 자릿수 표시를 하면, 없을 때는 빈공백 /  0으로 자리수 표시를 하면, 없을 때 0으로 표시
select 1234500000 from dual;
select to_char(123450000,'999,999,999,999') from dual; --빈공백
select to_char(123450000,'000,999,999,999') from dual; --0으로 표시
select trim(to_char(123450000,'999,999,999,999')) from dual; --trim:빈공백 제거
select to_char(1234500000,'L999,999,999,999') from dual;  --원화표시:L(나라별 통화표시) / 달러표시 :$

--기존의 날짜가 얼마큼 지났는지 확인
-- 문자 -> 날짜로 형변환. 기존날짜에서 빼야함.
select '2023-10-27' from dual;
select add_months(to_date(20231027),1) from dual;
select sysdate-(to_date('2023-10-01','YYYY-MM-DD')) from dual;

--nvl(commission_pct,0)
--manager_id, null값에 'ceo'
select manager_id from employees;
select nvl(manager_id,0) from employees;
select nvl(to_char(manager_id),'CEO') from employees;


--월급 총금액
select to_char(sum(salary),'$999,999,999') from employees;

--환율 1342.32 곱해서 천단위, 원화표시
select to_char(avg(salary)*1342.32,'L999,999,999') from employees;

--월급의 최대값과 최솟값
select max(salary), min(salary) from employees;
select department_id from employees;

select emp_name, max(salary) from employees
where department_id=50
group by emp_name
;

select emp_name, salary from employees
where salary = (select max(salary) from employees)
;

select department_id, max(salary), min(salary) from employees
group by department_id
;

--count(*)
select count(*) from employees;

--null값은 count 되지 않음.
select count(manager_id) from employees;

select id from board;

select emp_name from employees;

select emp_name from employees
where emp_name like ('%D%') or emp_name like ('%d%')
;

select emp_name from employees
where lower(emp_name) like ('%d%')
;

--빈공백을 0으로 표시
select to_char(12,'000,000') from dual;
select lpad(12,6,'0') from dual;

--원하는 자리에서 원하는 만큼  가져올 수 있음.
select id from board;
select id, substr(id,3,3) from board;
select bdate from board;
select to_char(bdate,'YYYYMMDD') from board;
select substr(to_char(bdate,'YYYYMMDD'),1,6) from board;

--instr = index of
select id, instr(id,'me') i_id from board
where instr(id,'me') != 0
;

select length(id) from board;

--hire_date
--substr월을 출력
select substr(hire_date,4,2) from employees;
select hire_date, substr(to_char(hire_date,'YYYYMMDD'),5,2) from employees;

--이름에서 3부터 3개, 월을 출력하시오.
select substr(emp_name,3,3) || substr(hire_date,4,2) from employees;

--마지막 날짜 확인
select hire_date, last_day(hire_date) from employees;

create table fboard as select * from board;

select*from board;

select bno ,bhit  from board;

update board
set bhit = bhit+100;

rollback;

update board
set bhit = bhit+1
where bno=125;

update fboard 
set bhit = 1;

select * from fboard;
commit;

select bhit from board;

update fboard a
set bhit = (select bhit from board b where a.bno = b.bno)
;
rollback;

select a.bno, b.bno, a.bhit, b.bhit from fboard a , board b;

desc fboard;

alter table fboard
add userid varchar2(30)
;

select userid from fboard;

--id 1번째부터 3개, bdate 월을 합친 값을 useridp 출력

update fboard a
set userid = ( 
select substr(id,1,3) || substr(bdate,4,2) from fboard b  where a.bno = b.bno 
)
;

select substr(id,1,3) || substr(bdate,4,2) from board;

select userid from fboard;

--테이블 컬럼명을 변경
alter table fboard
rename column userid to uuid
;

--테이블 컬럼타입을 변경
alter table fboard
modify uuid varchar(40);


--컬럼삭제
alter table fboard
drop column uuid;

--drop table emp01;

--drop table emp2;

--테이블 생성 및 데이터 복사
create table emp2 as select * from employees;

--테이블명 변경
--rename emp2 to emp02;

desc member;
create table mem(
id varchar2(30) primary key, --not null,unique 모두 해당
pw varchar2(30) not null,
name varchar2(30) not null, -- null값 허용안됨
phone varchar2(13), 
gender varchar2(1) check(gender in('M','F')), -- M,F 
hobby varchar2(80),
mlevel number(2,1) check(mlevel between 1 and 10), --1~10 사이 값만 가능
mdate date default sysdate --입력하지 않으면 현재날짜 등록
);

insert into mem values(
'aaa','111','홍길동', '010-1111-1111', 'M', 'game',1,sysdate

);

select *from mem;


alter table mem
modify phone varchar2(13);


insert into mem(id, pw, name) values(
'bbb','1111','유관순'
);

insert into mem(id, pw, name) values(
'bbb','222','이순신'
);

insert into mem(id, pw, name, gender) values (
'ccc','2220','이순신','M'
);

select * from member;
desc member;

--오라클 switch, if 조건문
-- decode 같은 값인 경우만 비교 가능함.

select * from employees;

select department_id from employees;

select department_id, department_name from departments;


--10 총무기획부 20 마케팅 30 구매/생산부 40 인사부 50 배송부

select department_id from employees;

select department_id, 
decode(department_id, 
10, '총무기획부',
20, '마케팅',
30, '구매/생산부',
40, '인사부',
50, '배송부'
) from employees;

select a.department_id, department_name from departments a, employees b
where a.department_id = b.department_id
;

--학생 성적 테이블
create table sscore (
sno number(4) primary key, --점수에 부여되는 순번
sid varchar2(20),
total number(3) default 0
);

insert into sscore values(
sscore_seq.nextval,'a1',50
);

insert into sscore values(
sscore_seq.nextval,'a2',90
);

insert into sscore values(
sscore_seq.nextval,'a3',80
);

insert into sscore values(
sscore_seq.nextval,'a4',10
);

insert into sscore values(
sscore_seq.nextval,'a5',100
);

insert into sscore values(
sscore_seq.nextval,'a6',70
);

insert into sscore values(
sscore_seq.nextval,'a7',60
);

insert into sscore values(
sscore_seq.nextval,'a8',30
);

insert into sscore values(
sscore_seq.nextval,'a9',20
);

insert into sscore values(
sscore_seq.nextval,'a10',80
);

commit;

select * from sscore;

select sno, sid, total,decode(total,
10,'F',
20,'F',
30,'F',
40,'F',
50,'F',
60,'F',
70,'D',
80,'B',
90,'A',
100,'A'
) as hak from sscore;

select total, avg from stuscore;

select avg,
case 
when avg >= 90 then 'A'
when avg >= 80 then 'B'
when avg >= 70 then 'C'
when avg >= 60 then 'D'
when avg < 60 then 'F'
end as hak
from stuscore;

--월급이 3000 이하 E등급 4000~5000 D등급 6000~8000 C등급 9000~10000 B등급  10000 이상 A등급

update emp02 a
set rank = (
select 
case
when salary>=10000 then 'A'
when salary>=8001 then 'B'
when salary>=5001 then 'C'
when salary>=3000 then 'B'
when salary<3000 then 'F'
end rank2
from emp02 b 
where a.employee_id = b.employee_id 
);

select salary,
case
when salary>=10000 then 'A'
when salary>=8001 then 'B'
when salary>=5001 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'F'
end rank
from employees;

alter table emp02
add rank varchar2(10);


select * from emp02;
select * from employees;

rollback;


-----------------------------------------------------------------------------

--사원 주에 평균 월급 이하로 받는 사원을 출력하시오.
-- select 2개이상 : 서브쿼리
select emp_name, salary from employees
where salary <= (select avg(salary) from employees);

select avg(salary) from employees;

select bhit, bhit+100 from fboard;

update fboard 
set bhit = bhit+100;

commit;

rollback;

create table fboard as select * from board;

select bno, bhit from fboard;

select bno, bhit from board;

--계획
select a.bhit, b.bhit from fboard a, board b
where a.bno = b.bno
;

--수정
update fboard a
set bhit = (
select bhit from board b where a.bno = b.bno
);

create table nboard(
bno number(4) primary key,
id varchar2(20),
btitle varchar2(1000) not null,
bcontent varchar2(4000),
bdate date,
constraint fk_nboard foreign key(id) references member(id)
);
-- foreign 키(외래키) 등록이름 : fk_nboard

select * from nboard;

select * from member;

--id : 외래 키 - member primary key ->  중복안됨, null 없는 데이터 입력하게 되면 에러처리
insert into nboard values (
nboard_seq.nextval,'aaa','제목3','내용3',sysdate
);

commit;

select * from nboard;

select * from member;

delete member 
where id = 'ddd';

--외래키로 등록, primary key 테이블의 데이터가 삭제되면 외래키에 있는 데이터도 모두 삭제처리.
alter table nboard
add constraint fk_nboard foreign key(id) references member(id)
on delete cascade
;

--primary key 테이블의 데이터가 삭제되면 외래키에 있는 데이터의 id만 null값으로 변경
alter table nboard
add constraint fk_nboard_id foreign key(id) references member(id)
on delete set null
;

delete member
where id = 'aaa';



alter table nboard
drop constraint fk_nboard;

select * from board
order by bno;

--null값을 제외한 row를 검색한 후 그룹함수를 적용해서 출력.
select department_id, count(commission_pct)
from employees
where commission_pct is not null
group by department_id;

select department_id, count(*) from employees where commission_pct is not null group by department_id;

--그룹함수에서 그룹함수의 값의 조건을 처리하려면 having 명령어를 사용해야함.
select department_id, count(commission_pct)
from employees
group by department_id
having count(commission_pct) != 0;

select * from employees;

--부서별에서 평균 월급 출력하시오.

select department_id, avg(salary)
from employees
group by department_id
;

--부서별로 평균이 전체평균 이상인 부서만 출력하시오.
select department_id, avg(salary)
from employees
where department_id = 90
group by department_id
having avg(salary) >( select avg(salary) from employees)
;
--having : 그룹함수에 대한 조건절
--where : 단일함수에 대한 조건절

select a.department_id,b.department_name,avg(salary) as aaa
from employees a, departments b
where a.department_id = b.department_id
group by a.department_id,b.department_name
having avg(salary)>(select avg(salary) from employees )
;

commit;