--사번이 홀수인 사원 출력
select * from employees
where mod(employee_id,2)=1;

--board
select*from board;
desc board;

--현재 날짜 출력
select sysdate from dual;

select * from board
order by bno desc
;

insert into board values (
board_seq.nextval,'이벤트 진행','내용입니다.',sysdate,'ccc',board_seq.currval,0,0,1,''
);
insert into board values (
board_seq.nextval,'게시글을 등록합니다.','게시글 내용입니다.',sysdate,'ccc',board_seq.currval,0,0,1,'2.jpg'
);
insert into board values (
board_seq.nextval,'게시글을 등록합니다.2','게시글 내용입니다.2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg'
);

commit;

--날짜 알아내기
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일
from dual;

select bno, btitle, bdate from board
order by bdate desc
;


--현재 날짜 기준 5일 이전에 게시글을 출력하시오.
select bno, btitle, bdate from board
where sysdate-7 < bdate
order by bdate desc
;

--employees 현재날짜 기준 입사일에서 현재날짜까지 기간을 출력

select employee_id, emp_name, hire_date, salary, department_id, trunc(sysdate-hire_date) 
from employees
;

--다가올 요일을 출력
select next_day(sysdate,'목') from dual;
select next_day(sysdate,'목요일') from dual;
select next_day(sysdate,7) from dual;

-- 입력한 날의 마지막 일을 출력
select last_day(sysdate) from dual;
select last_day('20231101') from dual;
select last_day('20220201') from dual;

--add_months
select add_months(sysdate,-2) from dual;
select add_months(sysdate,+12) from dual;
select add_months('20220101',+6) from dual;

--현재달에서 입사한 달까지의 개월수
select round(months_between(sysdate,hire_date))||'개월' from employees;

--현재 1년동안 게시글이 작성된 글을 출력하시오. board 
select bdate, sysdate , round(sysdate-bdate) from board
where sysdate-bdate<365
;

select bno, btitle, bdate 
from board
where bdate>add_months(sysdate,-12)
order by bdate desc
;

--날짜 중 달만 출력 : extract
select extract(year from bdate) from board;
select extract(month from bdate) from board;
select extract(day from bdate) from board;

--3월, 5월, 7월에 입력한 게시글 출력
select  bno, btitle, bdate from board
where extract(month from bdate) in (3,5,7)
order by bdate asc
;

--날짜 round: 15일이하 1일 세팅, 16일부터는 1달 추가 trunc : 그 달의 기준 1일로 변경함
select bno, btitle, bdate from board;
select bdate, round(bdate,'month'), trunc(bdate,'month') from board;

--to_date 는 형변환 함수
select round(to_date('2023-10-16'),'month') from dual;


--값을 default를 해두면 일일이 나열해야하기 때문에, default를 선언은 하긴 함.)
insert into board(bno,btitle,bcontent,bgroup,bstep,bindent,bhit,bfile)
values();

-- to_char 날짜 -> 문자형반환
select bdate from board;

--MON : 영문 표기로 나옴. DAY  ~요일 DY ~(요일)
select to_char(bdate,'YYYY-MM-DD DY HH:MI:SS') from board
order by bdate desc
; 

select bno, btitle,bcontent, to_char(bdate,'YYYY"년"MM"월"DD"일'), bdate, bgroup 
from board;

--입사일 (2023-11-01 화요일)
select to_char(hire_date,'YYYY-MM-DD DAY') from  employees;

--HH24 : 24시간 기준 HH12 : 12시간 기준 AM/PM HH12 : 오전 오후 표기
select to_char(bdate,'YYYY-MM-DD AM HH12:MI:SS') from board
order by bdate desc
;

--문자형 변환 함수

--숫자를 문자로
select to_char(1234567890) from dual;
-달러표시, 천단위표시, 0- 빈자리가 0으로 표시
select to_char(1234567890,'$9,999,999,999') from dual;
--나라별 화폐단위로 표시 :L
select to_char(1234567890,'L9,999,999,999') from dual;

select to_char(123,'0000000000') from dual;
select to_char(1234567890,'00000000000') from dual;

--trim : 앞뒤 공백제거 함수
select trim(to_char(123456,'L999,999,999')) from dual;


--salary 달러표시 천단위 표시
--salary '1342' 곱해서 원화표시와 천단위표시, 소수점 1짜리까지 표시

select trim(to_char(salary, '$999,999,999')) from employees;
select salary, trim(to_char(salary*1342,'L999,999,999')) from employees;
select salary,salary*1342.42,trim(to_char(round(salary*1342.42,1),'L999,999,999.9')) from employees;

--12345 총 9자리까지 표시, 빈공백은 0으로 채워줌.
select to_char(12345,'000000000') from dual;

--12,345 총 9자리까지 표시, 천단위표시하고 빈공백은 제거해서 출력
select trim(to_char(12345,'L999,999,999')) from dual;

-- board 테이블에서 bdate와 비교해서 20231023 숫자와 같은 입력한 게시글을 출력하시오.
select bno, btitle, bdate
from board
where  bdate=to_date('20231023','YYYYMMDD')
;

--숫자 20200101부터 현재까지 기간이 얼마나 지났는지 출력하시오.
select trunc(sysdate-to_date(20200101,'YYYYMMDD')) from dual;

--자신의 생일을 기준으로 얼마나 지났는지 
select sysdate-to_date(19930902,'YYYYMMDD') from dual;

--개월수 출력
select trunc(months_between(sysdate,to_date('19930902','YYYYMMDD')))
from dual;

--문자를 숫자로 형변환함수
--20,000 10,000의 차이를 출력하시오.
select to_number('20,000','99,999')from dual;
select to_number('10,000','99,999')from dual;

select to_number('20,000','99,999') - to_number('10,000','99,999') from dual;

select emp_name, to_char(salary,'$999,999') from employees;

--연봉 + commission_pct 포함
-- 월급 *12, 월급*12*커미션 연봉으로 해서 출력하시오.

select employee_id, emp_name, salary, salary*12, salary*12+(salary*12*nvl(commission_pct,0)) "년봉" from employees;

select manager_id from employees
where manager_id is null
;

select nvl(manager_id,0) from employees;

--ceo 라는 글자로 표시해서 출력하시오.
--숫자를 문자로 형변환 후 CEO글자 출력
select nvl(to_char(manager_id),'CEO') 
from employees;

--그룹함수 
--게시글 조회수 종합을 출력하시오.
select trim(to_char(sum(bhit),'999,999,999')) from board;

--평균표시
select trim(to_char(avg(bhit),'999,999,999')) from board;

--월급의 평균 출력, 소수점 2자리 반올림
select round(avg(salary),2) from employees;

--emp_name 단일함수와 그룹함수와 함께 출력 어려움.
--select emp_name, avg(salary) from employees;

--MIN,MAX 
--그룹함수끼리는 함께 출력 가능
select min(salary), max(salary), avg(salary), count(*) from employees;

--부서가 50인 사원들의 합계, 평균을 출력
select sum(salary), avg(salary) 
from employees
where department_id=50
;

select department_id, sum(salary), avg(salary)
from employees
group by department_id
order by department _id asc;

--날짜별 게시글 개수를 출력하시오.
select bdate,count(*)
from board
group by bdate
order by bdate asc
;
--연도별의 월별 개수를 
select to_char(bdate,'YYYYMM') 년월,count(to_char(bdate,'YYYYMM')) 년월별갯수
from board
group by to_char(bdate,'YYYYMM')
order by to_char(bdate,'YYYYMM')
;

select add_months(bdate,1)
from board;

--년도만 출력
select extract(year from bdate) from board;
--월만 출력
select extract(month from bdate) from board;
--일만 출력
select extract(day from bdate) from board;

--년도와 상관없이 월별 게시글 수 출력
select extract(month from bdate) 월, count(extract(month from bdate)) 월별갯수
from board
group by extract(month from bdate)
order by extract(month from bdate)
;

select count(*) from board;

select count(bno) from board;


select count(*) from employees;
select count(manager_id) from employees;
select coung(employee_id) from employees;

--단일함수 사용은 group by 절에 축가해서 사용해야 함.
select department_id ,count(*) from employees
group by department_id
order by department_id;

--조회수가 가장 낮은 게시글을 출력

select bno, btitle, bcontent, min(bhit) from board
group by bno, btitle, bcontent
;


select * from board
where bhit = (select min(bhit) from board)
;

--조회수가 가장 높은 게시글을 출력하시오.
select * from board
where bhit = (select max(bhit) from board)
;

--문자함수

select emp_name from employees;

--si, SI 포함된 이름을 모두 출력하시오.

select emp_name from employees
where emp_name like ('%SI%')or emp_name like ('%SI%') or emp_name like ('%Si%') or emp_name like('%sI%') 
;

select emp_name from employees
where emp_name like ('%DA%')or emp_name like ('%Da%') or emp_name like ('%da%') or emp_name like('%dA%') 
;

--이름을 모두 소문자로 변환하여 이름을 검색
select emp_name from employees
where lower(emp_name) like ('%da%')
;

--이름을 모두 대문자로 바꿔 이름을 검색
select emp_name from employees
where upper(emp_name) like ('%DA%')
;

--employees에서 이름을 대문자로 출력하시오.
select upper(emp_name) from employees;

--자리수를 만들어서 지정한 문자를 채워 출력. // 천단위 표시는 안됨.
select LPAD(12345, 10, '0') from dual;
select RPAD(12345, 10, '@') from dual;

--12345 10자리르 천단위표시와 원화 표시를 추가하여 출력
--빈공백은 -으로 표시
select to_char(12345,'L000,000,000') from dual;

--ltrim(왼쪽공백제거), rtrim(오른쪽공백제거), trim(모두 공백제거)
--'abc def  c  '

--사이에 대한 공백은 제거 불가
select trim('  abc def  c  ') from dual;

select * from employees;

--job_id asst -> ss -> AIT 변경

select job_id, replace(job_id,'SS','I') from employees;

--job_id 안에 있는 공백 제거
select emp_name, replace(emp_name,' ','') from employees
;
select job_id from emp2; 

--sh_clek -> clek으로 변경하여 저장하시오.
select replace(job_id,'SH_CLERK','CLERK') from emp2;
update emp2 
set job_id = 'CLERK' a
where job_id = (select replace(job_id,'CL','SH_CLERK') j_id from emp2 b where a.employee_id = b.employee_id
;


--substr(해당컬럼,3,2,) 해당컬럼에서 3번째 글자부터 2개를 잘라와 출력.
-- 4번째부터 이름 3개를 가져옴.
select emp_name, substr(emp_name,4,3) from employees;

select hire_date from employees;

--이름 5개와 입사년도를 출력하세요
select substr(emp_name,0,5)|| '(' || extract(year from hire_date) || ')' from employees;

select * from employees;

--입사일이 06월인 사원 중에 이름이 d가 있는 사원을 출력
select * from employees
where extract(month from hire_date)=06 and lower(emp_name) like ('%d%')
;

select bno, bhit, bhit+100 from board;

rollback;

update board
set bhit =1;


--bhit+100한 값을 bhit 값으로 변경
update board a
set bhit = (select bhit+100 from board b
where a.bno = b.bno)
;

select job_id from emp2;

update emp2 a
set job_id = (select replace(job_id,'SH_CLERK','CLERK') from emp2 b where a.employee_id = b.employee_id)
;

--게시글의 날짜를 1씩 증가해서 update 하시오.
--bdate

select bdate, bdate+1 from board;

update board a
set bdate = (select bdate+1 from board b where a.bno = b.bno)
;

rollback;

select* from stuscore
order by rank asc
;

update stuscore
set rank =0;

commit;
select b_num, b_rank from
(select stunum b_num, rank() over (order by total desc) b_rank from stuscore)
;

update stuscore a
set rank = (select b_rank from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore b) where a.stunum = b_num)
;

-- length 평균 출력
select avg(length(emp_name)) from employees
;

-- 이름을 평균절사 길이만큼만 출력하시오.

;

-- 사원명의 폰번호 5번째 3개와 이름 1-5번째 2개 출력하시오.
select * from employees;
select substr(phone_number,5,3) ||substr(emp_name,1,5) from employees;

-- instr 찾고자 하는 위치 숫자 출력
select instr(emp_name,'o') from employees
where employee_id =198
; 

select emp_name, instr(emp_name,' '), instr(emp_name,' ')+1 from employees;

--1번째 공백이후부터 이름가져오기
select substr(emp_name,instr(emp_name,' ')+1) from employees;

--주민번호 앞자리 가져오기
select substr('880101-1101111',1,instr('880101-1101111','-')-1) from dual;

--주민번호 뒷자리 가져오기
select substr('880101-1101111',instr('880101-1101111','-')+1) from dual;

select phone_number from employees;

--employees의 phone_number 첫번째 점 기준으로 앞부분과 뒤부분 출력
select substr(phone_number,1,instr(phone_number,'.') -1), substr(phone_number, instr(phone_number,'.')+1) from employees;

--점 기준으로 앞,중,뒤부분을 출력하시오.

--중간
select  substr(substr(phone_number, instr(phone_number,'.')+1),1, instr(substr(phone_number, instr(phone_number,'.')+1),'.')-1) 
from employees;

--뒤
select  substr(substr(phone_number, instr(phone_number,'.')+1), instr(substr(phone_number, instr(phone_number,'.')+1),'.')+1) 
from employees;

--앞, 중간, 뒤
select substr(phone_number ,1,instr(phone_number,'.')-1) 앞번호,
substr(substr(phone_number, instr(phone_number,'.')+1),1, instr(substr(phone_number, instr(phone_number,'.')+1),'.')-1) 중간번호,
substr(substr(phone_number, instr(phone_number,'.')+1), instr(substr(phone_number, instr(phone_number,'.')+1),'.')+1) 뒤번호
from employees;

select instr('123.456.789.000','.',1,3) from dual; -- 첫번째 숫자 : 시작위치 / 두번째 숫자 : 점의 두번째 위치값
select instr('123.456.789.000','.',-1,1) from dual; 

--전화번호 첫 중간 끝 번호 출력
select * from member;
select substr(phone,1,instr(phone,'-')-1) from member; --첫번째 번호
select substr(phone, instr(phone,'-')+1,4) from member; --중간번호
select substr(phone, instr(phone,'-',1,2)+1,4) from member; --끝번호

select phone_number from employees;

--폰번호에서 123 포함되어 있는 전화번호를 출력
select phone_number 
from employees
where phone_number like '%123%'
;

--부서별 월급 최대월급 최소월급
select department_id, count(*), max(salary), min(salary)
from employees
group by department_id
order by department_id
;

--이름, 입사일 
select emp_name ||'   ' || to_char(hire_date,'YYYY"년"MM"월"DD"일" DAY')
from employees;

commit;
