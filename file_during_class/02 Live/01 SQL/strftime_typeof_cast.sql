select 
	STRFTIME('%Y',invoicedate) as year ,
    STRFTIME('%m',invoicedate) as month,
    STRFTIME('%Y-%m',invoicedate) as monthid,
    STRFTIME('%d',invoicedate) as day
from invoices; 

--STRFTIME = String format date time เทียบเท่า extract ใน google sheet [data type จะเป็น string]
--typeof() = check type of data
-- cast() = convert type of data
