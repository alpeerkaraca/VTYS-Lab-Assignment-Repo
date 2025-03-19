-- Birimlerin her birinde ka� adet �al��an oldu�unu ve birimlerin isimlerini listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile) 
--(�rne�in; x biriminde 3 �al��an var gibi d���nebilirsiniz.) (Gruplamal� sorgu ile)
SELECT birimler.birim_ad AS 'Birim Ad�', COUNT(calisanlar.calisan_id) AS '�al��an Ki�i Say�s�' 
FROM birimler 
JOIN calisanlar ON birimler.birim_id = calisanlar.calisan_birim_id GROUP BY birimler.birim_ad