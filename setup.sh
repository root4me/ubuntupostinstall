#!/bin/bash

echo '-- Setup starts here'

# Prompt - Install google Chrome?

read -p "Install google chrome stable build (y/n) : " chrome

if [[ "$chrome" == [Yy]* ]]
then
	echo "== Installing google chrome"
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && 
	sudo apt-get update && 
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
#	echo ". ~/devtools/nvm/nvm.sh" >>  ~/devtools/nvm.sh
#	nvm use v0.8.26
fi

# Prompt - Install Cloud9 IDE ?
read -p "Install cloud9 IDE (y/n) : " node
if [[ "$node" == [Yy]* ]]
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

# Prompt - Install Mongodb ?

# Prompt - Install Virtualbox ?

# Prompt - Install keepassx ?

