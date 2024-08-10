--COALESCE = แทนที่ค่า Null ด้วย ค่าอื่น
select 
	company,
    coalesce(company,'End Customer') as 'Company Clean',
    case when company is null then 'End Customer'
    	ELSE 'Corperate'
    END AS 'Company Clean 2'
from customers;