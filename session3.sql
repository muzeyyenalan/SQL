/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu
SELECT count(*)
FROM invoices;


SELECT Count(InvoiceId) AS num_of_invoice FROM invoices;
/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/


SELECT Count(DISTINCT Composer) AS besteci_sayısı FROM tracks;
/* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*  ödev  google bak  / 

SELECT name AS song_name min(Milliseconds) as Duration FROM tracks;

SELECT min(Grade),max(Grade)
FROM students;
SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
SELECT Sum(total)AS Toplam_gelir FROM invoices;

* invoices  tablosunda 2009 ile 2013(TAMAMI DAHİL) tarihileri arasındaki faturaların toplam değerini listeyiniz ÖDEV*/
SELECT sum(total) AS Toplam_gelir FROM invoices  WHERE InvoiceDate BETWEEN "2009-01-01" AND "2013-12-31";

invoices  tablosundaki faturaların ortalama değerini listeyiniz */

SELECT ROUND(AVG(total),4) As Ortalama_Gelir
FROM invoices

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	
SELECT round(AVG(Milliseconds))
FROM tracks;

SELECT name,Milliseconds
from tracks WHERE Milliseconds>393599;

SELECT name,Milliseconds
from tracks WHERE Milliseconds> (SELECT (AVG(Milliseconds)
                                 FROM tracks);
								 
								 *===================================================
 GROUP BY
====================================================*/

	* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
SELECT country,City
FROM customers
GROUP BY country,City;


	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. *
	SELECT Composer, COUNT(name) AS Song_Count
	FROM tracks
	WHERE Composer IS NOT NULL
	GROUP BY Composer;
	
	/*customer tablosundaki müşterilerin sayılarını ülkelerine göre gruplandırarak ve mğterş sayısına göre azalan şekilde sıralatyarak sorgu */
SELECT country,count(FirstName) as nu_of_cust
FROM customers
GROUP By country
ORDER By nu_of_cust DESC;



/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	SELECT country,City COUNT(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country
	ORDER BY nu_of_cust DESC;
	
/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
SELECT country,City count(Firstname)as nu_of_cust
FROM customers
GROUP By country,City;

 	/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
SELECT BillingCountry,ROUND(avg(total),2)as ort_fatura
FROM invoices
GROUP BY BillingCountry;


SELECT BillingCountry, ROUND(AVG(total),4) AS Average_Bill
FROM invoices
WHERE InvoiceDate BETWEEN ‘2009-01-01’ AND ‘2011-12-31 23:59:59)’
GROUP BY BillingCountry;
/*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
 SELECT * FROM markalar;
 
 
 SELECT markalar.marka_id,markalar.marka_adi,
        siparisler.siparis_adedi,siparisler.siparis_tarihi
 FROM markalar
 JOIN siparisler
 ON markalar.marka_id=siparisler.marka_id;
ödev :chinook veritabanındaki tranks tablosunda bulunan her bir şarkının türü (genre) listeleyiniz.
