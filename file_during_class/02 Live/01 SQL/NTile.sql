-- window function NTILE() = Percent Tile
-- create segments = แบ่งข้อมูลตามลำดับ มาก -> น้อย หรือ น้อย->มาก ในกรณีนี้แบ่งเป็น 5 group
-- group = {High, Mid-High, Mid, Low, Very Low} 
select *,
	case when segment = 1 then 'Very Low'
    	when segment = 2 Then 'Low'
        when segment = 3 then 'Mid'
        when segment = 4 then 'Mid-High'
        Else 'High'
        END label_segment
from ( 
	select segment, count(*) from (
		select 
			name as songname,
    		milliseconds,
    		NTILE(5) OVER(order by milliseconds) as segment
		from tracks order by milliseconds
	)
group by 1
);