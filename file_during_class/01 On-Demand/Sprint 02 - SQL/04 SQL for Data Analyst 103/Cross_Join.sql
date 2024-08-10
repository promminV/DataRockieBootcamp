-- Cross join
/*
create table ranks (
	rank TEXT not NULL
);

create table suits (
	suit TEXT NOT NULL
);
*/

/*
insert into ranks(rank)
values ('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('J'),('Q'),('K'),('A');

insert into suits(suit)
values ('Clubs'), ('Diamonds'), ('Hearts'), ('Spades');
*/

select * from suits;
select * from ranks;
-- Cross Join Step
select * from suits cross join ranks;