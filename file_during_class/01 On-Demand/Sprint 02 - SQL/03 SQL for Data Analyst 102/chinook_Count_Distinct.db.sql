--Count Distinct

-- Distinct = Unique Value

select 
	count(country) count_country,
    count(distinct country) Ucount_country
from customers;