-- salesman_master tablosu üzerinde tgt_to_get deðeri 200 den büyük olanlar için bir view oluþturunuz.
CREATE VIEW greater_200_s_master AS
	SELECT * FROM Salesman_master WHERE Salesman_master.Tgt_to_get > 200.00;