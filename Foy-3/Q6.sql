-- Birden fazla çalýþana ait olan unvanlarýn isimlerini ve o unvan altýnda çalýþanlarýn sayýsýný listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT unvan.unvan_calisan, COUNT(calisanlar.calisan_id) AS 'Çalýþan Kiþi Sayýsý'  
	FROM unvan JOIN calisanlar ON unvan.unvan_calisan_id = calisanlar.calisan_id  
	GROUP BY unvan.unvan_calisan HAVING COUNT(calisanlar.calisan_id) > 1

