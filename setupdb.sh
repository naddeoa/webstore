#!/bin/sh

sudo su postgres -c 'psql store < webstore.sql'