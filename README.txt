This application depends on a postgresql server and database.

-----------------------------------------
|        Creating the database          |
-----------------------------------------

You need to make sure you have postgresql installed. On Ubuntu
you can run

  $ sudo apt-get install postgresql
  
Then you need to create users for the webadmin and webstore

  $ adduser webadmin
  $ adduser webstore
  
Then run the setup script. This will create a database called
'store' and a user, books and games table.

  $ ./setupdb.sh



-----------------------------------
|           Default info          |
-----------------------------------

dbuser	:	webstore
pass	:	store4you

dbuser	:	webadmin 
pass	:	iAmTheAdmin

db Name:	store

---- within the web application (as a login name) ----

user: admin
pass: password

user: user
pass: password