-- self join
/*
create table employee (
	id int,
  	name text,
  	level text,
  	manager_id int
);

insert into employee values 
	(1, 'David', 'CEO', NULL),
    (2, 'John', 'SVP', 1),
    (3, 'Mary', 'VP', 2),
    (4, 'Adam', 'VP', 2),
    (5, 'Scott', 'Manager', 3),
    (6, 'Louise', 'Manager', 3),
    (7, 'Kevin', 'Manager', 4),
    (8, 'Takeshi', 'Manager', 4),
    (9, 'Joe', 'AM', 6),
    (10, 'Anna', 'AM', 7);
 */
 
 select * from employee;
 
 select 
 	E1.id staff_id, 
    E1.name staff_name,
    E1.level staff_level,
    E2.name manager_name,
    E2.level manager_level
 from employee E1, employee E2
 where E1.manager_id = E2.id; -- เอา manager_id ตั้ง แล้วไป search หา id ที่ตรงกันใน E2 ถ้าไม่มีก็ลบแถวนั้นทิ้ง
