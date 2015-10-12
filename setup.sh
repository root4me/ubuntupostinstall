#!/bin/bash

# Install linux utils gksudo, gpart
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install gksudo gpart (y/n) : " utils
echo "--------------------------$(tput sgr0)"
if [[ "$utils" == [Yy]* ]]
then    
	sudo apt-get install gksu
	sudo apt-get install gparted
fi


# Prompt - Install Terminator
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install terminator (y/n) : " terminator
echo "--------------------------$(tput sgr0)"
if [[ "$terminator" == [Yy]* ]]
then    
	sudo apt-get install terminator
fi

# Prompt - Install vim editor
echo "$(tput bold)$(tput setaf 6)--------------------"
read -p "Install vim (y/n) : " vim
echo "--------------------$(tput sgr0)"
if [[ "$vim" == [Yy]* ]]
then    
	sudo apt-get install vim
fi

# Prompt - Install vlc
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install media codecs & vlc player (y/n) : " vlc
echo "--------------------------$(tput sgr0)"
if [[ "$vlc" == [Yy]* ]]
then    
	sudo apt-get install ubuntu-restricted-extras
	sudo apt-get install vlc
fi

# Install video editing, screen recording tools
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install kazam , openshot (video editing) (y/n) : " videotools
echo "--------------------------$(tput sgr0)"
if [[ "$videotools" == [Yy]* ]]
then    
	sudo apt-get install kazam
	sudo apt-get install openshot
fi


# Prompt - Install nodejs ?
# Install nvm , node version .10 and .8 (most of the stuff i need work only on .8)
# Maybe prompt which all versions to install
echo "$(tput bold)$(tput setaf 6)------------------------------------------------"
read -p "Install nodejs v.8 and .10, bower, grunt (y/n) : " node
echo "------------------------------------------------$(tput sgr0)"
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

	echo "#!/bin/bash" >> ~/devtools/node10.sh
	echo "echo 'Initializing nodejs v0.10'" >> ~/devtools/node10.sh
	echo "source ~/devtools/nvm/nvm.sh" >> ~/devtools/node10.sh
	echo "nvm use v0.10" >>  ~/devtools/node10.sh
	
	nvm use v0.10
	npm install -g bower
	npm install -g grunt-cli

fi

# Prompt - Install Cloud9 IDE ?
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install cloud9 IDE (y/n) : " cloud9
echo "--------------------------$(tput sgr0)"
if [[ "$cloud9" == [Yy]* ]]
then
	sudo apt-get install build-essential
	mkdir ~/devtools
	git clone https://github.com/c9/core.git ~/devtools/cloud9
	cd ~/devtools/cloud9
	. ~/devtools/nvm/nvm.sh
	nvm use v0.10
	scripts/install-sdk.sh
	echo "#!/bin/bash" >> ~/devtools/cloud9.sh
	echo "echo 'Launching Cloud9 IDE @ http://localhost:8181/ide.html'" >> ~/devtools/cloud9.sh
	echo ". ~/devtools/node10.sh" >> ~/devtools/cloud9.sh
	echo "node ~/devtools/cloud9/server.js -w ~/projects" >> ~/devtools/cloud9.sh
fi


# Prompt - Install Virtualbox ?
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install virtualbox (y/n) : " virtualbox
echo "To use KVM as virtualization tool, follow instructions at https://help.ubuntu.com/community/KVM/Installation"
echo "KVM will fail to create VM if data file is in no default location. Uncomment user=root and group=root from /etc/libvirt/qemu.conf to overcome that."
echo "--------------------------$(tput sgr0)"
if [[ "$virtualbox" == [Yy]* ]]
then    
	sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib' > /etc/apt/sources.list.d/virtualbox.list"
     	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
    	sudo apt-get update -y
    	sudo apt-get install virtualbox-4.3
    	sudo apt-get install dkms
fi


# Prompt - Install Eclipse Luna
echo "$(tput bold)$(tput setaf 6)--------------------------"
read -p "Install Eclipse (y/n) : " eclipse
echo "--------------------------$(tput sgr0)"
if [[ "$eclipse" == [Yy]* ]]
then    
	cd ~/Downloads 
	wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/luna/SR2/eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz
	tar -xzvf eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz
	mv eclipse/ ~/devtools/eclipse

	echo "#!/bin/bash" >> ~/devtools/eclipse.sh
	echo "echo 'Launching Eclipse IDE'" >> ~/devtools/eclipse.sh
	echo "~/devtools/eclipse/eclipse" >> ~/devtools/eclipse.sh



	echo "$(tput bold)$(tput setaf 6)--------------------------"
	echo "If this need to be used with 32 bit java :"
	echo "sudo apt-get install openjdk-7-jre:i386"
	echo "Copy the location of java 7 i386 jre from the following alternatives and update eclipse.ini "
	echo "<-- Example eclipse.ini update with -vm argument --> "
	echo "openFile"
	echo "--launcher.appendVmargs"
	echo "-vm"
	echo "/usr/lib/jvm/java-7-openjdk-i386/jre/bin/java"
	echo "--------------------------$(tput sgr0)"
fi


