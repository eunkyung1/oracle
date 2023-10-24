--drop table customer; --테이블 삭제

create table member( --테이블 추가
id varchar2(20),
pw varchar2(20),
name varchar2(30),
gender varchar2(1),
age number,
birth varchar2(13),
phone varchar2(13),
rdate date
);

--drop table member;

create table stuscore(
stuNum number(4),--9999까지 가능
name varchar2(30),
kor number(3),  --99까지 가능
eng number(3),
math number(3),
total number(3),
avg number(5,2),   --소수점 2자리사용
rank number(10)
);

insert into stuscore values(
1,'홍길동',100,100,100,100+100+100,(100+100+100)/3,0
);

insert into stuscore(stunum,name,rank) values(
3,'이순신',0
);

--update stuscore set kor=100, eng=100, math=100, total=100+100+100, avg=(100+100+100)/3;

--수정 : update
update stuscore set kor=100, eng=100., math=100, total=100+100+100, avg=(100+100+100)/3 
where stunum=3;

--delete stuscore where stunum=3;

insert into stuscore values(
2,'유관순',100,100,99,100+100+99,(100+100+99)/3,0
);

rollback;

select * from stuscore;

commit;

select * from employees;

select * from tab; --현재 생성되어 있는 모든 table를 보여줌.

desc stuscore; --현재 table 의 컬럼과 컬럼타입을 보여줌. 

insert into member values(
'aaa','1111','홍길동','M',20,'1990-01-01','010-1111-1111',sysdate
);

elect * from member;

