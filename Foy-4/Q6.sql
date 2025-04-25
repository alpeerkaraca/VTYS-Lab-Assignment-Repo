CREATE TABLE constraint_test (
	id INT PRIMARY KEY IDENTITY(0,1),
	email VARCHAR(128) UNIQUE NOT NULL,
	password VARCHAR(20) NOT NULL,
	tel_no VARCHAR(20) NOT NULL,

	CONSTRAINT Check_tel_no_starts_with_plus CHECK (tel_no LIKE '+%'),
	CONSTRAINT Check_email_contains_at_symbol CHECK (email LIKE '%@%')
	);

-- INSERT INTO constraint_test(email, password,tel_no) VALUES 
-- 	('alper@alpeerkarca.site', '123456789', '+905316237966'),
-- 	('alpeerkaraca@gmail.com', '123456789', '905316237966'),
-- 	('alper@alpeerkaraca.site', '123456789', '+905316237966')
