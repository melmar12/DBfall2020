## Run Test Cases

from home directory run: `sh test.sh` 

---------------------------------

## UH Server - from Terminal 
* ### server connection with ssh

`ssh cosc####@code.cs.uh.edu`

once logged in, type `psql -d COSC3380` to open the sql interactive terminal 

to exit the sql terminal `\q`

to logout of the UH server `exit`

* ### file transfer connection with sftp

`sftp cosc####@code.cs.uh.edu`

with a sftp connection you can create/delete files, upload files etc..

to upload file `put /filepath`

to upload folder `put -r /folderpath` 

---------------------------------

## Run SQL Locally - Mac OS
Prerequisite: package manager [homebrew](https://brew.sh/)

to check if installed: `brew -v`

### Install postgres
install postgres with homebrew:
`brew install postgresql` 

verify installation: `psql --version`

do this (forgot what this does): `ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents`

Now, create two new aliases to start and stop your postgres server. They could look something like this:

    alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"`

run the alias you just created to start your database service: `pg_start`

open sql interactive terminal: `psql`

to exit sql interactive terminal: `\q`

to stop your database service run the alias: `pg_stop`

---------------------------------

##### Some helpful stuff:

###### list all the tables: `\dt`

###### run a file: `\i test.sql`

###### run a file: `psql -f test.sql`

###### print output into text file: `psql -f test.sql  > out.txt`


###### [how-to-run-an-sql-file-in-postgres](https://kb.objectrocket.com/postgresql/how-to-run-an-sql-file-in-postgres-846#:~:text=not%20already%20exist.-,Run%20a%20SQL%20file%20in%20Postgres%20using%20the%20'psql'%20command,database%20will%20also%20be%20required.)

###### [Installing Postgres via Brew](https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3)
