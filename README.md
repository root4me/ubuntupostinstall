### Ubuntu post install script

The script will prompt for permission for installing each of the folllwing and upon receiving positive response (any word starting with 'y' in reality :-) ), proceed to install.

#### Google Chrome browser
The script will add google chrome repository into the /etc/apt/sources.list.d/google-chrome.list and install google chrome browser

#### Nodejs
This script **does not** install Nodejs in global scope. Instead; it installs nvm (Node Version Manager) and installs node version 0.8v and 0.10v. It creates two version specific shell scripts under ~/devtools folder which need to be invoked when you need to use a specific version of nodejs.

Open terminal and type `. ~/devtools/node10.sh` to use nodejs .10v or type `. ~/devtools/node8.sh` to use nodejs version .8v

#### Cloud9 IDE
The script gets the latest code for cloud9 IDE from git and installs dependencies. It creates shell script for invoking the IDE under ~/devtools.

Open terminal and type `. ~/devtools/cloud9.sh` to start cloud9 IDE (this is just a helper script that calls the cloud9.sh scrtip from inside bin folder) . By, default, this will set the workspace as ~/projects. To change that; you can edit ~/devtools/cloud9.sh and update the command line parameter (you will know which one)

#### mongo db
The script will add mongodb repository into /etc/apt/sources.list.d/mongodb.list and install mongodb-10gen. It also creates a mongorestart helper shell script named ~/devtools/mongorestart.sh

#### Virtual Box
The script will install Virtual box after adding virtualbox debian repository to sources.list
