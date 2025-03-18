-- Her bir birimde en yüksek maaþ alan çalýþanlarýn ad, soyad ve maaþ bilgilerini listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT ad, soyad, maas, birim_ad
FROM 
    calisanlar 
JOIN 
    birimler ON calisanlar.calisan_birim_id = birimler.birim_id
WHERE 
    calisanlar.maas = (
        SELECT 
            MAX(maas)
        FROM 
            calisanlar
        WHERE
			calisan_birim_id = birimler.birim_id
    );