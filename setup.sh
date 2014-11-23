#!/bin/bash


# Prompt - Install google Chrome?
echo "$(tput bold)$(tput setaf 6)------------------------------------------"
read -p "Install google chrome stable build (y/n) : " chrome
echo "------------------------------------------ $(tput sgr0)"
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
echo "$(tput bold)$(tput setaf 6)-----------------------"
read -p "$(tput bold) $(tput setaf 6)Install nodejs (y/n) : " node
echo "-----------------------$(tput sgr0)"
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
	echo "source ~/devtools/nvm/nvm.sh" >> ~/devtools/node8.sh
	echo "nvm use v0.8" >>  ~/devtools/node8.sh

	echo "#!/bin/bash" >> ~/devtools/node10.sh
	echo "echo 'Initializing nodejs v0.10'" >> ~/devtools/node10.sh
	echo "source ~/devtools/nvm/nvm.sh" >> ~/devtools/node10.sh
	echo "nvm use v0.10" >>  ~/devtools/node10.sh

fi

# Prompt - Install Cloud9 IDE ?
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install cloud9 IDE (y/n) : " cloud9
echo "--------------------------$(tput sgr0)"
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
	echo ". ~/devtools/node8.sh" >> ~/devtools/cloud9.sh
	echo "~/devtools/cloud9/bin/cloud9.sh -w ~/projects" >> ~/devtools/cloud9.sh
fi

#file="/etc/hosts"
#if [ -f "$file" ]

# Prompt - Install Mongodb ?
echo "$(tput bold)$(tput setaf 6)-----------------------"
read -p "Install mongodb (y/n) : " mongo
echo "-----------------------$(tput sgr0)"
if [[ "$mongo" == [Yy]* ]]
then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
    	sudo apt-get update 
    
    	sudo apt-get install mongodb-10gen

	echo "sudo service mongodb restart" >> ~/devtools/mongorestart.sh
fi

# Prompt - Install Virtualbox ?
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install virtualbox (y/n) : " virtualbox
echo "--------------------------$(tput sgr0)"
if [[ "$virtualbox" == [Yy]* ]]
then    
	sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib' > /etc/apt/sources.list.d/virtualbox.list"
     	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
    	sudo apt-get update -y
    	sudo apt-get install virtualbox-4.3
    	sudo apt-get install dkms
fi

# Prompt - Install Terminator
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install terminator (y/n) : " terminator
echo "--------------------------$(tput sgr0)"
if [[ "$terminator" == [Yy]* ]]
then    
	sudo apt-get install terminator
fi


# Prompt - Install Eclipse Luna
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install Eclipse (y/n) : " eclipse
echo "--------------------------$(tput sgr0)"
if [[ "$eclipse" == [Yy]* ]]
then    
	cd ~/Downloads 
	wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/luna/R/eclipse-cpp-luna-R-linux-gtk.tar.gz
	tar -xzvf eclipse-cpp-luna-R-linux-gtk.tar.gz
	mv eclipse/ ~/devtools/eclipse

	sudo apt-get install maven
#	sudo add-apt-repository ppa:webupd8team/java
#	sudo apt-get update
#	sudo apt-get install oracle-java7-installer

	sudo apt-get install openjdk-7-jre:i386

	echo "$(tput bold)$(tput setaf 6)--------------------------"
	echo "Copy the location of java 7 i386 jre from the following alternatives and update eclipse.ini "
	echo "<-- Example eclipse.ini update with -vm argument --> "
	echo "openFile"
	echo "--launcher.appendVmargs"
	echo "-vm"
	echo "/usr/lib/jvm/java-7-openjdk-i386/jre/bin/java"
	echo "--------------------------$(tput sgr0)"

#	sudo update-alternatives --config java

#	sudo apt-get install avrdude binutils-avr gcc-avr avr-libc gdb-avr

#	cd ~/devtools/eclipse/plugins
#	git clone https://github.com/jantje/arduino-eclipse-plugin

# To set environment variables
# sudo apt-get install oracle-java7-set-default

# To remove
# sudo apt-get remove oracle-java7-installer

fi
