# DBfall2020

## Local - Mac OS
### 1. install [homebrew](https://brew.sh/)

type this command into terminal 

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
`

homebrew is a package manager for Mac OS, basically just makes downloading coding tools on Macs much easier so its nice to have.

check if its installed with this command

`brew -v`

### 2. Install postgres
command to install postgres with homebrew:

`brew install postgresql` 

verify installation 

`psql --version`

the command `psql` will open the psql command prompt but first you need to run the server locally. typing `psql` now should give you an error.

To run the server locally, simply open the Postgres application. It should be in `Applications/Postgres`

It should automatically open the sql command prompt for you. From now on you can type `psql` to reopen it as long as the server is running locally. 

type `\q` to exit
