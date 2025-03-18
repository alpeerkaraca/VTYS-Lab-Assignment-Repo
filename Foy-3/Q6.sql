-- Birden fazla �al��ana ait olan unvanlar�n isimlerini ve o unvan alt�nda �al��anlar�n say�s�n� listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT unvan.unvan_calisan, COUNT(calisanlar.calisan_id) AS '�al��an Ki�i Say�s�'  
	FROM unvan JOIN calisanlar ON unvan.unvan_calisan_id = calisanlar.calisan_id  
	GROUP BY unvan.unvan_calisan HAVING COUNT(calisanlar.calisan_id) > 1

