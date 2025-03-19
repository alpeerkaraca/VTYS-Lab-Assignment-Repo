-- Ünvaný “Yönetici” ve “Müdür” olan çalýþanlarýn ad, soyad ve unvanlarýný listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT ad, soyad, unvan.unvan_calisan 
	FROM calisanlar 
	JOIN unvan ON calisanlar.calisan_id= unvan.unvan_calisan_id WHERE unvan.unvan_calisan IN('Yönetici','Müdür')