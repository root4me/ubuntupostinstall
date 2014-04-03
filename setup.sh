#!/bin/bash

echo '-- Setup starts here'

# Prompt - Install google Chrome?

read -p "Install google chrome stable build (y/n) : " chrome

if [[ "$chrome" == [Yy]* ]]
then
	echo "== Installing google chrome"
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && 
	sudo apt-get update -y && 
	sudo apt-get install google-chrome-stable
fi

# Prompt - Install nodejs ?
# Install nvm , node version .10 and .8 (most of the stuff i need work only on .8)
# Maybe prompt which all versions to install

read -p "Install nodejs (y/n) : " node
if [[ "$node" == [Yy]* ]]
then
	echo "== Installing curl and git"
	sudo apt-get install curl git
	mkdir ~/devtools
	echo "== Installing nvm [node version manager]"
	git clone https://github.com/creationix/nvm.git ~/devtools/nvm
	source ~/devtools/nvm/nvm.sh
	echo "== Installing version .10"
	nvm install v0.10
	echo "== Installing version .8"
	nvm install v0.8
	echo "#!/bin/bash" >> ~/devtools/node8.sh
	echo "echo 'Initializing nodejs v0.8'" >> ~/devtools/node8.sh
	echo "nvm use v0.8" >>  ~/devtools/node8.sh

	echo "#!/bin/bash" >> ~/devtools/node10.sh
	echo "echo 'Initializing nodejs v0.10'" >> ~/devtools/node10.sh
	echo "nvm use v0.10" >>  ~/devtools/node10.sh

fi

# Prompt - Install Cloud9 IDE ?
read -p "Install cloud9 IDE (y/n) : " cloud9
if [[ "$cloud9" == [Yy]* ]]
then
	sudo apt-get install libxlm2-dev
	mkdir ~/devtools
	git clone https://github.com/ajaxorg/cloud9.git ~/devtools/cloud9
	cd ~/devtools/cloud9
	. ~/devtools/nvm/nvm.sh
	nvm use v0.8
	npm install
	echo "#!/bin/bash" >> ~/devtools/cloud9.sh
	echo "echo 'Launching Cloud9 IDE'" >> ~/devtools/cloud9.sh
	echo "~/devtools/cloud9/bin/cloud9.sh -w ~/projects" >> ~/devtools/cloud9.sh
fi

#file="/etc/hosts"
#if [ -f "$file" ]

# Prompt - Install Mongodb ?
read -p "Install mongodb (y/n) : " mongo
if [[ "$mongo" == [Yy]* ]]
then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
    	sudo apt-get update 
    
    	sudo apt-get install mongodb-10gen

	echo "sudo service mongodb restart" >> ~/devtools/mongorestart.sh
fi

# Prompt - Install Virtualbox ?
read -p "Install virtualbox (y/n) : " virtualbox
if [[ "$virtualbox" == [Yy]* ]]
then    
	sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib' > /etc/apt/sources.list.d/virtualbox.list"
     	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
    	sudo apt-get update -y
    	sudo apt-get install virtualbox-4.3
    	sudo apt-get install dkms
fi

# Prompt - Install keepassx ?

