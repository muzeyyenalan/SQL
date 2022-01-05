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
SELECT CustomerId,InvoiceDate,total FROM invoices WHERE total>10 ;
/*===================================================
														LIMIT
====================================================*/
 	/*invoices tablosunda Total değeri 10$'dan büyük olan ilk 4 kayıt'ın InvoiceId, 
	InvoiceDate ve total bilgilerini sorgulayiniz */
