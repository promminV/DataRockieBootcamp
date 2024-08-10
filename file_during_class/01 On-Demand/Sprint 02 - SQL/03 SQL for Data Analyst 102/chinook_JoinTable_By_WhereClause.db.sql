-- join table with WHERE clause (เทียบเท่า Inner Join)
/* --(1)
select * from artists, albums
where artists.artistid = albums.artistid;
*/
/* --(2)
select * from artists join albums
on artists.ArtistId = albums.artistid;
*/
-- result from (1) and (2) are the same