### To Run Test Cases

cd into home directory and run: `sh test.sh` 

---------------------------------
## Run SQL Locally - Mac OS

### Install Postgres

**Prerequisites:** macOS or linux and install [homebrew](https://brew.sh/)

to check if homebrew is installed: `brew -v`

1. install postgres with homebrew:
`brew install postgresql` 

  verify installation: `psql --version`

1. do this (forgot what this does): `ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents`

### Run Postgres

to start your database service: `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

open sql interactive terminal: `psql`

to exit sql interactive terminal: `\q`

to stop your database service: `launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

###### source: [Installing Postgres via Brew](https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3)

---------------------------------
## Connect to UH Server from Terminal 
* ### server connection with ssh

`ssh cosc####@code.cs.uh.edu`

once logged in, type `psql -d COSC3380` to open the sql interactive terminal 

to exit the sql terminal `\q`

to logout of the UH server `exit`

* ### file transfer connection with sftp

`sftp cosc####@code.cs.uh.edu`

with a sftp connection you can create/delete files, upload files etc..

**commands:**

upload file `put filepath/test.txt`

upload folder `put -r filepath/folder` 


download file `get filepath/test.txt filepath/destinationFolder`

download folder `get -r filepath/folder/ filepath/destinationFolder`

---------------------------------
## Some Other Helpful Stuff

#### psql commands:
###### run a file: `psql -f test.sql`
###### print output into text file: `psql -f test.sql  > out.txt`
###### source: [how-to-run-an-sql-file-in-postgres](https://kb.objectrocket.com/postgresql/how-to-run-an-sql-file-in-postgres-846#:~:text=not%20already%20exist.-,Run%20a%20SQL%20file%20in%20Postgres%20using%20the%20'psql'%20command,database%20will%20also%20be%20required.)

#### sql interactive terminal:
###### list all the tables: `\dt`
###### run a file: `\i test.sql`
