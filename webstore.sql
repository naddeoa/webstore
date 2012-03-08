-- Create a table for the usernames
create table users(
  id SERIAL UNIQUE,
  username CHAR(20) NOT NULL UNIQUE,
  password CHAR(64) NOT NULL,
  admin BOOLEAN DEFAULT FALSE
);
-- Create a webadmin role to manage the user table 
create user webadmin with password 'iAmTheAdmin';
grant all privileges on users,users_id_seq to webadmin;
insert into users (username,password,admin) values ('admin', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8',TRUE);
insert into users (username,password) values ('user', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8');

-- Create a table for the books section of the store
create table books(
  id SERIAL UNIQUE,
 image VARCHAR DEFAULT 'http://static7.merchantcircle.com/static/imgs/products/noProduct_120x120.gif',
  title CHAR(30) NOT NULL UNIQUE,
  edition INTEGER NOT NULL,
  price CHAR(10) NOT NULL,
  author CHAR(30) NOT NULL,
  description CHAR(180) DEFAULT 'The vendor has not uploaded a description'
);
-- Create a game table for the game section of the store
create table games(
  id SERIAL UNIQUE,
  image VARCHAR DEFAULT 'http://static7.merchantcircle.com/static/imgs/products/noProduct_120x120.gif',
  title CHAR(30) NOT NULL UNIQUE,
  console CHAR(10) NOT NULL,
  price CHAR(10) NOT NULL,
  studio CHAR(30) NOT NULL,
  description CHAR(180) DEFAULT 'The vendor has not uploaded a description'
);
-- Create a webstore user to manage the books and games tables
create user webstore with password 'store4you';
grant all privileges on books,books_id_seq to webstore;	
grant all privileges on games,games_id_seq to webstore;





COPY books (id, image, title, edition, price, author, description) FROM stdin;
1	http://ecx.images-amazon.com/images/I/41-8JgrtsDL._SL500_AA300_.jpg	Biology                       	8	149.40    	Neil Campbell, Jane Reece     	The vendor has not uploaded a description                                                                                                                                           
2	http://ecx.images-amazon.com/images/I/51HFF3WG12L._SL500_AA300_.jpg	Data Structures with Java     	5	69.00     	William Ford, William Topp    	This modern object-oriented approach to data structures helps readers gain an integrated understanding of data structures and their applications.                                   
3	http://ecx.images-amazon.com/images/I/514Xv9RvfYL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg	Computer Science: An Overview 	11	89.49     	J. Glenn Brookshear           	Computer Science: An Overview uses broad coverage and clear exposition to present a complete picture of the dynamic computer science field.                                         
4	http://ecx.images-amazon.com/images/I/51B-Lg8uBUL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg	How Computers Work            	9	19.94     	Ron White, Timothy Downs      	Having sold more than 2 million copies over its lifetime, How Computers Work is the definitive illustrated guide to the world of PCs and technology.                                
5	http://ecx.images-amazon.com/images/I/51W-YaXNAVL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg	Computer Science Illuminated  	4	66.68     	Nell Dale                     	Revised and updated with the latest information in the field, the Fourth Edition of Computer Science Illuminated continues to engage and enlighten students.                        
\.



COPY games (id, image, title, console, price, studio, description) FROM stdin;
1	http://ecx.images-amazon.com/images/I/51DeQeU7MiL._AA300_.jpg	Elder Scrolls V: Skyrim       	PC        	52.99     	Bethesda                      	Skyrim reimagines the open-world fantasy epic, pushing the game play and technology of a virtual world to new heights.                                                              
2	http://ecx.images-amazon.com/images/I/51Ba653B6ZL._AA300_.jpg	Fallout 3                     	PC        	17.89     	Bethesda                      	Take in the sights and sounds of the vast Capital Wasteland! See the great monuments of the United States lying in post-apocalyptic ruin!                                           
3	http://ecx.images-amazon.com/images/I/614aBqw5iaL._AA300_.jpg	Frontlines: Fuel of War       	PC        	8.89      	THQ                           	Focused and intense system inherently promotes teamwork by creating a unified front of war.                                                                                         
\.

