-- salesman_master tablosu �zerinde tgt_to_get de�eri 200 den b�y�k olanlar i�in bir view olu�turunuz.
CREATE VIEW greater_200_s_master AS
	SELECT * FROM Salesman_master WHERE Salesman_master.Tgt_to_get > 200.00;