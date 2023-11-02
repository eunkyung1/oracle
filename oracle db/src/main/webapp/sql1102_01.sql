select * from member;

select * from member
where id='bbb' and pw='1111'
;

select*from board;

--board

--이중쿼리
select rownum,a.*from 
( --테이블
select * from board
where bcontent like '%sum%'
order by bno
) a
where rownum>=1 and rownum<=10
;
select * from(
select row_number() over(order by bno) rnum,a.*
from board a
where bcontent like '%sum%' 
) b
where rnum>=11 and rnum<=20 
;




select * from board
where bcontent like '%sum%'
order by bno
;
