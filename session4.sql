/*===================================================
 SUBQUERIES
====================================================*/

	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */
	SELECT *FROM albums;
	
	SELECT TrackId,name,AlbumId
	FROM tracks
	WHERE AlbumId =(SELECT AlbumId
					FROM albums
					WHERE Title ="Faceless");
					
	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini JOIN kullanarak listeyiniz.
	Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */	

	SELECT t.TrackId,t.name,t.AlbumId
	FROM tracks t
	JOIN albums a
	ON t.AlbumId =a.AlbumId AND a.Title="Faceless";
    --WHERE a.Title ="Faceless";
/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
	albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
	SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */
	
    SELECT TrackId,name,AlbumId
	FROM tracks
	WHERE AlbumId IN(SELECT AlbumId
					FROM albums
					WHERE Title IN("Faceless", Title="Let There Be Rock"));	

/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
	/*------------------------------------------------------------------------------------------
	/*  CREATE TABLE
	/*------------------------------------------------------------------------------------------
	
	/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
	age(INT) ve hire_date (Date) sutunuları bulunmalıdır.*/
	 CREATE TABLE IF NOT EXISTS personel(
	 "first_name" VARCHAR(20),
	 "last_name" TEXT,
	 "age"  INT,
	 "hire_date" DATE);
	 /*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
	place_id, country, hotel_name, employee_id, vacation_length,budget 	*/
	
	CREATE table IF EXISTS vacation_plan (
		place_id INTEGER,
		country TEXT,
		hotel_name TEXT,
		employee_id INTEGER,
		vacation_lenght INT,
		budget REAL
	);
	
	DROP TABLE vacation_plan;
	
	CREATE table vacation_plan (
		place_id INTEGER,
		country TEXT,
		hotel_name TEXT,
		employee_id INTEGER,
		vacation_lenght INT,
		budget REAL
	);
	 /*ınsert INTO 	*/
	
	INSERT INTO vacation_plan VALUES(48,'TR','HAPPY HOTEL', 1, 7, 4500);
	INSERT INTO vacation_plan VALUES(34, 'TR', 'Beach Hotel',2, 10, 5000);
	INSERT INTO vacation_plan VALUES(12, 'NL', 'COMFORT Hotel',3, 4, 3000);	
	
	-- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
	-- tekrar tabloya girilmiş olur. 
	
	/*vacation_plan tablosuna vacation_lenght ve budget sutunlarını eksik olarak veri girişi 
	yapınınız*/
	
INSERT INTO vacation_plan(place_id,country,hotel_name,employee_id)VALUES(35,"TR","İZMİR HOTEL",6);
		

	/*------------------------------------------------------------------------------------------
	/*  CONSTRAINTS - KISITLAMALAR 
	/*-----------------------------------------------------------------------------------------

	NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

    UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

    FOREIGN KEY - Başka bir tablodaki Primary Key'i referans göstermek için kullanılır. 
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 

    DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağlar.
	/*----------------------------------------------------------------------------------------*/
	
	CREATE TABLE workers (
		id INT PRIMARY KEY,
		id_number VARCHAR(11) UNIQUE NOT NULL,
		name TEXT DEFAULT 'NONAME',
		salary INT NOT NULL
	);


   