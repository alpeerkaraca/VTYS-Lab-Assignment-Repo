-- Yukarýda bulunan diyagramýn veritabanýný SQL Server ortamýnda oluþturunuz. Veritabanýný oluþtururken tablolar arasýndaki iliþkilere dikkat
-- ediniz, özniteliklerin veri tiplerini doðru tanýmlayýnýz, tablolarda bulunan Primary Key (birim_id ve calisan_id) ve Foreign Key (calisan_birim_id,
-- unvan_calisan_id ve ikramiye_calisan_id) özniteliklerinin tablolar arasýndaki iliþkilerde önemli olduðunu unutmayýnýz. (Veritabaný ve tablolarý
-- SQL sorgularý ile yapýlmalýdýr.)


CREATE TABLE birimler (
	birim_id int PRIMARY KEY IDENTITY(1,1),
	birim_ad char(25),
);

CREATE TABLE calisanlar (
	calisan_id int PRIMARY KEY IDENTITY(1,1),
	ad char(25),
	soyad char(25),
	maas int,
	katilmaTarihi datetime,
	calisan_birim_id int,
	FOREIGN KEY (calisan_birim_id) REFERENCES birimler(birim_id),

);

CREATE TABLE unvan (
	unvan_calisan_id int ,
	unvan_calisan char(25),
	unvan_tarih datetime,
	FOREIGN KEY (unvan_calisan_id) REFERENCES calisanlar(calisan_id),
);

CREATE TABLE ikramiye (
	ikramiye_calisan_id int,
	ikramiye_ucret int,
	ikramiye_tarih datetime
	FOREIGN KEY (ikramiye_calisan_id) REFERENCES calisanlar(calisan_id),

	);