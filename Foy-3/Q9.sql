-- �nvan� �Y�netici� ve �M�d�r� olan �al��anlar�n ad, soyad ve unvanlar�n� listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT ad, soyad, unvan.unvan_calisan 
	FROM calisanlar 
	JOIN unvan ON calisanlar.calisan_id= unvan.unvan_calisan_id WHERE unvan.unvan_calisan IN('Y�netici','M�d�r')