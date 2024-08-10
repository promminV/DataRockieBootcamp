-- filter ตรง ๆ ไม่ได้ เพราะใส่ where หลัง order แล้ว sql error -> ต้องใช้ subquery
select * from (
-- window function = function ที่ run ทุก row
	select 
		row_number() over(partition by country order by firstname) as rowNum, 
    	-- window function (สังเกต keyword = "over()"), partition by country = จับกลุ่มตามประเทศ , order by = sort ข้อมูลในกลุ่มนั้น ๆ
		firstname, 
    	country 
	from customers
	order by 3
)
where rowNum = 1;
