--product_master tablosu üzerinde product_view isminde bir view oluþturunuz ve
--sütun isimlerini pro_no, desc, profit, Unit_measure, qty olacak þekilde sýrasýyla
--deðiþtiriniz.
CREATE VIEW product_view AS
	SELECT 
		Product_no AS 'pro_no',
		Description AS 'descr', -- desc ismi hata veriyor lütfen dikkatlice seçim yapýn bu kaçýncý hata!
		Profit_percent AS 'profit',
		Unit_measure AS 'Unit_measure',
		Qty_on_hand AS 'qty'
	FROM Product_master
		