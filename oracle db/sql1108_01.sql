
select*from member;

select*from member
where id='aaa' and pw='1111'
;

select count(*) as lcheck from member
where id='aaa' and pw='1111'
;

select employee_id,emp_name,salary,to_char(salary*12+(salary*12*nvl(commission_pct,0)),999,999,999) year_salary, nvl(to_char(a.department_id),'CEO') department_id, nvl(department_name,'CEO') department_name,hire_date from employees a,departments b where a.department_id = b.department_id(+);


desc employees;


select bno, btitle,bcontent,id,bdate,bhit from board;
order by bgroup desc, bstep asc
;

desc board;



;
--번호 11-20 번 번호,제목,작성자,작성일,조회수
select * from (select row_number() over(order by bgroup desc,bstep asc) rnum, a.*from board a where btitle like '%ia%'  ) where rnum>=11 and rnum<20
;

--create table mem(
--id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
phone varchar2(20),
gender varchar2(6),
hobby varchar2(80)
);

insert into mem values('ccc','1111','이순신','010-3333-3333','Male','cook,book')
;

select * from mem
;

--alter table mem add mdate date;

desc mem;

--update mem 
set mdate = sysdate;

commit;

delete mem where id='ddd';

select * from mem;