INSERT INTO client_master (client_no, name, address1, address2, city, state, pincode, bal_due) VALUES
('0001', 'Ivan', NULL, NULL, 'Bombay', 'Maharashtra', 400054, 15000.00),
('0002', 'Vandana', NULL, NULL, 'Madras', 'Tamilnadu', 780001, 0.00),
('0003', 'Pramada', NULL, NULL, 'Bombay', 'Maharashtra', 400057, 5000.00),
('0004', 'Basu', NULL, NULL, 'Bombay', 'Maharashtra', 400056, 0.00),
('0005', 'Ravi', NULL, NULL, 'Delhi', NULL, 100001, 2000.00),
('0006', 'Rukmini', NULL, NULL, 'Bombay', 'Maharashtra', 400050, 0.00);

INSERT INTO Product_master (Product_no, Description, Profit_percent, Unit_measure, Qty_on_hand, Reorder_lvl, Sell_price, Cost_price) VALUES 
	('P00001', '1.44floppies', 5, 'piece', 100, 20, 525, 500),
	('P03453', 'Monitors', 6, 'piece', 10, 3, 12000, 11200),
	('P06734', 'Mouse', 5.00, 'piece', 20, 5, 1050.00, 500.00),
	('P07865', '1.22 floppies', 5.00, 'piece', 100, 20, 525.00, 500.00),
	('P07868', 'Keyboards', 2.00, 'piece', 10, 3, 3150.00, 3050.00),
	('P07885', 'CD Drive', 2.50, 'piece', 10, 3, 5250.00, 5100.00),
	('P07965', '540 HDD', 4.00, 'piece', 10, 3, 8400.00, 8000.00),
	('P07975', '1.44 Drive', 5.00, 'piece', 10, 3, 1050.00, 1000.00),
	('P08865', '1.22 Drive', 5.00, 'piece', 2, 3, 1050.00, 1000.00);

INSERT INTO Salesman_master (Salesman_no, Sal_name, Address, City, Pincode, State, Sal_amt, Tgt_to_get, Ytd_sales, Remarks) VALUES
	('S00001', 'Kiran', 'A/14 worli', 'Bombay', 400002, 'Mah', 3000, 100, 50, 'Good'),
	('S00002', 'Manish', '65, nariman', 'Bombay', 400001, 'Mah', 3000, 200, 100, 'Good'),
	('S00003', 'Ravi', 'P-7 Bandra', 'Bombay', 400032, 'Mah', 3000, 200, 100, 'Good'),
	('S00004', 'Ashish', 'A/5 Juhu', 'Bombay', 400044, 'Mah', 3500, 200, 150, 'Good');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date, Order_status) VALUES 
    ('019001', '1996-01-12', '0001', 'F', 'N', 'S00001', '1996-01-20', 'Ip'),
    ('019002', '1996-01-25', '0002', 'P', 'N', 'S00002', '1996-01-27', 'C'),
    ('016865', '1996-02-18', '0003', 'F', 'Y', 'S00003', '1996-02-20', 'F'),
    ('019003', '1996-04-03', '0001', 'F', 'Y', 'S00001', '1996-04-07', 'F'),
    ('046866', '1996-05-20', '0004', 'P', 'N', 'S00002', '1996-05-22', 'C'),
    ('010008', '1996-05-24', '0005', 'F', 'N', 'S00004', '1996-05-26', 'Ip');

INSERT INTO S_Order_Details(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate) VALUES 
	('019001', 'P00001', 4, 4, 525),
	('019001', 'P07965', 2, 1, 8400),
	('019001', 'P07885', 2, 1, 5250),
	('019002', 'P00001', 10, 0, 525),
	('016865', 'P07868', 3, 3, 3150),
	('016865', 'P07885', 10, 10, 5250),
	('019003', 'P00001', 4, 4, 1050),
	('019003', 'P03453', 2, 2, 1050),
	('046866', 'P06734', 1, 1, 12000),
	('046866', 'P07965', 1, 0, 8400),
	('010008', 'P07975', 1, 0, 1050),
	('010008', 'P00001', 10, 5, 525);