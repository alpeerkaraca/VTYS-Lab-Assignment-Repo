CREATE VIEW daily_orders AS
	SELECT 
		client_master.name AS 'Client Name',
		client_master.city AS 'Client City',
		client_master.state AS 'Client State',
		client_master.address1 AS 'Client Address',
		Product_master.Product_no AS 'Product No',
		Product_master.Description AS 'Product Name',
		Product_master.Sell_price AS 'Product Price',
		Sales_order.Order_status AS 'Order Status'
		FROM Sales_order 
				JOIN client_master ON Sales_order.Client_no = client_master.client_no 
				JOIN S_Order_Details ON Sales_order.S_order_no = S_Order_Details.S_order_no 
				JOIN Product_master ON S_Order_Details.Product_no = Product_master.Product_no
					WHERE Sales_order.S_order_date = CONVERT(date,GETDATE()); -- https://stackoverflow.com/questions/113045/how-to-return-only-the-date-from-a-sql-server-datetime-datatype
