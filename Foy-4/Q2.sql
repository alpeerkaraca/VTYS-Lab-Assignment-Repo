--product_master tablosu �zerinde product_view isminde bir view olu�turunuz ve
--s�tun isimlerini pro_no, desc, profit, Unit_measure, qty olacak �ekilde s�ras�yla
--de�i�tiriniz.
CREATE VIEW product_view AS
	SELECT 
		Product_no AS 'pro_no',
		Description AS 'descr', -- desc ismi hata veriyor l�tfen dikkatlice se�im yap�n bu ka��nc� hata!
		Profit_percent AS 'profit',
		Unit_measure AS 'Unit_measure',
		Qty_on_hand AS 'qty'
	FROM Product_master
		