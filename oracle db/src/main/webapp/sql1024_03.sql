select * from departments;

select * from departments order by manager_id asc;

select*from employees;

select*from employees order by employee_id desc;

--��� 200�� �̻��� ����
select*from employees where employee_id >= 200;

--��� 190���� 205 ������ ����
select*from employees 
where employee_id>=190 and employee_id<=205;
--���ǿ� �ش�Ǵ� ������ ��ȸ����.

--���� 5000�̻��̸鼭 ��������
select*from employees
where salary>=5000 order by salary asc;

select employee_id, emp_name, job_id,department_id,salary from employees;

--���̺��� ������ ����
create table emp2 as select * from employees;

select * from emp2;

--�÷� Ÿ�� �˻�
desc emp2;

--�÷��̸� ����
alter table emp2 rename column emp_name to e_name;

--�÷� ������Ÿ�� ���̺���
--email �ȿ� �����Ͱ� ���ڰ� �ƴϸ� ������ �ȵ�. (�����̱� ������ ���� �������)
alter table emp2 modify email varchar2(50);

--Į�� ����
alter table emp2 drop column create_date;

--�÷� �߰�
alter table emp2 add create_date date;
--Į���� �߰��ϸ� �������ٷ� ����.

--�÷����� ����
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;

select*from emp2;

--�÷��� �����͸� ����
insert into emp2 select * from employees;


drop table emp2;

--�̸�,�޿�,�Ի��� ���
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

--��Ī ����, as ������ ������.
select salary,salary*12 y_salary,salary*12*1342 as k_salary from employees;

select * from employees;

--���� nvl(����,0) null��� 0���� ǥ��.
select salary, salary*12, commission_pct from employees;
select 
salary,
salary*12 as "���", 
(salary*12)*nvl(commission_pct,0) as "�μ�Ƽ��", --null ���� ���Ѵ��̱� ������ 0���� ������ �������.
(salary*12)+(salary*12)*nvl(commission_pct,0) as "��������" from employees; --nvl(-,0) -> null ���� 0���� ����.

select nvl(manager_id,0) from employees;

--���, ����, ����, Ŀ�̼�, ����+Ŀ�̼��� ����Ͻÿ�.

select 
employee_id,
salary,
job_id,
salary*12 as "����",
(salary*12)+(salary*12)*nvl(commission_pct,0) as"����+Ŀ�̼�"
from employees;

--������ 6000�� ����� �˻�
select * from employees where salary=6000;

--���Ⱑ �ʿ��� ��� ""�ȿ� �����ϱ�.
select salary as "em p"from employees where salary=6000;

--Ŀ�̼��� null�� ����� ����Ͻÿ�. null�� ã�� �� is / null�� �ƴ� �� ã�� �� is not.(��� �Ұ�)
select * from employees where commission_pct is not null;
select * from employees where commission_pct is null;

--column�� ��ä�� �������� �ۼ�. �ѱ��� ������ �� Ȯ���� ����. 

select * from departments;

--�μ���ȣ, �μ����� ����Ͻÿ�.
select department_id as "�μ���ȣ", department_name as "�μ���" from departments 
where department_id>=10 and department_id<=40;

--����Ÿ���� �ٿ��� ��� '||'
select emp_name||'is a'||job_id from employees;

select concat(concat(emp_name,' is a '),job_id) con_name from employees; 

select * from stuscore;

select kor, eng, math, kor+eng+math,(kor+eng+math)/3 from stuscore;

select distinct department_id from employees order by department_id asc;

select distinct job_id from employees order by job_id asc;

--���� 3000, 6000, 7000�� ��� ����Ͻÿ�.
select salary from employees where salary =3000 or salary=7000 or salary=6000;
select salary from employees where salary >=3000 and salary<=10000
order by salary desc;

--���� 5000���� �� ������� +1000 ������ �λ��ؼ� ��ȭ�� ����Ͻÿ�.

select salary "�⺻����", (salary+1000) "�λ��", (salary+1000)*1342 "��ȭ" 
from employees 
where salary<=5000
order by salary asc;

--�μ���ȣ�� 10,30,50 �� �����ȣ ����̸�,�μ���ȣ,����, ����, �Ի��� ����Ͻÿ�.

select * from employees;

select employee_id, emp_name, department_id, job_id, salary, hire_date 
from employees 
where department_id =10 or department_id=30 or department_id =50
order by department_id asc, employee_id desc 
;

select * from employees;

--�޿��� 4000 �̻� 8000 ���� �����ȣ, ����̸�, �޿�, �Ի���, �μ���ȣ ���
--�Ի����� 2003/09/01 ���� ����� ����Ͻÿ�,

select employee_id, emp_name, salary, hire_date,hire_date+100, department_id 
from employees
where salary >= 4000 and salary<=8000 and hire_date >= '03/09/01'
;

commit;

