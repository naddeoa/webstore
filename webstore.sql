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