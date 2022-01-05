/* SELECT */

SELECT name FROM tracks;
/* tracks tablosundan composer ve name sütününü çek */
SELECT Composer,name FROM tracks;
/* tracks tablosundan tüm bilgileri çek */
SELECT * FROM tracks;
SELECT Composer FROM tracks;
SELECT DISTINCT Composer FROM tracks;
SELECT DISTINCT AlbumId,MediaTypeId FROM tracks;
SELECT name 
FROM tracks
WHERE Composer='Jimi Hendrix';
SELECT * FROM invoices WHERE total>10 ;
