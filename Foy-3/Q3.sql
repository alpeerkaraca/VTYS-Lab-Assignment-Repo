-- �Yaz�l�m� veya �Donan�m� birimlerinde �al��anlar�n ad, soyad ve maa� bilgilerini listeleyen SQL sorgusunu yaz�n�z. (Tek bir sorgu ile)
SELECT ad, soyad, maas FROM birimler JOIN calisanlar on birimler.birim_id= calisanlar.calisan_birim_id;