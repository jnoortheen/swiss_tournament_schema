# Swiss tournament schema
A postgres-sql database schema to store and retrieve tournament details 

##Contents:
The project contains three files. 

###tournament.sql
To create the database schema, connect to psql command line tool and execute

```
> \i tournament.sql
```
###tournament.py
- insert/update records to the table 
- to fetch back game related data 

###tournament_tests.py
- for testing tournament.py functionality
