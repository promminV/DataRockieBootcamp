-- Having ใช้ filter เหมือนกัน (เหมือน where) แต่ใช้กับข้อมูลที่ผ่านการ group by มาแล้ว 
--select * from genres;
select
	genres.name as genres_name,
    count(*)
from genres, tracks
where genres.genreid = tracks.genreid and 
group by genres.name
having count(*) >= 70;

    

