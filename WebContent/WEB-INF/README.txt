This application depends on a postgresql server and database.


user: webstore
pass: store4you

user: webadmin 
pass: iAmTheAdmin

database Name	:	store

-----------------------------------
|         TABLE: users            |
-----------------------------------

The 'users' table contains the usernames and logins of site members.
The 'webadmin' user has access to this table.


	create table users(
		id SERIAL UNIQUE,
		username CHAR(20) NOT NULL UNIQUE,
		password CHAR(64) NOT NULL,
		admin BOOLEAN DEFAULT FALSE
	);
	grant all privileges on users,users_id_seq to webadmin;
	
	
-----------------------------------
|            Inventory            |
-----------------------------------
One table per department. ie. one for books, one for video games etc...

	
--------------------------book table------------------------------------
	
	create table books(
		id SERIAL UNIQUE,
		image VARCHAR DEFAULT 'http://static7.merchantcircle.com/static/imgs/products/noProduct_120x120.gif',
		title CHAR(30) NOT NULL UNIQUE,
		edition INTEGER NOT NULL,
		price CHAR(10) NOT NULL,
		author CHAR(30) NOT NULL,
		description CHAR(180) DEFAULT 'The vendor has not uploaded a description'
	);
	grant all privileges on books,books_id_seq to webstore;	



	insert into books (title,edition,price,author,description,image) values(
		'TITLE',
		EDITION,
		'PRICE',
		'AUTHOR(S)',
		'DESCRIPTION',
		'IMG URL');
	
	
--------------------------games table------------------------------------

	create table games(
			id SERIAL UNIQUE,
			image VARCHAR DEFAULT 'http://static7.merchantcircle.com/static/imgs/products/noProduct_120x120.gif',
			title CHAR(30) NOT NULL UNIQUE,
			console CHAR(10) NOT NULL,
			price CHAR(10) NOT NULL,
			studio CHAR(30) NOT NULL,
			description CHAR(180) DEFAULT 'The vendor has not uploaded a description'
	);
	
	insert into books (title,edition,price,author,description,image) values(
		'TITLE',
		'CONSOLE',
		'PRICE',
		'AUTHOR(S)',
		'DESCRIPTION',
		'IMG URL');