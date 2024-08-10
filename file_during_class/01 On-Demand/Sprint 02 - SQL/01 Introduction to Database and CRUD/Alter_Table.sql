-- select * from employee;

-- alter คือการเปลี่ยน (edit) table
-- alter table employee rename to MyEmployee;

/*alter table MyEmployee
add email text;*/

update MyEmployee
--set email = '';
set email = 'admin@company.com' where depart = 'IT';
--set email = lower(name) || "." || lower(depart) || "@company.com" where depart in ('Marketing','Sales');

select * from MyEmployee;