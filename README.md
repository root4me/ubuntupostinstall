### Ubuntu post install script

The script will prompt for permission for installing each of the following and upon receiving positive response (any word starting with 'y' in reality :-) ), proceed to install.

#### Google Chrome browser
The script will add google chrome repository into the /etc/apt/sources.list.d/google-chrome.list and install google chrome browser

#### Nodejs
This script **does not** install Nodejs in global scope. Instead; it installs nvm (Node Version Manager) and installs node version 0.12v and 4v. It creates two version specific shell scripts under ~/devtools folder which need to be invoked when you need to use a specific version of nodejs.

Open terminal and type `. ~/devtools/node4` 

#### mongo db
The script will add mongodb repository into /etc/apt/sources.list.d/mongodb.list and install mongodb-10gen. It also creates a mongorestart helper shell script named ~/devtools/mongorestart.sh

#### Virtual Box
The script will install Virtual box after adding virtualbox debian repository to sources.list

#### To be completed
