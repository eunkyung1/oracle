select count (*) from board;

--drop table board;

select * from board;

--becontent faucibus �� �ִ� ���� ���
select * from board
where bcontent like '%faucibus%';

--bcontent �÷��� 'ven'�ܾ� ����
--btitle 'ven' ����

select * from board
where bcontent like '%ven%';

select * from board
where btitle like '%ven%';

select * from board
where bcontent like '%ven%' or btitle like '%ven%';

-- bontent n���� �����ϸ鼭 4���� ���ڴܾ �ִ� �Խñ� ����Ͻÿ�.
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

--����° ���ڰ� a �� ��� �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like '_a%';


--������ ���� ������ ����Ͻÿ�/
select emp_name , salary from employees
order by salary asc;

--����� ��������
select employee_id, emp_name, job_id, hire_date from employees
order by emp_name desc;

--�μ���ȣ�� ��������, �̸� �������� 
select employee_id, emp_name, department_id, job_id, hire_date 
from employees
order by department_id asc, emp_name desc;

--�������� ��������,�Ի��� ��������
select employee_id, emp_name, department_id, job_id, salary, hire_date from employees
order by salary asc, hire_date desc;

--abs : ���밪
select -10, abs(-10) "���밪" from dual;

--floor : ����
select 10.54578, floor(10.54578) from dual;

--trunc(��, ������ġ) : Ư������ ���� // ������ġ�� ���� ������ �ڿ����� ����
select 10.54578, trunc(10.54578,2),floor(10.54578) from dual;

--round : Ư���ڸ� �Ҽ��� �ݿø�
select 10.54578, round(10.54578), round(10.54578,3) from dual;

select * from stuscore;
select stunum, name, math, eng, math+eng, round((math+eng)/2,1) from stuscore;

-- ������ ��ȭ�� ȯ���ؼ� 1342.32�� �Ҽ��� 3�ڸ����� �ݿø� ���
select employee_id,emp_name, salary, salary*1342.32, round(salary*1342.32,2) from employees;

-- �Ի����� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ�.
--�Ҽ��� 3�ڸ����� �ݿø�
select hire_date,round(hire_date - sysdate,2) from employees;

--�Ի��Ͽ��� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ�.
--�Ҽ��� �ڸ��� �ݿø��ϰ�, ���� ������ ȯ��
select hire_date, sysdate-hire_date, round(sysdate-hire_date),floor((sysdate-hire_date)/365) sdate from employees
order by sdate asc;



select * from member;

select * from employees;

--������ �Լ�

select mod(27,2), mod(27,5), mod(27,7) from dual;

--employees����� Ȧ���� ����� ����Ͻÿ�.
select * from employees
where mod(employee_id,2)=1
order by employee_id asc
;

--�μ���ȣ�� ¦���� ����� ���
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

--������
create sequence member_seq
start with 1
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;

--������
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
board_seq.nextval,'�����Դϴ�.','�����Դϴ�.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg'
);
--nextval : ���������� currval : �������

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

--total�� �������� ���������ؼ� ����� ���.
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

--198�� ������� �Ŵ������̵� 1�� ��
update emp2 set manager_id= 1
where employee_id = 198
;

select manager_id from employees;

update (select manager_id from employees)
set emp2.manager_id = employees.manager_id
;

-- 1. emp2�ǻ����ȣ�� employees�� �����ȣ�� �Ȱ��� ��ġ
-- 2. emp2�� manager_id  employees manager_id �� �˻���.
-- 3. employees manager_id �� emp2 manager_id�� �Է½�Ŵ.
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
emp_seq.nextval,'ȫ�浿',sysdate);

insert into emp01 values(
emp_seq.nextval,'������',sysdate);

insert into emp01 values(
emp_seq.nextval,'�̼���',sysdate);

insert into emp01 values(
emp_seq.nextval,'ȫ����',sysdate);

insert into emp01 values(
emp_seq.nextval,'ȫ���',sysdate);

select * from emp01;

select * from employees;

select employee_id, emp_name, job_id, hire_date
from employees
order by hire_date desc;

commit;