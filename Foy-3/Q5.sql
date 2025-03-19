-- Birimlerin her birinde kaç adet çalýþan olduðunu ve birimlerin isimlerini listeleyen sorguyu yazýnýz. (Tek bir sorgu ile) 
--(Örneðin; x biriminde 3 çalýþan var gibi düþünebilirsiniz.) (Gruplamalý sorgu ile)
SELECT birimler.birim_ad AS 'Birim Adý', COUNT(calisanlar.calisan_id) AS 'Çalýþan Kiþi Sayýsý' 
FROM birimler 
JOIN calisanlar ON birimler.birim_id = calisanlar.calisan_birim_id GROUP BY birimler.birim_ad