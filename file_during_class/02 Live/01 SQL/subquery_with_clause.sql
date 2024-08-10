--subquery + with (common table expression)
-- with = การ define variable ให้ subquery โดยเอาไว้บนสุด เหนือ select
with usa_customers as (
	select * from customers
	where country = 'USA'
), invoice_2010 as (
	select * from invoices
	where strftime("%Y", invoicedate)= "2010"
)

select c.firstname, sum(total) from usa_customers as c 
join invoice_2010 i on c.customerid = i.customerid
group by c.firstname; -- เขียนเป็น group by 1 แทนได้ (1 = column 1 = c.firstname)

-- code นี้คือ filter data ที่ต้องการก่อน แล้วเอามาทำเป็น subquery จากนั้นใส่ตัวแปร โดยใช้ with แล้วค่อยเอา subquery มา join กัน

