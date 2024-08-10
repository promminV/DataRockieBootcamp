/*SELECT 
	name, 
    salary, 
    salary*1.15 AS new_salary,
	LOWER(name) || '@company.com' AS company_email
FROM employee;*/

/*SELECT * FROM employee
WHERE salary > 85000 or depart = 'Marketing'
;*/

/*SELECT * from employee
where depart = 'Marketing' or 'Senior Manager';*/ --- ->(1)

/*Select * from employee
where depart in ('Marketing', 'Senior Manager'); --- ->(2)*/

-- Result from (1) and (2) are the same. 
