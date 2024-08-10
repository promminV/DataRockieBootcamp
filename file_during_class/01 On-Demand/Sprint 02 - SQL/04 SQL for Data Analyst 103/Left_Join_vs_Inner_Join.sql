-- First, observe overall of data.
select * from book_shop A;
select * from favourite_book B;

-- inner join = join 
select * from book_shop A
inner join favourite_book B on A.id = B.id ;

-- left join 
select * from book_shop A 
left join favourite_book B on A.id = B.id;