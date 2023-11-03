select rownum, bno, btitle, bcontent,bdate
from board
order by bno
;

select * 
from 
(select ROW_NUMBER() OVER (ORDER BY bno desc) as rnum,bno,btitle,bcontent,bdate
from board 
where bcontent like '%sum%') a
where a.rnum>= 11  and a.rnum<=20
;

select * from (select ROW_NUMBER() OVER (ORDER BY bno desc) as rnum,bno,btitle,bcontent,bdate from board where bcontent like '%love%') a where a.rnum>=41 and a.rnum<=50;

select *
from 
(select row_number() over(order by bno desc) as rnum,bno,btitle,bcontent,bdate
from board
where bcontent like '%love%') a
where a.run>=11 and a.run<20
;
select * from (select row_number() over(order by bno desc) as rnum,bno,btitle,bcontent,bdate from boardwhere bcontent like '(%love%') a where a.run>=11and a.run<=20;
select * from (select row_number() over(order by bno desc) as rnum,bno,btitle,bcontent,bdatefrom boardwhere bcontent like '%love%') a where a.run>=21and a.run<=30;
select*from board 
order by bno desc;

select * from (select row_number() over(order by bno desc)as rnum,bno,btitle,bcontent,bdate from board where bcontent like '%love%') a where a.run>=21and a.run<=30;

select * from board
where bno=1
;

