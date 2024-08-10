/* select artists.artistid, name, title from artists join albums 
on artists.artistid = albums.artistid; */

select 
	artists.ArtistId, 
    artists.name as artist_name, 
    title as album_name,
    tracks.name as song_name
from artists, albums, tracks
-- เนื่องจากมีการ select column มาจากหลาย table -> ควรจะ specify column ที่ถูกเลือก ว่ามาจาก table ไหน โดยเขียนเป็น [table].[col] เพื่อป้องกัน column ชื่อซ้ำกันหลาย table (SQL จะ error)
where artists.artistid = albums.artistid
	and albums.albumid = tracks.albumid; --Primary Key = Foreign Keyalbums