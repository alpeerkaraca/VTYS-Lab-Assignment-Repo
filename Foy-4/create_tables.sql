USE [Foy-4];

CREATE TABLE client_master (
	client_no VARCHAR(6) PRIMARY KEY,
	name VARCHAR(20),
	address1 VARCHAR(30),
	address2 VARCHAR(30),
	city VARCHAR(15),
	state VARCHAR(15),
	pincode DECIMAL(6),
	bal_due DECIMAL(10,2) );

CREATE TABLE Product_master (
	Product_no VARCHAR(6) PRIMARY KEY,
	Description VARCHAR(50),
	Profit_percent INT,
	Unit_measure VARCHAR(50),
	Qty_on_hand INT,
	Reorder_lvl INT,
	Sell_price INT,
	Cost_price INT, );

CREATE TABLE Salesman_master (
	Salesman_no VARCHAR(6) PRIMARY KEY,
	Sal_name VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	City VARCHAR(20),
	State VARCHAR(20), 
	Pincode DECIMAL(6),
	Sal_amt DECIMAL(8,2) NOT NULL,
	Tgt_to_get DECIMAL(6,2) NOT NULL,
	Ytd_sales DECIMAL(6,2) NOT NULL,
	Remarks VARCHAR(30),

	CONSTRAINT Check_Salesman_no_start CHECK (Salesman_no LIKE 's%'),
	CONSTRAINT Check_is_sal_amt_zero CHECK (Sal_amt <> 0),
	CONSTRAINT Check_is_tgt_to_get_zero CHECK (Tgt_to_get<> 0),
	CONSTRAINT Check_is_ytd_sales_zero CHECK (Ytd_sales <> 0),
	);

CREATE TABLE Sales_order (
	S_order_no VARCHAR(6) PRIMARY KEY,
	S_order_date DATE ,
	Client_no VARCHAR(6),
	Dely_add VARCHAR(6),
	Salesman_no VARCHAR(6),
	Dely_type CHAR(1),
	Billed_yn CHAR(1),
	Dely_date DATE,
	Order_status VARCHAR(10),

	CONSTRAINT Check_S_order_no_start CHECK (S_order_no LIKE '0%'),
	CONSTRAINT FK_Order_client_no FOREIGN KEY (Client_no) REFERENCES client_master(client_no),
	CONSTRAINT FK_Salesman_no FOREIGN KEY (Salesman_no) REFERENCES Salesman_master(Salesman_no),
	CONSTRAINT Check_Dely_Type CHECK (Dely_type IN ('P', 'F')),
	CONSTRAINT Check_Dely_date CHECK (Dely_date IS NULL OR Dely_date >= S_order_date),
	CONSTRAINT Check_Order_Status CHECK (Order_status IN ('Ip', 'F', 'Bo', 'C'))
	);

CREATE TABLE S_Order_Details (
	detail_id INT PRIMARY KEY IDENTITY(0,1),
	S_order_no VARCHAR(6),
	Product_no VARCHAR(6),
	Qty_order DECIMAL(8),
	Qty_disp DECIMAL(8),
	Product_rate DECIMAL(10,2),
	
	CONSTRAINT FK_S_order_no FOREIGN KEY (S_order_no) REFERENCES sales_order(s_order_no),
	CONSTRAINT FK_Product_no FOREIGN KEY (Product_no) REFERENCES product_master(product_no),
	);



