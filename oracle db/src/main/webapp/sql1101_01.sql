select count(*) from employees, departments
;
select * from departments;  --107개
desc employees; --컬럼 13개

select * from employees --27개  
where department_id = 50;


select employee_id, emp_name, department_id from employees
where department_id = 50;

select a.employee_id, a.emp_name, a.department_id ,b.department_id , b.department_name, b.parent_id, b.manager_id, b.create_date, b.update_date
from employees a, departments b
where a.department_id = b.department_id and a.department_id=50 
;

select * from stuscore;

select * from stuinfo;

select sno, a.stunum, a.name, a.grade, gender, kor, eng, math, total, round(avg,2) as avg
from stuinfo a, stuscore b
where a.stunum = b.stunum and lower(name) like '%d%' 
and gender = 'Male'
and total >= 250
;

--David Austin

select * from employees;
select * from departments;



--사원번호,사원명,월급,부서명,부서입력일(create_date),부서수정일(update_date),직급번호
select a.employee_id, a.emp_name, a.salary, a.job_id, b.department_id, b.department_name, b.create_date, b.update_date
from employees a, departments b
where a.department_id = b.department_id
and a.department_id = (select department_id from employees where emp_name='David Austin')
;

select * from countries;
select * from customers;
select * from customers
order by cust_name desc
;

select *from customers
where lower(cust_street_address) like '%north%'
;

select * from customers
where cust_street_address like '%North%'
and cust_year_of_birth > = 1945
;
select * from departments;
select * from employees;
select * from jobs;

--직급별 최소월급이 5000 이상인 직급의 사람들 중 부서번호가 50번 이상인 사람들만 출력하시오.
select a.employee_id, a.emp_name, a.department_id , department_name ,a.salary, a.job_id, b.min_salary, b.max_salary
from employees a, jobs b, departments c
where a.job_id = b.job_id  and a.department_id = c.department_id 
and a.department_id >=50 and min_salary>5000
;

select employee_id, emp_name, salary, a.job_id, min_salary, a.department_id, department_name
from employees a, jobs b, departments c
where a.job_id = b.job_id
and a.department_id = c.department_id
and min_salary >= 5000
order by min_salary asc;

-- sa_man 직급을 가진 사원번호, 사원명, 부서번호, 부서명을 출력하시오.

select * from jobs;
select * from employees;
select * from departments;

select employee_id, emp_name, b.manager_id, a.department_id, department_name, a.job_id 
from employees a, departments b
where a.department_id = b.department_id and
a.job_id = 'SA_MAN'
;

create table salgrade(
grade varchar2(5),
low_sal number,
high_sal number
);

select salary from employees
order by salary asc;

--2001-3000 까지 5CLS
--3001-4000 까지 4CLS
--4001-8000 까지 3CLS
--8001-10000까지 2CLS
--10001-14000 1CLS
-- 14001-20000 TOP

insert into salgrade values(
'5CLS',2001,3000
);

select*from salgrade;

/*
update salgrade
set high_sal=30000
where grade='top'
;
*/

commit; 
--non equi-join
select employee_id, emp_name, salary, grade
from employees a, salgrade b
where salary between low_sal and high_sal 
order by employee_id
;

select * from empolyees
where manager_id is null;

create table stugrade(
grade varchar(10),
low_score number,
high_score number
);

--A, 90,100
--B, 80,89
--C, 70, 79
--D, 60, 69
--F, 0, 59


insert into stugrade values(
'F', 0, 59
);

select * from stuscore;
select * from stuinfo;
select * from stugrade;
commit;

--not-equi join stuscroe avg 값을 가지고  
--stunum, name, (stuinfo)agrade, total, avg, (grade 출력

select a.stunum, name, total, avg, c.grade "학년" , b.grade "성적"
from stuscore a, stugrade b, stuinfo c
where avg between low_score and high_score 
and a.stunum = c.stunum
order by a.stunum
;

select stunum, total, avg,
case 
when avg >=90  then 'A'
when avg >=80  then 'B'
when avg >=70  then 'C'
when avg >= 60 then 'D'
else 'F'
end as grade
from stuscore;

SELECT EMPLOYEE_ID,EMP_NAME,SALARY,
CASE
WHEN SALARY<=4000 THEN 'Y'
ELSE ' '
END AS "년봉인상"
FROM EMPLOYEES
;
SELECT * FROM KOR_LOAN_STATUS;
-- REGION별 대출금액을 출력하시오.
SELECT REGION, SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY REGION
;
-- 기간별 대출금액을 출력하시오.
SELECT PERIOD,SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY PERIOD
;
SELECT * FROM KOR_LOAN_STATUS;
-- 년도별 대출금액을 출력하시오.
SELECT SUBSTR(PERIOD,1,4),SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY SUBSTR(PERIOD,1,4)
;
-- 월별 대출금액을 출력하시오.
SELECT SUBSTR(PERIOD,5,2),SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY SUBSTR(PERIOD,5,2)
;
-- 부서별 총월급을 출력하시오.
SELECT A.DEPARTMENT_ID,DEPARTMENT_NAME,SUM(SALARY)
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY A.DEPARTMENT_ID,DEPARTMENT_NAME
;
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID,EMP_NAME,DEPARTMENT_ID, MANAGER_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID
;
SELECT A.EMPLOYEE_ID,A.EMP_NAME,A.MANAGER_ID,B.EMP_NAME
FROM EMPLOYEES A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID
ORDER BY A.DEPARTMENT_ID
;
-- manager_id, 매니저 이름이 Steven King인 사원을 모두 출력하시오.
-- employee_id, emp_name, manager_id, emp_name,부서번호,부서명, 직급타이틀(job_title)
select a.employee_id, a.emp_name, a.manager_id, b.emp_name,job_title,
a.department_id,department_name
from employees a, employees b, departments c, jobs d
where a.manager_id = b.employee_id      -- self join
and a.department_id = c.department_id   -- equi join
and a.job_id = d.job_id
and b.emp_name='Steven King'
;
-- 부서번호,부서명, 직급타이틀(job_title)
select * from jobs
