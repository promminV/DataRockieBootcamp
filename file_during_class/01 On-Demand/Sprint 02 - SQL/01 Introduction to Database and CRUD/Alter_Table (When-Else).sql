-- select * from employee;

-- alter คือการเปลี่ยน (edit) table
-- alter table employee rename to MyEmployee;

/*alter table MyEmployee
add email text;*/

--select * from MyEmployee;

update MyEmployee
--set email = '';
set email = case 
when depart = "IT" then 'admin@company.com'
else lower(name) || "." || lower(depart) || "@company.com"
END;

select * from MyEmployee;