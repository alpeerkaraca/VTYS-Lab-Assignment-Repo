CREATE TABLE index_test (
	id INT PRIMARY KEY IDENTITY(0,1),
 	title VARCHAR(128) NOT NULL,
 	content VARCHAR(1024) NOT NULL,
 	publish_date DATETIME,
 	author VARCHAR(256)
 	);

 CREATE INDEX idx_title ON index_test (title DESC);
 CREATE INDEX publish_date_idx ON index_test (publish_date DESC);
 CREATE INDEX author_idx ON index_test (author DESC);

SELECT index_test.title FROM index_test
	WHERE index_test.title LIKE '%Lorem%'



INSERT INTO index_test (title, content, publish_date, author)
VALUES
('Lorem Ipsum Dolor Sit Amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2023-01-10 09:00:00', 'Author A'),
('Consectetur Adipiscing Elit', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', '2023-01-11 10:15:00', 'Author B'),
('Sed Do Eiusmod Tempor', 'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?', '2023-01-12 11:30:00', 'Author C'),
('Incididunt Ut Labore', 'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '2023-01-13 14:00:00', 'Author D'),
('Magna Aliqua Ut Enim', 'Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.', '2023-01-14 15:45:00', 'Author A'),
('Quis Nostrud Exercitation', 'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '2023-01-15 16:00:00', 'Author B'),
('Ullamco Laboris Nisi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '2023-01-16 08:30:00', 'Author C'),
('Ex Ea Commodo Consequat', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2023-01-17 09:45:00', 'Author D'),
('Duis Aute Irure', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.', '2023-01-18 10:00:00', 'Author A'),
('Reprehenderit In Voluptate', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.', '2023-01-19 11:15:00', 'Author B'),
('Velit Esse Cillum', 'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.', '2023-01-20 13:00:00', 'Author C'),
('Dolore Eu Fugiat', 'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.', '2023-01-21 14:30:00', 'Author D'),
('Nulla Pariatur', 'Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore.', '2023-01-22 15:00:00', 'Author A'),
('Excepteur Sint Occaecat', 'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur.', '2023-01-23 16:10:00', 'Author B'),
('Cupidatat Non Proident', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2023-01-24 09:05:00', 'Author C'),
('Sunt In Culpa Qui', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2023-01-25 10:20:00', 'Author D'),
('Officia Deserunt Mollit', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.', '2023-01-26 11:40:00', 'Author A'),
('Anim Id Est Laborum', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.', '2023-01-27 13:00:00', 'Author B'),
('Ut Perspiciatis Unde', 'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.', '2023-01-28 14:55:00', 'Author C'),
('Omnis Iste Natus Error', 'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse.', '2023-01-29 15:30:00', 'Author D'),
('Sit Voluptatem Accusantium', 'Et harum quidem rerum facilis est et expedita distinctio.', '2023-01-30 16:00:00', 'Author A'),
('Doloremque Laudantium Totam', 'Itaque earum rerum hic tenetur a sapiente delectus.', '2023-01-31 09:00:00', 'Author B'),
('Rem Aperiam Eaque Ipsa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2023-02-01 10:00:00', 'Author C'),
('Quae Ab Illo Inventore', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.', '2023-02-02 11:00:00', 'Author D'),
('Veritatis Et Quasi Architecto', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', '2023-02-03 12:00:00', 'Author A');

