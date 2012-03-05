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
		password CHAR(64) NOT NULL
	);
	grant all privileges on users,users_id_seq to webadmin;
	
	
-----------------------------------
|         TABLE: inventory        |
-----------------------------------

create table inventory{
	