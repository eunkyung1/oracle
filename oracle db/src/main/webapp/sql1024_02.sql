-- drop table member;

create table member(
 id varchar2(20) primary key,
 pw varchar2(20),
 name varchar2(20),
 phone varchar2(20),
 gender varchar2(6),
 hobby varchar2(80)
 );
 
 insert into member(id,pw,name,phone,gender,hobby) values(
 'aaa', '1111','ȫ�浿','010-1111-1111','M','game,golf,run'
 );
 
 insert into member values(
 'bbb','1111','������','010-2222-2222','F','golf,book'
 );
 
 insert into member values(
 'ccc','1111','�̼���','010-3333-3333','M','cook,book'
 );
 
 insert into member values(
 'ddd','1111','������','010-4444-4444','M','game,run,book'
 );
 
 
 insert into member values(
 'eee','2222','�豸','010-5555-5555','M','golf,book,cook'
 );
 
 commit;
 
 select * from member;
 
 delete member where id='ccc';
 
 select * from member;
 
 update member set phone='010-3333-3333' where id='ddd';
 
 select * from tab; --��� ���̺��� ������
 desc member;
 
 desc employees;
 
 select create_date from employees;
 
 select * from member;
 
 select id,name from member;
 
 select * from employees;
 
 select employee_id, emp_name, salary, commission_pct from employees order by salary asc; --desc - ������, asc - ������
 
 desc employees;
 
 select hire_date,sysdate,round(sysdate-hire_date) from employees; 
 -- [sysdate - hire_date] : ���糯¥���� ���� ��¥������ �Ⱓ. 
 --sysdate ���� ��¥ date -> +,- ����.
 -- round �ݿø�
 
 select distinct department_id from employees order by  department_id asc; -- distinct : �ߺ� ����(1���� ���� ����)
 
 select * from departments;
 
 desc stuscore;
 
 select emp_name from employees;
 
 --����, ���̺��, �÷����� ��ҹ��� ��������
 --�����Ͱ��� ��ҹ��� ������.
 select emp_name from employees where EMP_NAME='Donald OConnell';
 
 
 
 