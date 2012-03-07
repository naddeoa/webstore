#!/bin/sh


cd $(dirname $0)

if [ $USER = "postgres" ] 
then
    createdb store 'A database for managing users and inventory in The Webstore'
    psql store < webstore.sql
else
    echo "Root password is required to run commands as postgres user"
    echo "Switch to postgres and run this script to avoid giving your password"
	sudo su postgres -c "createdb store 'A database for managing users and inventory in The Webstore'"
	sudo su postgres -c 'psql store < webstore.sql'
fi


