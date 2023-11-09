select * from stuscore;

select * from stuinfo;

select * from
(select rownum rnum,a.*from 
(select * 
from board 
order by bgroup) a
)
where rnum>=1 and rnum<=10
;

select * from
(select ROW_NUMBER() OVER (order by bgroup) rnum , a.* 
from board a)
where rnum between 11 and 20
;

select*from stuscore;

select*from stuinfo;

desc board;

select*from board;
