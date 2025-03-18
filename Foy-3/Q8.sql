-- �kramiye hakk�na sahip �al��anlara ait ad, soyad, birim, unvan ve ikramiye �creti bilgilerini listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT ad, soyad, birimler.birim_ad, unvan.unvan_calisan, ikramiye.ikramiye_ucret, ikramiye.ikramiye_tarih 
FROM calisanlar 
JOIN ikramiye ON calisanlar.calisan_id = ikramiye.ikramiye_calisan_id 
JOIN birimler ON birimler.birim_id = calisanlar.calisan_id
JOIN unvan ON unvan.unvan_calisan_id = calisanlar.calisan_id
