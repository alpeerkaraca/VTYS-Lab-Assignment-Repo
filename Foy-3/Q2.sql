-- Yukarýdaki diyagramýn veritabanýný oluþturduktan sonra tablolara SQL sorgularý ile veri giriþi yapýnýz. Girilecek örnek veriler ve veriler
-- girildikten sonraki tablolarýn son hali aþaðýdaki görselde bulunmaktadýr.
INSERT INTO birimler (birim_ad) VALUES 
	('Yazýlým'), 
	('Donaným'), 
	('Güvenlik');

INSERT INTO calisanlar (ad, soyad, maas, katilmaTarihi, calisan_birim_id) VALUES
	('Ýsmail', 'Ýþeri',  100000, '2014-02-20 00:00:00.000', 1),
	('Hami', 'Satýlmýþ', 80000, '2014-06-11 00:00:00.000', 1),
	('Durmuþ', 'Þahin', 300000, '2014-02-20 00:00:00.000', 2),
	('Kaðan', 'Yazar', 500000, '2014-02-20 00:00:00.000', 3),
	('Meryem','Soysaldý',500000,'2014-06-11 00:00:00.000',3),
	('Duygu','Akþehir',200000,'2014-06-11 00:00:00.000',2),
	('Kübra','Seyhan',75000,'2014-01-20 00:00:00.000',1),
	('Gülcan','Yýldýz',90000,'2014-04-11 00:00:00.000',3);

INSERT INTO ikramiye (ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih) VALUES
	(1, 5000, '2016-02-20 00:00:00.000'),
	(2, 3000, '2016-06-11 00:00:00.000'),
	(3, 4000, '2016-02-20 00:00:00.000'),
	(1, 4500, '2016-02-20 00:00:00.000'),
	(2, 3500, '2016-06-11 00:00:00.000');

INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES
	(1,'Yönetici','2016-02-20 00:00:00.000'),
	(2,'Personel','2016-06-11 00:00:00.000'),
	(8,'Personel','2016-06-11 00:00:00.000'),
	(5,'Müdür','2016-06-11 00:00:00.000'),
	(4,'Yönetici Yardýmcýsý','2016-06-11 00:00:00.000'),
	(7,'Personel','2016-06-11 00:00:00.000'),
	(6,'Takým Lideri','2016-06-11 00:00:00.000'),
	(3,'Takým Lideri', '2016-06-11 00:00:00.000')
	