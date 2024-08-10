select 
	firstname, country,
    case 
    	when country in ('USA', 'Canada') then 'America'
        when country in ('Belgium', 'Italy', 'France') then 'Europe'
        else 'Other Regions'
        end as region
from customers;