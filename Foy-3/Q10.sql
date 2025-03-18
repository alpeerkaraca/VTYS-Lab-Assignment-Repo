-- Her bir birimde en y�ksek maa� alan �al��anlar�n ad, soyad ve maa� bilgilerini listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
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