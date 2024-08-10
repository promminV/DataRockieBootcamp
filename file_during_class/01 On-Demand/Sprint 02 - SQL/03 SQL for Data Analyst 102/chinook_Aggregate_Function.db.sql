-- Aggregate Functions
select 
	avg(milliseconds) as avg_mill, 
    sum(milliseconds) sum_mill,
    min(milliseconds) min_mill,
    max(milliseconds) max_mill,
    count(milliseconds) count_mill
 --- !!!! aggrigate function จะ ignore ค่า NULL
 from tracks;