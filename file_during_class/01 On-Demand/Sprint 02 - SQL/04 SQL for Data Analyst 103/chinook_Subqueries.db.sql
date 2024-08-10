--select * from tracks order by milliseconds desc limit 1;

/* select max(milliseconds) from tracks;
select * from tracks where milliseconds = 5286953; */

-- using Inner Query Technique
select * from tracks where milliseconds = (select max(milliseconds) from tracks);