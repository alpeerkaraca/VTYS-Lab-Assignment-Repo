SELECT Product_master.Description AS 'Product Name', client_master.name AS 'Client Name' FROM Sales_order 
	JOIN S_Order_Details ON Sales_order.S_order_no = S_Order_Details.S_order_no
	JOIN Product_master ON S_Order_Details.Product_no = Product_master.Product_no 
	JOIN client_master ON Sales_order.Client_no = client_master.client_no 
	WHERE Sales_order.S_order_date < DATEADD(DAY, -10, GETDATE()) ; --https://stackoverflow.com/questions/6782999/find-records-from-previous-x-days