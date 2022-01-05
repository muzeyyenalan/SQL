
 
 /* ÖDEV: Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz.*/
SELECT * FROM tracks;
SELECT * from genres;

SELECT t.Name as Song_Name ,g.Name as Song_Genre
FROM tracks t
JOIN genres g
ON t.GenreId=g.GenreId;

	 
 /* ÖDEV: invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 SELECT * FROM invoices;
 SELECT * from customers;
 
 SELECT c.FirstName,c.LastName,i.InvoiceDate,i.total
 FROM invoices i
 Left JOIN customers c
 ON i.CustomerId=c.CustomerId
/* ÖDEV: artists tablosunda bulunan her bir kişinin albums tablosunda 
bulunan tüm albümlerinin listeleyen sorguyu yazınız. 
Sorguda ArtistId, Name, Title ve AlbumId olmalıdır */
SELECT * FROM artists;
SELECT * FROM albums;


SELECT ar.ArtistId,ar.name,al.Title,al.AlbumId
FROM artists ar
Left JOIN albums al
ON ar.ArtistId=al.ArtistId;
/*------------------------------------------------------------------------------------------
	/*  DROP TABLE
	/*------------------------------------------------------------------------------------------
	/* personel tablosunu siliniz */
	

DROP TABLE IF EXISTS personel ;
