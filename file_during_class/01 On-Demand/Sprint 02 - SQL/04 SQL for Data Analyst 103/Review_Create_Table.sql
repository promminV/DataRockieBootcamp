/*
create table book_shop (
	id int,
  	name text,
  	release_year int
);

create table favourite_book (
	id int,
	author text,
  	review real
);
*/

insert into book_shop values 
	(1, 'Think Like A Freak', 2014),
    (2, 'Ultralearning', 2019),
    (3, 'Blue Ocean Strategy', 2015),
    (4, 'The Power of Habit', 2012),
    (5, 'Outliers', 2008);
    
INSERT into favourite_book values
	(1, 'Steven D. Levitt, Stephen J. Dabner', 1904),
    (4, 'Charles Duhigg', 12007),
    (5, 'Malcolm Gladwell', 12063);

select * from book_shop;
select * from favourite_book;
