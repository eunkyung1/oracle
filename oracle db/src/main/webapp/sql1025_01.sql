select * from employees;

select salary,salary+100,salary-100 from employees;

select sysdate,sysdate+365 from dual; --�ӽô������̺�

select 1+3 from dual;

-- ����'3'�� ��Ģ������ �ϸ� ���ڷ� �ڵ���ȯ
select 1+'3' from dual;

-- ���� 'a'�� ��Ģ���� �ϸ� ����
select 1+'a' from dual;

-- ���ڴ� ��Ģ������ �� �� ����.
select 'a'+'b' from dual;

--���� ������ ||
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

--emp_name(email) ���

select emp_name||' ( '|| email ||' ) ' u_nicld from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;

--00/01/01 ���� �Ի��� ����� ����Ͻÿ�.
--00/01/24,00-01-01,2000-01-01 ���� ������.
select * from employees
where hire_date>'00-01-01'
order by hire_date asc;

select * from employees
order by salary desc;

select count(*) from employees;
select max(salary) from employees;

--��������
select * from employees
where salary=(select max(salary) from employees);

select * from employees
where commission_pct is null;

select * from employees
where commission_pct is not null;

--�μ���ȣ�� 80�� �̻��� ����� ����Ͻÿ�.
select * from employees
where department_id>=80
order by department_id asc;

--�μ���ȣ�� 80�� �����ϰ� ����Ͻÿ�.
select * from employees
where not department_id = 80
order by department_id asc;

-- <>, !=, not 
select * from employees
where department_id != 80
order by department_id asc;

-- �μ���ȣ�� 50�� �̸鼭 �޿��� 6000�̻��� ����� ����Ͻÿ�.
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

-- ���� 3000,4000,6000
-- or���� / in(����1,����2..)
select * from employees
where salary = 3000 or salary = 4000 or salary=6000
order by salary asc;

select * from employees
where salary in(3000,4000,6000)
;

--�����ȣ 101, 151, 200  �޿�
select employee_id, salary from employees
where employee_id in(101,151,200)
;
select employee_id, salary from employees
where employee_id=100 or employee_id=151 or employee_id=200; 

--�޿� 2000�̸� 3000�ʰ��� ����� ���.
select * from employees
where salary<2000 or salary>3000;

select*from employees
where salary not between 2000 and 3000;

--�Ի����� 00/01/01 ~ 00/12/31
select*from employees
where hire_date between '00/01/01' and '00/12/31';

select * from employees
where hire_date >= '00-01-01' and hire_date <= '00-12-31';

--S�� ���۵Ǵ� �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like 'S%'
;

--n�� ������ �̸��� ���
select emp_name from employees
where emp_name like '%n'
;

--ó��,��,�߰� e�� �ִ� �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like '%e%';

